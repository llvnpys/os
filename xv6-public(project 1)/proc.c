#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"

struct
{
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

// mlfq
struct
{
  struct queue queues[3];
  int global_ticks;
} mlfq;

static struct proc *initproc;

int nextpid = 1;
struct spinlock scheduler_lock;
int scheduler_locked = 0;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

void pinit(void)
{
  initlock(&ptable.lock, "ptable");
  initlock(&scheduler_lock, "scheduler");
}

// Must be called with interrupts disabled
int cpuid()
{
  return mycpu() - cpus;
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu *
mycpu(void)
{
  int apicid, i;

  if (readeflags() & FL_IF)
    panic("mycpu called with interrupts enabled\n");

  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i)
  {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc *
myproc(void)
{
  struct cpu *c;
  struct proc *p;
  pushcli();
  c = mycpu();
  p = c->proc;
  popcli();
  return p;
}

// PAGEBREAK: 32
//  Look in the process table for an UNUSED proc.
//  If found, change state to EMBRYO and initialize
//  state required to run in the kernel.
//  Otherwise return 0.
static struct proc *
allocproc(void)
{

  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if (p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
  release(&ptable.lock);

  // Allocate kernel stack.
  if ((p->kstack = kalloc()) == 0)
  {
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe *)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint *)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context *)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}

// PAGEBREAK: 32
//  Set up first user process.
void userinit(void)
{
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  // MLFQ 초기화
  mlfq.queues[0].level = 0;
  mlfq.queues[0].time_quantum = 4;
  mlfq.queues[1].level = 1;
  mlfq.queues[1].time_quantum = 6;
  mlfq.queues[2].level = 2;
  mlfq.queues[2].time_quantum = 8;

  p = allocproc();

  initproc = p;
  if ((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es = p->tf->ds;
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0; // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  // 스케줄링 변수
  p->priority = 3;
  p->queue_level = 0;
  p->ticks = 0;
  enqueue(&mlfq.queues[0], p);

  p->state = RUNNABLE;

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if (n > 0)
  {
    if ((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  else if (n < 0)
  {
    if ((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if ((np = allocproc()) == 0)
  {
    return -1;
  }

  // Copy process state from proc.
  if ((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0)
  {
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for (i = 0; i < NOFILE; i++)
    if (curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  acquire(&ptable.lock);

  // 스케줄링 변수
  np->priority = 3;
  np->queue_level = 0;
  np->ticks = 0;
  enqueue(&mlfq.queues[0], np);

  np->state = RUNNABLE;

  release(&ptable.lock);

  return pid;
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void exit(void)
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if (holding(&scheduler_lock))
  {
    cprintf("Scheduler lock released for PID %d\n", myproc()->pid);
    release(&scheduler_lock);
  }

  if (curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for (fd = 0; fd < NOFILE; fd++)
  {
    if (curproc->ofile[fd])
    {
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->parent == curproc)
    {
      p->parent = initproc;
      if (p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int wait(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();

  acquire(&ptable.lock);
  for (;;)
  {
    // Scan through table looking for exited children.
    havekids = 0;
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    {
      if (p->parent != curproc)
        continue;
      havekids = 1;
      if (p->state == ZOMBIE)
      {
        // MLFQ 큐에서 현재 프로세스 제거
        struct queue *q = &mlfq.queues[p->queue_level];
        struct proc *prev = 0;
        struct proc *current = q->head;

        while (current != 0)
        {

          if (current == p)
          {
            // 중간인 경우
            if (prev != 0)
            {
              prev->next = current->next;
            }

            // 종료 프로세스가 q의 head 인 경우
            else
            {
              q->head = current->next;
            }

            // 맨 뒤인 경우
            if (current == q->tail)
            {
              q->tail = prev;
              prev->next = 0;
            }

            q->count--;
            break;
          }

          prev = current;
          current = current->next;
        }

        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;

        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if (!havekids || curproc->killed)
    {
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock); // DOC: wait-sleep
  }
}

// PAGEBREAK: 42
//  Per-CPU process scheduler.
//  Each CPU calls scheduler() after setting itself up.
//  Scheduler never returns.  It loops, doing:
//   - choose a process to run
//   - swtch to start running that process
//   - eventually that process transfers control
//       via swtch back to the scheduler.
void scheduler(void)
{
  struct proc *p;
  struct queue *q;
  struct cpu *c = mycpu();
  c->proc = 0;

  for (;;)
  {
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);

    int index = 0;
    while (index < 3)
    {
      q = &mlfq.queues[index];
      p = q->head;

      int count = q->count;

      for (int i = 0; i < count; i++)
      {
        if (p->state == RUNNABLE)
          break;

        if (p->state == ZOMBIE)
        {
          dequeue(q);
        }
        else if (q->level == 2)
        {
          p->queue_level = 0;
          p->ticks = 0;
          p->priority = 3;
          enqueue(&mlfq.queues[0], dequeue(q));
        }
        else
        {
          enqueue(q, dequeue(q));
        }

        p = q->head;
      }

      if (p == 0 || p->state != RUNNABLE)
      {
        index++;
        continue;
      }

      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
      swtch(&(c->scheduler), p->context);
      c->proc = 0;

      switchkvm();
      break;
    }

    release(&ptable.lock);
  }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void sched(void)
{
  int intena;
  struct proc *p = myproc();

  if (!holding(&ptable.lock))
    panic("sched ptable.lock");
  if (mycpu()->ncli != 1)
    panic("sched locks");
  if (p->state == RUNNING)
    panic("sched running");
  if (readeflags() & FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
// 큐 이동 & 부스팅이 일어나는 곳.
void yield(void)
{
  struct proc *p = myproc();
  struct queue *q = &mlfq.queues[p->queue_level];

  acquire(&ptable.lock); // DOC: yieldlock

  // boosting
  if (++mlfq.global_ticks >= 100)
  {
    priority_boosting();
  }

  else if (holding(&scheduler_lock))
  {
    release(&ptable.lock);
    return;
  }

  // demote
  else if (++p->ticks >= q->time_quantum)
  {
    if (q->level == 2)
    {
      if (p->priority > 0)
      {
        p->priority--;
        p->ticks = 0;
        enqueue(q, dequeue(q));
      }
    }

    // q의 맨 뒤로 이동
    else
    {
      p->queue_level++;
      p->ticks = 0;
      enqueue(&mlfq.queues[p->queue_level], dequeue(q));
    }
  }
  else
  {
    enqueue(q, dequeue(q));
  }

  myproc()->state = RUNNABLE;
  sched();
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first)
  {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();

  if (p == 0)
    panic("sleep");

  if (lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if (lk != &ptable.lock)
  {                        // DOC: sleeplock0
    acquire(&ptable.lock); // DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if (lk != &ptable.lock)
  { // DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

// PAGEBREAK!
//  Wake up all processes sleeping on chan.
//  The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if (p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}

// Wake up all processes sleeping on chan.
void wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->pid == pid)
    {
      p->killed = 1;
      // Wake process from sleep if necessary.
      if (p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

// PAGEBREAK: 365
//  Print a process listing to console.  For debugging.
//  Runs when user types ^P on console.
//  No lock to avoid wedging a stuck machine further.
void procdump(void)
{
  static char *states[] = {
      [UNUSED] "unused",
      [EMBRYO] "embryo",
      [SLEEPING] "sleep ",
      [RUNNABLE] "runble",
      [RUNNING] "run   ",
      [ZOMBIE] "zombie"};
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if (p->state == SLEEPING)
    {
      getcallerpcs((uint *)p->context->ebp + 2, pc);
      for (i = 0; i < 10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}

// MLFQ 큐에 프로세스 추가 (enqueue)
void enqueue(struct queue *queue, struct proc *p)
{
  p->next = 0;

  // FCFS + Priority 적용 (레벨 2인 경우)
  if (queue->level == 2)
  {
    struct proc *current = queue->head;
    struct proc *prev = 0;

    // 큐가 비어있는 경우
    if (queue->count == 0)
    {
      queue->head = p;
      queue->tail = p;
    }
    else
    {
      // 큐 순회: priority가 같고 pid가 더 큰 위치 앞에 삽입
      while (current != 0 && (current->priority < p->priority ||
                              (current->priority == p->priority && current->pid < p->pid)))
      {
        prev = current;
        current = current->next;
      }

      // 새로운 프로세스를 큐의 맨 앞에 삽입
      if (prev == 0)
      {
        int i = 0;
        p->next = queue->head;
        queue->head = p;
        i++;
      }
      else
      {
        prev->next = p;
        p->next = current;
        // 후순위
        if (current == 0)
        {
          queue->tail = p;
        }
      }
    }
  }
  else
  {
    // 기본 RR 로직 (레벨 0, 1인 경우)
    if (queue->count == 0)
    {
      queue->head = p;
      queue->tail = p;
    }
    else
    {
      queue->tail->next = p;
      queue->tail = p;
    }
  }

  queue->count++;
}

// 큐의 맨 앞 프로세스 제거 (dequeue)
struct proc *
dequeue(struct queue *queue)
{
  struct proc *p = queue->head;

  queue->head = p->next;
  if (queue->head == 0)
  {
    queue->tail = 0;
  }

  queue->count--;
  p->next = 0;
  return p;
}

void priority_boosting(void)
{
  struct queue *L0 = &mlfq.queues[0];
  struct queue *q;

  if (holding(&scheduler_lock))
  {
    cprintf("Scheduler lock released for PID %d\n", myproc()->pid);
    release(&scheduler_lock);
  }

  // L1, L2 프로세스를 L0로 이동
  for (int i = 1; i <= 2; i++)
  {
    q = &mlfq.queues[i];
    while (q->count > 0)
    {
      enqueue(L0, dequeue(q));
    }
  }

  // L0의 모든 프로세스의 우선순위, 틱 초기화
  struct proc *L0proc = L0->head;
  for (int i = 0; i < L0->count; i++)
  {
    L0proc->priority = 3;
    L0proc->queue_level = 0;
    L0proc->ticks = 0;
    L0proc = L0proc->next;
  }
  // 글로벌 틱 초기화
  mlfq.global_ticks = 0;
}

int getLevel(void)
{
  struct proc *p = myproc();
  return p->queue_level;
}

void setPriority(int pid, int priority)
{
  struct proc *p;

  acquire(&ptable.lock);
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->pid == pid)
    {
      p->priority = priority;
      break;
    }
  }
  release(&ptable.lock);
}

void schedulerLock(int password)
{
  struct proc *p = myproc();
  struct queue *q = &mlfq.queues[p->queue_level];

  // 학번 획인
  if (password != 2020062860)
  {
    cprintf("Invalid password\n");
    cprintf("pid : %d, ticks : %d, queue level : %d\n", p->pid, p->ticks, p->queue_level);
    p->killed = 1;
    return;
  }

  acquire(&ptable.lock);

  // 현재 프로세스가 위치한 큐에서 제거
  if (q->head == p)
  {
    // 큐의 head에 위치한 경우
    q->head = p->next;
    if (q->tail == p)
      q->tail = p->next;
  }
  // 큐의 중간이나 끝에 위치한 경우
  else
  {

    struct proc *prev = q->head;
    while (prev != 0 && prev->next != p)
    {
      prev = prev->next;
    }
    if (prev != 0)
    {
      prev->next = p->next;
      if (q->tail == p)
        q->tail = prev;
    }
  }
  q->count--; // 큐의 프로세스 수 감소

  struct queue *L0 = &mlfq.queues[0];
  p->priority = 3;
  p->queue_level = 0;
  p->ticks = 0;

  // L0 큐의 맨 앞에 추가
  p->next = L0->head;
  L0->head = p;
  if (L0->tail == 0)
    L0->tail = p;

  L0->count++;

  release(&ptable.lock);
  acquire(&scheduler_lock);
  mlfq.global_ticks = 0;
  

  cprintf("Scheduler lock acquired for PID %d\n", p->pid);
}

void schedulerUnlock(int password)
{
  struct proc *p = myproc();

  // 학번 획인
  if (password != 2020062860)
  {
    cprintf("Invalid password\n");
    cprintf("pid : %d, ticks : %d, queue level : %d\n", p->pid, p->ticks, p->queue_level);
    p->killed = 1;
    return;
  }

  acquire(&ptable.lock);
  p->priority = 3;
  p->queue_level = 0;
  p->ticks = 0;
  release(&ptable.lock);

  release(&scheduler_lock);

  cprintf("Scheduler lock released for PID %d\n", p->pid);
}