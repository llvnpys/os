
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp
8010002d:	b8 40 30 10 80       	mov    $0x80103040,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	f3 0f 1e fb          	endbr32 
80100044:	55                   	push   %ebp
80100045:	89 e5                	mov    %esp,%ebp
80100047:	53                   	push   %ebx
80100048:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
8010004d:	83 ec 0c             	sub    $0xc,%esp
80100050:	68 e0 70 10 80       	push   $0x801070e0
80100055:	68 c0 b5 10 80       	push   $0x8010b5c0
8010005a:	e8 81 43 00 00       	call   801043e0 <initlock>
8010005f:	83 c4 10             	add    $0x10,%esp
80100062:	b8 bc fc 10 80       	mov    $0x8010fcbc,%eax
80100067:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
8010006e:	fc 10 80 
80100071:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
80100078:	fc 10 80 
8010007b:	eb 05                	jmp    80100082 <binit+0x42>
8010007d:	8d 76 00             	lea    0x0(%esi),%esi
80100080:	89 d3                	mov    %edx,%ebx
80100082:	89 43 54             	mov    %eax,0x54(%ebx)
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	8d 43 0c             	lea    0xc(%ebx),%eax
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
80100092:	68 e7 70 10 80       	push   $0x801070e7
80100097:	50                   	push   %eax
80100098:	e8 03 42 00 00       	call   801042a0 <initsleeplock>
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
801000a2:	8d 93 5c 02 00 00    	lea    0x25c(%ebx),%edx
801000a8:	83 c4 10             	add    $0x10,%esp
801000ab:	89 58 50             	mov    %ebx,0x50(%eax)
801000ae:	89 d8                	mov    %ebx,%eax
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
801000b6:	81 fb 60 fa 10 80    	cmp    $0x8010fa60,%ebx
801000bc:	75 c2                	jne    80100080 <binit+0x40>
801000be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c1:	c9                   	leave  
801000c2:	c3                   	ret    
801000c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801000d0 <bread>:
801000d0:	f3 0f 1e fb          	endbr32 
801000d4:	55                   	push   %ebp
801000d5:	89 e5                	mov    %esp,%ebp
801000d7:	57                   	push   %edi
801000d8:	56                   	push   %esi
801000d9:	53                   	push   %ebx
801000da:	83 ec 18             	sub    $0x18,%esp
801000dd:	8b 7d 08             	mov    0x8(%ebp),%edi
801000e0:	8b 75 0c             	mov    0xc(%ebp),%esi
801000e3:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e8:	e8 73 44 00 00       	call   80104560 <acquire>
801000ed:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000f3:	83 c4 10             	add    $0x10,%esp
801000f6:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000fc:	75 0d                	jne    8010010b <bread+0x3b>
801000fe:	eb 20                	jmp    80100120 <bread+0x50>
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 7b 04             	cmp    0x4(%ebx),%edi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 73 08             	cmp    0x8(%ebx),%esi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010011f:	90                   	nop
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 70                	jmp    801001a0 <bread+0xd0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 65                	je     801001a0 <bread+0xd0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 7b 04             	mov    %edi,0x4(%ebx)
8010014a:	89 73 08             	mov    %esi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 b9 44 00 00       	call   80104620 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 6e 41 00 00       	call   801042e0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	74 0e                	je     80100188 <bread+0xb8>
8010017a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010017d:	89 d8                	mov    %ebx,%eax
8010017f:	5b                   	pop    %ebx
80100180:	5e                   	pop    %esi
80100181:	5f                   	pop    %edi
80100182:	5d                   	pop    %ebp
80100183:	c3                   	ret    
80100184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100188:	83 ec 0c             	sub    $0xc,%esp
8010018b:	53                   	push   %ebx
8010018c:	e8 ef 20 00 00       	call   80102280 <iderw>
80100191:	83 c4 10             	add    $0x10,%esp
80100194:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100197:	89 d8                	mov    %ebx,%eax
80100199:	5b                   	pop    %ebx
8010019a:	5e                   	pop    %esi
8010019b:	5f                   	pop    %edi
8010019c:	5d                   	pop    %ebp
8010019d:	c3                   	ret    
8010019e:	66 90                	xchg   %ax,%ax
801001a0:	83 ec 0c             	sub    $0xc,%esp
801001a3:	68 ee 70 10 80       	push   $0x801070ee
801001a8:	e8 e3 01 00 00       	call   80100390 <panic>
801001ad:	8d 76 00             	lea    0x0(%esi),%esi

801001b0 <bwrite>:
801001b0:	f3 0f 1e fb          	endbr32 
801001b4:	55                   	push   %ebp
801001b5:	89 e5                	mov    %esp,%ebp
801001b7:	53                   	push   %ebx
801001b8:	83 ec 10             	sub    $0x10,%esp
801001bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001be:	8d 43 0c             	lea    0xc(%ebx),%eax
801001c1:	50                   	push   %eax
801001c2:	e8 b9 41 00 00       	call   80104380 <holdingsleep>
801001c7:	83 c4 10             	add    $0x10,%esp
801001ca:	85 c0                	test   %eax,%eax
801001cc:	74 0f                	je     801001dd <bwrite+0x2d>
801001ce:	83 0b 04             	orl    $0x4,(%ebx)
801001d1:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001d7:	c9                   	leave  
801001d8:	e9 a3 20 00 00       	jmp    80102280 <iderw>
801001dd:	83 ec 0c             	sub    $0xc,%esp
801001e0:	68 ff 70 10 80       	push   $0x801070ff
801001e5:	e8 a6 01 00 00       	call   80100390 <panic>
801001ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801001f0 <brelse>:
801001f0:	f3 0f 1e fb          	endbr32 
801001f4:	55                   	push   %ebp
801001f5:	89 e5                	mov    %esp,%ebp
801001f7:	56                   	push   %esi
801001f8:	53                   	push   %ebx
801001f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001fc:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ff:	83 ec 0c             	sub    $0xc,%esp
80100202:	56                   	push   %esi
80100203:	e8 78 41 00 00       	call   80104380 <holdingsleep>
80100208:	83 c4 10             	add    $0x10,%esp
8010020b:	85 c0                	test   %eax,%eax
8010020d:	74 66                	je     80100275 <brelse+0x85>
8010020f:	83 ec 0c             	sub    $0xc,%esp
80100212:	56                   	push   %esi
80100213:	e8 28 41 00 00       	call   80104340 <releasesleep>
80100218:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010021f:	e8 3c 43 00 00       	call   80104560 <acquire>
80100224:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100227:	83 c4 10             	add    $0x10,%esp
8010022a:	83 e8 01             	sub    $0x1,%eax
8010022d:	89 43 4c             	mov    %eax,0x4c(%ebx)
80100230:	85 c0                	test   %eax,%eax
80100232:	75 2f                	jne    80100263 <brelse+0x73>
80100234:	8b 43 54             	mov    0x54(%ebx),%eax
80100237:	8b 53 50             	mov    0x50(%ebx),%edx
8010023a:	89 50 50             	mov    %edx,0x50(%eax)
8010023d:	8b 43 50             	mov    0x50(%ebx),%eax
80100240:	8b 53 54             	mov    0x54(%ebx),%edx
80100243:	89 50 54             	mov    %edx,0x54(%eax)
80100246:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
8010024b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
80100252:	89 43 54             	mov    %eax,0x54(%ebx)
80100255:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
8010025a:	89 58 50             	mov    %ebx,0x50(%eax)
8010025d:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
80100263:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
8010026a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010026d:	5b                   	pop    %ebx
8010026e:	5e                   	pop    %esi
8010026f:	5d                   	pop    %ebp
80100270:	e9 ab 43 00 00       	jmp    80104620 <release>
80100275:	83 ec 0c             	sub    $0xc,%esp
80100278:	68 06 71 10 80       	push   $0x80107106
8010027d:	e8 0e 01 00 00       	call   80100390 <panic>
80100282:	66 90                	xchg   %ax,%ax
80100284:	66 90                	xchg   %ax,%ax
80100286:	66 90                	xchg   %ax,%ax
80100288:	66 90                	xchg   %ax,%ax
8010028a:	66 90                	xchg   %ax,%ax
8010028c:	66 90                	xchg   %ax,%ax
8010028e:	66 90                	xchg   %ax,%ax

80100290 <consoleread>:
80100290:	f3 0f 1e fb          	endbr32 
80100294:	55                   	push   %ebp
80100295:	89 e5                	mov    %esp,%ebp
80100297:	57                   	push   %edi
80100298:	56                   	push   %esi
80100299:	53                   	push   %ebx
8010029a:	83 ec 18             	sub    $0x18,%esp
8010029d:	ff 75 08             	pushl  0x8(%ebp)
801002a0:	8b 5d 10             	mov    0x10(%ebp),%ebx
801002a3:	89 de                	mov    %ebx,%esi
801002a5:	e8 96 15 00 00       	call   80101840 <iunlock>
801002aa:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801002b1:	e8 aa 42 00 00       	call   80104560 <acquire>
801002b6:	8b 7d 0c             	mov    0xc(%ebp),%edi
801002b9:	83 c4 10             	add    $0x10,%esp
801002bc:	01 df                	add    %ebx,%edi
801002be:	85 db                	test   %ebx,%ebx
801002c0:	0f 8e 97 00 00 00    	jle    8010035d <consoleread+0xcd>
801002c6:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002cb:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002d1:	74 27                	je     801002fa <consoleread+0x6a>
801002d3:	eb 5b                	jmp    80100330 <consoleread+0xa0>
801002d5:	8d 76 00             	lea    0x0(%esi),%esi
801002d8:	83 ec 08             	sub    $0x8,%esp
801002db:	68 20 a5 10 80       	push   $0x8010a520
801002e0:	68 a0 ff 10 80       	push   $0x8010ffa0
801002e5:	e8 36 3c 00 00       	call   80103f20 <sleep>
801002ea:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002ef:	83 c4 10             	add    $0x10,%esp
801002f2:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002f8:	75 36                	jne    80100330 <consoleread+0xa0>
801002fa:	e8 61 36 00 00       	call   80103960 <myproc>
801002ff:	8b 48 24             	mov    0x24(%eax),%ecx
80100302:	85 c9                	test   %ecx,%ecx
80100304:	74 d2                	je     801002d8 <consoleread+0x48>
80100306:	83 ec 0c             	sub    $0xc,%esp
80100309:	68 20 a5 10 80       	push   $0x8010a520
8010030e:	e8 0d 43 00 00       	call   80104620 <release>
80100313:	5a                   	pop    %edx
80100314:	ff 75 08             	pushl  0x8(%ebp)
80100317:	e8 44 14 00 00       	call   80101760 <ilock>
8010031c:	83 c4 10             	add    $0x10,%esp
8010031f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100322:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100327:	5b                   	pop    %ebx
80100328:	5e                   	pop    %esi
80100329:	5f                   	pop    %edi
8010032a:	5d                   	pop    %ebp
8010032b:	c3                   	ret    
8010032c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100330:	8d 50 01             	lea    0x1(%eax),%edx
80100333:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100339:	89 c2                	mov    %eax,%edx
8010033b:	83 e2 7f             	and    $0x7f,%edx
8010033e:	0f be 8a 20 ff 10 80 	movsbl -0x7fef00e0(%edx),%ecx
80100345:	80 f9 04             	cmp    $0x4,%cl
80100348:	74 38                	je     80100382 <consoleread+0xf2>
8010034a:	89 d8                	mov    %ebx,%eax
8010034c:	83 eb 01             	sub    $0x1,%ebx
8010034f:	f7 d8                	neg    %eax
80100351:	88 0c 07             	mov    %cl,(%edi,%eax,1)
80100354:	83 f9 0a             	cmp    $0xa,%ecx
80100357:	0f 85 61 ff ff ff    	jne    801002be <consoleread+0x2e>
8010035d:	83 ec 0c             	sub    $0xc,%esp
80100360:	68 20 a5 10 80       	push   $0x8010a520
80100365:	e8 b6 42 00 00       	call   80104620 <release>
8010036a:	58                   	pop    %eax
8010036b:	ff 75 08             	pushl  0x8(%ebp)
8010036e:	e8 ed 13 00 00       	call   80101760 <ilock>
80100373:	89 f0                	mov    %esi,%eax
80100375:	83 c4 10             	add    $0x10,%esp
80100378:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010037b:	29 d8                	sub    %ebx,%eax
8010037d:	5b                   	pop    %ebx
8010037e:	5e                   	pop    %esi
8010037f:	5f                   	pop    %edi
80100380:	5d                   	pop    %ebp
80100381:	c3                   	ret    
80100382:	39 f3                	cmp    %esi,%ebx
80100384:	73 d7                	jae    8010035d <consoleread+0xcd>
80100386:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
8010038b:	eb d0                	jmp    8010035d <consoleread+0xcd>
8010038d:	8d 76 00             	lea    0x0(%esi),%esi

80100390 <panic>:
80100390:	f3 0f 1e fb          	endbr32 
80100394:	55                   	push   %ebp
80100395:	89 e5                	mov    %esp,%ebp
80100397:	56                   	push   %esi
80100398:	53                   	push   %ebx
80100399:	83 ec 30             	sub    $0x30,%esp
8010039c:	fa                   	cli    
8010039d:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
801003a4:	00 00 00 
801003a7:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003aa:	8d 75 f8             	lea    -0x8(%ebp),%esi
801003ad:	e8 ee 24 00 00       	call   801028a0 <lapicid>
801003b2:	83 ec 08             	sub    $0x8,%esp
801003b5:	50                   	push   %eax
801003b6:	68 0d 71 10 80       	push   $0x8010710d
801003bb:	e8 f0 02 00 00       	call   801006b0 <cprintf>
801003c0:	58                   	pop    %eax
801003c1:	ff 75 08             	pushl  0x8(%ebp)
801003c4:	e8 e7 02 00 00       	call   801006b0 <cprintf>
801003c9:	c7 04 24 37 7a 10 80 	movl   $0x80107a37,(%esp)
801003d0:	e8 db 02 00 00       	call   801006b0 <cprintf>
801003d5:	8d 45 08             	lea    0x8(%ebp),%eax
801003d8:	5a                   	pop    %edx
801003d9:	59                   	pop    %ecx
801003da:	53                   	push   %ebx
801003db:	50                   	push   %eax
801003dc:	e8 1f 40 00 00       	call   80104400 <getcallerpcs>
801003e1:	83 c4 10             	add    $0x10,%esp
801003e4:	83 ec 08             	sub    $0x8,%esp
801003e7:	ff 33                	pushl  (%ebx)
801003e9:	83 c3 04             	add    $0x4,%ebx
801003ec:	68 21 71 10 80       	push   $0x80107121
801003f1:	e8 ba 02 00 00       	call   801006b0 <cprintf>
801003f6:	83 c4 10             	add    $0x10,%esp
801003f9:	39 f3                	cmp    %esi,%ebx
801003fb:	75 e7                	jne    801003e4 <panic+0x54>
801003fd:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
80100404:	00 00 00 
80100407:	eb fe                	jmp    80100407 <panic+0x77>
80100409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100410 <consputc.part.0>:
80100410:	55                   	push   %ebp
80100411:	89 e5                	mov    %esp,%ebp
80100413:	57                   	push   %edi
80100414:	56                   	push   %esi
80100415:	53                   	push   %ebx
80100416:	89 c3                	mov    %eax,%ebx
80100418:	83 ec 1c             	sub    $0x1c,%esp
8010041b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100420:	0f 84 ea 00 00 00    	je     80100510 <consputc.part.0+0x100>
80100426:	83 ec 0c             	sub    $0xc,%esp
80100429:	50                   	push   %eax
8010042a:	e8 b1 58 00 00       	call   80105ce0 <uartputc>
8010042f:	83 c4 10             	add    $0x10,%esp
80100432:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100437:	b8 0e 00 00 00       	mov    $0xe,%eax
8010043c:	89 fa                	mov    %edi,%edx
8010043e:	ee                   	out    %al,(%dx)
8010043f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100444:	89 ca                	mov    %ecx,%edx
80100446:	ec                   	in     (%dx),%al
80100447:	0f b6 c0             	movzbl %al,%eax
8010044a:	89 fa                	mov    %edi,%edx
8010044c:	c1 e0 08             	shl    $0x8,%eax
8010044f:	89 c6                	mov    %eax,%esi
80100451:	b8 0f 00 00 00       	mov    $0xf,%eax
80100456:	ee                   	out    %al,(%dx)
80100457:	89 ca                	mov    %ecx,%edx
80100459:	ec                   	in     (%dx),%al
8010045a:	0f b6 c0             	movzbl %al,%eax
8010045d:	09 f0                	or     %esi,%eax
8010045f:	83 fb 0a             	cmp    $0xa,%ebx
80100462:	0f 84 90 00 00 00    	je     801004f8 <consputc.part.0+0xe8>
80100468:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010046e:	74 70                	je     801004e0 <consputc.part.0+0xd0>
80100470:	0f b6 db             	movzbl %bl,%ebx
80100473:	8d 70 01             	lea    0x1(%eax),%esi
80100476:	80 cf 07             	or     $0x7,%bh
80100479:	66 89 9c 00 00 80 0b 	mov    %bx,-0x7ff48000(%eax,%eax,1)
80100480:	80 
80100481:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
80100487:	0f 8f f9 00 00 00    	jg     80100586 <consputc.part.0+0x176>
8010048d:	81 fe 7f 07 00 00    	cmp    $0x77f,%esi
80100493:	0f 8f a7 00 00 00    	jg     80100540 <consputc.part.0+0x130>
80100499:	89 f0                	mov    %esi,%eax
8010049b:	8d b4 36 00 80 0b 80 	lea    -0x7ff48000(%esi,%esi,1),%esi
801004a2:	88 45 e7             	mov    %al,-0x19(%ebp)
801004a5:	0f b6 fc             	movzbl %ah,%edi
801004a8:	bb d4 03 00 00       	mov    $0x3d4,%ebx
801004ad:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b2:	89 da                	mov    %ebx,%edx
801004b4:	ee                   	out    %al,(%dx)
801004b5:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004ba:	89 f8                	mov    %edi,%eax
801004bc:	89 ca                	mov    %ecx,%edx
801004be:	ee                   	out    %al,(%dx)
801004bf:	b8 0f 00 00 00       	mov    $0xf,%eax
801004c4:	89 da                	mov    %ebx,%edx
801004c6:	ee                   	out    %al,(%dx)
801004c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
801004cb:	89 ca                	mov    %ecx,%edx
801004cd:	ee                   	out    %al,(%dx)
801004ce:	b8 20 07 00 00       	mov    $0x720,%eax
801004d3:	66 89 06             	mov    %ax,(%esi)
801004d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004d9:	5b                   	pop    %ebx
801004da:	5e                   	pop    %esi
801004db:	5f                   	pop    %edi
801004dc:	5d                   	pop    %ebp
801004dd:	c3                   	ret    
801004de:	66 90                	xchg   %ax,%ax
801004e0:	8d 70 ff             	lea    -0x1(%eax),%esi
801004e3:	85 c0                	test   %eax,%eax
801004e5:	75 9a                	jne    80100481 <consputc.part.0+0x71>
801004e7:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
801004eb:	be 00 80 0b 80       	mov    $0x800b8000,%esi
801004f0:	31 ff                	xor    %edi,%edi
801004f2:	eb b4                	jmp    801004a8 <consputc.part.0+0x98>
801004f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801004f8:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
801004fd:	f7 e2                	mul    %edx
801004ff:	c1 ea 06             	shr    $0x6,%edx
80100502:	8d 04 92             	lea    (%edx,%edx,4),%eax
80100505:	c1 e0 04             	shl    $0x4,%eax
80100508:	8d 70 50             	lea    0x50(%eax),%esi
8010050b:	e9 71 ff ff ff       	jmp    80100481 <consputc.part.0+0x71>
80100510:	83 ec 0c             	sub    $0xc,%esp
80100513:	6a 08                	push   $0x8
80100515:	e8 c6 57 00 00       	call   80105ce0 <uartputc>
8010051a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100521:	e8 ba 57 00 00       	call   80105ce0 <uartputc>
80100526:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010052d:	e8 ae 57 00 00       	call   80105ce0 <uartputc>
80100532:	83 c4 10             	add    $0x10,%esp
80100535:	e9 f8 fe ff ff       	jmp    80100432 <consputc.part.0+0x22>
8010053a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100540:	83 ec 04             	sub    $0x4,%esp
80100543:	8d 5e b0             	lea    -0x50(%esi),%ebx
80100546:	8d b4 36 60 7f 0b 80 	lea    -0x7ff480a0(%esi,%esi,1),%esi
8010054d:	bf 07 00 00 00       	mov    $0x7,%edi
80100552:	68 60 0e 00 00       	push   $0xe60
80100557:	68 a0 80 0b 80       	push   $0x800b80a0
8010055c:	68 00 80 0b 80       	push   $0x800b8000
80100561:	e8 aa 41 00 00       	call   80104710 <memmove>
80100566:	b8 80 07 00 00       	mov    $0x780,%eax
8010056b:	83 c4 0c             	add    $0xc,%esp
8010056e:	29 d8                	sub    %ebx,%eax
80100570:	01 c0                	add    %eax,%eax
80100572:	50                   	push   %eax
80100573:	6a 00                	push   $0x0
80100575:	56                   	push   %esi
80100576:	e8 f5 40 00 00       	call   80104670 <memset>
8010057b:	88 5d e7             	mov    %bl,-0x19(%ebp)
8010057e:	83 c4 10             	add    $0x10,%esp
80100581:	e9 22 ff ff ff       	jmp    801004a8 <consputc.part.0+0x98>
80100586:	83 ec 0c             	sub    $0xc,%esp
80100589:	68 25 71 10 80       	push   $0x80107125
8010058e:	e8 fd fd ff ff       	call   80100390 <panic>
80100593:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010059a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801005a0 <printint>:
801005a0:	55                   	push   %ebp
801005a1:	89 e5                	mov    %esp,%ebp
801005a3:	57                   	push   %edi
801005a4:	56                   	push   %esi
801005a5:	53                   	push   %ebx
801005a6:	83 ec 2c             	sub    $0x2c,%esp
801005a9:	89 55 d4             	mov    %edx,-0x2c(%ebp)
801005ac:	85 c9                	test   %ecx,%ecx
801005ae:	74 04                	je     801005b4 <printint+0x14>
801005b0:	85 c0                	test   %eax,%eax
801005b2:	78 6d                	js     80100621 <printint+0x81>
801005b4:	89 c1                	mov    %eax,%ecx
801005b6:	31 f6                	xor    %esi,%esi
801005b8:	89 75 cc             	mov    %esi,-0x34(%ebp)
801005bb:	31 db                	xor    %ebx,%ebx
801005bd:	8d 7d d7             	lea    -0x29(%ebp),%edi
801005c0:	89 c8                	mov    %ecx,%eax
801005c2:	31 d2                	xor    %edx,%edx
801005c4:	89 ce                	mov    %ecx,%esi
801005c6:	f7 75 d4             	divl   -0x2c(%ebp)
801005c9:	0f b6 92 50 71 10 80 	movzbl -0x7fef8eb0(%edx),%edx
801005d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
801005d3:	89 d8                	mov    %ebx,%eax
801005d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
801005d8:	8b 4d d0             	mov    -0x30(%ebp),%ecx
801005db:	89 75 d0             	mov    %esi,-0x30(%ebp)
801005de:	88 14 1f             	mov    %dl,(%edi,%ebx,1)
801005e1:	8b 75 d4             	mov    -0x2c(%ebp),%esi
801005e4:	39 75 d0             	cmp    %esi,-0x30(%ebp)
801005e7:	73 d7                	jae    801005c0 <printint+0x20>
801005e9:	8b 75 cc             	mov    -0x34(%ebp),%esi
801005ec:	85 f6                	test   %esi,%esi
801005ee:	74 0c                	je     801005fc <printint+0x5c>
801005f0:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
801005f5:	89 d8                	mov    %ebx,%eax
801005f7:	ba 2d 00 00 00       	mov    $0x2d,%edx
801005fc:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
80100600:	0f be c2             	movsbl %dl,%eax
80100603:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
80100609:	85 d2                	test   %edx,%edx
8010060b:	74 03                	je     80100610 <printint+0x70>
8010060d:	fa                   	cli    
8010060e:	eb fe                	jmp    8010060e <printint+0x6e>
80100610:	e8 fb fd ff ff       	call   80100410 <consputc.part.0>
80100615:	39 fb                	cmp    %edi,%ebx
80100617:	74 10                	je     80100629 <printint+0x89>
80100619:	0f be 03             	movsbl (%ebx),%eax
8010061c:	83 eb 01             	sub    $0x1,%ebx
8010061f:	eb e2                	jmp    80100603 <printint+0x63>
80100621:	f7 d8                	neg    %eax
80100623:	89 ce                	mov    %ecx,%esi
80100625:	89 c1                	mov    %eax,%ecx
80100627:	eb 8f                	jmp    801005b8 <printint+0x18>
80100629:	83 c4 2c             	add    $0x2c,%esp
8010062c:	5b                   	pop    %ebx
8010062d:	5e                   	pop    %esi
8010062e:	5f                   	pop    %edi
8010062f:	5d                   	pop    %ebp
80100630:	c3                   	ret    
80100631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010063f:	90                   	nop

80100640 <consolewrite>:
80100640:	f3 0f 1e fb          	endbr32 
80100644:	55                   	push   %ebp
80100645:	89 e5                	mov    %esp,%ebp
80100647:	57                   	push   %edi
80100648:	56                   	push   %esi
80100649:	53                   	push   %ebx
8010064a:	83 ec 18             	sub    $0x18,%esp
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100653:	e8 e8 11 00 00       	call   80101840 <iunlock>
80100658:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010065f:	e8 fc 3e 00 00       	call   80104560 <acquire>
80100664:	83 c4 10             	add    $0x10,%esp
80100667:	85 db                	test   %ebx,%ebx
80100669:	7e 24                	jle    8010068f <consolewrite+0x4f>
8010066b:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010066e:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
80100671:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
80100677:	85 d2                	test   %edx,%edx
80100679:	74 05                	je     80100680 <consolewrite+0x40>
8010067b:	fa                   	cli    
8010067c:	eb fe                	jmp    8010067c <consolewrite+0x3c>
8010067e:	66 90                	xchg   %ax,%ax
80100680:	0f b6 07             	movzbl (%edi),%eax
80100683:	83 c7 01             	add    $0x1,%edi
80100686:	e8 85 fd ff ff       	call   80100410 <consputc.part.0>
8010068b:	39 fe                	cmp    %edi,%esi
8010068d:	75 e2                	jne    80100671 <consolewrite+0x31>
8010068f:	83 ec 0c             	sub    $0xc,%esp
80100692:	68 20 a5 10 80       	push   $0x8010a520
80100697:	e8 84 3f 00 00       	call   80104620 <release>
8010069c:	58                   	pop    %eax
8010069d:	ff 75 08             	pushl  0x8(%ebp)
801006a0:	e8 bb 10 00 00       	call   80101760 <ilock>
801006a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801006a8:	89 d8                	mov    %ebx,%eax
801006aa:	5b                   	pop    %ebx
801006ab:	5e                   	pop    %esi
801006ac:	5f                   	pop    %edi
801006ad:	5d                   	pop    %ebp
801006ae:	c3                   	ret    
801006af:	90                   	nop

801006b0 <cprintf>:
801006b0:	f3 0f 1e fb          	endbr32 
801006b4:	55                   	push   %ebp
801006b5:	89 e5                	mov    %esp,%ebp
801006b7:	57                   	push   %edi
801006b8:	56                   	push   %esi
801006b9:	53                   	push   %ebx
801006ba:	83 ec 1c             	sub    $0x1c,%esp
801006bd:	a1 54 a5 10 80       	mov    0x8010a554,%eax
801006c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
801006c5:	85 c0                	test   %eax,%eax
801006c7:	0f 85 e8 00 00 00    	jne    801007b5 <cprintf+0x105>
801006cd:	8b 45 08             	mov    0x8(%ebp),%eax
801006d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d3:	85 c0                	test   %eax,%eax
801006d5:	0f 84 5a 01 00 00    	je     80100835 <cprintf+0x185>
801006db:	0f b6 00             	movzbl (%eax),%eax
801006de:	85 c0                	test   %eax,%eax
801006e0:	74 36                	je     80100718 <cprintf+0x68>
801006e2:	8d 5d 0c             	lea    0xc(%ebp),%ebx
801006e5:	31 f6                	xor    %esi,%esi
801006e7:	83 f8 25             	cmp    $0x25,%eax
801006ea:	74 44                	je     80100730 <cprintf+0x80>
801006ec:	8b 0d 58 a5 10 80    	mov    0x8010a558,%ecx
801006f2:	85 c9                	test   %ecx,%ecx
801006f4:	74 0f                	je     80100705 <cprintf+0x55>
801006f6:	fa                   	cli    
801006f7:	eb fe                	jmp    801006f7 <cprintf+0x47>
801006f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100700:	b8 25 00 00 00       	mov    $0x25,%eax
80100705:	e8 06 fd ff ff       	call   80100410 <consputc.part.0>
8010070a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010070d:	83 c6 01             	add    $0x1,%esi
80100710:	0f b6 04 30          	movzbl (%eax,%esi,1),%eax
80100714:	85 c0                	test   %eax,%eax
80100716:	75 cf                	jne    801006e7 <cprintf+0x37>
80100718:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010071b:	85 c0                	test   %eax,%eax
8010071d:	0f 85 fd 00 00 00    	jne    80100820 <cprintf+0x170>
80100723:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100726:	5b                   	pop    %ebx
80100727:	5e                   	pop    %esi
80100728:	5f                   	pop    %edi
80100729:	5d                   	pop    %ebp
8010072a:	c3                   	ret    
8010072b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010072f:	90                   	nop
80100730:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100733:	83 c6 01             	add    $0x1,%esi
80100736:	0f b6 3c 30          	movzbl (%eax,%esi,1),%edi
8010073a:	85 ff                	test   %edi,%edi
8010073c:	74 da                	je     80100718 <cprintf+0x68>
8010073e:	83 ff 70             	cmp    $0x70,%edi
80100741:	74 5a                	je     8010079d <cprintf+0xed>
80100743:	7f 2a                	jg     8010076f <cprintf+0xbf>
80100745:	83 ff 25             	cmp    $0x25,%edi
80100748:	0f 84 92 00 00 00    	je     801007e0 <cprintf+0x130>
8010074e:	83 ff 64             	cmp    $0x64,%edi
80100751:	0f 85 a1 00 00 00    	jne    801007f8 <cprintf+0x148>
80100757:	8b 03                	mov    (%ebx),%eax
80100759:	8d 7b 04             	lea    0x4(%ebx),%edi
8010075c:	b9 01 00 00 00       	mov    $0x1,%ecx
80100761:	ba 0a 00 00 00       	mov    $0xa,%edx
80100766:	89 fb                	mov    %edi,%ebx
80100768:	e8 33 fe ff ff       	call   801005a0 <printint>
8010076d:	eb 9b                	jmp    8010070a <cprintf+0x5a>
8010076f:	83 ff 73             	cmp    $0x73,%edi
80100772:	75 24                	jne    80100798 <cprintf+0xe8>
80100774:	8d 7b 04             	lea    0x4(%ebx),%edi
80100777:	8b 1b                	mov    (%ebx),%ebx
80100779:	85 db                	test   %ebx,%ebx
8010077b:	75 55                	jne    801007d2 <cprintf+0x122>
8010077d:	bb 38 71 10 80       	mov    $0x80107138,%ebx
80100782:	b8 28 00 00 00       	mov    $0x28,%eax
80100787:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
8010078d:	85 d2                	test   %edx,%edx
8010078f:	74 39                	je     801007ca <cprintf+0x11a>
80100791:	fa                   	cli    
80100792:	eb fe                	jmp    80100792 <cprintf+0xe2>
80100794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100798:	83 ff 78             	cmp    $0x78,%edi
8010079b:	75 5b                	jne    801007f8 <cprintf+0x148>
8010079d:	8b 03                	mov    (%ebx),%eax
8010079f:	8d 7b 04             	lea    0x4(%ebx),%edi
801007a2:	31 c9                	xor    %ecx,%ecx
801007a4:	ba 10 00 00 00       	mov    $0x10,%edx
801007a9:	89 fb                	mov    %edi,%ebx
801007ab:	e8 f0 fd ff ff       	call   801005a0 <printint>
801007b0:	e9 55 ff ff ff       	jmp    8010070a <cprintf+0x5a>
801007b5:	83 ec 0c             	sub    $0xc,%esp
801007b8:	68 20 a5 10 80       	push   $0x8010a520
801007bd:	e8 9e 3d 00 00       	call   80104560 <acquire>
801007c2:	83 c4 10             	add    $0x10,%esp
801007c5:	e9 03 ff ff ff       	jmp    801006cd <cprintf+0x1d>
801007ca:	e8 41 fc ff ff       	call   80100410 <consputc.part.0>
801007cf:	83 c3 01             	add    $0x1,%ebx
801007d2:	0f be 03             	movsbl (%ebx),%eax
801007d5:	84 c0                	test   %al,%al
801007d7:	75 ae                	jne    80100787 <cprintf+0xd7>
801007d9:	89 fb                	mov    %edi,%ebx
801007db:	e9 2a ff ff ff       	jmp    8010070a <cprintf+0x5a>
801007e0:	8b 3d 58 a5 10 80    	mov    0x8010a558,%edi
801007e6:	85 ff                	test   %edi,%edi
801007e8:	0f 84 12 ff ff ff    	je     80100700 <cprintf+0x50>
801007ee:	fa                   	cli    
801007ef:	eb fe                	jmp    801007ef <cprintf+0x13f>
801007f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007f8:	8b 0d 58 a5 10 80    	mov    0x8010a558,%ecx
801007fe:	85 c9                	test   %ecx,%ecx
80100800:	74 06                	je     80100808 <cprintf+0x158>
80100802:	fa                   	cli    
80100803:	eb fe                	jmp    80100803 <cprintf+0x153>
80100805:	8d 76 00             	lea    0x0(%esi),%esi
80100808:	b8 25 00 00 00       	mov    $0x25,%eax
8010080d:	e8 fe fb ff ff       	call   80100410 <consputc.part.0>
80100812:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
80100818:	85 d2                	test   %edx,%edx
8010081a:	74 2c                	je     80100848 <cprintf+0x198>
8010081c:	fa                   	cli    
8010081d:	eb fe                	jmp    8010081d <cprintf+0x16d>
8010081f:	90                   	nop
80100820:	83 ec 0c             	sub    $0xc,%esp
80100823:	68 20 a5 10 80       	push   $0x8010a520
80100828:	e8 f3 3d 00 00       	call   80104620 <release>
8010082d:	83 c4 10             	add    $0x10,%esp
80100830:	e9 ee fe ff ff       	jmp    80100723 <cprintf+0x73>
80100835:	83 ec 0c             	sub    $0xc,%esp
80100838:	68 3f 71 10 80       	push   $0x8010713f
8010083d:	e8 4e fb ff ff       	call   80100390 <panic>
80100842:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100848:	89 f8                	mov    %edi,%eax
8010084a:	e8 c1 fb ff ff       	call   80100410 <consputc.part.0>
8010084f:	e9 b6 fe ff ff       	jmp    8010070a <cprintf+0x5a>
80100854:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010085b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010085f:	90                   	nop

80100860 <consoleintr>:
80100860:	f3 0f 1e fb          	endbr32 
80100864:	55                   	push   %ebp
80100865:	89 e5                	mov    %esp,%ebp
80100867:	57                   	push   %edi
80100868:	56                   	push   %esi
80100869:	31 f6                	xor    %esi,%esi
8010086b:	53                   	push   %ebx
8010086c:	83 ec 18             	sub    $0x18,%esp
8010086f:	8b 7d 08             	mov    0x8(%ebp),%edi
80100872:	68 20 a5 10 80       	push   $0x8010a520
80100877:	e8 e4 3c 00 00       	call   80104560 <acquire>
8010087c:	83 c4 10             	add    $0x10,%esp
8010087f:	eb 17                	jmp    80100898 <consoleintr+0x38>
80100881:	83 fb 08             	cmp    $0x8,%ebx
80100884:	0f 84 f6 00 00 00    	je     80100980 <consoleintr+0x120>
8010088a:	83 fb 10             	cmp    $0x10,%ebx
8010088d:	0f 85 15 01 00 00    	jne    801009a8 <consoleintr+0x148>
80100893:	be 01 00 00 00       	mov    $0x1,%esi
80100898:	ff d7                	call   *%edi
8010089a:	89 c3                	mov    %eax,%ebx
8010089c:	85 c0                	test   %eax,%eax
8010089e:	0f 88 23 01 00 00    	js     801009c7 <consoleintr+0x167>
801008a4:	83 fb 15             	cmp    $0x15,%ebx
801008a7:	74 77                	je     80100920 <consoleintr+0xc0>
801008a9:	7e d6                	jle    80100881 <consoleintr+0x21>
801008ab:	83 fb 7f             	cmp    $0x7f,%ebx
801008ae:	0f 84 cc 00 00 00    	je     80100980 <consoleintr+0x120>
801008b4:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801008b9:	89 c2                	mov    %eax,%edx
801008bb:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
801008c1:	83 fa 7f             	cmp    $0x7f,%edx
801008c4:	77 d2                	ja     80100898 <consoleintr+0x38>
801008c6:	8d 48 01             	lea    0x1(%eax),%ecx
801008c9:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801008cf:	83 e0 7f             	and    $0x7f,%eax
801008d2:	89 0d a8 ff 10 80    	mov    %ecx,0x8010ffa8
801008d8:	83 fb 0d             	cmp    $0xd,%ebx
801008db:	0f 84 02 01 00 00    	je     801009e3 <consoleintr+0x183>
801008e1:	88 98 20 ff 10 80    	mov    %bl,-0x7fef00e0(%eax)
801008e7:	85 d2                	test   %edx,%edx
801008e9:	0f 85 ff 00 00 00    	jne    801009ee <consoleintr+0x18e>
801008ef:	89 d8                	mov    %ebx,%eax
801008f1:	e8 1a fb ff ff       	call   80100410 <consputc.part.0>
801008f6:	83 fb 0a             	cmp    $0xa,%ebx
801008f9:	0f 84 0f 01 00 00    	je     80100a0e <consoleintr+0x1ae>
801008ff:	83 fb 04             	cmp    $0x4,%ebx
80100902:	0f 84 06 01 00 00    	je     80100a0e <consoleintr+0x1ae>
80100908:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
8010090d:	83 e8 80             	sub    $0xffffff80,%eax
80100910:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
80100916:	75 80                	jne    80100898 <consoleintr+0x38>
80100918:	e9 f6 00 00 00       	jmp    80100a13 <consoleintr+0x1b3>
8010091d:	8d 76 00             	lea    0x0(%esi),%esi
80100920:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100925:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
8010092b:	0f 84 67 ff ff ff    	je     80100898 <consoleintr+0x38>
80100931:	83 e8 01             	sub    $0x1,%eax
80100934:	89 c2                	mov    %eax,%edx
80100936:	83 e2 7f             	and    $0x7f,%edx
80100939:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
80100940:	0f 84 52 ff ff ff    	je     80100898 <consoleintr+0x38>
80100946:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
8010094c:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100951:	85 d2                	test   %edx,%edx
80100953:	74 0b                	je     80100960 <consoleintr+0x100>
80100955:	fa                   	cli    
80100956:	eb fe                	jmp    80100956 <consoleintr+0xf6>
80100958:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010095f:	90                   	nop
80100960:	b8 00 01 00 00       	mov    $0x100,%eax
80100965:	e8 a6 fa ff ff       	call   80100410 <consputc.part.0>
8010096a:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010096f:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
80100975:	75 ba                	jne    80100931 <consoleintr+0xd1>
80100977:	e9 1c ff ff ff       	jmp    80100898 <consoleintr+0x38>
8010097c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100980:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100985:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010098b:	0f 84 07 ff ff ff    	je     80100898 <consoleintr+0x38>
80100991:	83 e8 01             	sub    $0x1,%eax
80100994:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100999:	a1 58 a5 10 80       	mov    0x8010a558,%eax
8010099e:	85 c0                	test   %eax,%eax
801009a0:	74 16                	je     801009b8 <consoleintr+0x158>
801009a2:	fa                   	cli    
801009a3:	eb fe                	jmp    801009a3 <consoleintr+0x143>
801009a5:	8d 76 00             	lea    0x0(%esi),%esi
801009a8:	85 db                	test   %ebx,%ebx
801009aa:	0f 84 e8 fe ff ff    	je     80100898 <consoleintr+0x38>
801009b0:	e9 ff fe ff ff       	jmp    801008b4 <consoleintr+0x54>
801009b5:	8d 76 00             	lea    0x0(%esi),%esi
801009b8:	b8 00 01 00 00       	mov    $0x100,%eax
801009bd:	e8 4e fa ff ff       	call   80100410 <consputc.part.0>
801009c2:	e9 d1 fe ff ff       	jmp    80100898 <consoleintr+0x38>
801009c7:	83 ec 0c             	sub    $0xc,%esp
801009ca:	68 20 a5 10 80       	push   $0x8010a520
801009cf:	e8 4c 3c 00 00       	call   80104620 <release>
801009d4:	83 c4 10             	add    $0x10,%esp
801009d7:	85 f6                	test   %esi,%esi
801009d9:	75 1d                	jne    801009f8 <consoleintr+0x198>
801009db:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009de:	5b                   	pop    %ebx
801009df:	5e                   	pop    %esi
801009e0:	5f                   	pop    %edi
801009e1:	5d                   	pop    %ebp
801009e2:	c3                   	ret    
801009e3:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
801009ea:	85 d2                	test   %edx,%edx
801009ec:	74 16                	je     80100a04 <consoleintr+0x1a4>
801009ee:	fa                   	cli    
801009ef:	eb fe                	jmp    801009ef <consoleintr+0x18f>
801009f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801009f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009fb:	5b                   	pop    %ebx
801009fc:	5e                   	pop    %esi
801009fd:	5f                   	pop    %edi
801009fe:	5d                   	pop    %ebp
801009ff:	e9 cc 37 00 00       	jmp    801041d0 <procdump>
80100a04:	b8 0a 00 00 00       	mov    $0xa,%eax
80100a09:	e8 02 fa ff ff       	call   80100410 <consputc.part.0>
80100a0e:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100a13:	83 ec 0c             	sub    $0xc,%esp
80100a16:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
80100a1b:	68 a0 ff 10 80       	push   $0x8010ffa0
80100a20:	e8 bb 36 00 00       	call   801040e0 <wakeup>
80100a25:	83 c4 10             	add    $0x10,%esp
80100a28:	e9 6b fe ff ff       	jmp    80100898 <consoleintr+0x38>
80100a2d:	8d 76 00             	lea    0x0(%esi),%esi

80100a30 <consoleinit>:
80100a30:	f3 0f 1e fb          	endbr32 
80100a34:	55                   	push   %ebp
80100a35:	89 e5                	mov    %esp,%ebp
80100a37:	83 ec 10             	sub    $0x10,%esp
80100a3a:	68 48 71 10 80       	push   $0x80107148
80100a3f:	68 20 a5 10 80       	push   $0x8010a520
80100a44:	e8 97 39 00 00       	call   801043e0 <initlock>
80100a49:	58                   	pop    %eax
80100a4a:	5a                   	pop    %edx
80100a4b:	6a 00                	push   $0x0
80100a4d:	6a 01                	push   $0x1
80100a4f:	c7 05 6c 09 11 80 40 	movl   $0x80100640,0x8011096c
80100a56:	06 10 80 
80100a59:	c7 05 68 09 11 80 90 	movl   $0x80100290,0x80110968
80100a60:	02 10 80 
80100a63:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
80100a6a:	00 00 00 
80100a6d:	e8 be 19 00 00       	call   80102430 <ioapicenable>
80100a72:	83 c4 10             	add    $0x10,%esp
80100a75:	c9                   	leave  
80100a76:	c3                   	ret    
80100a77:	66 90                	xchg   %ax,%ax
80100a79:	66 90                	xchg   %ax,%ax
80100a7b:	66 90                	xchg   %ax,%ax
80100a7d:	66 90                	xchg   %ax,%ax
80100a7f:	90                   	nop

80100a80 <exec>:
80100a80:	f3 0f 1e fb          	endbr32 
80100a84:	55                   	push   %ebp
80100a85:	89 e5                	mov    %esp,%ebp
80100a87:	57                   	push   %edi
80100a88:	56                   	push   %esi
80100a89:	53                   	push   %ebx
80100a8a:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
80100a90:	e8 cb 2e 00 00       	call   80103960 <myproc>
80100a95:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100a9b:	e8 90 22 00 00       	call   80102d30 <begin_op>
80100aa0:	83 ec 0c             	sub    $0xc,%esp
80100aa3:	ff 75 08             	pushl  0x8(%ebp)
80100aa6:	e8 85 15 00 00       	call   80102030 <namei>
80100aab:	83 c4 10             	add    $0x10,%esp
80100aae:	85 c0                	test   %eax,%eax
80100ab0:	0f 84 fe 02 00 00    	je     80100db4 <exec+0x334>
80100ab6:	83 ec 0c             	sub    $0xc,%esp
80100ab9:	89 c3                	mov    %eax,%ebx
80100abb:	50                   	push   %eax
80100abc:	e8 9f 0c 00 00       	call   80101760 <ilock>
80100ac1:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100ac7:	6a 34                	push   $0x34
80100ac9:	6a 00                	push   $0x0
80100acb:	50                   	push   %eax
80100acc:	53                   	push   %ebx
80100acd:	e8 8e 0f 00 00       	call   80101a60 <readi>
80100ad2:	83 c4 20             	add    $0x20,%esp
80100ad5:	83 f8 34             	cmp    $0x34,%eax
80100ad8:	74 26                	je     80100b00 <exec+0x80>
80100ada:	83 ec 0c             	sub    $0xc,%esp
80100add:	53                   	push   %ebx
80100ade:	e8 1d 0f 00 00       	call   80101a00 <iunlockput>
80100ae3:	e8 b8 22 00 00       	call   80102da0 <end_op>
80100ae8:	83 c4 10             	add    $0x10,%esp
80100aeb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100af0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100af3:	5b                   	pop    %ebx
80100af4:	5e                   	pop    %esi
80100af5:	5f                   	pop    %edi
80100af6:	5d                   	pop    %ebp
80100af7:	c3                   	ret    
80100af8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100aff:	90                   	nop
80100b00:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100b07:	45 4c 46 
80100b0a:	75 ce                	jne    80100ada <exec+0x5a>
80100b0c:	e8 3f 63 00 00       	call   80106e50 <setupkvm>
80100b11:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100b17:	85 c0                	test   %eax,%eax
80100b19:	74 bf                	je     80100ada <exec+0x5a>
80100b1b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100b22:	00 
80100b23:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100b29:	0f 84 a4 02 00 00    	je     80100dd3 <exec+0x353>
80100b2f:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100b36:	00 00 00 
80100b39:	31 ff                	xor    %edi,%edi
80100b3b:	e9 86 00 00 00       	jmp    80100bc6 <exec+0x146>
80100b40:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b47:	75 6c                	jne    80100bb5 <exec+0x135>
80100b49:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b4f:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b55:	0f 82 87 00 00 00    	jb     80100be2 <exec+0x162>
80100b5b:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b61:	72 7f                	jb     80100be2 <exec+0x162>
80100b63:	83 ec 04             	sub    $0x4,%esp
80100b66:	50                   	push   %eax
80100b67:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b6d:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b73:	e8 f8 60 00 00       	call   80106c70 <allocuvm>
80100b78:	83 c4 10             	add    $0x10,%esp
80100b7b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b81:	85 c0                	test   %eax,%eax
80100b83:	74 5d                	je     80100be2 <exec+0x162>
80100b85:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b8b:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b90:	75 50                	jne    80100be2 <exec+0x162>
80100b92:	83 ec 0c             	sub    $0xc,%esp
80100b95:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b9b:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100ba1:	53                   	push   %ebx
80100ba2:	50                   	push   %eax
80100ba3:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ba9:	e8 f2 5f 00 00       	call   80106ba0 <loaduvm>
80100bae:	83 c4 20             	add    $0x20,%esp
80100bb1:	85 c0                	test   %eax,%eax
80100bb3:	78 2d                	js     80100be2 <exec+0x162>
80100bb5:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100bbc:	83 c7 01             	add    $0x1,%edi
80100bbf:	83 c6 20             	add    $0x20,%esi
80100bc2:	39 f8                	cmp    %edi,%eax
80100bc4:	7e 3a                	jle    80100c00 <exec+0x180>
80100bc6:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100bcc:	6a 20                	push   $0x20
80100bce:	56                   	push   %esi
80100bcf:	50                   	push   %eax
80100bd0:	53                   	push   %ebx
80100bd1:	e8 8a 0e 00 00       	call   80101a60 <readi>
80100bd6:	83 c4 10             	add    $0x10,%esp
80100bd9:	83 f8 20             	cmp    $0x20,%eax
80100bdc:	0f 84 5e ff ff ff    	je     80100b40 <exec+0xc0>
80100be2:	83 ec 0c             	sub    $0xc,%esp
80100be5:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100beb:	e8 e0 61 00 00       	call   80106dd0 <freevm>
80100bf0:	83 c4 10             	add    $0x10,%esp
80100bf3:	e9 e2 fe ff ff       	jmp    80100ada <exec+0x5a>
80100bf8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100bff:	90                   	nop
80100c00:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100c06:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100c0c:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100c12:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
80100c18:	83 ec 0c             	sub    $0xc,%esp
80100c1b:	53                   	push   %ebx
80100c1c:	e8 df 0d 00 00       	call   80101a00 <iunlockput>
80100c21:	e8 7a 21 00 00       	call   80102da0 <end_op>
80100c26:	83 c4 0c             	add    $0xc,%esp
80100c29:	56                   	push   %esi
80100c2a:	57                   	push   %edi
80100c2b:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100c31:	57                   	push   %edi
80100c32:	e8 39 60 00 00       	call   80106c70 <allocuvm>
80100c37:	83 c4 10             	add    $0x10,%esp
80100c3a:	89 c6                	mov    %eax,%esi
80100c3c:	85 c0                	test   %eax,%eax
80100c3e:	0f 84 94 00 00 00    	je     80100cd8 <exec+0x258>
80100c44:	83 ec 08             	sub    $0x8,%esp
80100c47:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100c4d:	89 f3                	mov    %esi,%ebx
80100c4f:	50                   	push   %eax
80100c50:	57                   	push   %edi
80100c51:	31 ff                	xor    %edi,%edi
80100c53:	e8 98 62 00 00       	call   80106ef0 <clearpteu>
80100c58:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c5b:	83 c4 10             	add    $0x10,%esp
80100c5e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c64:	8b 00                	mov    (%eax),%eax
80100c66:	85 c0                	test   %eax,%eax
80100c68:	0f 84 8b 00 00 00    	je     80100cf9 <exec+0x279>
80100c6e:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100c74:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100c7a:	eb 23                	jmp    80100c9f <exec+0x21f>
80100c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100c80:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c83:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c8a:	83 c7 01             	add    $0x1,%edi
80100c8d:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c93:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c96:	85 c0                	test   %eax,%eax
80100c98:	74 59                	je     80100cf3 <exec+0x273>
80100c9a:	83 ff 20             	cmp    $0x20,%edi
80100c9d:	74 39                	je     80100cd8 <exec+0x258>
80100c9f:	83 ec 0c             	sub    $0xc,%esp
80100ca2:	50                   	push   %eax
80100ca3:	e8 c8 3b 00 00       	call   80104870 <strlen>
80100ca8:	f7 d0                	not    %eax
80100caa:	01 c3                	add    %eax,%ebx
80100cac:	58                   	pop    %eax
80100cad:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cb0:	83 e3 fc             	and    $0xfffffffc,%ebx
80100cb3:	ff 34 b8             	pushl  (%eax,%edi,4)
80100cb6:	e8 b5 3b 00 00       	call   80104870 <strlen>
80100cbb:	83 c0 01             	add    $0x1,%eax
80100cbe:	50                   	push   %eax
80100cbf:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cc2:	ff 34 b8             	pushl  (%eax,%edi,4)
80100cc5:	53                   	push   %ebx
80100cc6:	56                   	push   %esi
80100cc7:	e8 84 63 00 00       	call   80107050 <copyout>
80100ccc:	83 c4 20             	add    $0x20,%esp
80100ccf:	85 c0                	test   %eax,%eax
80100cd1:	79 ad                	jns    80100c80 <exec+0x200>
80100cd3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100cd7:	90                   	nop
80100cd8:	83 ec 0c             	sub    $0xc,%esp
80100cdb:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ce1:	e8 ea 60 00 00       	call   80106dd0 <freevm>
80100ce6:	83 c4 10             	add    $0x10,%esp
80100ce9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100cee:	e9 fd fd ff ff       	jmp    80100af0 <exec+0x70>
80100cf3:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100cf9:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100d00:	89 d9                	mov    %ebx,%ecx
80100d02:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100d09:	00 00 00 00 
80100d0d:	29 c1                	sub    %eax,%ecx
80100d0f:	83 c0 0c             	add    $0xc,%eax
80100d12:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100d18:	29 c3                	sub    %eax,%ebx
80100d1a:	50                   	push   %eax
80100d1b:	52                   	push   %edx
80100d1c:	53                   	push   %ebx
80100d1d:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100d23:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100d2a:	ff ff ff 
80100d2d:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100d33:	e8 18 63 00 00       	call   80107050 <copyout>
80100d38:	83 c4 10             	add    $0x10,%esp
80100d3b:	85 c0                	test   %eax,%eax
80100d3d:	78 99                	js     80100cd8 <exec+0x258>
80100d3f:	8b 45 08             	mov    0x8(%ebp),%eax
80100d42:	8b 55 08             	mov    0x8(%ebp),%edx
80100d45:	0f b6 00             	movzbl (%eax),%eax
80100d48:	84 c0                	test   %al,%al
80100d4a:	74 13                	je     80100d5f <exec+0x2df>
80100d4c:	89 d1                	mov    %edx,%ecx
80100d4e:	66 90                	xchg   %ax,%ax
80100d50:	83 c1 01             	add    $0x1,%ecx
80100d53:	3c 2f                	cmp    $0x2f,%al
80100d55:	0f b6 01             	movzbl (%ecx),%eax
80100d58:	0f 44 d1             	cmove  %ecx,%edx
80100d5b:	84 c0                	test   %al,%al
80100d5d:	75 f1                	jne    80100d50 <exec+0x2d0>
80100d5f:	8b bd ec fe ff ff    	mov    -0x114(%ebp),%edi
80100d65:	83 ec 04             	sub    $0x4,%esp
80100d68:	6a 10                	push   $0x10
80100d6a:	89 f8                	mov    %edi,%eax
80100d6c:	52                   	push   %edx
80100d6d:	83 c0 6c             	add    $0x6c,%eax
80100d70:	50                   	push   %eax
80100d71:	e8 ba 3a 00 00       	call   80104830 <safestrcpy>
80100d76:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100d7c:	89 f8                	mov    %edi,%eax
80100d7e:	8b 7f 04             	mov    0x4(%edi),%edi
80100d81:	89 30                	mov    %esi,(%eax)
80100d83:	89 48 04             	mov    %ecx,0x4(%eax)
80100d86:	89 c1                	mov    %eax,%ecx
80100d88:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d8e:	8b 40 18             	mov    0x18(%eax),%eax
80100d91:	89 50 38             	mov    %edx,0x38(%eax)
80100d94:	8b 41 18             	mov    0x18(%ecx),%eax
80100d97:	89 58 44             	mov    %ebx,0x44(%eax)
80100d9a:	89 0c 24             	mov    %ecx,(%esp)
80100d9d:	e8 6e 5c 00 00       	call   80106a10 <switchuvm>
80100da2:	89 3c 24             	mov    %edi,(%esp)
80100da5:	e8 26 60 00 00       	call   80106dd0 <freevm>
80100daa:	83 c4 10             	add    $0x10,%esp
80100dad:	31 c0                	xor    %eax,%eax
80100daf:	e9 3c fd ff ff       	jmp    80100af0 <exec+0x70>
80100db4:	e8 e7 1f 00 00       	call   80102da0 <end_op>
80100db9:	83 ec 0c             	sub    $0xc,%esp
80100dbc:	68 61 71 10 80       	push   $0x80107161
80100dc1:	e8 ea f8 ff ff       	call   801006b0 <cprintf>
80100dc6:	83 c4 10             	add    $0x10,%esp
80100dc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100dce:	e9 1d fd ff ff       	jmp    80100af0 <exec+0x70>
80100dd3:	31 ff                	xor    %edi,%edi
80100dd5:	be 00 20 00 00       	mov    $0x2000,%esi
80100dda:	e9 39 fe ff ff       	jmp    80100c18 <exec+0x198>
80100ddf:	90                   	nop

80100de0 <fileinit>:
80100de0:	f3 0f 1e fb          	endbr32 
80100de4:	55                   	push   %ebp
80100de5:	89 e5                	mov    %esp,%ebp
80100de7:	83 ec 10             	sub    $0x10,%esp
80100dea:	68 6d 71 10 80       	push   $0x8010716d
80100def:	68 c0 ff 10 80       	push   $0x8010ffc0
80100df4:	e8 e7 35 00 00       	call   801043e0 <initlock>
80100df9:	83 c4 10             	add    $0x10,%esp
80100dfc:	c9                   	leave  
80100dfd:	c3                   	ret    
80100dfe:	66 90                	xchg   %ax,%ax

80100e00 <filealloc>:
80100e00:	f3 0f 1e fb          	endbr32 
80100e04:	55                   	push   %ebp
80100e05:	89 e5                	mov    %esp,%ebp
80100e07:	53                   	push   %ebx
80100e08:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
80100e0d:	83 ec 10             	sub    $0x10,%esp
80100e10:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e15:	e8 46 37 00 00       	call   80104560 <acquire>
80100e1a:	83 c4 10             	add    $0x10,%esp
80100e1d:	eb 0c                	jmp    80100e2b <filealloc+0x2b>
80100e1f:	90                   	nop
80100e20:	83 c3 18             	add    $0x18,%ebx
80100e23:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100e29:	74 25                	je     80100e50 <filealloc+0x50>
80100e2b:	8b 43 04             	mov    0x4(%ebx),%eax
80100e2e:	85 c0                	test   %eax,%eax
80100e30:	75 ee                	jne    80100e20 <filealloc+0x20>
80100e32:	83 ec 0c             	sub    $0xc,%esp
80100e35:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100e3c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e41:	e8 da 37 00 00       	call   80104620 <release>
80100e46:	89 d8                	mov    %ebx,%eax
80100e48:	83 c4 10             	add    $0x10,%esp
80100e4b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e4e:	c9                   	leave  
80100e4f:	c3                   	ret    
80100e50:	83 ec 0c             	sub    $0xc,%esp
80100e53:	31 db                	xor    %ebx,%ebx
80100e55:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e5a:	e8 c1 37 00 00       	call   80104620 <release>
80100e5f:	89 d8                	mov    %ebx,%eax
80100e61:	83 c4 10             	add    $0x10,%esp
80100e64:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e67:	c9                   	leave  
80100e68:	c3                   	ret    
80100e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100e70 <filedup>:
80100e70:	f3 0f 1e fb          	endbr32 
80100e74:	55                   	push   %ebp
80100e75:	89 e5                	mov    %esp,%ebp
80100e77:	53                   	push   %ebx
80100e78:	83 ec 10             	sub    $0x10,%esp
80100e7b:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e7e:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e83:	e8 d8 36 00 00       	call   80104560 <acquire>
80100e88:	8b 43 04             	mov    0x4(%ebx),%eax
80100e8b:	83 c4 10             	add    $0x10,%esp
80100e8e:	85 c0                	test   %eax,%eax
80100e90:	7e 1a                	jle    80100eac <filedup+0x3c>
80100e92:	83 c0 01             	add    $0x1,%eax
80100e95:	83 ec 0c             	sub    $0xc,%esp
80100e98:	89 43 04             	mov    %eax,0x4(%ebx)
80100e9b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100ea0:	e8 7b 37 00 00       	call   80104620 <release>
80100ea5:	89 d8                	mov    %ebx,%eax
80100ea7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100eaa:	c9                   	leave  
80100eab:	c3                   	ret    
80100eac:	83 ec 0c             	sub    $0xc,%esp
80100eaf:	68 74 71 10 80       	push   $0x80107174
80100eb4:	e8 d7 f4 ff ff       	call   80100390 <panic>
80100eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100ec0 <fileclose>:
80100ec0:	f3 0f 1e fb          	endbr32 
80100ec4:	55                   	push   %ebp
80100ec5:	89 e5                	mov    %esp,%ebp
80100ec7:	57                   	push   %edi
80100ec8:	56                   	push   %esi
80100ec9:	53                   	push   %ebx
80100eca:	83 ec 28             	sub    $0x28,%esp
80100ecd:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100ed0:	68 c0 ff 10 80       	push   $0x8010ffc0
80100ed5:	e8 86 36 00 00       	call   80104560 <acquire>
80100eda:	8b 53 04             	mov    0x4(%ebx),%edx
80100edd:	83 c4 10             	add    $0x10,%esp
80100ee0:	85 d2                	test   %edx,%edx
80100ee2:	0f 8e a1 00 00 00    	jle    80100f89 <fileclose+0xc9>
80100ee8:	83 ea 01             	sub    $0x1,%edx
80100eeb:	89 53 04             	mov    %edx,0x4(%ebx)
80100eee:	75 40                	jne    80100f30 <fileclose+0x70>
80100ef0:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100ef4:	83 ec 0c             	sub    $0xc,%esp
80100ef7:	8b 3b                	mov    (%ebx),%edi
80100ef9:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100eff:	8b 73 0c             	mov    0xc(%ebx),%esi
80100f02:	88 45 e7             	mov    %al,-0x19(%ebp)
80100f05:	8b 43 10             	mov    0x10(%ebx),%eax
80100f08:	68 c0 ff 10 80       	push   $0x8010ffc0
80100f0d:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100f10:	e8 0b 37 00 00       	call   80104620 <release>
80100f15:	83 c4 10             	add    $0x10,%esp
80100f18:	83 ff 01             	cmp    $0x1,%edi
80100f1b:	74 53                	je     80100f70 <fileclose+0xb0>
80100f1d:	83 ff 02             	cmp    $0x2,%edi
80100f20:	74 26                	je     80100f48 <fileclose+0x88>
80100f22:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f25:	5b                   	pop    %ebx
80100f26:	5e                   	pop    %esi
80100f27:	5f                   	pop    %edi
80100f28:	5d                   	pop    %ebp
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f30:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
80100f37:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f3a:	5b                   	pop    %ebx
80100f3b:	5e                   	pop    %esi
80100f3c:	5f                   	pop    %edi
80100f3d:	5d                   	pop    %ebp
80100f3e:	e9 dd 36 00 00       	jmp    80104620 <release>
80100f43:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f47:	90                   	nop
80100f48:	e8 e3 1d 00 00       	call   80102d30 <begin_op>
80100f4d:	83 ec 0c             	sub    $0xc,%esp
80100f50:	ff 75 e0             	pushl  -0x20(%ebp)
80100f53:	e8 38 09 00 00       	call   80101890 <iput>
80100f58:	83 c4 10             	add    $0x10,%esp
80100f5b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f5e:	5b                   	pop    %ebx
80100f5f:	5e                   	pop    %esi
80100f60:	5f                   	pop    %edi
80100f61:	5d                   	pop    %ebp
80100f62:	e9 39 1e 00 00       	jmp    80102da0 <end_op>
80100f67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f6e:	66 90                	xchg   %ax,%ax
80100f70:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100f74:	83 ec 08             	sub    $0x8,%esp
80100f77:	53                   	push   %ebx
80100f78:	56                   	push   %esi
80100f79:	e8 82 25 00 00       	call   80103500 <pipeclose>
80100f7e:	83 c4 10             	add    $0x10,%esp
80100f81:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f84:	5b                   	pop    %ebx
80100f85:	5e                   	pop    %esi
80100f86:	5f                   	pop    %edi
80100f87:	5d                   	pop    %ebp
80100f88:	c3                   	ret    
80100f89:	83 ec 0c             	sub    $0xc,%esp
80100f8c:	68 7c 71 10 80       	push   $0x8010717c
80100f91:	e8 fa f3 ff ff       	call   80100390 <panic>
80100f96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f9d:	8d 76 00             	lea    0x0(%esi),%esi

80100fa0 <filestat>:
80100fa0:	f3 0f 1e fb          	endbr32 
80100fa4:	55                   	push   %ebp
80100fa5:	89 e5                	mov    %esp,%ebp
80100fa7:	53                   	push   %ebx
80100fa8:	83 ec 04             	sub    $0x4,%esp
80100fab:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fae:	83 3b 02             	cmpl   $0x2,(%ebx)
80100fb1:	75 2d                	jne    80100fe0 <filestat+0x40>
80100fb3:	83 ec 0c             	sub    $0xc,%esp
80100fb6:	ff 73 10             	pushl  0x10(%ebx)
80100fb9:	e8 a2 07 00 00       	call   80101760 <ilock>
80100fbe:	58                   	pop    %eax
80100fbf:	5a                   	pop    %edx
80100fc0:	ff 75 0c             	pushl  0xc(%ebp)
80100fc3:	ff 73 10             	pushl  0x10(%ebx)
80100fc6:	e8 65 0a 00 00       	call   80101a30 <stati>
80100fcb:	59                   	pop    %ecx
80100fcc:	ff 73 10             	pushl  0x10(%ebx)
80100fcf:	e8 6c 08 00 00       	call   80101840 <iunlock>
80100fd4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100fd7:	83 c4 10             	add    $0x10,%esp
80100fda:	31 c0                	xor    %eax,%eax
80100fdc:	c9                   	leave  
80100fdd:	c3                   	ret    
80100fde:	66 90                	xchg   %ax,%ax
80100fe0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100fe3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fe8:	c9                   	leave  
80100fe9:	c3                   	ret    
80100fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100ff0 <fileread>:
80100ff0:	f3 0f 1e fb          	endbr32 
80100ff4:	55                   	push   %ebp
80100ff5:	89 e5                	mov    %esp,%ebp
80100ff7:	57                   	push   %edi
80100ff8:	56                   	push   %esi
80100ff9:	53                   	push   %ebx
80100ffa:	83 ec 0c             	sub    $0xc,%esp
80100ffd:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101000:	8b 75 0c             	mov    0xc(%ebp),%esi
80101003:	8b 7d 10             	mov    0x10(%ebp),%edi
80101006:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
8010100a:	74 64                	je     80101070 <fileread+0x80>
8010100c:	8b 03                	mov    (%ebx),%eax
8010100e:	83 f8 01             	cmp    $0x1,%eax
80101011:	74 45                	je     80101058 <fileread+0x68>
80101013:	83 f8 02             	cmp    $0x2,%eax
80101016:	75 5f                	jne    80101077 <fileread+0x87>
80101018:	83 ec 0c             	sub    $0xc,%esp
8010101b:	ff 73 10             	pushl  0x10(%ebx)
8010101e:	e8 3d 07 00 00       	call   80101760 <ilock>
80101023:	57                   	push   %edi
80101024:	ff 73 14             	pushl  0x14(%ebx)
80101027:	56                   	push   %esi
80101028:	ff 73 10             	pushl  0x10(%ebx)
8010102b:	e8 30 0a 00 00       	call   80101a60 <readi>
80101030:	83 c4 20             	add    $0x20,%esp
80101033:	89 c6                	mov    %eax,%esi
80101035:	85 c0                	test   %eax,%eax
80101037:	7e 03                	jle    8010103c <fileread+0x4c>
80101039:	01 43 14             	add    %eax,0x14(%ebx)
8010103c:	83 ec 0c             	sub    $0xc,%esp
8010103f:	ff 73 10             	pushl  0x10(%ebx)
80101042:	e8 f9 07 00 00       	call   80101840 <iunlock>
80101047:	83 c4 10             	add    $0x10,%esp
8010104a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010104d:	89 f0                	mov    %esi,%eax
8010104f:	5b                   	pop    %ebx
80101050:	5e                   	pop    %esi
80101051:	5f                   	pop    %edi
80101052:	5d                   	pop    %ebp
80101053:	c3                   	ret    
80101054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101058:	8b 43 0c             	mov    0xc(%ebx),%eax
8010105b:	89 45 08             	mov    %eax,0x8(%ebp)
8010105e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101061:	5b                   	pop    %ebx
80101062:	5e                   	pop    %esi
80101063:	5f                   	pop    %edi
80101064:	5d                   	pop    %ebp
80101065:	e9 36 26 00 00       	jmp    801036a0 <piperead>
8010106a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101070:	be ff ff ff ff       	mov    $0xffffffff,%esi
80101075:	eb d3                	jmp    8010104a <fileread+0x5a>
80101077:	83 ec 0c             	sub    $0xc,%esp
8010107a:	68 86 71 10 80       	push   $0x80107186
8010107f:	e8 0c f3 ff ff       	call   80100390 <panic>
80101084:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010108b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010108f:	90                   	nop

80101090 <filewrite>:
80101090:	f3 0f 1e fb          	endbr32 
80101094:	55                   	push   %ebp
80101095:	89 e5                	mov    %esp,%ebp
80101097:	57                   	push   %edi
80101098:	56                   	push   %esi
80101099:	53                   	push   %ebx
8010109a:	83 ec 1c             	sub    $0x1c,%esp
8010109d:	8b 45 0c             	mov    0xc(%ebp),%eax
801010a0:	8b 75 08             	mov    0x8(%ebp),%esi
801010a3:	89 45 dc             	mov    %eax,-0x24(%ebp)
801010a6:	8b 45 10             	mov    0x10(%ebp),%eax
801010a9:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
801010ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801010b0:	0f 84 c1 00 00 00    	je     80101177 <filewrite+0xe7>
801010b6:	8b 06                	mov    (%esi),%eax
801010b8:	83 f8 01             	cmp    $0x1,%eax
801010bb:	0f 84 c3 00 00 00    	je     80101184 <filewrite+0xf4>
801010c1:	83 f8 02             	cmp    $0x2,%eax
801010c4:	0f 85 cc 00 00 00    	jne    80101196 <filewrite+0x106>
801010ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801010cd:	31 ff                	xor    %edi,%edi
801010cf:	85 c0                	test   %eax,%eax
801010d1:	7f 34                	jg     80101107 <filewrite+0x77>
801010d3:	e9 98 00 00 00       	jmp    80101170 <filewrite+0xe0>
801010d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010df:	90                   	nop
801010e0:	01 46 14             	add    %eax,0x14(%esi)
801010e3:	83 ec 0c             	sub    $0xc,%esp
801010e6:	ff 76 10             	pushl  0x10(%esi)
801010e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010ec:	e8 4f 07 00 00       	call   80101840 <iunlock>
801010f1:	e8 aa 1c 00 00       	call   80102da0 <end_op>
801010f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010f9:	83 c4 10             	add    $0x10,%esp
801010fc:	39 c3                	cmp    %eax,%ebx
801010fe:	75 60                	jne    80101160 <filewrite+0xd0>
80101100:	01 df                	add    %ebx,%edi
80101102:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101105:	7e 69                	jle    80101170 <filewrite+0xe0>
80101107:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010110a:	b8 00 06 00 00       	mov    $0x600,%eax
8010110f:	29 fb                	sub    %edi,%ebx
80101111:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101117:	0f 4f d8             	cmovg  %eax,%ebx
8010111a:	e8 11 1c 00 00       	call   80102d30 <begin_op>
8010111f:	83 ec 0c             	sub    $0xc,%esp
80101122:	ff 76 10             	pushl  0x10(%esi)
80101125:	e8 36 06 00 00       	call   80101760 <ilock>
8010112a:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010112d:	53                   	push   %ebx
8010112e:	ff 76 14             	pushl  0x14(%esi)
80101131:	01 f8                	add    %edi,%eax
80101133:	50                   	push   %eax
80101134:	ff 76 10             	pushl  0x10(%esi)
80101137:	e8 24 0a 00 00       	call   80101b60 <writei>
8010113c:	83 c4 20             	add    $0x20,%esp
8010113f:	85 c0                	test   %eax,%eax
80101141:	7f 9d                	jg     801010e0 <filewrite+0x50>
80101143:	83 ec 0c             	sub    $0xc,%esp
80101146:	ff 76 10             	pushl  0x10(%esi)
80101149:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010114c:	e8 ef 06 00 00       	call   80101840 <iunlock>
80101151:	e8 4a 1c 00 00       	call   80102da0 <end_op>
80101156:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101159:	83 c4 10             	add    $0x10,%esp
8010115c:	85 c0                	test   %eax,%eax
8010115e:	75 17                	jne    80101177 <filewrite+0xe7>
80101160:	83 ec 0c             	sub    $0xc,%esp
80101163:	68 8f 71 10 80       	push   $0x8010718f
80101168:	e8 23 f2 ff ff       	call   80100390 <panic>
8010116d:	8d 76 00             	lea    0x0(%esi),%esi
80101170:	89 f8                	mov    %edi,%eax
80101172:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
80101175:	74 05                	je     8010117c <filewrite+0xec>
80101177:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010117c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010117f:	5b                   	pop    %ebx
80101180:	5e                   	pop    %esi
80101181:	5f                   	pop    %edi
80101182:	5d                   	pop    %ebp
80101183:	c3                   	ret    
80101184:	8b 46 0c             	mov    0xc(%esi),%eax
80101187:	89 45 08             	mov    %eax,0x8(%ebp)
8010118a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010118d:	5b                   	pop    %ebx
8010118e:	5e                   	pop    %esi
8010118f:	5f                   	pop    %edi
80101190:	5d                   	pop    %ebp
80101191:	e9 0a 24 00 00       	jmp    801035a0 <pipewrite>
80101196:	83 ec 0c             	sub    $0xc,%esp
80101199:	68 95 71 10 80       	push   $0x80107195
8010119e:	e8 ed f1 ff ff       	call   80100390 <panic>
801011a3:	66 90                	xchg   %ax,%ax
801011a5:	66 90                	xchg   %ax,%ax
801011a7:	66 90                	xchg   %ax,%ax
801011a9:	66 90                	xchg   %ax,%ax
801011ab:	66 90                	xchg   %ax,%ax
801011ad:	66 90                	xchg   %ax,%ax
801011af:	90                   	nop

801011b0 <bfree>:
801011b0:	55                   	push   %ebp
801011b1:	89 c1                	mov    %eax,%ecx
801011b3:	89 d0                	mov    %edx,%eax
801011b5:	c1 e8 0c             	shr    $0xc,%eax
801011b8:	03 05 d8 09 11 80    	add    0x801109d8,%eax
801011be:	89 e5                	mov    %esp,%ebp
801011c0:	56                   	push   %esi
801011c1:	53                   	push   %ebx
801011c2:	89 d3                	mov    %edx,%ebx
801011c4:	83 ec 08             	sub    $0x8,%esp
801011c7:	50                   	push   %eax
801011c8:	51                   	push   %ecx
801011c9:	e8 02 ef ff ff       	call   801000d0 <bread>
801011ce:	89 d9                	mov    %ebx,%ecx
801011d0:	c1 fb 03             	sar    $0x3,%ebx
801011d3:	ba 01 00 00 00       	mov    $0x1,%edx
801011d8:	83 e1 07             	and    $0x7,%ecx
801011db:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
801011e1:	83 c4 10             	add    $0x10,%esp
801011e4:	d3 e2                	shl    %cl,%edx
801011e6:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
801011eb:	85 d1                	test   %edx,%ecx
801011ed:	74 25                	je     80101214 <bfree+0x64>
801011ef:	f7 d2                	not    %edx
801011f1:	83 ec 0c             	sub    $0xc,%esp
801011f4:	89 c6                	mov    %eax,%esi
801011f6:	21 ca                	and    %ecx,%edx
801011f8:	88 54 18 5c          	mov    %dl,0x5c(%eax,%ebx,1)
801011fc:	50                   	push   %eax
801011fd:	e8 0e 1d 00 00       	call   80102f10 <log_write>
80101202:	89 34 24             	mov    %esi,(%esp)
80101205:	e8 e6 ef ff ff       	call   801001f0 <brelse>
8010120a:	83 c4 10             	add    $0x10,%esp
8010120d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101210:	5b                   	pop    %ebx
80101211:	5e                   	pop    %esi
80101212:	5d                   	pop    %ebp
80101213:	c3                   	ret    
80101214:	83 ec 0c             	sub    $0xc,%esp
80101217:	68 9f 71 10 80       	push   $0x8010719f
8010121c:	e8 6f f1 ff ff       	call   80100390 <panic>
80101221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101228:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010122f:	90                   	nop

80101230 <balloc>:
80101230:	55                   	push   %ebp
80101231:	89 e5                	mov    %esp,%ebp
80101233:	57                   	push   %edi
80101234:	56                   	push   %esi
80101235:	53                   	push   %ebx
80101236:	83 ec 1c             	sub    $0x1c,%esp
80101239:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
8010123f:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101242:	85 c9                	test   %ecx,%ecx
80101244:	0f 84 87 00 00 00    	je     801012d1 <balloc+0xa1>
8010124a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101251:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101254:	83 ec 08             	sub    $0x8,%esp
80101257:	89 f0                	mov    %esi,%eax
80101259:	c1 f8 0c             	sar    $0xc,%eax
8010125c:	03 05 d8 09 11 80    	add    0x801109d8,%eax
80101262:	50                   	push   %eax
80101263:	ff 75 d8             	pushl  -0x28(%ebp)
80101266:	e8 65 ee ff ff       	call   801000d0 <bread>
8010126b:	83 c4 10             	add    $0x10,%esp
8010126e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101271:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101276:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101279:	31 c0                	xor    %eax,%eax
8010127b:	eb 2f                	jmp    801012ac <balloc+0x7c>
8010127d:	8d 76 00             	lea    0x0(%esi),%esi
80101280:	89 c1                	mov    %eax,%ecx
80101282:	bb 01 00 00 00       	mov    $0x1,%ebx
80101287:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010128a:	83 e1 07             	and    $0x7,%ecx
8010128d:	d3 e3                	shl    %cl,%ebx
8010128f:	89 c1                	mov    %eax,%ecx
80101291:	c1 f9 03             	sar    $0x3,%ecx
80101294:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101299:	89 fa                	mov    %edi,%edx
8010129b:	85 df                	test   %ebx,%edi
8010129d:	74 41                	je     801012e0 <balloc+0xb0>
8010129f:	83 c0 01             	add    $0x1,%eax
801012a2:	83 c6 01             	add    $0x1,%esi
801012a5:	3d 00 10 00 00       	cmp    $0x1000,%eax
801012aa:	74 05                	je     801012b1 <balloc+0x81>
801012ac:	39 75 e0             	cmp    %esi,-0x20(%ebp)
801012af:	77 cf                	ja     80101280 <balloc+0x50>
801012b1:	83 ec 0c             	sub    $0xc,%esp
801012b4:	ff 75 e4             	pushl  -0x1c(%ebp)
801012b7:	e8 34 ef ff ff       	call   801001f0 <brelse>
801012bc:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801012c3:	83 c4 10             	add    $0x10,%esp
801012c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801012c9:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
801012cf:	77 80                	ja     80101251 <balloc+0x21>
801012d1:	83 ec 0c             	sub    $0xc,%esp
801012d4:	68 b2 71 10 80       	push   $0x801071b2
801012d9:	e8 b2 f0 ff ff       	call   80100390 <panic>
801012de:	66 90                	xchg   %ax,%ax
801012e0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801012e3:	83 ec 0c             	sub    $0xc,%esp
801012e6:	09 da                	or     %ebx,%edx
801012e8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801012ec:	57                   	push   %edi
801012ed:	e8 1e 1c 00 00       	call   80102f10 <log_write>
801012f2:	89 3c 24             	mov    %edi,(%esp)
801012f5:	e8 f6 ee ff ff       	call   801001f0 <brelse>
801012fa:	58                   	pop    %eax
801012fb:	5a                   	pop    %edx
801012fc:	56                   	push   %esi
801012fd:	ff 75 d8             	pushl  -0x28(%ebp)
80101300:	e8 cb ed ff ff       	call   801000d0 <bread>
80101305:	83 c4 0c             	add    $0xc,%esp
80101308:	89 c3                	mov    %eax,%ebx
8010130a:	8d 40 5c             	lea    0x5c(%eax),%eax
8010130d:	68 00 02 00 00       	push   $0x200
80101312:	6a 00                	push   $0x0
80101314:	50                   	push   %eax
80101315:	e8 56 33 00 00       	call   80104670 <memset>
8010131a:	89 1c 24             	mov    %ebx,(%esp)
8010131d:	e8 ee 1b 00 00       	call   80102f10 <log_write>
80101322:	89 1c 24             	mov    %ebx,(%esp)
80101325:	e8 c6 ee ff ff       	call   801001f0 <brelse>
8010132a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010132d:	89 f0                	mov    %esi,%eax
8010132f:	5b                   	pop    %ebx
80101330:	5e                   	pop    %esi
80101331:	5f                   	pop    %edi
80101332:	5d                   	pop    %ebp
80101333:	c3                   	ret    
80101334:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010133b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010133f:	90                   	nop

80101340 <iget>:
80101340:	55                   	push   %ebp
80101341:	89 e5                	mov    %esp,%ebp
80101343:	57                   	push   %edi
80101344:	89 c7                	mov    %eax,%edi
80101346:	56                   	push   %esi
80101347:	31 f6                	xor    %esi,%esi
80101349:	53                   	push   %ebx
8010134a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
8010134f:	83 ec 28             	sub    $0x28,%esp
80101352:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101355:	68 e0 09 11 80       	push   $0x801109e0
8010135a:	e8 01 32 00 00       	call   80104560 <acquire>
8010135f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101362:	83 c4 10             	add    $0x10,%esp
80101365:	eb 1b                	jmp    80101382 <iget+0x42>
80101367:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010136e:	66 90                	xchg   %ax,%ax
80101370:	39 3b                	cmp    %edi,(%ebx)
80101372:	74 6c                	je     801013e0 <iget+0xa0>
80101374:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010137a:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101380:	73 26                	jae    801013a8 <iget+0x68>
80101382:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101385:	85 c9                	test   %ecx,%ecx
80101387:	7f e7                	jg     80101370 <iget+0x30>
80101389:	85 f6                	test   %esi,%esi
8010138b:	75 e7                	jne    80101374 <iget+0x34>
8010138d:	89 d8                	mov    %ebx,%eax
8010138f:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101395:	85 c9                	test   %ecx,%ecx
80101397:	75 6e                	jne    80101407 <iget+0xc7>
80101399:	89 c6                	mov    %eax,%esi
8010139b:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
801013a1:	72 df                	jb     80101382 <iget+0x42>
801013a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801013a7:	90                   	nop
801013a8:	85 f6                	test   %esi,%esi
801013aa:	74 73                	je     8010141f <iget+0xdf>
801013ac:	83 ec 0c             	sub    $0xc,%esp
801013af:	89 3e                	mov    %edi,(%esi)
801013b1:	89 56 04             	mov    %edx,0x4(%esi)
801013b4:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
801013bb:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801013c2:	68 e0 09 11 80       	push   $0x801109e0
801013c7:	e8 54 32 00 00       	call   80104620 <release>
801013cc:	83 c4 10             	add    $0x10,%esp
801013cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013d2:	89 f0                	mov    %esi,%eax
801013d4:	5b                   	pop    %ebx
801013d5:	5e                   	pop    %esi
801013d6:	5f                   	pop    %edi
801013d7:	5d                   	pop    %ebp
801013d8:	c3                   	ret    
801013d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801013e0:	39 53 04             	cmp    %edx,0x4(%ebx)
801013e3:	75 8f                	jne    80101374 <iget+0x34>
801013e5:	83 ec 0c             	sub    $0xc,%esp
801013e8:	83 c1 01             	add    $0x1,%ecx
801013eb:	89 de                	mov    %ebx,%esi
801013ed:	68 e0 09 11 80       	push   $0x801109e0
801013f2:	89 4b 08             	mov    %ecx,0x8(%ebx)
801013f5:	e8 26 32 00 00       	call   80104620 <release>
801013fa:	83 c4 10             	add    $0x10,%esp
801013fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101400:	89 f0                	mov    %esi,%eax
80101402:	5b                   	pop    %ebx
80101403:	5e                   	pop    %esi
80101404:	5f                   	pop    %edi
80101405:	5d                   	pop    %ebp
80101406:	c3                   	ret    
80101407:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
8010140d:	73 10                	jae    8010141f <iget+0xdf>
8010140f:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101412:	85 c9                	test   %ecx,%ecx
80101414:	0f 8f 56 ff ff ff    	jg     80101370 <iget+0x30>
8010141a:	e9 6e ff ff ff       	jmp    8010138d <iget+0x4d>
8010141f:	83 ec 0c             	sub    $0xc,%esp
80101422:	68 c8 71 10 80       	push   $0x801071c8
80101427:	e8 64 ef ff ff       	call   80100390 <panic>
8010142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101430 <bmap>:
80101430:	55                   	push   %ebp
80101431:	89 e5                	mov    %esp,%ebp
80101433:	57                   	push   %edi
80101434:	56                   	push   %esi
80101435:	89 c6                	mov    %eax,%esi
80101437:	53                   	push   %ebx
80101438:	83 ec 1c             	sub    $0x1c,%esp
8010143b:	83 fa 0b             	cmp    $0xb,%edx
8010143e:	0f 86 84 00 00 00    	jbe    801014c8 <bmap+0x98>
80101444:	8d 5a f4             	lea    -0xc(%edx),%ebx
80101447:	83 fb 7f             	cmp    $0x7f,%ebx
8010144a:	0f 87 98 00 00 00    	ja     801014e8 <bmap+0xb8>
80101450:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101456:	8b 16                	mov    (%esi),%edx
80101458:	85 c0                	test   %eax,%eax
8010145a:	74 54                	je     801014b0 <bmap+0x80>
8010145c:	83 ec 08             	sub    $0x8,%esp
8010145f:	50                   	push   %eax
80101460:	52                   	push   %edx
80101461:	e8 6a ec ff ff       	call   801000d0 <bread>
80101466:	83 c4 10             	add    $0x10,%esp
80101469:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010146d:	89 c7                	mov    %eax,%edi
8010146f:	8b 1a                	mov    (%edx),%ebx
80101471:	85 db                	test   %ebx,%ebx
80101473:	74 1b                	je     80101490 <bmap+0x60>
80101475:	83 ec 0c             	sub    $0xc,%esp
80101478:	57                   	push   %edi
80101479:	e8 72 ed ff ff       	call   801001f0 <brelse>
8010147e:	83 c4 10             	add    $0x10,%esp
80101481:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101484:	89 d8                	mov    %ebx,%eax
80101486:	5b                   	pop    %ebx
80101487:	5e                   	pop    %esi
80101488:	5f                   	pop    %edi
80101489:	5d                   	pop    %ebp
8010148a:	c3                   	ret    
8010148b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010148f:	90                   	nop
80101490:	8b 06                	mov    (%esi),%eax
80101492:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101495:	e8 96 fd ff ff       	call   80101230 <balloc>
8010149a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010149d:	83 ec 0c             	sub    $0xc,%esp
801014a0:	89 c3                	mov    %eax,%ebx
801014a2:	89 02                	mov    %eax,(%edx)
801014a4:	57                   	push   %edi
801014a5:	e8 66 1a 00 00       	call   80102f10 <log_write>
801014aa:	83 c4 10             	add    $0x10,%esp
801014ad:	eb c6                	jmp    80101475 <bmap+0x45>
801014af:	90                   	nop
801014b0:	89 d0                	mov    %edx,%eax
801014b2:	e8 79 fd ff ff       	call   80101230 <balloc>
801014b7:	8b 16                	mov    (%esi),%edx
801014b9:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801014bf:	eb 9b                	jmp    8010145c <bmap+0x2c>
801014c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801014c8:	8d 3c 90             	lea    (%eax,%edx,4),%edi
801014cb:	8b 5f 5c             	mov    0x5c(%edi),%ebx
801014ce:	85 db                	test   %ebx,%ebx
801014d0:	75 af                	jne    80101481 <bmap+0x51>
801014d2:	8b 00                	mov    (%eax),%eax
801014d4:	e8 57 fd ff ff       	call   80101230 <balloc>
801014d9:	89 47 5c             	mov    %eax,0x5c(%edi)
801014dc:	89 c3                	mov    %eax,%ebx
801014de:	8d 65 f4             	lea    -0xc(%ebp),%esp
801014e1:	89 d8                	mov    %ebx,%eax
801014e3:	5b                   	pop    %ebx
801014e4:	5e                   	pop    %esi
801014e5:	5f                   	pop    %edi
801014e6:	5d                   	pop    %ebp
801014e7:	c3                   	ret    
801014e8:	83 ec 0c             	sub    $0xc,%esp
801014eb:	68 d8 71 10 80       	push   $0x801071d8
801014f0:	e8 9b ee ff ff       	call   80100390 <panic>
801014f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801014fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101500 <readsb>:
80101500:	f3 0f 1e fb          	endbr32 
80101504:	55                   	push   %ebp
80101505:	89 e5                	mov    %esp,%ebp
80101507:	56                   	push   %esi
80101508:	53                   	push   %ebx
80101509:	8b 75 0c             	mov    0xc(%ebp),%esi
8010150c:	83 ec 08             	sub    $0x8,%esp
8010150f:	6a 01                	push   $0x1
80101511:	ff 75 08             	pushl  0x8(%ebp)
80101514:	e8 b7 eb ff ff       	call   801000d0 <bread>
80101519:	83 c4 0c             	add    $0xc,%esp
8010151c:	89 c3                	mov    %eax,%ebx
8010151e:	8d 40 5c             	lea    0x5c(%eax),%eax
80101521:	6a 1c                	push   $0x1c
80101523:	50                   	push   %eax
80101524:	56                   	push   %esi
80101525:	e8 e6 31 00 00       	call   80104710 <memmove>
8010152a:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010152d:	83 c4 10             	add    $0x10,%esp
80101530:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101533:	5b                   	pop    %ebx
80101534:	5e                   	pop    %esi
80101535:	5d                   	pop    %ebp
80101536:	e9 b5 ec ff ff       	jmp    801001f0 <brelse>
8010153b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010153f:	90                   	nop

80101540 <iinit>:
80101540:	f3 0f 1e fb          	endbr32 
80101544:	55                   	push   %ebp
80101545:	89 e5                	mov    %esp,%ebp
80101547:	53                   	push   %ebx
80101548:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
8010154d:	83 ec 0c             	sub    $0xc,%esp
80101550:	68 eb 71 10 80       	push   $0x801071eb
80101555:	68 e0 09 11 80       	push   $0x801109e0
8010155a:	e8 81 2e 00 00       	call   801043e0 <initlock>
8010155f:	83 c4 10             	add    $0x10,%esp
80101562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101568:	83 ec 08             	sub    $0x8,%esp
8010156b:	68 f2 71 10 80       	push   $0x801071f2
80101570:	53                   	push   %ebx
80101571:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101577:	e8 24 2d 00 00       	call   801042a0 <initsleeplock>
8010157c:	83 c4 10             	add    $0x10,%esp
8010157f:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
80101585:	75 e1                	jne    80101568 <iinit+0x28>
80101587:	83 ec 08             	sub    $0x8,%esp
8010158a:	68 c0 09 11 80       	push   $0x801109c0
8010158f:	ff 75 08             	pushl  0x8(%ebp)
80101592:	e8 69 ff ff ff       	call   80101500 <readsb>
80101597:	ff 35 d8 09 11 80    	pushl  0x801109d8
8010159d:	ff 35 d4 09 11 80    	pushl  0x801109d4
801015a3:	ff 35 d0 09 11 80    	pushl  0x801109d0
801015a9:	ff 35 cc 09 11 80    	pushl  0x801109cc
801015af:	ff 35 c8 09 11 80    	pushl  0x801109c8
801015b5:	ff 35 c4 09 11 80    	pushl  0x801109c4
801015bb:	ff 35 c0 09 11 80    	pushl  0x801109c0
801015c1:	68 58 72 10 80       	push   $0x80107258
801015c6:	e8 e5 f0 ff ff       	call   801006b0 <cprintf>
801015cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801015ce:	83 c4 30             	add    $0x30,%esp
801015d1:	c9                   	leave  
801015d2:	c3                   	ret    
801015d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801015da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801015e0 <ialloc>:
801015e0:	f3 0f 1e fb          	endbr32 
801015e4:	55                   	push   %ebp
801015e5:	89 e5                	mov    %esp,%ebp
801015e7:	57                   	push   %edi
801015e8:	56                   	push   %esi
801015e9:	53                   	push   %ebx
801015ea:	83 ec 1c             	sub    $0x1c,%esp
801015ed:	8b 45 0c             	mov    0xc(%ebp),%eax
801015f0:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
801015f7:	8b 75 08             	mov    0x8(%ebp),%esi
801015fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801015fd:	0f 86 8d 00 00 00    	jbe    80101690 <ialloc+0xb0>
80101603:	bf 01 00 00 00       	mov    $0x1,%edi
80101608:	eb 1d                	jmp    80101627 <ialloc+0x47>
8010160a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101610:	83 ec 0c             	sub    $0xc,%esp
80101613:	83 c7 01             	add    $0x1,%edi
80101616:	53                   	push   %ebx
80101617:	e8 d4 eb ff ff       	call   801001f0 <brelse>
8010161c:	83 c4 10             	add    $0x10,%esp
8010161f:	3b 3d c8 09 11 80    	cmp    0x801109c8,%edi
80101625:	73 69                	jae    80101690 <ialloc+0xb0>
80101627:	89 f8                	mov    %edi,%eax
80101629:	83 ec 08             	sub    $0x8,%esp
8010162c:	c1 e8 03             	shr    $0x3,%eax
8010162f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101635:	50                   	push   %eax
80101636:	56                   	push   %esi
80101637:	e8 94 ea ff ff       	call   801000d0 <bread>
8010163c:	83 c4 10             	add    $0x10,%esp
8010163f:	89 c3                	mov    %eax,%ebx
80101641:	89 f8                	mov    %edi,%eax
80101643:	83 e0 07             	and    $0x7,%eax
80101646:	c1 e0 06             	shl    $0x6,%eax
80101649:	8d 4c 03 5c          	lea    0x5c(%ebx,%eax,1),%ecx
8010164d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101651:	75 bd                	jne    80101610 <ialloc+0x30>
80101653:	83 ec 04             	sub    $0x4,%esp
80101656:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101659:	6a 40                	push   $0x40
8010165b:	6a 00                	push   $0x0
8010165d:	51                   	push   %ecx
8010165e:	e8 0d 30 00 00       	call   80104670 <memset>
80101663:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101667:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010166a:	66 89 01             	mov    %ax,(%ecx)
8010166d:	89 1c 24             	mov    %ebx,(%esp)
80101670:	e8 9b 18 00 00       	call   80102f10 <log_write>
80101675:	89 1c 24             	mov    %ebx,(%esp)
80101678:	e8 73 eb ff ff       	call   801001f0 <brelse>
8010167d:	83 c4 10             	add    $0x10,%esp
80101680:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101683:	89 fa                	mov    %edi,%edx
80101685:	5b                   	pop    %ebx
80101686:	89 f0                	mov    %esi,%eax
80101688:	5e                   	pop    %esi
80101689:	5f                   	pop    %edi
8010168a:	5d                   	pop    %ebp
8010168b:	e9 b0 fc ff ff       	jmp    80101340 <iget>
80101690:	83 ec 0c             	sub    $0xc,%esp
80101693:	68 f8 71 10 80       	push   $0x801071f8
80101698:	e8 f3 ec ff ff       	call   80100390 <panic>
8010169d:	8d 76 00             	lea    0x0(%esi),%esi

801016a0 <iupdate>:
801016a0:	f3 0f 1e fb          	endbr32 
801016a4:	55                   	push   %ebp
801016a5:	89 e5                	mov    %esp,%ebp
801016a7:	56                   	push   %esi
801016a8:	53                   	push   %ebx
801016a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801016ac:	8b 43 04             	mov    0x4(%ebx),%eax
801016af:	83 c3 5c             	add    $0x5c,%ebx
801016b2:	83 ec 08             	sub    $0x8,%esp
801016b5:	c1 e8 03             	shr    $0x3,%eax
801016b8:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016be:	50                   	push   %eax
801016bf:	ff 73 a4             	pushl  -0x5c(%ebx)
801016c2:	e8 09 ea ff ff       	call   801000d0 <bread>
801016c7:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
801016cb:	83 c4 0c             	add    $0xc,%esp
801016ce:	89 c6                	mov    %eax,%esi
801016d0:	8b 43 a8             	mov    -0x58(%ebx),%eax
801016d3:	83 e0 07             	and    $0x7,%eax
801016d6:	c1 e0 06             	shl    $0x6,%eax
801016d9:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016dd:	66 89 10             	mov    %dx,(%eax)
801016e0:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
801016e4:	83 c0 0c             	add    $0xc,%eax
801016e7:	66 89 50 f6          	mov    %dx,-0xa(%eax)
801016eb:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801016ef:	66 89 50 f8          	mov    %dx,-0x8(%eax)
801016f3:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
801016f7:	66 89 50 fa          	mov    %dx,-0x6(%eax)
801016fb:	8b 53 fc             	mov    -0x4(%ebx),%edx
801016fe:	89 50 fc             	mov    %edx,-0x4(%eax)
80101701:	6a 34                	push   $0x34
80101703:	53                   	push   %ebx
80101704:	50                   	push   %eax
80101705:	e8 06 30 00 00       	call   80104710 <memmove>
8010170a:	89 34 24             	mov    %esi,(%esp)
8010170d:	e8 fe 17 00 00       	call   80102f10 <log_write>
80101712:	89 75 08             	mov    %esi,0x8(%ebp)
80101715:	83 c4 10             	add    $0x10,%esp
80101718:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010171b:	5b                   	pop    %ebx
8010171c:	5e                   	pop    %esi
8010171d:	5d                   	pop    %ebp
8010171e:	e9 cd ea ff ff       	jmp    801001f0 <brelse>
80101723:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010172a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101730 <idup>:
80101730:	f3 0f 1e fb          	endbr32 
80101734:	55                   	push   %ebp
80101735:	89 e5                	mov    %esp,%ebp
80101737:	53                   	push   %ebx
80101738:	83 ec 10             	sub    $0x10,%esp
8010173b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010173e:	68 e0 09 11 80       	push   $0x801109e0
80101743:	e8 18 2e 00 00       	call   80104560 <acquire>
80101748:	83 43 08 01          	addl   $0x1,0x8(%ebx)
8010174c:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101753:	e8 c8 2e 00 00       	call   80104620 <release>
80101758:	89 d8                	mov    %ebx,%eax
8010175a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010175d:	c9                   	leave  
8010175e:	c3                   	ret    
8010175f:	90                   	nop

80101760 <ilock>:
80101760:	f3 0f 1e fb          	endbr32 
80101764:	55                   	push   %ebp
80101765:	89 e5                	mov    %esp,%ebp
80101767:	56                   	push   %esi
80101768:	53                   	push   %ebx
80101769:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010176c:	85 db                	test   %ebx,%ebx
8010176e:	0f 84 b3 00 00 00    	je     80101827 <ilock+0xc7>
80101774:	8b 53 08             	mov    0x8(%ebx),%edx
80101777:	85 d2                	test   %edx,%edx
80101779:	0f 8e a8 00 00 00    	jle    80101827 <ilock+0xc7>
8010177f:	83 ec 0c             	sub    $0xc,%esp
80101782:	8d 43 0c             	lea    0xc(%ebx),%eax
80101785:	50                   	push   %eax
80101786:	e8 55 2b 00 00       	call   801042e0 <acquiresleep>
8010178b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010178e:	83 c4 10             	add    $0x10,%esp
80101791:	85 c0                	test   %eax,%eax
80101793:	74 0b                	je     801017a0 <ilock+0x40>
80101795:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101798:	5b                   	pop    %ebx
80101799:	5e                   	pop    %esi
8010179a:	5d                   	pop    %ebp
8010179b:	c3                   	ret    
8010179c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801017a0:	8b 43 04             	mov    0x4(%ebx),%eax
801017a3:	83 ec 08             	sub    $0x8,%esp
801017a6:	c1 e8 03             	shr    $0x3,%eax
801017a9:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801017af:	50                   	push   %eax
801017b0:	ff 33                	pushl  (%ebx)
801017b2:	e8 19 e9 ff ff       	call   801000d0 <bread>
801017b7:	83 c4 0c             	add    $0xc,%esp
801017ba:	89 c6                	mov    %eax,%esi
801017bc:	8b 43 04             	mov    0x4(%ebx),%eax
801017bf:	83 e0 07             	and    $0x7,%eax
801017c2:	c1 e0 06             	shl    $0x6,%eax
801017c5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801017c9:	0f b7 10             	movzwl (%eax),%edx
801017cc:	83 c0 0c             	add    $0xc,%eax
801017cf:	66 89 53 50          	mov    %dx,0x50(%ebx)
801017d3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801017d7:	66 89 53 52          	mov    %dx,0x52(%ebx)
801017db:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801017df:	66 89 53 54          	mov    %dx,0x54(%ebx)
801017e3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801017e7:	66 89 53 56          	mov    %dx,0x56(%ebx)
801017eb:	8b 50 fc             	mov    -0x4(%eax),%edx
801017ee:	89 53 58             	mov    %edx,0x58(%ebx)
801017f1:	6a 34                	push   $0x34
801017f3:	50                   	push   %eax
801017f4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801017f7:	50                   	push   %eax
801017f8:	e8 13 2f 00 00       	call   80104710 <memmove>
801017fd:	89 34 24             	mov    %esi,(%esp)
80101800:	e8 eb e9 ff ff       	call   801001f0 <brelse>
80101805:	83 c4 10             	add    $0x10,%esp
80101808:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010180d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101814:	0f 85 7b ff ff ff    	jne    80101795 <ilock+0x35>
8010181a:	83 ec 0c             	sub    $0xc,%esp
8010181d:	68 10 72 10 80       	push   $0x80107210
80101822:	e8 69 eb ff ff       	call   80100390 <panic>
80101827:	83 ec 0c             	sub    $0xc,%esp
8010182a:	68 0a 72 10 80       	push   $0x8010720a
8010182f:	e8 5c eb ff ff       	call   80100390 <panic>
80101834:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010183b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010183f:	90                   	nop

80101840 <iunlock>:
80101840:	f3 0f 1e fb          	endbr32 
80101844:	55                   	push   %ebp
80101845:	89 e5                	mov    %esp,%ebp
80101847:	56                   	push   %esi
80101848:	53                   	push   %ebx
80101849:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010184c:	85 db                	test   %ebx,%ebx
8010184e:	74 28                	je     80101878 <iunlock+0x38>
80101850:	83 ec 0c             	sub    $0xc,%esp
80101853:	8d 73 0c             	lea    0xc(%ebx),%esi
80101856:	56                   	push   %esi
80101857:	e8 24 2b 00 00       	call   80104380 <holdingsleep>
8010185c:	83 c4 10             	add    $0x10,%esp
8010185f:	85 c0                	test   %eax,%eax
80101861:	74 15                	je     80101878 <iunlock+0x38>
80101863:	8b 43 08             	mov    0x8(%ebx),%eax
80101866:	85 c0                	test   %eax,%eax
80101868:	7e 0e                	jle    80101878 <iunlock+0x38>
8010186a:	89 75 08             	mov    %esi,0x8(%ebp)
8010186d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101870:	5b                   	pop    %ebx
80101871:	5e                   	pop    %esi
80101872:	5d                   	pop    %ebp
80101873:	e9 c8 2a 00 00       	jmp    80104340 <releasesleep>
80101878:	83 ec 0c             	sub    $0xc,%esp
8010187b:	68 1f 72 10 80       	push   $0x8010721f
80101880:	e8 0b eb ff ff       	call   80100390 <panic>
80101885:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010188c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101890 <iput>:
80101890:	f3 0f 1e fb          	endbr32 
80101894:	55                   	push   %ebp
80101895:	89 e5                	mov    %esp,%ebp
80101897:	57                   	push   %edi
80101898:	56                   	push   %esi
80101899:	53                   	push   %ebx
8010189a:	83 ec 28             	sub    $0x28,%esp
8010189d:	8b 5d 08             	mov    0x8(%ebp),%ebx
801018a0:	8d 7b 0c             	lea    0xc(%ebx),%edi
801018a3:	57                   	push   %edi
801018a4:	e8 37 2a 00 00       	call   801042e0 <acquiresleep>
801018a9:	8b 53 4c             	mov    0x4c(%ebx),%edx
801018ac:	83 c4 10             	add    $0x10,%esp
801018af:	85 d2                	test   %edx,%edx
801018b1:	74 07                	je     801018ba <iput+0x2a>
801018b3:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801018b8:	74 36                	je     801018f0 <iput+0x60>
801018ba:	83 ec 0c             	sub    $0xc,%esp
801018bd:	57                   	push   %edi
801018be:	e8 7d 2a 00 00       	call   80104340 <releasesleep>
801018c3:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801018ca:	e8 91 2c 00 00       	call   80104560 <acquire>
801018cf:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
801018d3:	83 c4 10             	add    $0x10,%esp
801018d6:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
801018dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018e0:	5b                   	pop    %ebx
801018e1:	5e                   	pop    %esi
801018e2:	5f                   	pop    %edi
801018e3:	5d                   	pop    %ebp
801018e4:	e9 37 2d 00 00       	jmp    80104620 <release>
801018e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018f0:	83 ec 0c             	sub    $0xc,%esp
801018f3:	68 e0 09 11 80       	push   $0x801109e0
801018f8:	e8 63 2c 00 00       	call   80104560 <acquire>
801018fd:	8b 73 08             	mov    0x8(%ebx),%esi
80101900:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101907:	e8 14 2d 00 00       	call   80104620 <release>
8010190c:	83 c4 10             	add    $0x10,%esp
8010190f:	83 fe 01             	cmp    $0x1,%esi
80101912:	75 a6                	jne    801018ba <iput+0x2a>
80101914:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
8010191a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
8010191d:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101920:	89 cf                	mov    %ecx,%edi
80101922:	eb 0b                	jmp    8010192f <iput+0x9f>
80101924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101928:	83 c6 04             	add    $0x4,%esi
8010192b:	39 fe                	cmp    %edi,%esi
8010192d:	74 19                	je     80101948 <iput+0xb8>
8010192f:	8b 16                	mov    (%esi),%edx
80101931:	85 d2                	test   %edx,%edx
80101933:	74 f3                	je     80101928 <iput+0x98>
80101935:	8b 03                	mov    (%ebx),%eax
80101937:	e8 74 f8 ff ff       	call   801011b0 <bfree>
8010193c:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80101942:	eb e4                	jmp    80101928 <iput+0x98>
80101944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101948:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
8010194e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101951:	85 c0                	test   %eax,%eax
80101953:	75 33                	jne    80101988 <iput+0xf8>
80101955:	83 ec 0c             	sub    $0xc,%esp
80101958:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010195f:	53                   	push   %ebx
80101960:	e8 3b fd ff ff       	call   801016a0 <iupdate>
80101965:	31 c0                	xor    %eax,%eax
80101967:	66 89 43 50          	mov    %ax,0x50(%ebx)
8010196b:	89 1c 24             	mov    %ebx,(%esp)
8010196e:	e8 2d fd ff ff       	call   801016a0 <iupdate>
80101973:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
8010197a:	83 c4 10             	add    $0x10,%esp
8010197d:	e9 38 ff ff ff       	jmp    801018ba <iput+0x2a>
80101982:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101988:	83 ec 08             	sub    $0x8,%esp
8010198b:	50                   	push   %eax
8010198c:	ff 33                	pushl  (%ebx)
8010198e:	e8 3d e7 ff ff       	call   801000d0 <bread>
80101993:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101996:	83 c4 10             	add    $0x10,%esp
80101999:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
8010199f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801019a2:	8d 70 5c             	lea    0x5c(%eax),%esi
801019a5:	89 cf                	mov    %ecx,%edi
801019a7:	eb 0e                	jmp    801019b7 <iput+0x127>
801019a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801019b0:	83 c6 04             	add    $0x4,%esi
801019b3:	39 f7                	cmp    %esi,%edi
801019b5:	74 19                	je     801019d0 <iput+0x140>
801019b7:	8b 16                	mov    (%esi),%edx
801019b9:	85 d2                	test   %edx,%edx
801019bb:	74 f3                	je     801019b0 <iput+0x120>
801019bd:	8b 03                	mov    (%ebx),%eax
801019bf:	e8 ec f7 ff ff       	call   801011b0 <bfree>
801019c4:	eb ea                	jmp    801019b0 <iput+0x120>
801019c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801019cd:	8d 76 00             	lea    0x0(%esi),%esi
801019d0:	83 ec 0c             	sub    $0xc,%esp
801019d3:	ff 75 e4             	pushl  -0x1c(%ebp)
801019d6:	8b 7d e0             	mov    -0x20(%ebp),%edi
801019d9:	e8 12 e8 ff ff       	call   801001f0 <brelse>
801019de:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
801019e4:	8b 03                	mov    (%ebx),%eax
801019e6:	e8 c5 f7 ff ff       	call   801011b0 <bfree>
801019eb:	83 c4 10             	add    $0x10,%esp
801019ee:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
801019f5:	00 00 00 
801019f8:	e9 58 ff ff ff       	jmp    80101955 <iput+0xc5>
801019fd:	8d 76 00             	lea    0x0(%esi),%esi

80101a00 <iunlockput>:
80101a00:	f3 0f 1e fb          	endbr32 
80101a04:	55                   	push   %ebp
80101a05:	89 e5                	mov    %esp,%ebp
80101a07:	53                   	push   %ebx
80101a08:	83 ec 10             	sub    $0x10,%esp
80101a0b:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101a0e:	53                   	push   %ebx
80101a0f:	e8 2c fe ff ff       	call   80101840 <iunlock>
80101a14:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101a17:	83 c4 10             	add    $0x10,%esp
80101a1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101a1d:	c9                   	leave  
80101a1e:	e9 6d fe ff ff       	jmp    80101890 <iput>
80101a23:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101a30 <stati>:
80101a30:	f3 0f 1e fb          	endbr32 
80101a34:	55                   	push   %ebp
80101a35:	89 e5                	mov    %esp,%ebp
80101a37:	8b 55 08             	mov    0x8(%ebp),%edx
80101a3a:	8b 45 0c             	mov    0xc(%ebp),%eax
80101a3d:	8b 0a                	mov    (%edx),%ecx
80101a3f:	89 48 04             	mov    %ecx,0x4(%eax)
80101a42:	8b 4a 04             	mov    0x4(%edx),%ecx
80101a45:	89 48 08             	mov    %ecx,0x8(%eax)
80101a48:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101a4c:	66 89 08             	mov    %cx,(%eax)
80101a4f:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101a53:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101a57:	8b 52 58             	mov    0x58(%edx),%edx
80101a5a:	89 50 10             	mov    %edx,0x10(%eax)
80101a5d:	5d                   	pop    %ebp
80101a5e:	c3                   	ret    
80101a5f:	90                   	nop

80101a60 <readi>:
80101a60:	f3 0f 1e fb          	endbr32 
80101a64:	55                   	push   %ebp
80101a65:	89 e5                	mov    %esp,%ebp
80101a67:	57                   	push   %edi
80101a68:	56                   	push   %esi
80101a69:	53                   	push   %ebx
80101a6a:	83 ec 1c             	sub    $0x1c,%esp
80101a6d:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101a70:	8b 45 08             	mov    0x8(%ebp),%eax
80101a73:	8b 75 10             	mov    0x10(%ebp),%esi
80101a76:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a79:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a7c:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a81:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a84:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101a87:	0f 84 a3 00 00 00    	je     80101b30 <readi+0xd0>
80101a8d:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a90:	8b 40 58             	mov    0x58(%eax),%eax
80101a93:	39 c6                	cmp    %eax,%esi
80101a95:	0f 87 b6 00 00 00    	ja     80101b51 <readi+0xf1>
80101a9b:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101a9e:	31 c9                	xor    %ecx,%ecx
80101aa0:	89 da                	mov    %ebx,%edx
80101aa2:	01 f2                	add    %esi,%edx
80101aa4:	0f 92 c1             	setb   %cl
80101aa7:	89 cf                	mov    %ecx,%edi
80101aa9:	0f 82 a2 00 00 00    	jb     80101b51 <readi+0xf1>
80101aaf:	89 c1                	mov    %eax,%ecx
80101ab1:	29 f1                	sub    %esi,%ecx
80101ab3:	39 d0                	cmp    %edx,%eax
80101ab5:	0f 43 cb             	cmovae %ebx,%ecx
80101ab8:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101abb:	85 c9                	test   %ecx,%ecx
80101abd:	74 63                	je     80101b22 <readi+0xc2>
80101abf:	90                   	nop
80101ac0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101ac3:	89 f2                	mov    %esi,%edx
80101ac5:	c1 ea 09             	shr    $0x9,%edx
80101ac8:	89 d8                	mov    %ebx,%eax
80101aca:	e8 61 f9 ff ff       	call   80101430 <bmap>
80101acf:	83 ec 08             	sub    $0x8,%esp
80101ad2:	50                   	push   %eax
80101ad3:	ff 33                	pushl  (%ebx)
80101ad5:	e8 f6 e5 ff ff       	call   801000d0 <bread>
80101ada:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101add:	b9 00 02 00 00       	mov    $0x200,%ecx
80101ae2:	83 c4 0c             	add    $0xc,%esp
80101ae5:	89 c2                	mov    %eax,%edx
80101ae7:	89 f0                	mov    %esi,%eax
80101ae9:	25 ff 01 00 00       	and    $0x1ff,%eax
80101aee:	29 fb                	sub    %edi,%ebx
80101af0:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101af3:	29 c1                	sub    %eax,%ecx
80101af5:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101af9:	39 d9                	cmp    %ebx,%ecx
80101afb:	0f 46 d9             	cmovbe %ecx,%ebx
80101afe:	53                   	push   %ebx
80101aff:	01 df                	add    %ebx,%edi
80101b01:	01 de                	add    %ebx,%esi
80101b03:	50                   	push   %eax
80101b04:	ff 75 e0             	pushl  -0x20(%ebp)
80101b07:	e8 04 2c 00 00       	call   80104710 <memmove>
80101b0c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101b0f:	89 14 24             	mov    %edx,(%esp)
80101b12:	e8 d9 e6 ff ff       	call   801001f0 <brelse>
80101b17:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101b1a:	83 c4 10             	add    $0x10,%esp
80101b1d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101b20:	77 9e                	ja     80101ac0 <readi+0x60>
80101b22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b25:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b28:	5b                   	pop    %ebx
80101b29:	5e                   	pop    %esi
80101b2a:	5f                   	pop    %edi
80101b2b:	5d                   	pop    %ebp
80101b2c:	c3                   	ret    
80101b2d:	8d 76 00             	lea    0x0(%esi),%esi
80101b30:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b34:	66 83 f8 09          	cmp    $0x9,%ax
80101b38:	77 17                	ja     80101b51 <readi+0xf1>
80101b3a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101b41:	85 c0                	test   %eax,%eax
80101b43:	74 0c                	je     80101b51 <readi+0xf1>
80101b45:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b4b:	5b                   	pop    %ebx
80101b4c:	5e                   	pop    %esi
80101b4d:	5f                   	pop    %edi
80101b4e:	5d                   	pop    %ebp
80101b4f:	ff e0                	jmp    *%eax
80101b51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b56:	eb cd                	jmp    80101b25 <readi+0xc5>
80101b58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b5f:	90                   	nop

80101b60 <writei>:
80101b60:	f3 0f 1e fb          	endbr32 
80101b64:	55                   	push   %ebp
80101b65:	89 e5                	mov    %esp,%ebp
80101b67:	57                   	push   %edi
80101b68:	56                   	push   %esi
80101b69:	53                   	push   %ebx
80101b6a:	83 ec 1c             	sub    $0x1c,%esp
80101b6d:	8b 45 08             	mov    0x8(%ebp),%eax
80101b70:	8b 75 0c             	mov    0xc(%ebp),%esi
80101b73:	8b 7d 14             	mov    0x14(%ebp),%edi
80101b76:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101b7b:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101b7e:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101b81:	8b 75 10             	mov    0x10(%ebp),%esi
80101b84:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101b87:	0f 84 b3 00 00 00    	je     80101c40 <writei+0xe0>
80101b8d:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b90:	39 70 58             	cmp    %esi,0x58(%eax)
80101b93:	0f 82 e3 00 00 00    	jb     80101c7c <writei+0x11c>
80101b99:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101b9c:	89 f8                	mov    %edi,%eax
80101b9e:	01 f0                	add    %esi,%eax
80101ba0:	0f 82 d6 00 00 00    	jb     80101c7c <writei+0x11c>
80101ba6:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101bab:	0f 87 cb 00 00 00    	ja     80101c7c <writei+0x11c>
80101bb1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101bb8:	85 ff                	test   %edi,%edi
80101bba:	74 75                	je     80101c31 <writei+0xd1>
80101bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bc0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101bc3:	89 f2                	mov    %esi,%edx
80101bc5:	c1 ea 09             	shr    $0x9,%edx
80101bc8:	89 f8                	mov    %edi,%eax
80101bca:	e8 61 f8 ff ff       	call   80101430 <bmap>
80101bcf:	83 ec 08             	sub    $0x8,%esp
80101bd2:	50                   	push   %eax
80101bd3:	ff 37                	pushl  (%edi)
80101bd5:	e8 f6 e4 ff ff       	call   801000d0 <bread>
80101bda:	b9 00 02 00 00       	mov    $0x200,%ecx
80101bdf:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101be2:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
80101be5:	89 c7                	mov    %eax,%edi
80101be7:	89 f0                	mov    %esi,%eax
80101be9:	83 c4 0c             	add    $0xc,%esp
80101bec:	25 ff 01 00 00       	and    $0x1ff,%eax
80101bf1:	29 c1                	sub    %eax,%ecx
80101bf3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101bf7:	39 d9                	cmp    %ebx,%ecx
80101bf9:	0f 46 d9             	cmovbe %ecx,%ebx
80101bfc:	53                   	push   %ebx
80101bfd:	01 de                	add    %ebx,%esi
80101bff:	ff 75 dc             	pushl  -0x24(%ebp)
80101c02:	50                   	push   %eax
80101c03:	e8 08 2b 00 00       	call   80104710 <memmove>
80101c08:	89 3c 24             	mov    %edi,(%esp)
80101c0b:	e8 00 13 00 00       	call   80102f10 <log_write>
80101c10:	89 3c 24             	mov    %edi,(%esp)
80101c13:	e8 d8 e5 ff ff       	call   801001f0 <brelse>
80101c18:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101c1b:	83 c4 10             	add    $0x10,%esp
80101c1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101c21:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101c24:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101c27:	77 97                	ja     80101bc0 <writei+0x60>
80101c29:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101c2c:	3b 70 58             	cmp    0x58(%eax),%esi
80101c2f:	77 37                	ja     80101c68 <writei+0x108>
80101c31:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101c34:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c37:	5b                   	pop    %ebx
80101c38:	5e                   	pop    %esi
80101c39:	5f                   	pop    %edi
80101c3a:	5d                   	pop    %ebp
80101c3b:	c3                   	ret    
80101c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101c44:	66 83 f8 09          	cmp    $0x9,%ax
80101c48:	77 32                	ja     80101c7c <writei+0x11c>
80101c4a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101c51:	85 c0                	test   %eax,%eax
80101c53:	74 27                	je     80101c7c <writei+0x11c>
80101c55:	89 7d 10             	mov    %edi,0x10(%ebp)
80101c58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c5b:	5b                   	pop    %ebx
80101c5c:	5e                   	pop    %esi
80101c5d:	5f                   	pop    %edi
80101c5e:	5d                   	pop    %ebp
80101c5f:	ff e0                	jmp    *%eax
80101c61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c68:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101c6b:	83 ec 0c             	sub    $0xc,%esp
80101c6e:	89 70 58             	mov    %esi,0x58(%eax)
80101c71:	50                   	push   %eax
80101c72:	e8 29 fa ff ff       	call   801016a0 <iupdate>
80101c77:	83 c4 10             	add    $0x10,%esp
80101c7a:	eb b5                	jmp    80101c31 <writei+0xd1>
80101c7c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101c81:	eb b1                	jmp    80101c34 <writei+0xd4>
80101c83:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101c90 <namecmp>:
80101c90:	f3 0f 1e fb          	endbr32 
80101c94:	55                   	push   %ebp
80101c95:	89 e5                	mov    %esp,%ebp
80101c97:	83 ec 0c             	sub    $0xc,%esp
80101c9a:	6a 0e                	push   $0xe
80101c9c:	ff 75 0c             	pushl  0xc(%ebp)
80101c9f:	ff 75 08             	pushl  0x8(%ebp)
80101ca2:	e8 d9 2a 00 00       	call   80104780 <strncmp>
80101ca7:	c9                   	leave  
80101ca8:	c3                   	ret    
80101ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101cb0 <dirlookup>:
80101cb0:	f3 0f 1e fb          	endbr32 
80101cb4:	55                   	push   %ebp
80101cb5:	89 e5                	mov    %esp,%ebp
80101cb7:	57                   	push   %edi
80101cb8:	56                   	push   %esi
80101cb9:	53                   	push   %ebx
80101cba:	83 ec 1c             	sub    $0x1c,%esp
80101cbd:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101cc0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101cc5:	0f 85 89 00 00 00    	jne    80101d54 <dirlookup+0xa4>
80101ccb:	8b 53 58             	mov    0x58(%ebx),%edx
80101cce:	31 ff                	xor    %edi,%edi
80101cd0:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101cd3:	85 d2                	test   %edx,%edx
80101cd5:	74 42                	je     80101d19 <dirlookup+0x69>
80101cd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cde:	66 90                	xchg   %ax,%ax
80101ce0:	6a 10                	push   $0x10
80101ce2:	57                   	push   %edi
80101ce3:	56                   	push   %esi
80101ce4:	53                   	push   %ebx
80101ce5:	e8 76 fd ff ff       	call   80101a60 <readi>
80101cea:	83 c4 10             	add    $0x10,%esp
80101ced:	83 f8 10             	cmp    $0x10,%eax
80101cf0:	75 55                	jne    80101d47 <dirlookup+0x97>
80101cf2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101cf7:	74 18                	je     80101d11 <dirlookup+0x61>
80101cf9:	83 ec 04             	sub    $0x4,%esp
80101cfc:	8d 45 da             	lea    -0x26(%ebp),%eax
80101cff:	6a 0e                	push   $0xe
80101d01:	50                   	push   %eax
80101d02:	ff 75 0c             	pushl  0xc(%ebp)
80101d05:	e8 76 2a 00 00       	call   80104780 <strncmp>
80101d0a:	83 c4 10             	add    $0x10,%esp
80101d0d:	85 c0                	test   %eax,%eax
80101d0f:	74 17                	je     80101d28 <dirlookup+0x78>
80101d11:	83 c7 10             	add    $0x10,%edi
80101d14:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101d17:	72 c7                	jb     80101ce0 <dirlookup+0x30>
80101d19:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d1c:	31 c0                	xor    %eax,%eax
80101d1e:	5b                   	pop    %ebx
80101d1f:	5e                   	pop    %esi
80101d20:	5f                   	pop    %edi
80101d21:	5d                   	pop    %ebp
80101d22:	c3                   	ret    
80101d23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d27:	90                   	nop
80101d28:	8b 45 10             	mov    0x10(%ebp),%eax
80101d2b:	85 c0                	test   %eax,%eax
80101d2d:	74 05                	je     80101d34 <dirlookup+0x84>
80101d2f:	8b 45 10             	mov    0x10(%ebp),%eax
80101d32:	89 38                	mov    %edi,(%eax)
80101d34:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101d38:	8b 03                	mov    (%ebx),%eax
80101d3a:	e8 01 f6 ff ff       	call   80101340 <iget>
80101d3f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d42:	5b                   	pop    %ebx
80101d43:	5e                   	pop    %esi
80101d44:	5f                   	pop    %edi
80101d45:	5d                   	pop    %ebp
80101d46:	c3                   	ret    
80101d47:	83 ec 0c             	sub    $0xc,%esp
80101d4a:	68 39 72 10 80       	push   $0x80107239
80101d4f:	e8 3c e6 ff ff       	call   80100390 <panic>
80101d54:	83 ec 0c             	sub    $0xc,%esp
80101d57:	68 27 72 10 80       	push   $0x80107227
80101d5c:	e8 2f e6 ff ff       	call   80100390 <panic>
80101d61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101d68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101d6f:	90                   	nop

80101d70 <namex>:
80101d70:	55                   	push   %ebp
80101d71:	89 e5                	mov    %esp,%ebp
80101d73:	57                   	push   %edi
80101d74:	56                   	push   %esi
80101d75:	53                   	push   %ebx
80101d76:	89 c3                	mov    %eax,%ebx
80101d78:	83 ec 1c             	sub    $0x1c,%esp
80101d7b:	80 38 2f             	cmpb   $0x2f,(%eax)
80101d7e:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101d81:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d84:	0f 84 86 01 00 00    	je     80101f10 <namex+0x1a0>
80101d8a:	e8 d1 1b 00 00       	call   80103960 <myproc>
80101d8f:	83 ec 0c             	sub    $0xc,%esp
80101d92:	89 df                	mov    %ebx,%edi
80101d94:	8b 70 68             	mov    0x68(%eax),%esi
80101d97:	68 e0 09 11 80       	push   $0x801109e0
80101d9c:	e8 bf 27 00 00       	call   80104560 <acquire>
80101da1:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101da5:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101dac:	e8 6f 28 00 00       	call   80104620 <release>
80101db1:	83 c4 10             	add    $0x10,%esp
80101db4:	eb 0d                	jmp    80101dc3 <namex+0x53>
80101db6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101dbd:	8d 76 00             	lea    0x0(%esi),%esi
80101dc0:	83 c7 01             	add    $0x1,%edi
80101dc3:	0f b6 07             	movzbl (%edi),%eax
80101dc6:	3c 2f                	cmp    $0x2f,%al
80101dc8:	74 f6                	je     80101dc0 <namex+0x50>
80101dca:	84 c0                	test   %al,%al
80101dcc:	0f 84 ee 00 00 00    	je     80101ec0 <namex+0x150>
80101dd2:	0f b6 07             	movzbl (%edi),%eax
80101dd5:	84 c0                	test   %al,%al
80101dd7:	0f 84 fb 00 00 00    	je     80101ed8 <namex+0x168>
80101ddd:	89 fb                	mov    %edi,%ebx
80101ddf:	3c 2f                	cmp    $0x2f,%al
80101de1:	0f 84 f1 00 00 00    	je     80101ed8 <namex+0x168>
80101de7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101dee:	66 90                	xchg   %ax,%ax
80101df0:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
80101df4:	83 c3 01             	add    $0x1,%ebx
80101df7:	3c 2f                	cmp    $0x2f,%al
80101df9:	74 04                	je     80101dff <namex+0x8f>
80101dfb:	84 c0                	test   %al,%al
80101dfd:	75 f1                	jne    80101df0 <namex+0x80>
80101dff:	89 d8                	mov    %ebx,%eax
80101e01:	29 f8                	sub    %edi,%eax
80101e03:	83 f8 0d             	cmp    $0xd,%eax
80101e06:	0f 8e 84 00 00 00    	jle    80101e90 <namex+0x120>
80101e0c:	83 ec 04             	sub    $0x4,%esp
80101e0f:	6a 0e                	push   $0xe
80101e11:	57                   	push   %edi
80101e12:	89 df                	mov    %ebx,%edi
80101e14:	ff 75 e4             	pushl  -0x1c(%ebp)
80101e17:	e8 f4 28 00 00       	call   80104710 <memmove>
80101e1c:	83 c4 10             	add    $0x10,%esp
80101e1f:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101e22:	75 0c                	jne    80101e30 <namex+0xc0>
80101e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101e28:	83 c7 01             	add    $0x1,%edi
80101e2b:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101e2e:	74 f8                	je     80101e28 <namex+0xb8>
80101e30:	83 ec 0c             	sub    $0xc,%esp
80101e33:	56                   	push   %esi
80101e34:	e8 27 f9 ff ff       	call   80101760 <ilock>
80101e39:	83 c4 10             	add    $0x10,%esp
80101e3c:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101e41:	0f 85 a1 00 00 00    	jne    80101ee8 <namex+0x178>
80101e47:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101e4a:	85 d2                	test   %edx,%edx
80101e4c:	74 09                	je     80101e57 <namex+0xe7>
80101e4e:	80 3f 00             	cmpb   $0x0,(%edi)
80101e51:	0f 84 d9 00 00 00    	je     80101f30 <namex+0x1c0>
80101e57:	83 ec 04             	sub    $0x4,%esp
80101e5a:	6a 00                	push   $0x0
80101e5c:	ff 75 e4             	pushl  -0x1c(%ebp)
80101e5f:	56                   	push   %esi
80101e60:	e8 4b fe ff ff       	call   80101cb0 <dirlookup>
80101e65:	83 c4 10             	add    $0x10,%esp
80101e68:	89 c3                	mov    %eax,%ebx
80101e6a:	85 c0                	test   %eax,%eax
80101e6c:	74 7a                	je     80101ee8 <namex+0x178>
80101e6e:	83 ec 0c             	sub    $0xc,%esp
80101e71:	56                   	push   %esi
80101e72:	e8 c9 f9 ff ff       	call   80101840 <iunlock>
80101e77:	89 34 24             	mov    %esi,(%esp)
80101e7a:	89 de                	mov    %ebx,%esi
80101e7c:	e8 0f fa ff ff       	call   80101890 <iput>
80101e81:	83 c4 10             	add    $0x10,%esp
80101e84:	e9 3a ff ff ff       	jmp    80101dc3 <namex+0x53>
80101e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e90:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101e93:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
80101e96:	89 4d dc             	mov    %ecx,-0x24(%ebp)
80101e99:	83 ec 04             	sub    $0x4,%esp
80101e9c:	50                   	push   %eax
80101e9d:	57                   	push   %edi
80101e9e:	89 df                	mov    %ebx,%edi
80101ea0:	ff 75 e4             	pushl  -0x1c(%ebp)
80101ea3:	e8 68 28 00 00       	call   80104710 <memmove>
80101ea8:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101eab:	83 c4 10             	add    $0x10,%esp
80101eae:	c6 00 00             	movb   $0x0,(%eax)
80101eb1:	e9 69 ff ff ff       	jmp    80101e1f <namex+0xaf>
80101eb6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ebd:	8d 76 00             	lea    0x0(%esi),%esi
80101ec0:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ec3:	85 c0                	test   %eax,%eax
80101ec5:	0f 85 85 00 00 00    	jne    80101f50 <namex+0x1e0>
80101ecb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ece:	89 f0                	mov    %esi,%eax
80101ed0:	5b                   	pop    %ebx
80101ed1:	5e                   	pop    %esi
80101ed2:	5f                   	pop    %edi
80101ed3:	5d                   	pop    %ebp
80101ed4:	c3                   	ret    
80101ed5:	8d 76 00             	lea    0x0(%esi),%esi
80101ed8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101edb:	89 fb                	mov    %edi,%ebx
80101edd:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101ee0:	31 c0                	xor    %eax,%eax
80101ee2:	eb b5                	jmp    80101e99 <namex+0x129>
80101ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ee8:	83 ec 0c             	sub    $0xc,%esp
80101eeb:	56                   	push   %esi
80101eec:	e8 4f f9 ff ff       	call   80101840 <iunlock>
80101ef1:	89 34 24             	mov    %esi,(%esp)
80101ef4:	31 f6                	xor    %esi,%esi
80101ef6:	e8 95 f9 ff ff       	call   80101890 <iput>
80101efb:	83 c4 10             	add    $0x10,%esp
80101efe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f01:	89 f0                	mov    %esi,%eax
80101f03:	5b                   	pop    %ebx
80101f04:	5e                   	pop    %esi
80101f05:	5f                   	pop    %edi
80101f06:	5d                   	pop    %ebp
80101f07:	c3                   	ret    
80101f08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f0f:	90                   	nop
80101f10:	ba 01 00 00 00       	mov    $0x1,%edx
80101f15:	b8 01 00 00 00       	mov    $0x1,%eax
80101f1a:	89 df                	mov    %ebx,%edi
80101f1c:	e8 1f f4 ff ff       	call   80101340 <iget>
80101f21:	89 c6                	mov    %eax,%esi
80101f23:	e9 9b fe ff ff       	jmp    80101dc3 <namex+0x53>
80101f28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f2f:	90                   	nop
80101f30:	83 ec 0c             	sub    $0xc,%esp
80101f33:	56                   	push   %esi
80101f34:	e8 07 f9 ff ff       	call   80101840 <iunlock>
80101f39:	83 c4 10             	add    $0x10,%esp
80101f3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f3f:	89 f0                	mov    %esi,%eax
80101f41:	5b                   	pop    %ebx
80101f42:	5e                   	pop    %esi
80101f43:	5f                   	pop    %edi
80101f44:	5d                   	pop    %ebp
80101f45:	c3                   	ret    
80101f46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f4d:	8d 76 00             	lea    0x0(%esi),%esi
80101f50:	83 ec 0c             	sub    $0xc,%esp
80101f53:	56                   	push   %esi
80101f54:	31 f6                	xor    %esi,%esi
80101f56:	e8 35 f9 ff ff       	call   80101890 <iput>
80101f5b:	83 c4 10             	add    $0x10,%esp
80101f5e:	e9 68 ff ff ff       	jmp    80101ecb <namex+0x15b>
80101f63:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101f70 <dirlink>:
80101f70:	f3 0f 1e fb          	endbr32 
80101f74:	55                   	push   %ebp
80101f75:	89 e5                	mov    %esp,%ebp
80101f77:	57                   	push   %edi
80101f78:	56                   	push   %esi
80101f79:	53                   	push   %ebx
80101f7a:	83 ec 20             	sub    $0x20,%esp
80101f7d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101f80:	6a 00                	push   $0x0
80101f82:	ff 75 0c             	pushl  0xc(%ebp)
80101f85:	53                   	push   %ebx
80101f86:	e8 25 fd ff ff       	call   80101cb0 <dirlookup>
80101f8b:	83 c4 10             	add    $0x10,%esp
80101f8e:	85 c0                	test   %eax,%eax
80101f90:	75 6b                	jne    80101ffd <dirlink+0x8d>
80101f92:	8b 7b 58             	mov    0x58(%ebx),%edi
80101f95:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101f98:	85 ff                	test   %edi,%edi
80101f9a:	74 2d                	je     80101fc9 <dirlink+0x59>
80101f9c:	31 ff                	xor    %edi,%edi
80101f9e:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101fa1:	eb 0d                	jmp    80101fb0 <dirlink+0x40>
80101fa3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101fa7:	90                   	nop
80101fa8:	83 c7 10             	add    $0x10,%edi
80101fab:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101fae:	73 19                	jae    80101fc9 <dirlink+0x59>
80101fb0:	6a 10                	push   $0x10
80101fb2:	57                   	push   %edi
80101fb3:	56                   	push   %esi
80101fb4:	53                   	push   %ebx
80101fb5:	e8 a6 fa ff ff       	call   80101a60 <readi>
80101fba:	83 c4 10             	add    $0x10,%esp
80101fbd:	83 f8 10             	cmp    $0x10,%eax
80101fc0:	75 4e                	jne    80102010 <dirlink+0xa0>
80101fc2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101fc7:	75 df                	jne    80101fa8 <dirlink+0x38>
80101fc9:	83 ec 04             	sub    $0x4,%esp
80101fcc:	8d 45 da             	lea    -0x26(%ebp),%eax
80101fcf:	6a 0e                	push   $0xe
80101fd1:	ff 75 0c             	pushl  0xc(%ebp)
80101fd4:	50                   	push   %eax
80101fd5:	e8 f6 27 00 00       	call   801047d0 <strncpy>
80101fda:	6a 10                	push   $0x10
80101fdc:	8b 45 10             	mov    0x10(%ebp),%eax
80101fdf:	57                   	push   %edi
80101fe0:	56                   	push   %esi
80101fe1:	53                   	push   %ebx
80101fe2:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101fe6:	e8 75 fb ff ff       	call   80101b60 <writei>
80101feb:	83 c4 20             	add    $0x20,%esp
80101fee:	83 f8 10             	cmp    $0x10,%eax
80101ff1:	75 2a                	jne    8010201d <dirlink+0xad>
80101ff3:	31 c0                	xor    %eax,%eax
80101ff5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ff8:	5b                   	pop    %ebx
80101ff9:	5e                   	pop    %esi
80101ffa:	5f                   	pop    %edi
80101ffb:	5d                   	pop    %ebp
80101ffc:	c3                   	ret    
80101ffd:	83 ec 0c             	sub    $0xc,%esp
80102000:	50                   	push   %eax
80102001:	e8 8a f8 ff ff       	call   80101890 <iput>
80102006:	83 c4 10             	add    $0x10,%esp
80102009:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010200e:	eb e5                	jmp    80101ff5 <dirlink+0x85>
80102010:	83 ec 0c             	sub    $0xc,%esp
80102013:	68 48 72 10 80       	push   $0x80107248
80102018:	e8 73 e3 ff ff       	call   80100390 <panic>
8010201d:	83 ec 0c             	sub    $0xc,%esp
80102020:	68 1e 78 10 80       	push   $0x8010781e
80102025:	e8 66 e3 ff ff       	call   80100390 <panic>
8010202a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102030 <namei>:
80102030:	f3 0f 1e fb          	endbr32 
80102034:	55                   	push   %ebp
80102035:	31 d2                	xor    %edx,%edx
80102037:	89 e5                	mov    %esp,%ebp
80102039:	83 ec 18             	sub    $0x18,%esp
8010203c:	8b 45 08             	mov    0x8(%ebp),%eax
8010203f:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80102042:	e8 29 fd ff ff       	call   80101d70 <namex>
80102047:	c9                   	leave  
80102048:	c3                   	ret    
80102049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102050 <nameiparent>:
80102050:	f3 0f 1e fb          	endbr32 
80102054:	55                   	push   %ebp
80102055:	ba 01 00 00 00       	mov    $0x1,%edx
8010205a:	89 e5                	mov    %esp,%ebp
8010205c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010205f:	8b 45 08             	mov    0x8(%ebp),%eax
80102062:	5d                   	pop    %ebp
80102063:	e9 08 fd ff ff       	jmp    80101d70 <namex>
80102068:	66 90                	xchg   %ax,%ax
8010206a:	66 90                	xchg   %ax,%ax
8010206c:	66 90                	xchg   %ax,%ax
8010206e:	66 90                	xchg   %ax,%ax

80102070 <idestart>:
80102070:	55                   	push   %ebp
80102071:	89 e5                	mov    %esp,%ebp
80102073:	57                   	push   %edi
80102074:	56                   	push   %esi
80102075:	53                   	push   %ebx
80102076:	83 ec 0c             	sub    $0xc,%esp
80102079:	85 c0                	test   %eax,%eax
8010207b:	0f 84 b4 00 00 00    	je     80102135 <idestart+0xc5>
80102081:	8b 70 08             	mov    0x8(%eax),%esi
80102084:	89 c3                	mov    %eax,%ebx
80102086:	81 fe e7 03 00 00    	cmp    $0x3e7,%esi
8010208c:	0f 87 96 00 00 00    	ja     80102128 <idestart+0xb8>
80102092:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80102097:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010209e:	66 90                	xchg   %ax,%ax
801020a0:	89 ca                	mov    %ecx,%edx
801020a2:	ec                   	in     (%dx),%al
801020a3:	83 e0 c0             	and    $0xffffffc0,%eax
801020a6:	3c 40                	cmp    $0x40,%al
801020a8:	75 f6                	jne    801020a0 <idestart+0x30>
801020aa:	31 ff                	xor    %edi,%edi
801020ac:	ba f6 03 00 00       	mov    $0x3f6,%edx
801020b1:	89 f8                	mov    %edi,%eax
801020b3:	ee                   	out    %al,(%dx)
801020b4:	b8 01 00 00 00       	mov    $0x1,%eax
801020b9:	ba f2 01 00 00       	mov    $0x1f2,%edx
801020be:	ee                   	out    %al,(%dx)
801020bf:	ba f3 01 00 00       	mov    $0x1f3,%edx
801020c4:	89 f0                	mov    %esi,%eax
801020c6:	ee                   	out    %al,(%dx)
801020c7:	89 f0                	mov    %esi,%eax
801020c9:	ba f4 01 00 00       	mov    $0x1f4,%edx
801020ce:	c1 f8 08             	sar    $0x8,%eax
801020d1:	ee                   	out    %al,(%dx)
801020d2:	ba f5 01 00 00       	mov    $0x1f5,%edx
801020d7:	89 f8                	mov    %edi,%eax
801020d9:	ee                   	out    %al,(%dx)
801020da:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
801020de:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020e3:	c1 e0 04             	shl    $0x4,%eax
801020e6:	83 e0 10             	and    $0x10,%eax
801020e9:	83 c8 e0             	or     $0xffffffe0,%eax
801020ec:	ee                   	out    %al,(%dx)
801020ed:	f6 03 04             	testb  $0x4,(%ebx)
801020f0:	75 16                	jne    80102108 <idestart+0x98>
801020f2:	b8 20 00 00 00       	mov    $0x20,%eax
801020f7:	89 ca                	mov    %ecx,%edx
801020f9:	ee                   	out    %al,(%dx)
801020fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020fd:	5b                   	pop    %ebx
801020fe:	5e                   	pop    %esi
801020ff:	5f                   	pop    %edi
80102100:	5d                   	pop    %ebp
80102101:	c3                   	ret    
80102102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102108:	b8 30 00 00 00       	mov    $0x30,%eax
8010210d:	89 ca                	mov    %ecx,%edx
8010210f:	ee                   	out    %al,(%dx)
80102110:	b9 80 00 00 00       	mov    $0x80,%ecx
80102115:	8d 73 5c             	lea    0x5c(%ebx),%esi
80102118:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010211d:	fc                   	cld    
8010211e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80102120:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102123:	5b                   	pop    %ebx
80102124:	5e                   	pop    %esi
80102125:	5f                   	pop    %edi
80102126:	5d                   	pop    %ebp
80102127:	c3                   	ret    
80102128:	83 ec 0c             	sub    $0xc,%esp
8010212b:	68 b4 72 10 80       	push   $0x801072b4
80102130:	e8 5b e2 ff ff       	call   80100390 <panic>
80102135:	83 ec 0c             	sub    $0xc,%esp
80102138:	68 ab 72 10 80       	push   $0x801072ab
8010213d:	e8 4e e2 ff ff       	call   80100390 <panic>
80102142:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102150 <ideinit>:
80102150:	f3 0f 1e fb          	endbr32 
80102154:	55                   	push   %ebp
80102155:	89 e5                	mov    %esp,%ebp
80102157:	83 ec 10             	sub    $0x10,%esp
8010215a:	68 c6 72 10 80       	push   $0x801072c6
8010215f:	68 80 a5 10 80       	push   $0x8010a580
80102164:	e8 77 22 00 00       	call   801043e0 <initlock>
80102169:	58                   	pop    %eax
8010216a:	a1 00 2d 11 80       	mov    0x80112d00,%eax
8010216f:	5a                   	pop    %edx
80102170:	83 e8 01             	sub    $0x1,%eax
80102173:	50                   	push   %eax
80102174:	6a 0e                	push   $0xe
80102176:	e8 b5 02 00 00       	call   80102430 <ioapicenable>
8010217b:	83 c4 10             	add    $0x10,%esp
8010217e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102183:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102187:	90                   	nop
80102188:	ec                   	in     (%dx),%al
80102189:	83 e0 c0             	and    $0xffffffc0,%eax
8010218c:	3c 40                	cmp    $0x40,%al
8010218e:	75 f8                	jne    80102188 <ideinit+0x38>
80102190:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102195:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010219a:	ee                   	out    %al,(%dx)
8010219b:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
801021a0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801021a5:	eb 0e                	jmp    801021b5 <ideinit+0x65>
801021a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021ae:	66 90                	xchg   %ax,%ax
801021b0:	83 e9 01             	sub    $0x1,%ecx
801021b3:	74 0f                	je     801021c4 <ideinit+0x74>
801021b5:	ec                   	in     (%dx),%al
801021b6:	84 c0                	test   %al,%al
801021b8:	74 f6                	je     801021b0 <ideinit+0x60>
801021ba:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
801021c1:	00 00 00 
801021c4:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
801021c9:	ba f6 01 00 00       	mov    $0x1f6,%edx
801021ce:	ee                   	out    %al,(%dx)
801021cf:	c9                   	leave  
801021d0:	c3                   	ret    
801021d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021df:	90                   	nop

801021e0 <ideintr>:
801021e0:	f3 0f 1e fb          	endbr32 
801021e4:	55                   	push   %ebp
801021e5:	89 e5                	mov    %esp,%ebp
801021e7:	57                   	push   %edi
801021e8:	56                   	push   %esi
801021e9:	53                   	push   %ebx
801021ea:	83 ec 18             	sub    $0x18,%esp
801021ed:	68 80 a5 10 80       	push   $0x8010a580
801021f2:	e8 69 23 00 00       	call   80104560 <acquire>
801021f7:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
801021fd:	83 c4 10             	add    $0x10,%esp
80102200:	85 db                	test   %ebx,%ebx
80102202:	74 5f                	je     80102263 <ideintr+0x83>
80102204:	8b 43 58             	mov    0x58(%ebx),%eax
80102207:	a3 64 a5 10 80       	mov    %eax,0x8010a564
8010220c:	8b 33                	mov    (%ebx),%esi
8010220e:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102214:	75 2b                	jne    80102241 <ideintr+0x61>
80102216:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010221b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010221f:	90                   	nop
80102220:	ec                   	in     (%dx),%al
80102221:	89 c1                	mov    %eax,%ecx
80102223:	83 e1 c0             	and    $0xffffffc0,%ecx
80102226:	80 f9 40             	cmp    $0x40,%cl
80102229:	75 f5                	jne    80102220 <ideintr+0x40>
8010222b:	a8 21                	test   $0x21,%al
8010222d:	75 12                	jne    80102241 <ideintr+0x61>
8010222f:	8d 7b 5c             	lea    0x5c(%ebx),%edi
80102232:	b9 80 00 00 00       	mov    $0x80,%ecx
80102237:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010223c:	fc                   	cld    
8010223d:	f3 6d                	rep insl (%dx),%es:(%edi)
8010223f:	8b 33                	mov    (%ebx),%esi
80102241:	83 e6 fb             	and    $0xfffffffb,%esi
80102244:	83 ec 0c             	sub    $0xc,%esp
80102247:	83 ce 02             	or     $0x2,%esi
8010224a:	89 33                	mov    %esi,(%ebx)
8010224c:	53                   	push   %ebx
8010224d:	e8 8e 1e 00 00       	call   801040e0 <wakeup>
80102252:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102257:	83 c4 10             	add    $0x10,%esp
8010225a:	85 c0                	test   %eax,%eax
8010225c:	74 05                	je     80102263 <ideintr+0x83>
8010225e:	e8 0d fe ff ff       	call   80102070 <idestart>
80102263:	83 ec 0c             	sub    $0xc,%esp
80102266:	68 80 a5 10 80       	push   $0x8010a580
8010226b:	e8 b0 23 00 00       	call   80104620 <release>
80102270:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102273:	5b                   	pop    %ebx
80102274:	5e                   	pop    %esi
80102275:	5f                   	pop    %edi
80102276:	5d                   	pop    %ebp
80102277:	c3                   	ret    
80102278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010227f:	90                   	nop

80102280 <iderw>:
80102280:	f3 0f 1e fb          	endbr32 
80102284:	55                   	push   %ebp
80102285:	89 e5                	mov    %esp,%ebp
80102287:	53                   	push   %ebx
80102288:	83 ec 10             	sub    $0x10,%esp
8010228b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010228e:	8d 43 0c             	lea    0xc(%ebx),%eax
80102291:	50                   	push   %eax
80102292:	e8 e9 20 00 00       	call   80104380 <holdingsleep>
80102297:	83 c4 10             	add    $0x10,%esp
8010229a:	85 c0                	test   %eax,%eax
8010229c:	0f 84 cf 00 00 00    	je     80102371 <iderw+0xf1>
801022a2:	8b 03                	mov    (%ebx),%eax
801022a4:	83 e0 06             	and    $0x6,%eax
801022a7:	83 f8 02             	cmp    $0x2,%eax
801022aa:	0f 84 b4 00 00 00    	je     80102364 <iderw+0xe4>
801022b0:	8b 53 04             	mov    0x4(%ebx),%edx
801022b3:	85 d2                	test   %edx,%edx
801022b5:	74 0d                	je     801022c4 <iderw+0x44>
801022b7:	a1 60 a5 10 80       	mov    0x8010a560,%eax
801022bc:	85 c0                	test   %eax,%eax
801022be:	0f 84 93 00 00 00    	je     80102357 <iderw+0xd7>
801022c4:	83 ec 0c             	sub    $0xc,%esp
801022c7:	68 80 a5 10 80       	push   $0x8010a580
801022cc:	e8 8f 22 00 00       	call   80104560 <acquire>
801022d1:	a1 64 a5 10 80       	mov    0x8010a564,%eax
801022d6:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801022dd:	83 c4 10             	add    $0x10,%esp
801022e0:	85 c0                	test   %eax,%eax
801022e2:	74 6c                	je     80102350 <iderw+0xd0>
801022e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801022e8:	89 c2                	mov    %eax,%edx
801022ea:	8b 40 58             	mov    0x58(%eax),%eax
801022ed:	85 c0                	test   %eax,%eax
801022ef:	75 f7                	jne    801022e8 <iderw+0x68>
801022f1:	83 c2 58             	add    $0x58,%edx
801022f4:	89 1a                	mov    %ebx,(%edx)
801022f6:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
801022fc:	74 42                	je     80102340 <iderw+0xc0>
801022fe:	8b 03                	mov    (%ebx),%eax
80102300:	83 e0 06             	and    $0x6,%eax
80102303:	83 f8 02             	cmp    $0x2,%eax
80102306:	74 23                	je     8010232b <iderw+0xab>
80102308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010230f:	90                   	nop
80102310:	83 ec 08             	sub    $0x8,%esp
80102313:	68 80 a5 10 80       	push   $0x8010a580
80102318:	53                   	push   %ebx
80102319:	e8 02 1c 00 00       	call   80103f20 <sleep>
8010231e:	8b 03                	mov    (%ebx),%eax
80102320:	83 c4 10             	add    $0x10,%esp
80102323:	83 e0 06             	and    $0x6,%eax
80102326:	83 f8 02             	cmp    $0x2,%eax
80102329:	75 e5                	jne    80102310 <iderw+0x90>
8010232b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
80102332:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102335:	c9                   	leave  
80102336:	e9 e5 22 00 00       	jmp    80104620 <release>
8010233b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010233f:	90                   	nop
80102340:	89 d8                	mov    %ebx,%eax
80102342:	e8 29 fd ff ff       	call   80102070 <idestart>
80102347:	eb b5                	jmp    801022fe <iderw+0x7e>
80102349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102350:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102355:	eb 9d                	jmp    801022f4 <iderw+0x74>
80102357:	83 ec 0c             	sub    $0xc,%esp
8010235a:	68 f5 72 10 80       	push   $0x801072f5
8010235f:	e8 2c e0 ff ff       	call   80100390 <panic>
80102364:	83 ec 0c             	sub    $0xc,%esp
80102367:	68 e0 72 10 80       	push   $0x801072e0
8010236c:	e8 1f e0 ff ff       	call   80100390 <panic>
80102371:	83 ec 0c             	sub    $0xc,%esp
80102374:	68 ca 72 10 80       	push   $0x801072ca
80102379:	e8 12 e0 ff ff       	call   80100390 <panic>
8010237e:	66 90                	xchg   %ax,%ax

80102380 <ioapicinit>:
80102380:	f3 0f 1e fb          	endbr32 
80102384:	55                   	push   %ebp
80102385:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
8010238c:	00 c0 fe 
8010238f:	89 e5                	mov    %esp,%ebp
80102391:	56                   	push   %esi
80102392:	53                   	push   %ebx
80102393:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
8010239a:	00 00 00 
8010239d:	8b 15 34 26 11 80    	mov    0x80112634,%edx
801023a3:	8b 72 10             	mov    0x10(%edx),%esi
801023a6:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
801023ac:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801023b2:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
801023b9:	c1 ee 10             	shr    $0x10,%esi
801023bc:	89 f0                	mov    %esi,%eax
801023be:	0f b6 f0             	movzbl %al,%esi
801023c1:	8b 41 10             	mov    0x10(%ecx),%eax
801023c4:	c1 e8 18             	shr    $0x18,%eax
801023c7:	39 c2                	cmp    %eax,%edx
801023c9:	74 16                	je     801023e1 <ioapicinit+0x61>
801023cb:	83 ec 0c             	sub    $0xc,%esp
801023ce:	68 14 73 10 80       	push   $0x80107314
801023d3:	e8 d8 e2 ff ff       	call   801006b0 <cprintf>
801023d8:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801023de:	83 c4 10             	add    $0x10,%esp
801023e1:	83 c6 21             	add    $0x21,%esi
801023e4:	ba 10 00 00 00       	mov    $0x10,%edx
801023e9:	b8 20 00 00 00       	mov    $0x20,%eax
801023ee:	66 90                	xchg   %ax,%ax
801023f0:	89 11                	mov    %edx,(%ecx)
801023f2:	89 c3                	mov    %eax,%ebx
801023f4:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801023fa:	83 c0 01             	add    $0x1,%eax
801023fd:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102403:	89 59 10             	mov    %ebx,0x10(%ecx)
80102406:	8d 5a 01             	lea    0x1(%edx),%ebx
80102409:	83 c2 02             	add    $0x2,%edx
8010240c:	89 19                	mov    %ebx,(%ecx)
8010240e:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102414:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010241b:	39 f0                	cmp    %esi,%eax
8010241d:	75 d1                	jne    801023f0 <ioapicinit+0x70>
8010241f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102422:	5b                   	pop    %ebx
80102423:	5e                   	pop    %esi
80102424:	5d                   	pop    %ebp
80102425:	c3                   	ret    
80102426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010242d:	8d 76 00             	lea    0x0(%esi),%esi

80102430 <ioapicenable>:
80102430:	f3 0f 1e fb          	endbr32 
80102434:	55                   	push   %ebp
80102435:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010243b:	89 e5                	mov    %esp,%ebp
8010243d:	8b 45 08             	mov    0x8(%ebp),%eax
80102440:	8d 50 20             	lea    0x20(%eax),%edx
80102443:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102447:	89 01                	mov    %eax,(%ecx)
80102449:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010244f:	83 c0 01             	add    $0x1,%eax
80102452:	89 51 10             	mov    %edx,0x10(%ecx)
80102455:	8b 55 0c             	mov    0xc(%ebp),%edx
80102458:	89 01                	mov    %eax,(%ecx)
8010245a:	a1 34 26 11 80       	mov    0x80112634,%eax
8010245f:	c1 e2 18             	shl    $0x18,%edx
80102462:	89 50 10             	mov    %edx,0x10(%eax)
80102465:	5d                   	pop    %ebp
80102466:	c3                   	ret    
80102467:	66 90                	xchg   %ax,%ax
80102469:	66 90                	xchg   %ax,%ax
8010246b:	66 90                	xchg   %ax,%ax
8010246d:	66 90                	xchg   %ax,%ax
8010246f:	90                   	nop

80102470 <kfree>:
80102470:	f3 0f 1e fb          	endbr32 
80102474:	55                   	push   %ebp
80102475:	89 e5                	mov    %esp,%ebp
80102477:	53                   	push   %ebx
80102478:	83 ec 04             	sub    $0x4,%esp
8010247b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010247e:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102484:	75 7a                	jne    80102500 <kfree+0x90>
80102486:	81 fb a8 54 11 80    	cmp    $0x801154a8,%ebx
8010248c:	72 72                	jb     80102500 <kfree+0x90>
8010248e:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102494:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102499:	77 65                	ja     80102500 <kfree+0x90>
8010249b:	83 ec 04             	sub    $0x4,%esp
8010249e:	68 00 10 00 00       	push   $0x1000
801024a3:	6a 01                	push   $0x1
801024a5:	53                   	push   %ebx
801024a6:	e8 c5 21 00 00       	call   80104670 <memset>
801024ab:	8b 15 74 26 11 80    	mov    0x80112674,%edx
801024b1:	83 c4 10             	add    $0x10,%esp
801024b4:	85 d2                	test   %edx,%edx
801024b6:	75 20                	jne    801024d8 <kfree+0x68>
801024b8:	a1 78 26 11 80       	mov    0x80112678,%eax
801024bd:	89 03                	mov    %eax,(%ebx)
801024bf:	a1 74 26 11 80       	mov    0x80112674,%eax
801024c4:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
801024ca:	85 c0                	test   %eax,%eax
801024cc:	75 22                	jne    801024f0 <kfree+0x80>
801024ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024d1:	c9                   	leave  
801024d2:	c3                   	ret    
801024d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024d7:	90                   	nop
801024d8:	83 ec 0c             	sub    $0xc,%esp
801024db:	68 40 26 11 80       	push   $0x80112640
801024e0:	e8 7b 20 00 00       	call   80104560 <acquire>
801024e5:	83 c4 10             	add    $0x10,%esp
801024e8:	eb ce                	jmp    801024b8 <kfree+0x48>
801024ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801024f0:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
801024f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024fa:	c9                   	leave  
801024fb:	e9 20 21 00 00       	jmp    80104620 <release>
80102500:	83 ec 0c             	sub    $0xc,%esp
80102503:	68 46 73 10 80       	push   $0x80107346
80102508:	e8 83 de ff ff       	call   80100390 <panic>
8010250d:	8d 76 00             	lea    0x0(%esi),%esi

80102510 <freerange>:
80102510:	f3 0f 1e fb          	endbr32 
80102514:	55                   	push   %ebp
80102515:	89 e5                	mov    %esp,%ebp
80102517:	56                   	push   %esi
80102518:	8b 45 08             	mov    0x8(%ebp),%eax
8010251b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010251e:	53                   	push   %ebx
8010251f:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102525:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010252b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102531:	39 de                	cmp    %ebx,%esi
80102533:	72 1f                	jb     80102554 <freerange+0x44>
80102535:	8d 76 00             	lea    0x0(%esi),%esi
80102538:	83 ec 0c             	sub    $0xc,%esp
8010253b:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102541:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102547:	50                   	push   %eax
80102548:	e8 23 ff ff ff       	call   80102470 <kfree>
8010254d:	83 c4 10             	add    $0x10,%esp
80102550:	39 f3                	cmp    %esi,%ebx
80102552:	76 e4                	jbe    80102538 <freerange+0x28>
80102554:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102557:	5b                   	pop    %ebx
80102558:	5e                   	pop    %esi
80102559:	5d                   	pop    %ebp
8010255a:	c3                   	ret    
8010255b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010255f:	90                   	nop

80102560 <kinit1>:
80102560:	f3 0f 1e fb          	endbr32 
80102564:	55                   	push   %ebp
80102565:	89 e5                	mov    %esp,%ebp
80102567:	56                   	push   %esi
80102568:	53                   	push   %ebx
80102569:	8b 75 0c             	mov    0xc(%ebp),%esi
8010256c:	83 ec 08             	sub    $0x8,%esp
8010256f:	68 4c 73 10 80       	push   $0x8010734c
80102574:	68 40 26 11 80       	push   $0x80112640
80102579:	e8 62 1e 00 00       	call   801043e0 <initlock>
8010257e:	8b 45 08             	mov    0x8(%ebp),%eax
80102581:	83 c4 10             	add    $0x10,%esp
80102584:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
8010258b:	00 00 00 
8010258e:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102594:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010259a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025a0:	39 de                	cmp    %ebx,%esi
801025a2:	72 20                	jb     801025c4 <kinit1+0x64>
801025a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025a8:	83 ec 0c             	sub    $0xc,%esp
801025ab:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801025b1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025b7:	50                   	push   %eax
801025b8:	e8 b3 fe ff ff       	call   80102470 <kfree>
801025bd:	83 c4 10             	add    $0x10,%esp
801025c0:	39 de                	cmp    %ebx,%esi
801025c2:	73 e4                	jae    801025a8 <kinit1+0x48>
801025c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801025c7:	5b                   	pop    %ebx
801025c8:	5e                   	pop    %esi
801025c9:	5d                   	pop    %ebp
801025ca:	c3                   	ret    
801025cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025cf:	90                   	nop

801025d0 <kinit2>:
801025d0:	f3 0f 1e fb          	endbr32 
801025d4:	55                   	push   %ebp
801025d5:	89 e5                	mov    %esp,%ebp
801025d7:	56                   	push   %esi
801025d8:	8b 45 08             	mov    0x8(%ebp),%eax
801025db:	8b 75 0c             	mov    0xc(%ebp),%esi
801025de:	53                   	push   %ebx
801025df:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801025e5:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801025eb:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025f1:	39 de                	cmp    %ebx,%esi
801025f3:	72 1f                	jb     80102614 <kinit2+0x44>
801025f5:	8d 76 00             	lea    0x0(%esi),%esi
801025f8:	83 ec 0c             	sub    $0xc,%esp
801025fb:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102601:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102607:	50                   	push   %eax
80102608:	e8 63 fe ff ff       	call   80102470 <kfree>
8010260d:	83 c4 10             	add    $0x10,%esp
80102610:	39 de                	cmp    %ebx,%esi
80102612:	73 e4                	jae    801025f8 <kinit2+0x28>
80102614:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
8010261b:	00 00 00 
8010261e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102621:	5b                   	pop    %ebx
80102622:	5e                   	pop    %esi
80102623:	5d                   	pop    %ebp
80102624:	c3                   	ret    
80102625:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010262c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102630 <kalloc>:
80102630:	f3 0f 1e fb          	endbr32 
80102634:	a1 74 26 11 80       	mov    0x80112674,%eax
80102639:	85 c0                	test   %eax,%eax
8010263b:	75 1b                	jne    80102658 <kalloc+0x28>
8010263d:	a1 78 26 11 80       	mov    0x80112678,%eax
80102642:	85 c0                	test   %eax,%eax
80102644:	74 0a                	je     80102650 <kalloc+0x20>
80102646:	8b 10                	mov    (%eax),%edx
80102648:	89 15 78 26 11 80    	mov    %edx,0x80112678
8010264e:	c3                   	ret    
8010264f:	90                   	nop
80102650:	c3                   	ret    
80102651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102658:	55                   	push   %ebp
80102659:	89 e5                	mov    %esp,%ebp
8010265b:	83 ec 24             	sub    $0x24,%esp
8010265e:	68 40 26 11 80       	push   $0x80112640
80102663:	e8 f8 1e 00 00       	call   80104560 <acquire>
80102668:	a1 78 26 11 80       	mov    0x80112678,%eax
8010266d:	8b 15 74 26 11 80    	mov    0x80112674,%edx
80102673:	83 c4 10             	add    $0x10,%esp
80102676:	85 c0                	test   %eax,%eax
80102678:	74 08                	je     80102682 <kalloc+0x52>
8010267a:	8b 08                	mov    (%eax),%ecx
8010267c:	89 0d 78 26 11 80    	mov    %ecx,0x80112678
80102682:	85 d2                	test   %edx,%edx
80102684:	74 16                	je     8010269c <kalloc+0x6c>
80102686:	83 ec 0c             	sub    $0xc,%esp
80102689:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010268c:	68 40 26 11 80       	push   $0x80112640
80102691:	e8 8a 1f 00 00       	call   80104620 <release>
80102696:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102699:	83 c4 10             	add    $0x10,%esp
8010269c:	c9                   	leave  
8010269d:	c3                   	ret    
8010269e:	66 90                	xchg   %ax,%ax

801026a0 <kbdgetc>:
801026a0:	f3 0f 1e fb          	endbr32 
801026a4:	ba 64 00 00 00       	mov    $0x64,%edx
801026a9:	ec                   	in     (%dx),%al
801026aa:	a8 01                	test   $0x1,%al
801026ac:	0f 84 be 00 00 00    	je     80102770 <kbdgetc+0xd0>
801026b2:	55                   	push   %ebp
801026b3:	ba 60 00 00 00       	mov    $0x60,%edx
801026b8:	89 e5                	mov    %esp,%ebp
801026ba:	53                   	push   %ebx
801026bb:	ec                   	in     (%dx),%al
801026bc:	8b 1d b4 a5 10 80    	mov    0x8010a5b4,%ebx
801026c2:	0f b6 d0             	movzbl %al,%edx
801026c5:	3c e0                	cmp    $0xe0,%al
801026c7:	74 57                	je     80102720 <kbdgetc+0x80>
801026c9:	89 d9                	mov    %ebx,%ecx
801026cb:	83 e1 40             	and    $0x40,%ecx
801026ce:	84 c0                	test   %al,%al
801026d0:	78 5e                	js     80102730 <kbdgetc+0x90>
801026d2:	85 c9                	test   %ecx,%ecx
801026d4:	74 09                	je     801026df <kbdgetc+0x3f>
801026d6:	83 c8 80             	or     $0xffffff80,%eax
801026d9:	83 e3 bf             	and    $0xffffffbf,%ebx
801026dc:	0f b6 d0             	movzbl %al,%edx
801026df:	0f b6 8a 80 74 10 80 	movzbl -0x7fef8b80(%edx),%ecx
801026e6:	0f b6 82 80 73 10 80 	movzbl -0x7fef8c80(%edx),%eax
801026ed:	09 d9                	or     %ebx,%ecx
801026ef:	31 c1                	xor    %eax,%ecx
801026f1:	89 c8                	mov    %ecx,%eax
801026f3:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
801026f9:	83 e0 03             	and    $0x3,%eax
801026fc:	83 e1 08             	and    $0x8,%ecx
801026ff:	8b 04 85 60 73 10 80 	mov    -0x7fef8ca0(,%eax,4),%eax
80102706:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
8010270a:	74 0b                	je     80102717 <kbdgetc+0x77>
8010270c:	8d 50 9f             	lea    -0x61(%eax),%edx
8010270f:	83 fa 19             	cmp    $0x19,%edx
80102712:	77 44                	ja     80102758 <kbdgetc+0xb8>
80102714:	83 e8 20             	sub    $0x20,%eax
80102717:	5b                   	pop    %ebx
80102718:	5d                   	pop    %ebp
80102719:	c3                   	ret    
8010271a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102720:	83 cb 40             	or     $0x40,%ebx
80102723:	31 c0                	xor    %eax,%eax
80102725:	89 1d b4 a5 10 80    	mov    %ebx,0x8010a5b4
8010272b:	5b                   	pop    %ebx
8010272c:	5d                   	pop    %ebp
8010272d:	c3                   	ret    
8010272e:	66 90                	xchg   %ax,%ax
80102730:	83 e0 7f             	and    $0x7f,%eax
80102733:	85 c9                	test   %ecx,%ecx
80102735:	0f 44 d0             	cmove  %eax,%edx
80102738:	31 c0                	xor    %eax,%eax
8010273a:	0f b6 8a 80 74 10 80 	movzbl -0x7fef8b80(%edx),%ecx
80102741:	83 c9 40             	or     $0x40,%ecx
80102744:	0f b6 c9             	movzbl %cl,%ecx
80102747:	f7 d1                	not    %ecx
80102749:	21 d9                	and    %ebx,%ecx
8010274b:	5b                   	pop    %ebx
8010274c:	5d                   	pop    %ebp
8010274d:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102753:	c3                   	ret    
80102754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102758:	8d 48 bf             	lea    -0x41(%eax),%ecx
8010275b:	8d 50 20             	lea    0x20(%eax),%edx
8010275e:	5b                   	pop    %ebx
8010275f:	5d                   	pop    %ebp
80102760:	83 f9 1a             	cmp    $0x1a,%ecx
80102763:	0f 42 c2             	cmovb  %edx,%eax
80102766:	c3                   	ret    
80102767:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010276e:	66 90                	xchg   %ax,%ax
80102770:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102775:	c3                   	ret    
80102776:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010277d:	8d 76 00             	lea    0x0(%esi),%esi

80102780 <kbdintr>:
80102780:	f3 0f 1e fb          	endbr32 
80102784:	55                   	push   %ebp
80102785:	89 e5                	mov    %esp,%ebp
80102787:	83 ec 14             	sub    $0x14,%esp
8010278a:	68 a0 26 10 80       	push   $0x801026a0
8010278f:	e8 cc e0 ff ff       	call   80100860 <consoleintr>
80102794:	83 c4 10             	add    $0x10,%esp
80102797:	c9                   	leave  
80102798:	c3                   	ret    
80102799:	66 90                	xchg   %ax,%ax
8010279b:	66 90                	xchg   %ax,%ax
8010279d:	66 90                	xchg   %ax,%ax
8010279f:	90                   	nop

801027a0 <lapicinit>:
801027a0:	f3 0f 1e fb          	endbr32 
801027a4:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801027a9:	85 c0                	test   %eax,%eax
801027ab:	0f 84 c7 00 00 00    	je     80102878 <lapicinit+0xd8>
801027b1:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801027b8:	01 00 00 
801027bb:	8b 50 20             	mov    0x20(%eax),%edx
801027be:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801027c5:	00 00 00 
801027c8:	8b 50 20             	mov    0x20(%eax),%edx
801027cb:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801027d2:	00 02 00 
801027d5:	8b 50 20             	mov    0x20(%eax),%edx
801027d8:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801027df:	96 98 00 
801027e2:	8b 50 20             	mov    0x20(%eax),%edx
801027e5:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801027ec:	00 01 00 
801027ef:	8b 50 20             	mov    0x20(%eax),%edx
801027f2:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801027f9:	00 01 00 
801027fc:	8b 50 20             	mov    0x20(%eax),%edx
801027ff:	8b 50 30             	mov    0x30(%eax),%edx
80102802:	c1 ea 10             	shr    $0x10,%edx
80102805:	81 e2 fc 00 00 00    	and    $0xfc,%edx
8010280b:	75 73                	jne    80102880 <lapicinit+0xe0>
8010280d:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102814:	00 00 00 
80102817:	8b 50 20             	mov    0x20(%eax),%edx
8010281a:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102821:	00 00 00 
80102824:	8b 50 20             	mov    0x20(%eax),%edx
80102827:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010282e:	00 00 00 
80102831:	8b 50 20             	mov    0x20(%eax),%edx
80102834:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
8010283b:	00 00 00 
8010283e:	8b 50 20             	mov    0x20(%eax),%edx
80102841:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102848:	00 00 00 
8010284b:	8b 50 20             	mov    0x20(%eax),%edx
8010284e:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102855:	85 08 00 
80102858:	8b 50 20             	mov    0x20(%eax),%edx
8010285b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010285f:	90                   	nop
80102860:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102866:	80 e6 10             	and    $0x10,%dh
80102869:	75 f5                	jne    80102860 <lapicinit+0xc0>
8010286b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102872:	00 00 00 
80102875:	8b 40 20             	mov    0x20(%eax),%eax
80102878:	c3                   	ret    
80102879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102880:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102887:	00 01 00 
8010288a:	8b 50 20             	mov    0x20(%eax),%edx
8010288d:	e9 7b ff ff ff       	jmp    8010280d <lapicinit+0x6d>
80102892:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801028a0 <lapicid>:
801028a0:	f3 0f 1e fb          	endbr32 
801028a4:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801028a9:	85 c0                	test   %eax,%eax
801028ab:	74 0b                	je     801028b8 <lapicid+0x18>
801028ad:	8b 40 20             	mov    0x20(%eax),%eax
801028b0:	c1 e8 18             	shr    $0x18,%eax
801028b3:	c3                   	ret    
801028b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801028b8:	31 c0                	xor    %eax,%eax
801028ba:	c3                   	ret    
801028bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801028bf:	90                   	nop

801028c0 <lapiceoi>:
801028c0:	f3 0f 1e fb          	endbr32 
801028c4:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801028c9:	85 c0                	test   %eax,%eax
801028cb:	74 0d                	je     801028da <lapiceoi+0x1a>
801028cd:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801028d4:	00 00 00 
801028d7:	8b 40 20             	mov    0x20(%eax),%eax
801028da:	c3                   	ret    
801028db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801028df:	90                   	nop

801028e0 <microdelay>:
801028e0:	f3 0f 1e fb          	endbr32 
801028e4:	c3                   	ret    
801028e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801028ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801028f0 <lapicstartap>:
801028f0:	f3 0f 1e fb          	endbr32 
801028f4:	55                   	push   %ebp
801028f5:	b8 0f 00 00 00       	mov    $0xf,%eax
801028fa:	ba 70 00 00 00       	mov    $0x70,%edx
801028ff:	89 e5                	mov    %esp,%ebp
80102901:	53                   	push   %ebx
80102902:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102905:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102908:	ee                   	out    %al,(%dx)
80102909:	b8 0a 00 00 00       	mov    $0xa,%eax
8010290e:	ba 71 00 00 00       	mov    $0x71,%edx
80102913:	ee                   	out    %al,(%dx)
80102914:	31 c0                	xor    %eax,%eax
80102916:	c1 e3 18             	shl    $0x18,%ebx
80102919:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010291f:	89 c8                	mov    %ecx,%eax
80102921:	c1 e9 0c             	shr    $0xc,%ecx
80102924:	89 da                	mov    %ebx,%edx
80102926:	c1 e8 04             	shr    $0x4,%eax
80102929:	80 cd 06             	or     $0x6,%ch
8010292c:	66 a3 69 04 00 80    	mov    %ax,0x80000469
80102932:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102937:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
8010293d:	8b 58 20             	mov    0x20(%eax),%ebx
80102940:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102947:	c5 00 00 
8010294a:	8b 58 20             	mov    0x20(%eax),%ebx
8010294d:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102954:	85 00 00 
80102957:	8b 58 20             	mov    0x20(%eax),%ebx
8010295a:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
80102960:	8b 58 20             	mov    0x20(%eax),%ebx
80102963:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102969:	8b 58 20             	mov    0x20(%eax),%ebx
8010296c:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
80102972:	8b 50 20             	mov    0x20(%eax),%edx
80102975:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
8010297b:	5b                   	pop    %ebx
8010297c:	8b 40 20             	mov    0x20(%eax),%eax
8010297f:	5d                   	pop    %ebp
80102980:	c3                   	ret    
80102981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102988:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010298f:	90                   	nop

80102990 <cmostime>:
80102990:	f3 0f 1e fb          	endbr32 
80102994:	55                   	push   %ebp
80102995:	b8 0b 00 00 00       	mov    $0xb,%eax
8010299a:	ba 70 00 00 00       	mov    $0x70,%edx
8010299f:	89 e5                	mov    %esp,%ebp
801029a1:	57                   	push   %edi
801029a2:	56                   	push   %esi
801029a3:	53                   	push   %ebx
801029a4:	83 ec 4c             	sub    $0x4c,%esp
801029a7:	ee                   	out    %al,(%dx)
801029a8:	ba 71 00 00 00       	mov    $0x71,%edx
801029ad:	ec                   	in     (%dx),%al
801029ae:	83 e0 04             	and    $0x4,%eax
801029b1:	bb 70 00 00 00       	mov    $0x70,%ebx
801029b6:	88 45 b3             	mov    %al,-0x4d(%ebp)
801029b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801029c0:	31 c0                	xor    %eax,%eax
801029c2:	89 da                	mov    %ebx,%edx
801029c4:	ee                   	out    %al,(%dx)
801029c5:	b9 71 00 00 00       	mov    $0x71,%ecx
801029ca:	89 ca                	mov    %ecx,%edx
801029cc:	ec                   	in     (%dx),%al
801029cd:	88 45 b7             	mov    %al,-0x49(%ebp)
801029d0:	89 da                	mov    %ebx,%edx
801029d2:	b8 02 00 00 00       	mov    $0x2,%eax
801029d7:	ee                   	out    %al,(%dx)
801029d8:	89 ca                	mov    %ecx,%edx
801029da:	ec                   	in     (%dx),%al
801029db:	88 45 b6             	mov    %al,-0x4a(%ebp)
801029de:	89 da                	mov    %ebx,%edx
801029e0:	b8 04 00 00 00       	mov    $0x4,%eax
801029e5:	ee                   	out    %al,(%dx)
801029e6:	89 ca                	mov    %ecx,%edx
801029e8:	ec                   	in     (%dx),%al
801029e9:	88 45 b5             	mov    %al,-0x4b(%ebp)
801029ec:	89 da                	mov    %ebx,%edx
801029ee:	b8 07 00 00 00       	mov    $0x7,%eax
801029f3:	ee                   	out    %al,(%dx)
801029f4:	89 ca                	mov    %ecx,%edx
801029f6:	ec                   	in     (%dx),%al
801029f7:	88 45 b4             	mov    %al,-0x4c(%ebp)
801029fa:	89 da                	mov    %ebx,%edx
801029fc:	b8 08 00 00 00       	mov    $0x8,%eax
80102a01:	ee                   	out    %al,(%dx)
80102a02:	89 ca                	mov    %ecx,%edx
80102a04:	ec                   	in     (%dx),%al
80102a05:	89 c7                	mov    %eax,%edi
80102a07:	89 da                	mov    %ebx,%edx
80102a09:	b8 09 00 00 00       	mov    $0x9,%eax
80102a0e:	ee                   	out    %al,(%dx)
80102a0f:	89 ca                	mov    %ecx,%edx
80102a11:	ec                   	in     (%dx),%al
80102a12:	89 c6                	mov    %eax,%esi
80102a14:	89 da                	mov    %ebx,%edx
80102a16:	b8 0a 00 00 00       	mov    $0xa,%eax
80102a1b:	ee                   	out    %al,(%dx)
80102a1c:	89 ca                	mov    %ecx,%edx
80102a1e:	ec                   	in     (%dx),%al
80102a1f:	84 c0                	test   %al,%al
80102a21:	78 9d                	js     801029c0 <cmostime+0x30>
80102a23:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102a27:	89 fa                	mov    %edi,%edx
80102a29:	0f b6 fa             	movzbl %dl,%edi
80102a2c:	89 f2                	mov    %esi,%edx
80102a2e:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102a31:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
80102a35:	0f b6 f2             	movzbl %dl,%esi
80102a38:	89 da                	mov    %ebx,%edx
80102a3a:	89 7d c8             	mov    %edi,-0x38(%ebp)
80102a3d:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102a40:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
80102a44:	89 75 cc             	mov    %esi,-0x34(%ebp)
80102a47:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102a4a:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102a4e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102a51:	31 c0                	xor    %eax,%eax
80102a53:	ee                   	out    %al,(%dx)
80102a54:	89 ca                	mov    %ecx,%edx
80102a56:	ec                   	in     (%dx),%al
80102a57:	0f b6 c0             	movzbl %al,%eax
80102a5a:	89 da                	mov    %ebx,%edx
80102a5c:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102a5f:	b8 02 00 00 00       	mov    $0x2,%eax
80102a64:	ee                   	out    %al,(%dx)
80102a65:	89 ca                	mov    %ecx,%edx
80102a67:	ec                   	in     (%dx),%al
80102a68:	0f b6 c0             	movzbl %al,%eax
80102a6b:	89 da                	mov    %ebx,%edx
80102a6d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102a70:	b8 04 00 00 00       	mov    $0x4,%eax
80102a75:	ee                   	out    %al,(%dx)
80102a76:	89 ca                	mov    %ecx,%edx
80102a78:	ec                   	in     (%dx),%al
80102a79:	0f b6 c0             	movzbl %al,%eax
80102a7c:	89 da                	mov    %ebx,%edx
80102a7e:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102a81:	b8 07 00 00 00       	mov    $0x7,%eax
80102a86:	ee                   	out    %al,(%dx)
80102a87:	89 ca                	mov    %ecx,%edx
80102a89:	ec                   	in     (%dx),%al
80102a8a:	0f b6 c0             	movzbl %al,%eax
80102a8d:	89 da                	mov    %ebx,%edx
80102a8f:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102a92:	b8 08 00 00 00       	mov    $0x8,%eax
80102a97:	ee                   	out    %al,(%dx)
80102a98:	89 ca                	mov    %ecx,%edx
80102a9a:	ec                   	in     (%dx),%al
80102a9b:	0f b6 c0             	movzbl %al,%eax
80102a9e:	89 da                	mov    %ebx,%edx
80102aa0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102aa3:	b8 09 00 00 00       	mov    $0x9,%eax
80102aa8:	ee                   	out    %al,(%dx)
80102aa9:	89 ca                	mov    %ecx,%edx
80102aab:	ec                   	in     (%dx),%al
80102aac:	0f b6 c0             	movzbl %al,%eax
80102aaf:	83 ec 04             	sub    $0x4,%esp
80102ab2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102ab5:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102ab8:	6a 18                	push   $0x18
80102aba:	50                   	push   %eax
80102abb:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102abe:	50                   	push   %eax
80102abf:	e8 fc 1b 00 00       	call   801046c0 <memcmp>
80102ac4:	83 c4 10             	add    $0x10,%esp
80102ac7:	85 c0                	test   %eax,%eax
80102ac9:	0f 85 f1 fe ff ff    	jne    801029c0 <cmostime+0x30>
80102acf:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
80102ad3:	75 78                	jne    80102b4d <cmostime+0x1bd>
80102ad5:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102ad8:	89 c2                	mov    %eax,%edx
80102ada:	83 e0 0f             	and    $0xf,%eax
80102add:	c1 ea 04             	shr    $0x4,%edx
80102ae0:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102ae3:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102ae6:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102ae9:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102aec:	89 c2                	mov    %eax,%edx
80102aee:	83 e0 0f             	and    $0xf,%eax
80102af1:	c1 ea 04             	shr    $0x4,%edx
80102af4:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102af7:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102afa:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102afd:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b00:	89 c2                	mov    %eax,%edx
80102b02:	83 e0 0f             	and    $0xf,%eax
80102b05:	c1 ea 04             	shr    $0x4,%edx
80102b08:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b0b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b0e:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102b11:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102b14:	89 c2                	mov    %eax,%edx
80102b16:	83 e0 0f             	and    $0xf,%eax
80102b19:	c1 ea 04             	shr    $0x4,%edx
80102b1c:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b1f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b22:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102b25:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102b28:	89 c2                	mov    %eax,%edx
80102b2a:	83 e0 0f             	and    $0xf,%eax
80102b2d:	c1 ea 04             	shr    $0x4,%edx
80102b30:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b33:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b36:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102b39:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102b3c:	89 c2                	mov    %eax,%edx
80102b3e:	83 e0 0f             	and    $0xf,%eax
80102b41:	c1 ea 04             	shr    $0x4,%edx
80102b44:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b47:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b4a:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102b4d:	8b 75 08             	mov    0x8(%ebp),%esi
80102b50:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102b53:	89 06                	mov    %eax,(%esi)
80102b55:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b58:	89 46 04             	mov    %eax,0x4(%esi)
80102b5b:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b5e:	89 46 08             	mov    %eax,0x8(%esi)
80102b61:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102b64:	89 46 0c             	mov    %eax,0xc(%esi)
80102b67:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102b6a:	89 46 10             	mov    %eax,0x10(%esi)
80102b6d:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102b70:	89 46 14             	mov    %eax,0x14(%esi)
80102b73:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102b7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b7d:	5b                   	pop    %ebx
80102b7e:	5e                   	pop    %esi
80102b7f:	5f                   	pop    %edi
80102b80:	5d                   	pop    %ebp
80102b81:	c3                   	ret    
80102b82:	66 90                	xchg   %ax,%ax
80102b84:	66 90                	xchg   %ax,%ax
80102b86:	66 90                	xchg   %ax,%ax
80102b88:	66 90                	xchg   %ax,%ax
80102b8a:	66 90                	xchg   %ax,%ax
80102b8c:	66 90                	xchg   %ax,%ax
80102b8e:	66 90                	xchg   %ax,%ax

80102b90 <install_trans>:
80102b90:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102b96:	85 c9                	test   %ecx,%ecx
80102b98:	0f 8e 8a 00 00 00    	jle    80102c28 <install_trans+0x98>
80102b9e:	55                   	push   %ebp
80102b9f:	89 e5                	mov    %esp,%ebp
80102ba1:	57                   	push   %edi
80102ba2:	31 ff                	xor    %edi,%edi
80102ba4:	56                   	push   %esi
80102ba5:	53                   	push   %ebx
80102ba6:	83 ec 0c             	sub    $0xc,%esp
80102ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102bb0:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102bb5:	83 ec 08             	sub    $0x8,%esp
80102bb8:	01 f8                	add    %edi,%eax
80102bba:	83 c0 01             	add    $0x1,%eax
80102bbd:	50                   	push   %eax
80102bbe:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102bc4:	e8 07 d5 ff ff       	call   801000d0 <bread>
80102bc9:	89 c6                	mov    %eax,%esi
80102bcb:	58                   	pop    %eax
80102bcc:	5a                   	pop    %edx
80102bcd:	ff 34 bd cc 26 11 80 	pushl  -0x7feed934(,%edi,4)
80102bd4:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102bda:	83 c7 01             	add    $0x1,%edi
80102bdd:	e8 ee d4 ff ff       	call   801000d0 <bread>
80102be2:	83 c4 0c             	add    $0xc,%esp
80102be5:	89 c3                	mov    %eax,%ebx
80102be7:	8d 46 5c             	lea    0x5c(%esi),%eax
80102bea:	68 00 02 00 00       	push   $0x200
80102bef:	50                   	push   %eax
80102bf0:	8d 43 5c             	lea    0x5c(%ebx),%eax
80102bf3:	50                   	push   %eax
80102bf4:	e8 17 1b 00 00       	call   80104710 <memmove>
80102bf9:	89 1c 24             	mov    %ebx,(%esp)
80102bfc:	e8 af d5 ff ff       	call   801001b0 <bwrite>
80102c01:	89 34 24             	mov    %esi,(%esp)
80102c04:	e8 e7 d5 ff ff       	call   801001f0 <brelse>
80102c09:	89 1c 24             	mov    %ebx,(%esp)
80102c0c:	e8 df d5 ff ff       	call   801001f0 <brelse>
80102c11:	83 c4 10             	add    $0x10,%esp
80102c14:	39 3d c8 26 11 80    	cmp    %edi,0x801126c8
80102c1a:	7f 94                	jg     80102bb0 <install_trans+0x20>
80102c1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c1f:	5b                   	pop    %ebx
80102c20:	5e                   	pop    %esi
80102c21:	5f                   	pop    %edi
80102c22:	5d                   	pop    %ebp
80102c23:	c3                   	ret    
80102c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c28:	c3                   	ret    
80102c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102c30 <write_head>:
80102c30:	55                   	push   %ebp
80102c31:	89 e5                	mov    %esp,%ebp
80102c33:	53                   	push   %ebx
80102c34:	83 ec 0c             	sub    $0xc,%esp
80102c37:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102c3d:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c43:	e8 88 d4 ff ff       	call   801000d0 <bread>
80102c48:	83 c4 10             	add    $0x10,%esp
80102c4b:	89 c3                	mov    %eax,%ebx
80102c4d:	a1 c8 26 11 80       	mov    0x801126c8,%eax
80102c52:	89 43 5c             	mov    %eax,0x5c(%ebx)
80102c55:	85 c0                	test   %eax,%eax
80102c57:	7e 19                	jle    80102c72 <write_head+0x42>
80102c59:	31 d2                	xor    %edx,%edx
80102c5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c5f:	90                   	nop
80102c60:	8b 0c 95 cc 26 11 80 	mov    -0x7feed934(,%edx,4),%ecx
80102c67:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
80102c6b:	83 c2 01             	add    $0x1,%edx
80102c6e:	39 d0                	cmp    %edx,%eax
80102c70:	75 ee                	jne    80102c60 <write_head+0x30>
80102c72:	83 ec 0c             	sub    $0xc,%esp
80102c75:	53                   	push   %ebx
80102c76:	e8 35 d5 ff ff       	call   801001b0 <bwrite>
80102c7b:	89 1c 24             	mov    %ebx,(%esp)
80102c7e:	e8 6d d5 ff ff       	call   801001f0 <brelse>
80102c83:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c86:	83 c4 10             	add    $0x10,%esp
80102c89:	c9                   	leave  
80102c8a:	c3                   	ret    
80102c8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c8f:	90                   	nop

80102c90 <initlog>:
80102c90:	f3 0f 1e fb          	endbr32 
80102c94:	55                   	push   %ebp
80102c95:	89 e5                	mov    %esp,%ebp
80102c97:	53                   	push   %ebx
80102c98:	83 ec 2c             	sub    $0x2c,%esp
80102c9b:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102c9e:	68 80 75 10 80       	push   $0x80107580
80102ca3:	68 80 26 11 80       	push   $0x80112680
80102ca8:	e8 33 17 00 00       	call   801043e0 <initlock>
80102cad:	58                   	pop    %eax
80102cae:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102cb1:	5a                   	pop    %edx
80102cb2:	50                   	push   %eax
80102cb3:	53                   	push   %ebx
80102cb4:	e8 47 e8 ff ff       	call   80101500 <readsb>
80102cb9:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102cbc:	59                   	pop    %ecx
80102cbd:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4
80102cc3:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102cc6:	a3 b4 26 11 80       	mov    %eax,0x801126b4
80102ccb:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
80102cd1:	5a                   	pop    %edx
80102cd2:	50                   	push   %eax
80102cd3:	53                   	push   %ebx
80102cd4:	e8 f7 d3 ff ff       	call   801000d0 <bread>
80102cd9:	83 c4 10             	add    $0x10,%esp
80102cdc:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102cdf:	89 0d c8 26 11 80    	mov    %ecx,0x801126c8
80102ce5:	85 c9                	test   %ecx,%ecx
80102ce7:	7e 19                	jle    80102d02 <initlog+0x72>
80102ce9:	31 d2                	xor    %edx,%edx
80102ceb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102cef:	90                   	nop
80102cf0:	8b 5c 90 60          	mov    0x60(%eax,%edx,4),%ebx
80102cf4:	89 1c 95 cc 26 11 80 	mov    %ebx,-0x7feed934(,%edx,4)
80102cfb:	83 c2 01             	add    $0x1,%edx
80102cfe:	39 d1                	cmp    %edx,%ecx
80102d00:	75 ee                	jne    80102cf0 <initlog+0x60>
80102d02:	83 ec 0c             	sub    $0xc,%esp
80102d05:	50                   	push   %eax
80102d06:	e8 e5 d4 ff ff       	call   801001f0 <brelse>
80102d0b:	e8 80 fe ff ff       	call   80102b90 <install_trans>
80102d10:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102d17:	00 00 00 
80102d1a:	e8 11 ff ff ff       	call   80102c30 <write_head>
80102d1f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d22:	83 c4 10             	add    $0x10,%esp
80102d25:	c9                   	leave  
80102d26:	c3                   	ret    
80102d27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102d2e:	66 90                	xchg   %ax,%ax

80102d30 <begin_op>:
80102d30:	f3 0f 1e fb          	endbr32 
80102d34:	55                   	push   %ebp
80102d35:	89 e5                	mov    %esp,%ebp
80102d37:	83 ec 14             	sub    $0x14,%esp
80102d3a:	68 80 26 11 80       	push   $0x80112680
80102d3f:	e8 1c 18 00 00       	call   80104560 <acquire>
80102d44:	83 c4 10             	add    $0x10,%esp
80102d47:	eb 1c                	jmp    80102d65 <begin_op+0x35>
80102d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102d50:	83 ec 08             	sub    $0x8,%esp
80102d53:	68 80 26 11 80       	push   $0x80112680
80102d58:	68 80 26 11 80       	push   $0x80112680
80102d5d:	e8 be 11 00 00       	call   80103f20 <sleep>
80102d62:	83 c4 10             	add    $0x10,%esp
80102d65:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102d6a:	85 c0                	test   %eax,%eax
80102d6c:	75 e2                	jne    80102d50 <begin_op+0x20>
80102d6e:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102d73:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d79:	83 c0 01             	add    $0x1,%eax
80102d7c:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102d7f:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102d82:	83 fa 1e             	cmp    $0x1e,%edx
80102d85:	7f c9                	jg     80102d50 <begin_op+0x20>
80102d87:	83 ec 0c             	sub    $0xc,%esp
80102d8a:	a3 bc 26 11 80       	mov    %eax,0x801126bc
80102d8f:	68 80 26 11 80       	push   $0x80112680
80102d94:	e8 87 18 00 00       	call   80104620 <release>
80102d99:	83 c4 10             	add    $0x10,%esp
80102d9c:	c9                   	leave  
80102d9d:	c3                   	ret    
80102d9e:	66 90                	xchg   %ax,%ax

80102da0 <end_op>:
80102da0:	f3 0f 1e fb          	endbr32 
80102da4:	55                   	push   %ebp
80102da5:	89 e5                	mov    %esp,%ebp
80102da7:	57                   	push   %edi
80102da8:	56                   	push   %esi
80102da9:	53                   	push   %ebx
80102daa:	83 ec 18             	sub    $0x18,%esp
80102dad:	68 80 26 11 80       	push   $0x80112680
80102db2:	e8 a9 17 00 00       	call   80104560 <acquire>
80102db7:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102dbc:	8b 35 c0 26 11 80    	mov    0x801126c0,%esi
80102dc2:	83 c4 10             	add    $0x10,%esp
80102dc5:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102dc8:	89 1d bc 26 11 80    	mov    %ebx,0x801126bc
80102dce:	85 f6                	test   %esi,%esi
80102dd0:	0f 85 1e 01 00 00    	jne    80102ef4 <end_op+0x154>
80102dd6:	85 db                	test   %ebx,%ebx
80102dd8:	0f 85 f2 00 00 00    	jne    80102ed0 <end_op+0x130>
80102dde:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102de5:	00 00 00 
80102de8:	83 ec 0c             	sub    $0xc,%esp
80102deb:	68 80 26 11 80       	push   $0x80112680
80102df0:	e8 2b 18 00 00       	call   80104620 <release>
80102df5:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102dfb:	83 c4 10             	add    $0x10,%esp
80102dfe:	85 c9                	test   %ecx,%ecx
80102e00:	7f 3e                	jg     80102e40 <end_op+0xa0>
80102e02:	83 ec 0c             	sub    $0xc,%esp
80102e05:	68 80 26 11 80       	push   $0x80112680
80102e0a:	e8 51 17 00 00       	call   80104560 <acquire>
80102e0f:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102e16:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102e1d:	00 00 00 
80102e20:	e8 bb 12 00 00       	call   801040e0 <wakeup>
80102e25:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102e2c:	e8 ef 17 00 00       	call   80104620 <release>
80102e31:	83 c4 10             	add    $0x10,%esp
80102e34:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e37:	5b                   	pop    %ebx
80102e38:	5e                   	pop    %esi
80102e39:	5f                   	pop    %edi
80102e3a:	5d                   	pop    %ebp
80102e3b:	c3                   	ret    
80102e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102e40:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102e45:	83 ec 08             	sub    $0x8,%esp
80102e48:	01 d8                	add    %ebx,%eax
80102e4a:	83 c0 01             	add    $0x1,%eax
80102e4d:	50                   	push   %eax
80102e4e:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102e54:	e8 77 d2 ff ff       	call   801000d0 <bread>
80102e59:	89 c6                	mov    %eax,%esi
80102e5b:	58                   	pop    %eax
80102e5c:	5a                   	pop    %edx
80102e5d:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102e64:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102e6a:	83 c3 01             	add    $0x1,%ebx
80102e6d:	e8 5e d2 ff ff       	call   801000d0 <bread>
80102e72:	83 c4 0c             	add    $0xc,%esp
80102e75:	89 c7                	mov    %eax,%edi
80102e77:	8d 40 5c             	lea    0x5c(%eax),%eax
80102e7a:	68 00 02 00 00       	push   $0x200
80102e7f:	50                   	push   %eax
80102e80:	8d 46 5c             	lea    0x5c(%esi),%eax
80102e83:	50                   	push   %eax
80102e84:	e8 87 18 00 00       	call   80104710 <memmove>
80102e89:	89 34 24             	mov    %esi,(%esp)
80102e8c:	e8 1f d3 ff ff       	call   801001b0 <bwrite>
80102e91:	89 3c 24             	mov    %edi,(%esp)
80102e94:	e8 57 d3 ff ff       	call   801001f0 <brelse>
80102e99:	89 34 24             	mov    %esi,(%esp)
80102e9c:	e8 4f d3 ff ff       	call   801001f0 <brelse>
80102ea1:	83 c4 10             	add    $0x10,%esp
80102ea4:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102eaa:	7c 94                	jl     80102e40 <end_op+0xa0>
80102eac:	e8 7f fd ff ff       	call   80102c30 <write_head>
80102eb1:	e8 da fc ff ff       	call   80102b90 <install_trans>
80102eb6:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102ebd:	00 00 00 
80102ec0:	e8 6b fd ff ff       	call   80102c30 <write_head>
80102ec5:	e9 38 ff ff ff       	jmp    80102e02 <end_op+0x62>
80102eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102ed0:	83 ec 0c             	sub    $0xc,%esp
80102ed3:	68 80 26 11 80       	push   $0x80112680
80102ed8:	e8 03 12 00 00       	call   801040e0 <wakeup>
80102edd:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102ee4:	e8 37 17 00 00       	call   80104620 <release>
80102ee9:	83 c4 10             	add    $0x10,%esp
80102eec:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102eef:	5b                   	pop    %ebx
80102ef0:	5e                   	pop    %esi
80102ef1:	5f                   	pop    %edi
80102ef2:	5d                   	pop    %ebp
80102ef3:	c3                   	ret    
80102ef4:	83 ec 0c             	sub    $0xc,%esp
80102ef7:	68 84 75 10 80       	push   $0x80107584
80102efc:	e8 8f d4 ff ff       	call   80100390 <panic>
80102f01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f0f:	90                   	nop

80102f10 <log_write>:
80102f10:	f3 0f 1e fb          	endbr32 
80102f14:	55                   	push   %ebp
80102f15:	89 e5                	mov    %esp,%ebp
80102f17:	53                   	push   %ebx
80102f18:	83 ec 04             	sub    $0x4,%esp
80102f1b:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102f21:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102f24:	83 fa 1d             	cmp    $0x1d,%edx
80102f27:	0f 8f 91 00 00 00    	jg     80102fbe <log_write+0xae>
80102f2d:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102f32:	83 e8 01             	sub    $0x1,%eax
80102f35:	39 c2                	cmp    %eax,%edx
80102f37:	0f 8d 81 00 00 00    	jge    80102fbe <log_write+0xae>
80102f3d:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102f42:	85 c0                	test   %eax,%eax
80102f44:	0f 8e 81 00 00 00    	jle    80102fcb <log_write+0xbb>
80102f4a:	83 ec 0c             	sub    $0xc,%esp
80102f4d:	68 80 26 11 80       	push   $0x80112680
80102f52:	e8 09 16 00 00       	call   80104560 <acquire>
80102f57:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102f5d:	83 c4 10             	add    $0x10,%esp
80102f60:	85 d2                	test   %edx,%edx
80102f62:	7e 4e                	jle    80102fb2 <log_write+0xa2>
80102f64:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102f67:	31 c0                	xor    %eax,%eax
80102f69:	eb 0c                	jmp    80102f77 <log_write+0x67>
80102f6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102f6f:	90                   	nop
80102f70:	83 c0 01             	add    $0x1,%eax
80102f73:	39 c2                	cmp    %eax,%edx
80102f75:	74 29                	je     80102fa0 <log_write+0x90>
80102f77:	39 0c 85 cc 26 11 80 	cmp    %ecx,-0x7feed934(,%eax,4)
80102f7e:	75 f0                	jne    80102f70 <log_write+0x60>
80102f80:	89 0c 85 cc 26 11 80 	mov    %ecx,-0x7feed934(,%eax,4)
80102f87:	83 0b 04             	orl    $0x4,(%ebx)
80102f8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102f8d:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
80102f94:	c9                   	leave  
80102f95:	e9 86 16 00 00       	jmp    80104620 <release>
80102f9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102fa0:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
80102fa7:	83 c2 01             	add    $0x1,%edx
80102faa:	89 15 c8 26 11 80    	mov    %edx,0x801126c8
80102fb0:	eb d5                	jmp    80102f87 <log_write+0x77>
80102fb2:	8b 43 08             	mov    0x8(%ebx),%eax
80102fb5:	a3 cc 26 11 80       	mov    %eax,0x801126cc
80102fba:	75 cb                	jne    80102f87 <log_write+0x77>
80102fbc:	eb e9                	jmp    80102fa7 <log_write+0x97>
80102fbe:	83 ec 0c             	sub    $0xc,%esp
80102fc1:	68 93 75 10 80       	push   $0x80107593
80102fc6:	e8 c5 d3 ff ff       	call   80100390 <panic>
80102fcb:	83 ec 0c             	sub    $0xc,%esp
80102fce:	68 a9 75 10 80       	push   $0x801075a9
80102fd3:	e8 b8 d3 ff ff       	call   80100390 <panic>
80102fd8:	66 90                	xchg   %ax,%ax
80102fda:	66 90                	xchg   %ax,%ax
80102fdc:	66 90                	xchg   %ax,%ax
80102fde:	66 90                	xchg   %ax,%ax

80102fe0 <mpmain>:
80102fe0:	55                   	push   %ebp
80102fe1:	89 e5                	mov    %esp,%ebp
80102fe3:	53                   	push   %ebx
80102fe4:	83 ec 04             	sub    $0x4,%esp
80102fe7:	e8 54 09 00 00       	call   80103940 <cpuid>
80102fec:	89 c3                	mov    %eax,%ebx
80102fee:	e8 4d 09 00 00       	call   80103940 <cpuid>
80102ff3:	83 ec 04             	sub    $0x4,%esp
80102ff6:	53                   	push   %ebx
80102ff7:	50                   	push   %eax
80102ff8:	68 c4 75 10 80       	push   $0x801075c4
80102ffd:	e8 ae d6 ff ff       	call   801006b0 <cprintf>
80103002:	e8 19 29 00 00       	call   80105920 <idtinit>
80103007:	e8 c4 08 00 00       	call   801038d0 <mycpu>
8010300c:	89 c2                	mov    %eax,%edx
8010300e:	b8 01 00 00 00       	mov    $0x1,%eax
80103013:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
8010301a:	e8 11 0c 00 00       	call   80103c30 <scheduler>
8010301f:	90                   	nop

80103020 <mpenter>:
80103020:	f3 0f 1e fb          	endbr32 
80103024:	55                   	push   %ebp
80103025:	89 e5                	mov    %esp,%ebp
80103027:	83 ec 08             	sub    $0x8,%esp
8010302a:	e8 c1 39 00 00       	call   801069f0 <switchkvm>
8010302f:	e8 2c 39 00 00       	call   80106960 <seginit>
80103034:	e8 67 f7 ff ff       	call   801027a0 <lapicinit>
80103039:	e8 a2 ff ff ff       	call   80102fe0 <mpmain>
8010303e:	66 90                	xchg   %ax,%ax

80103040 <main>:
80103040:	f3 0f 1e fb          	endbr32 
80103044:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80103048:	83 e4 f0             	and    $0xfffffff0,%esp
8010304b:	ff 71 fc             	pushl  -0x4(%ecx)
8010304e:	55                   	push   %ebp
8010304f:	89 e5                	mov    %esp,%ebp
80103051:	53                   	push   %ebx
80103052:	51                   	push   %ecx
80103053:	83 ec 08             	sub    $0x8,%esp
80103056:	68 00 00 40 80       	push   $0x80400000
8010305b:	68 a8 54 11 80       	push   $0x801154a8
80103060:	e8 fb f4 ff ff       	call   80102560 <kinit1>
80103065:	e8 66 3e 00 00       	call   80106ed0 <kvmalloc>
8010306a:	e8 81 01 00 00       	call   801031f0 <mpinit>
8010306f:	e8 2c f7 ff ff       	call   801027a0 <lapicinit>
80103074:	e8 e7 38 00 00       	call   80106960 <seginit>
80103079:	e8 52 03 00 00       	call   801033d0 <picinit>
8010307e:	e8 fd f2 ff ff       	call   80102380 <ioapicinit>
80103083:	e8 a8 d9 ff ff       	call   80100a30 <consoleinit>
80103088:	e8 93 2b 00 00       	call   80105c20 <uartinit>
8010308d:	e8 1e 08 00 00       	call   801038b0 <pinit>
80103092:	e8 09 28 00 00       	call   801058a0 <tvinit>
80103097:	e8 a4 cf ff ff       	call   80100040 <binit>
8010309c:	e8 3f dd ff ff       	call   80100de0 <fileinit>
801030a1:	e8 aa f0 ff ff       	call   80102150 <ideinit>
801030a6:	83 c4 0c             	add    $0xc,%esp
801030a9:	68 8a 00 00 00       	push   $0x8a
801030ae:	68 8c a4 10 80       	push   $0x8010a48c
801030b3:	68 00 70 00 80       	push   $0x80007000
801030b8:	e8 53 16 00 00       	call   80104710 <memmove>
801030bd:	83 c4 10             	add    $0x10,%esp
801030c0:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
801030c7:	00 00 00 
801030ca:	05 80 27 11 80       	add    $0x80112780,%eax
801030cf:	3d 80 27 11 80       	cmp    $0x80112780,%eax
801030d4:	76 7a                	jbe    80103150 <main+0x110>
801030d6:	bb 80 27 11 80       	mov    $0x80112780,%ebx
801030db:	eb 1c                	jmp    801030f9 <main+0xb9>
801030dd:	8d 76 00             	lea    0x0(%esi),%esi
801030e0:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
801030e7:	00 00 00 
801030ea:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
801030f0:	05 80 27 11 80       	add    $0x80112780,%eax
801030f5:	39 c3                	cmp    %eax,%ebx
801030f7:	73 57                	jae    80103150 <main+0x110>
801030f9:	e8 d2 07 00 00       	call   801038d0 <mycpu>
801030fe:	39 c3                	cmp    %eax,%ebx
80103100:	74 de                	je     801030e0 <main+0xa0>
80103102:	e8 29 f5 ff ff       	call   80102630 <kalloc>
80103107:	83 ec 08             	sub    $0x8,%esp
8010310a:	c7 05 f8 6f 00 80 20 	movl   $0x80103020,0x80006ff8
80103111:	30 10 80 
80103114:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
8010311b:	90 10 00 
8010311e:	05 00 10 00 00       	add    $0x1000,%eax
80103123:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80103128:	0f b6 03             	movzbl (%ebx),%eax
8010312b:	68 00 70 00 00       	push   $0x7000
80103130:	50                   	push   %eax
80103131:	e8 ba f7 ff ff       	call   801028f0 <lapicstartap>
80103136:	83 c4 10             	add    $0x10,%esp
80103139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103140:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103146:	85 c0                	test   %eax,%eax
80103148:	74 f6                	je     80103140 <main+0x100>
8010314a:	eb 94                	jmp    801030e0 <main+0xa0>
8010314c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103150:	83 ec 08             	sub    $0x8,%esp
80103153:	68 00 00 00 8e       	push   $0x8e000000
80103158:	68 00 00 40 80       	push   $0x80400000
8010315d:	e8 6e f4 ff ff       	call   801025d0 <kinit2>
80103162:	e8 29 08 00 00       	call   80103990 <userinit>
80103167:	e8 74 fe ff ff       	call   80102fe0 <mpmain>
8010316c:	66 90                	xchg   %ax,%ax
8010316e:	66 90                	xchg   %ax,%ax

80103170 <mpsearch1>:
80103170:	55                   	push   %ebp
80103171:	89 e5                	mov    %esp,%ebp
80103173:	57                   	push   %edi
80103174:	56                   	push   %esi
80103175:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
8010317b:	53                   	push   %ebx
8010317c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
8010317f:	83 ec 0c             	sub    $0xc,%esp
80103182:	39 de                	cmp    %ebx,%esi
80103184:	72 10                	jb     80103196 <mpsearch1+0x26>
80103186:	eb 50                	jmp    801031d8 <mpsearch1+0x68>
80103188:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010318f:	90                   	nop
80103190:	89 fe                	mov    %edi,%esi
80103192:	39 fb                	cmp    %edi,%ebx
80103194:	76 42                	jbe    801031d8 <mpsearch1+0x68>
80103196:	83 ec 04             	sub    $0x4,%esp
80103199:	8d 7e 10             	lea    0x10(%esi),%edi
8010319c:	6a 04                	push   $0x4
8010319e:	68 d8 75 10 80       	push   $0x801075d8
801031a3:	56                   	push   %esi
801031a4:	e8 17 15 00 00       	call   801046c0 <memcmp>
801031a9:	83 c4 10             	add    $0x10,%esp
801031ac:	85 c0                	test   %eax,%eax
801031ae:	75 e0                	jne    80103190 <mpsearch1+0x20>
801031b0:	89 f2                	mov    %esi,%edx
801031b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801031b8:	0f b6 0a             	movzbl (%edx),%ecx
801031bb:	83 c2 01             	add    $0x1,%edx
801031be:	01 c8                	add    %ecx,%eax
801031c0:	39 fa                	cmp    %edi,%edx
801031c2:	75 f4                	jne    801031b8 <mpsearch1+0x48>
801031c4:	84 c0                	test   %al,%al
801031c6:	75 c8                	jne    80103190 <mpsearch1+0x20>
801031c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031cb:	89 f0                	mov    %esi,%eax
801031cd:	5b                   	pop    %ebx
801031ce:	5e                   	pop    %esi
801031cf:	5f                   	pop    %edi
801031d0:	5d                   	pop    %ebp
801031d1:	c3                   	ret    
801031d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801031d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031db:	31 f6                	xor    %esi,%esi
801031dd:	5b                   	pop    %ebx
801031de:	89 f0                	mov    %esi,%eax
801031e0:	5e                   	pop    %esi
801031e1:	5f                   	pop    %edi
801031e2:	5d                   	pop    %ebp
801031e3:	c3                   	ret    
801031e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801031eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031ef:	90                   	nop

801031f0 <mpinit>:
801031f0:	f3 0f 1e fb          	endbr32 
801031f4:	55                   	push   %ebp
801031f5:	89 e5                	mov    %esp,%ebp
801031f7:	57                   	push   %edi
801031f8:	56                   	push   %esi
801031f9:	53                   	push   %ebx
801031fa:	83 ec 1c             	sub    $0x1c,%esp
801031fd:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103204:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
8010320b:	c1 e0 08             	shl    $0x8,%eax
8010320e:	09 d0                	or     %edx,%eax
80103210:	c1 e0 04             	shl    $0x4,%eax
80103213:	75 1b                	jne    80103230 <mpinit+0x40>
80103215:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010321c:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103223:	c1 e0 08             	shl    $0x8,%eax
80103226:	09 d0                	or     %edx,%eax
80103228:	c1 e0 0a             	shl    $0xa,%eax
8010322b:	2d 00 04 00 00       	sub    $0x400,%eax
80103230:	ba 00 04 00 00       	mov    $0x400,%edx
80103235:	e8 36 ff ff ff       	call   80103170 <mpsearch1>
8010323a:	89 c6                	mov    %eax,%esi
8010323c:	85 c0                	test   %eax,%eax
8010323e:	0f 84 4c 01 00 00    	je     80103390 <mpinit+0x1a0>
80103244:	8b 5e 04             	mov    0x4(%esi),%ebx
80103247:	85 db                	test   %ebx,%ebx
80103249:	0f 84 61 01 00 00    	je     801033b0 <mpinit+0x1c0>
8010324f:	83 ec 04             	sub    $0x4,%esp
80103252:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80103258:	6a 04                	push   $0x4
8010325a:	68 dd 75 10 80       	push   $0x801075dd
8010325f:	50                   	push   %eax
80103260:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103263:	e8 58 14 00 00       	call   801046c0 <memcmp>
80103268:	83 c4 10             	add    $0x10,%esp
8010326b:	85 c0                	test   %eax,%eax
8010326d:	0f 85 3d 01 00 00    	jne    801033b0 <mpinit+0x1c0>
80103273:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
8010327a:	3c 01                	cmp    $0x1,%al
8010327c:	74 08                	je     80103286 <mpinit+0x96>
8010327e:	3c 04                	cmp    $0x4,%al
80103280:	0f 85 2a 01 00 00    	jne    801033b0 <mpinit+0x1c0>
80103286:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
8010328d:	66 85 d2             	test   %dx,%dx
80103290:	74 26                	je     801032b8 <mpinit+0xc8>
80103292:	8d 3c 1a             	lea    (%edx,%ebx,1),%edi
80103295:	89 d8                	mov    %ebx,%eax
80103297:	31 d2                	xor    %edx,%edx
80103299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801032a0:	0f b6 88 00 00 00 80 	movzbl -0x80000000(%eax),%ecx
801032a7:	83 c0 01             	add    $0x1,%eax
801032aa:	01 ca                	add    %ecx,%edx
801032ac:	39 f8                	cmp    %edi,%eax
801032ae:	75 f0                	jne    801032a0 <mpinit+0xb0>
801032b0:	84 d2                	test   %dl,%dl
801032b2:	0f 85 f8 00 00 00    	jne    801033b0 <mpinit+0x1c0>
801032b8:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801032be:	a3 7c 26 11 80       	mov    %eax,0x8011267c
801032c3:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801032c9:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801032d0:	bb 01 00 00 00       	mov    $0x1,%ebx
801032d5:	03 55 e4             	add    -0x1c(%ebp),%edx
801032d8:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801032db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801032df:	90                   	nop
801032e0:	39 c2                	cmp    %eax,%edx
801032e2:	76 15                	jbe    801032f9 <mpinit+0x109>
801032e4:	0f b6 08             	movzbl (%eax),%ecx
801032e7:	80 f9 02             	cmp    $0x2,%cl
801032ea:	74 5c                	je     80103348 <mpinit+0x158>
801032ec:	77 42                	ja     80103330 <mpinit+0x140>
801032ee:	84 c9                	test   %cl,%cl
801032f0:	74 6e                	je     80103360 <mpinit+0x170>
801032f2:	83 c0 08             	add    $0x8,%eax
801032f5:	39 c2                	cmp    %eax,%edx
801032f7:	77 eb                	ja     801032e4 <mpinit+0xf4>
801032f9:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801032fc:	85 db                	test   %ebx,%ebx
801032fe:	0f 84 b9 00 00 00    	je     801033bd <mpinit+0x1cd>
80103304:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
80103308:	74 15                	je     8010331f <mpinit+0x12f>
8010330a:	b8 70 00 00 00       	mov    $0x70,%eax
8010330f:	ba 22 00 00 00       	mov    $0x22,%edx
80103314:	ee                   	out    %al,(%dx)
80103315:	ba 23 00 00 00       	mov    $0x23,%edx
8010331a:	ec                   	in     (%dx),%al
8010331b:	83 c8 01             	or     $0x1,%eax
8010331e:	ee                   	out    %al,(%dx)
8010331f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103322:	5b                   	pop    %ebx
80103323:	5e                   	pop    %esi
80103324:	5f                   	pop    %edi
80103325:	5d                   	pop    %ebp
80103326:	c3                   	ret    
80103327:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010332e:	66 90                	xchg   %ax,%ax
80103330:	83 e9 03             	sub    $0x3,%ecx
80103333:	80 f9 01             	cmp    $0x1,%cl
80103336:	76 ba                	jbe    801032f2 <mpinit+0x102>
80103338:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010333f:	eb 9f                	jmp    801032e0 <mpinit+0xf0>
80103341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103348:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
8010334c:	83 c0 08             	add    $0x8,%eax
8010334f:	88 0d 60 27 11 80    	mov    %cl,0x80112760
80103355:	eb 89                	jmp    801032e0 <mpinit+0xf0>
80103357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010335e:	66 90                	xchg   %ax,%ax
80103360:	8b 0d 00 2d 11 80    	mov    0x80112d00,%ecx
80103366:	83 f9 07             	cmp    $0x7,%ecx
80103369:	7f 19                	jg     80103384 <mpinit+0x194>
8010336b:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
80103371:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
80103375:	83 c1 01             	add    $0x1,%ecx
80103378:	89 0d 00 2d 11 80    	mov    %ecx,0x80112d00
8010337e:	88 9f 80 27 11 80    	mov    %bl,-0x7feed880(%edi)
80103384:	83 c0 14             	add    $0x14,%eax
80103387:	e9 54 ff ff ff       	jmp    801032e0 <mpinit+0xf0>
8010338c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103390:	ba 00 00 01 00       	mov    $0x10000,%edx
80103395:	b8 00 00 0f 00       	mov    $0xf0000,%eax
8010339a:	e8 d1 fd ff ff       	call   80103170 <mpsearch1>
8010339f:	89 c6                	mov    %eax,%esi
801033a1:	85 c0                	test   %eax,%eax
801033a3:	0f 85 9b fe ff ff    	jne    80103244 <mpinit+0x54>
801033a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801033b0:	83 ec 0c             	sub    $0xc,%esp
801033b3:	68 e2 75 10 80       	push   $0x801075e2
801033b8:	e8 d3 cf ff ff       	call   80100390 <panic>
801033bd:	83 ec 0c             	sub    $0xc,%esp
801033c0:	68 fc 75 10 80       	push   $0x801075fc
801033c5:	e8 c6 cf ff ff       	call   80100390 <panic>
801033ca:	66 90                	xchg   %ax,%ax
801033cc:	66 90                	xchg   %ax,%ax
801033ce:	66 90                	xchg   %ax,%ax

801033d0 <picinit>:
801033d0:	f3 0f 1e fb          	endbr32 
801033d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801033d9:	ba 21 00 00 00       	mov    $0x21,%edx
801033de:	ee                   	out    %al,(%dx)
801033df:	ba a1 00 00 00       	mov    $0xa1,%edx
801033e4:	ee                   	out    %al,(%dx)
801033e5:	c3                   	ret    
801033e6:	66 90                	xchg   %ax,%ax
801033e8:	66 90                	xchg   %ax,%ax
801033ea:	66 90                	xchg   %ax,%ax
801033ec:	66 90                	xchg   %ax,%ax
801033ee:	66 90                	xchg   %ax,%ax

801033f0 <pipealloc>:
801033f0:	f3 0f 1e fb          	endbr32 
801033f4:	55                   	push   %ebp
801033f5:	89 e5                	mov    %esp,%ebp
801033f7:	57                   	push   %edi
801033f8:	56                   	push   %esi
801033f9:	53                   	push   %ebx
801033fa:	83 ec 0c             	sub    $0xc,%esp
801033fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103400:	8b 75 0c             	mov    0xc(%ebp),%esi
80103403:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103409:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010340f:	e8 ec d9 ff ff       	call   80100e00 <filealloc>
80103414:	89 03                	mov    %eax,(%ebx)
80103416:	85 c0                	test   %eax,%eax
80103418:	0f 84 ac 00 00 00    	je     801034ca <pipealloc+0xda>
8010341e:	e8 dd d9 ff ff       	call   80100e00 <filealloc>
80103423:	89 06                	mov    %eax,(%esi)
80103425:	85 c0                	test   %eax,%eax
80103427:	0f 84 8b 00 00 00    	je     801034b8 <pipealloc+0xc8>
8010342d:	e8 fe f1 ff ff       	call   80102630 <kalloc>
80103432:	89 c7                	mov    %eax,%edi
80103434:	85 c0                	test   %eax,%eax
80103436:	0f 84 b4 00 00 00    	je     801034f0 <pipealloc+0x100>
8010343c:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103443:	00 00 00 
80103446:	83 ec 08             	sub    $0x8,%esp
80103449:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103450:	00 00 00 
80103453:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
8010345a:	00 00 00 
8010345d:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103464:	00 00 00 
80103467:	68 1b 76 10 80       	push   $0x8010761b
8010346c:	50                   	push   %eax
8010346d:	e8 6e 0f 00 00       	call   801043e0 <initlock>
80103472:	8b 03                	mov    (%ebx),%eax
80103474:	83 c4 10             	add    $0x10,%esp
80103477:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
8010347d:	8b 03                	mov    (%ebx),%eax
8010347f:	c6 40 08 01          	movb   $0x1,0x8(%eax)
80103483:	8b 03                	mov    (%ebx),%eax
80103485:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80103489:	8b 03                	mov    (%ebx),%eax
8010348b:	89 78 0c             	mov    %edi,0xc(%eax)
8010348e:	8b 06                	mov    (%esi),%eax
80103490:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103496:	8b 06                	mov    (%esi),%eax
80103498:	c6 40 08 00          	movb   $0x0,0x8(%eax)
8010349c:	8b 06                	mov    (%esi),%eax
8010349e:	c6 40 09 01          	movb   $0x1,0x9(%eax)
801034a2:	8b 06                	mov    (%esi),%eax
801034a4:	89 78 0c             	mov    %edi,0xc(%eax)
801034a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801034aa:	31 c0                	xor    %eax,%eax
801034ac:	5b                   	pop    %ebx
801034ad:	5e                   	pop    %esi
801034ae:	5f                   	pop    %edi
801034af:	5d                   	pop    %ebp
801034b0:	c3                   	ret    
801034b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801034b8:	8b 03                	mov    (%ebx),%eax
801034ba:	85 c0                	test   %eax,%eax
801034bc:	74 1e                	je     801034dc <pipealloc+0xec>
801034be:	83 ec 0c             	sub    $0xc,%esp
801034c1:	50                   	push   %eax
801034c2:	e8 f9 d9 ff ff       	call   80100ec0 <fileclose>
801034c7:	83 c4 10             	add    $0x10,%esp
801034ca:	8b 06                	mov    (%esi),%eax
801034cc:	85 c0                	test   %eax,%eax
801034ce:	74 0c                	je     801034dc <pipealloc+0xec>
801034d0:	83 ec 0c             	sub    $0xc,%esp
801034d3:	50                   	push   %eax
801034d4:	e8 e7 d9 ff ff       	call   80100ec0 <fileclose>
801034d9:	83 c4 10             	add    $0x10,%esp
801034dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801034df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801034e4:	5b                   	pop    %ebx
801034e5:	5e                   	pop    %esi
801034e6:	5f                   	pop    %edi
801034e7:	5d                   	pop    %ebp
801034e8:	c3                   	ret    
801034e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801034f0:	8b 03                	mov    (%ebx),%eax
801034f2:	85 c0                	test   %eax,%eax
801034f4:	75 c8                	jne    801034be <pipealloc+0xce>
801034f6:	eb d2                	jmp    801034ca <pipealloc+0xda>
801034f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801034ff:	90                   	nop

80103500 <pipeclose>:
80103500:	f3 0f 1e fb          	endbr32 
80103504:	55                   	push   %ebp
80103505:	89 e5                	mov    %esp,%ebp
80103507:	56                   	push   %esi
80103508:	53                   	push   %ebx
80103509:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010350c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010350f:	83 ec 0c             	sub    $0xc,%esp
80103512:	53                   	push   %ebx
80103513:	e8 48 10 00 00       	call   80104560 <acquire>
80103518:	83 c4 10             	add    $0x10,%esp
8010351b:	85 f6                	test   %esi,%esi
8010351d:	74 41                	je     80103560 <pipeclose+0x60>
8010351f:	83 ec 0c             	sub    $0xc,%esp
80103522:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103528:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010352f:	00 00 00 
80103532:	50                   	push   %eax
80103533:	e8 a8 0b 00 00       	call   801040e0 <wakeup>
80103538:	83 c4 10             	add    $0x10,%esp
8010353b:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
80103541:	85 d2                	test   %edx,%edx
80103543:	75 0a                	jne    8010354f <pipeclose+0x4f>
80103545:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
8010354b:	85 c0                	test   %eax,%eax
8010354d:	74 31                	je     80103580 <pipeclose+0x80>
8010354f:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103552:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103555:	5b                   	pop    %ebx
80103556:	5e                   	pop    %esi
80103557:	5d                   	pop    %ebp
80103558:	e9 c3 10 00 00       	jmp    80104620 <release>
8010355d:	8d 76 00             	lea    0x0(%esi),%esi
80103560:	83 ec 0c             	sub    $0xc,%esp
80103563:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103569:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103570:	00 00 00 
80103573:	50                   	push   %eax
80103574:	e8 67 0b 00 00       	call   801040e0 <wakeup>
80103579:	83 c4 10             	add    $0x10,%esp
8010357c:	eb bd                	jmp    8010353b <pipeclose+0x3b>
8010357e:	66 90                	xchg   %ax,%ax
80103580:	83 ec 0c             	sub    $0xc,%esp
80103583:	53                   	push   %ebx
80103584:	e8 97 10 00 00       	call   80104620 <release>
80103589:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010358c:	83 c4 10             	add    $0x10,%esp
8010358f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103592:	5b                   	pop    %ebx
80103593:	5e                   	pop    %esi
80103594:	5d                   	pop    %ebp
80103595:	e9 d6 ee ff ff       	jmp    80102470 <kfree>
8010359a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801035a0 <pipewrite>:
801035a0:	f3 0f 1e fb          	endbr32 
801035a4:	55                   	push   %ebp
801035a5:	89 e5                	mov    %esp,%ebp
801035a7:	57                   	push   %edi
801035a8:	56                   	push   %esi
801035a9:	53                   	push   %ebx
801035aa:	83 ec 28             	sub    $0x28,%esp
801035ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
801035b0:	53                   	push   %ebx
801035b1:	e8 aa 0f 00 00       	call   80104560 <acquire>
801035b6:	8b 45 10             	mov    0x10(%ebp),%eax
801035b9:	83 c4 10             	add    $0x10,%esp
801035bc:	85 c0                	test   %eax,%eax
801035be:	0f 8e bc 00 00 00    	jle    80103680 <pipewrite+0xe0>
801035c4:	8b 45 0c             	mov    0xc(%ebp),%eax
801035c7:	8b 8b 38 02 00 00    	mov    0x238(%ebx),%ecx
801035cd:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801035d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801035d6:	03 45 10             	add    0x10(%ebp),%eax
801035d9:	89 45 e0             	mov    %eax,-0x20(%ebp)
801035dc:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801035e2:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801035e8:	89 ca                	mov    %ecx,%edx
801035ea:	05 00 02 00 00       	add    $0x200,%eax
801035ef:	39 c1                	cmp    %eax,%ecx
801035f1:	74 3b                	je     8010362e <pipewrite+0x8e>
801035f3:	eb 63                	jmp    80103658 <pipewrite+0xb8>
801035f5:	8d 76 00             	lea    0x0(%esi),%esi
801035f8:	e8 63 03 00 00       	call   80103960 <myproc>
801035fd:	8b 48 24             	mov    0x24(%eax),%ecx
80103600:	85 c9                	test   %ecx,%ecx
80103602:	75 34                	jne    80103638 <pipewrite+0x98>
80103604:	83 ec 0c             	sub    $0xc,%esp
80103607:	57                   	push   %edi
80103608:	e8 d3 0a 00 00       	call   801040e0 <wakeup>
8010360d:	58                   	pop    %eax
8010360e:	5a                   	pop    %edx
8010360f:	53                   	push   %ebx
80103610:	56                   	push   %esi
80103611:	e8 0a 09 00 00       	call   80103f20 <sleep>
80103616:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010361c:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
80103622:	83 c4 10             	add    $0x10,%esp
80103625:	05 00 02 00 00       	add    $0x200,%eax
8010362a:	39 c2                	cmp    %eax,%edx
8010362c:	75 2a                	jne    80103658 <pipewrite+0xb8>
8010362e:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103634:	85 c0                	test   %eax,%eax
80103636:	75 c0                	jne    801035f8 <pipewrite+0x58>
80103638:	83 ec 0c             	sub    $0xc,%esp
8010363b:	53                   	push   %ebx
8010363c:	e8 df 0f 00 00       	call   80104620 <release>
80103641:	83 c4 10             	add    $0x10,%esp
80103644:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103649:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010364c:	5b                   	pop    %ebx
8010364d:	5e                   	pop    %esi
8010364e:	5f                   	pop    %edi
8010364f:	5d                   	pop    %ebp
80103650:	c3                   	ret    
80103651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103658:	8b 75 e4             	mov    -0x1c(%ebp),%esi
8010365b:	8d 4a 01             	lea    0x1(%edx),%ecx
8010365e:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103664:	89 8b 38 02 00 00    	mov    %ecx,0x238(%ebx)
8010366a:	0f b6 06             	movzbl (%esi),%eax
8010366d:	83 c6 01             	add    $0x1,%esi
80103670:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80103673:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
80103677:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010367a:	0f 85 5c ff ff ff    	jne    801035dc <pipewrite+0x3c>
80103680:	83 ec 0c             	sub    $0xc,%esp
80103683:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103689:	50                   	push   %eax
8010368a:	e8 51 0a 00 00       	call   801040e0 <wakeup>
8010368f:	89 1c 24             	mov    %ebx,(%esp)
80103692:	e8 89 0f 00 00       	call   80104620 <release>
80103697:	8b 45 10             	mov    0x10(%ebp),%eax
8010369a:	83 c4 10             	add    $0x10,%esp
8010369d:	eb aa                	jmp    80103649 <pipewrite+0xa9>
8010369f:	90                   	nop

801036a0 <piperead>:
801036a0:	f3 0f 1e fb          	endbr32 
801036a4:	55                   	push   %ebp
801036a5:	89 e5                	mov    %esp,%ebp
801036a7:	57                   	push   %edi
801036a8:	56                   	push   %esi
801036a9:	53                   	push   %ebx
801036aa:	83 ec 18             	sub    $0x18,%esp
801036ad:	8b 75 08             	mov    0x8(%ebp),%esi
801036b0:	8b 7d 0c             	mov    0xc(%ebp),%edi
801036b3:	56                   	push   %esi
801036b4:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801036ba:	e8 a1 0e 00 00       	call   80104560 <acquire>
801036bf:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
801036c5:	83 c4 10             	add    $0x10,%esp
801036c8:	39 86 38 02 00 00    	cmp    %eax,0x238(%esi)
801036ce:	74 33                	je     80103703 <piperead+0x63>
801036d0:	eb 3b                	jmp    8010370d <piperead+0x6d>
801036d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801036d8:	e8 83 02 00 00       	call   80103960 <myproc>
801036dd:	8b 48 24             	mov    0x24(%eax),%ecx
801036e0:	85 c9                	test   %ecx,%ecx
801036e2:	0f 85 88 00 00 00    	jne    80103770 <piperead+0xd0>
801036e8:	83 ec 08             	sub    $0x8,%esp
801036eb:	56                   	push   %esi
801036ec:	53                   	push   %ebx
801036ed:	e8 2e 08 00 00       	call   80103f20 <sleep>
801036f2:	8b 86 38 02 00 00    	mov    0x238(%esi),%eax
801036f8:	83 c4 10             	add    $0x10,%esp
801036fb:	39 86 34 02 00 00    	cmp    %eax,0x234(%esi)
80103701:	75 0a                	jne    8010370d <piperead+0x6d>
80103703:	8b 86 40 02 00 00    	mov    0x240(%esi),%eax
80103709:	85 c0                	test   %eax,%eax
8010370b:	75 cb                	jne    801036d8 <piperead+0x38>
8010370d:	8b 55 10             	mov    0x10(%ebp),%edx
80103710:	31 db                	xor    %ebx,%ebx
80103712:	85 d2                	test   %edx,%edx
80103714:	7f 28                	jg     8010373e <piperead+0x9e>
80103716:	eb 34                	jmp    8010374c <piperead+0xac>
80103718:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010371f:	90                   	nop
80103720:	8d 48 01             	lea    0x1(%eax),%ecx
80103723:	25 ff 01 00 00       	and    $0x1ff,%eax
80103728:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010372e:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
80103733:	88 04 1f             	mov    %al,(%edi,%ebx,1)
80103736:	83 c3 01             	add    $0x1,%ebx
80103739:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010373c:	74 0e                	je     8010374c <piperead+0xac>
8010373e:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103744:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010374a:	75 d4                	jne    80103720 <piperead+0x80>
8010374c:	83 ec 0c             	sub    $0xc,%esp
8010374f:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103755:	50                   	push   %eax
80103756:	e8 85 09 00 00       	call   801040e0 <wakeup>
8010375b:	89 34 24             	mov    %esi,(%esp)
8010375e:	e8 bd 0e 00 00       	call   80104620 <release>
80103763:	83 c4 10             	add    $0x10,%esp
80103766:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103769:	89 d8                	mov    %ebx,%eax
8010376b:	5b                   	pop    %ebx
8010376c:	5e                   	pop    %esi
8010376d:	5f                   	pop    %edi
8010376e:	5d                   	pop    %ebp
8010376f:	c3                   	ret    
80103770:	83 ec 0c             	sub    $0xc,%esp
80103773:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103778:	56                   	push   %esi
80103779:	e8 a2 0e 00 00       	call   80104620 <release>
8010377e:	83 c4 10             	add    $0x10,%esp
80103781:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103784:	89 d8                	mov    %ebx,%eax
80103786:	5b                   	pop    %ebx
80103787:	5e                   	pop    %esi
80103788:	5f                   	pop    %edi
80103789:	5d                   	pop    %ebp
8010378a:	c3                   	ret    
8010378b:	66 90                	xchg   %ax,%ax
8010378d:	66 90                	xchg   %ax,%ax
8010378f:	90                   	nop

80103790 <allocproc>:
80103790:	55                   	push   %ebp
80103791:	89 e5                	mov    %esp,%ebp
80103793:	53                   	push   %ebx
80103794:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103799:	83 ec 10             	sub    $0x10,%esp
8010379c:	68 20 2d 11 80       	push   $0x80112d20
801037a1:	e8 ba 0d 00 00       	call   80104560 <acquire>
801037a6:	83 c4 10             	add    $0x10,%esp
801037a9:	eb 10                	jmp    801037bb <allocproc+0x2b>
801037ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801037af:	90                   	nop
801037b0:	83 c3 7c             	add    $0x7c,%ebx
801037b3:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
801037b9:	74 75                	je     80103830 <allocproc+0xa0>
801037bb:	8b 43 0c             	mov    0xc(%ebx),%eax
801037be:	85 c0                	test   %eax,%eax
801037c0:	75 ee                	jne    801037b0 <allocproc+0x20>
801037c2:	a1 04 a0 10 80       	mov    0x8010a004,%eax
801037c7:	83 ec 0c             	sub    $0xc,%esp
801037ca:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
801037d1:	89 43 10             	mov    %eax,0x10(%ebx)
801037d4:	8d 50 01             	lea    0x1(%eax),%edx
801037d7:	68 20 2d 11 80       	push   $0x80112d20
801037dc:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
801037e2:	e8 39 0e 00 00       	call   80104620 <release>
801037e7:	e8 44 ee ff ff       	call   80102630 <kalloc>
801037ec:	83 c4 10             	add    $0x10,%esp
801037ef:	89 43 08             	mov    %eax,0x8(%ebx)
801037f2:	85 c0                	test   %eax,%eax
801037f4:	74 53                	je     80103849 <allocproc+0xb9>
801037f6:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
801037fc:	83 ec 04             	sub    $0x4,%esp
801037ff:	05 9c 0f 00 00       	add    $0xf9c,%eax
80103804:	89 53 18             	mov    %edx,0x18(%ebx)
80103807:	c7 40 14 86 58 10 80 	movl   $0x80105886,0x14(%eax)
8010380e:	89 43 1c             	mov    %eax,0x1c(%ebx)
80103811:	6a 14                	push   $0x14
80103813:	6a 00                	push   $0x0
80103815:	50                   	push   %eax
80103816:	e8 55 0e 00 00       	call   80104670 <memset>
8010381b:	8b 43 1c             	mov    0x1c(%ebx),%eax
8010381e:	83 c4 10             	add    $0x10,%esp
80103821:	c7 40 10 60 38 10 80 	movl   $0x80103860,0x10(%eax)
80103828:	89 d8                	mov    %ebx,%eax
8010382a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010382d:	c9                   	leave  
8010382e:	c3                   	ret    
8010382f:	90                   	nop
80103830:	83 ec 0c             	sub    $0xc,%esp
80103833:	31 db                	xor    %ebx,%ebx
80103835:	68 20 2d 11 80       	push   $0x80112d20
8010383a:	e8 e1 0d 00 00       	call   80104620 <release>
8010383f:	89 d8                	mov    %ebx,%eax
80103841:	83 c4 10             	add    $0x10,%esp
80103844:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103847:	c9                   	leave  
80103848:	c3                   	ret    
80103849:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103850:	31 db                	xor    %ebx,%ebx
80103852:	89 d8                	mov    %ebx,%eax
80103854:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103857:	c9                   	leave  
80103858:	c3                   	ret    
80103859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103860 <forkret>:
80103860:	f3 0f 1e fb          	endbr32 
80103864:	55                   	push   %ebp
80103865:	89 e5                	mov    %esp,%ebp
80103867:	83 ec 14             	sub    $0x14,%esp
8010386a:	68 20 2d 11 80       	push   $0x80112d20
8010386f:	e8 ac 0d 00 00       	call   80104620 <release>
80103874:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103879:	83 c4 10             	add    $0x10,%esp
8010387c:	85 c0                	test   %eax,%eax
8010387e:	75 08                	jne    80103888 <forkret+0x28>
80103880:	c9                   	leave  
80103881:	c3                   	ret    
80103882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103888:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010388f:	00 00 00 
80103892:	83 ec 0c             	sub    $0xc,%esp
80103895:	6a 01                	push   $0x1
80103897:	e8 a4 dc ff ff       	call   80101540 <iinit>
8010389c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801038a3:	e8 e8 f3 ff ff       	call   80102c90 <initlog>
801038a8:	83 c4 10             	add    $0x10,%esp
801038ab:	c9                   	leave  
801038ac:	c3                   	ret    
801038ad:	8d 76 00             	lea    0x0(%esi),%esi

801038b0 <pinit>:
801038b0:	f3 0f 1e fb          	endbr32 
801038b4:	55                   	push   %ebp
801038b5:	89 e5                	mov    %esp,%ebp
801038b7:	83 ec 10             	sub    $0x10,%esp
801038ba:	68 20 76 10 80       	push   $0x80107620
801038bf:	68 20 2d 11 80       	push   $0x80112d20
801038c4:	e8 17 0b 00 00       	call   801043e0 <initlock>
801038c9:	83 c4 10             	add    $0x10,%esp
801038cc:	c9                   	leave  
801038cd:	c3                   	ret    
801038ce:	66 90                	xchg   %ax,%ax

801038d0 <mycpu>:
801038d0:	f3 0f 1e fb          	endbr32 
801038d4:	55                   	push   %ebp
801038d5:	89 e5                	mov    %esp,%ebp
801038d7:	56                   	push   %esi
801038d8:	53                   	push   %ebx
801038d9:	9c                   	pushf  
801038da:	58                   	pop    %eax
801038db:	f6 c4 02             	test   $0x2,%ah
801038de:	75 4a                	jne    8010392a <mycpu+0x5a>
801038e0:	e8 bb ef ff ff       	call   801028a0 <lapicid>
801038e5:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
801038eb:	89 c3                	mov    %eax,%ebx
801038ed:	85 f6                	test   %esi,%esi
801038ef:	7e 2c                	jle    8010391d <mycpu+0x4d>
801038f1:	31 d2                	xor    %edx,%edx
801038f3:	eb 0a                	jmp    801038ff <mycpu+0x2f>
801038f5:	8d 76 00             	lea    0x0(%esi),%esi
801038f8:	83 c2 01             	add    $0x1,%edx
801038fb:	39 f2                	cmp    %esi,%edx
801038fd:	74 1e                	je     8010391d <mycpu+0x4d>
801038ff:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
80103905:	0f b6 81 80 27 11 80 	movzbl -0x7feed880(%ecx),%eax
8010390c:	39 d8                	cmp    %ebx,%eax
8010390e:	75 e8                	jne    801038f8 <mycpu+0x28>
80103910:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103913:	8d 81 80 27 11 80    	lea    -0x7feed880(%ecx),%eax
80103919:	5b                   	pop    %ebx
8010391a:	5e                   	pop    %esi
8010391b:	5d                   	pop    %ebp
8010391c:	c3                   	ret    
8010391d:	83 ec 0c             	sub    $0xc,%esp
80103920:	68 27 76 10 80       	push   $0x80107627
80103925:	e8 66 ca ff ff       	call   80100390 <panic>
8010392a:	83 ec 0c             	sub    $0xc,%esp
8010392d:	68 04 77 10 80       	push   $0x80107704
80103932:	e8 59 ca ff ff       	call   80100390 <panic>
80103937:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010393e:	66 90                	xchg   %ax,%ax

80103940 <cpuid>:
80103940:	f3 0f 1e fb          	endbr32 
80103944:	55                   	push   %ebp
80103945:	89 e5                	mov    %esp,%ebp
80103947:	83 ec 08             	sub    $0x8,%esp
8010394a:	e8 81 ff ff ff       	call   801038d0 <mycpu>
8010394f:	c9                   	leave  
80103950:	2d 80 27 11 80       	sub    $0x80112780,%eax
80103955:	c1 f8 04             	sar    $0x4,%eax
80103958:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
8010395e:	c3                   	ret    
8010395f:	90                   	nop

80103960 <myproc>:
80103960:	f3 0f 1e fb          	endbr32 
80103964:	55                   	push   %ebp
80103965:	89 e5                	mov    %esp,%ebp
80103967:	53                   	push   %ebx
80103968:	83 ec 04             	sub    $0x4,%esp
8010396b:	e8 f0 0a 00 00       	call   80104460 <pushcli>
80103970:	e8 5b ff ff ff       	call   801038d0 <mycpu>
80103975:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
8010397b:	e8 30 0b 00 00       	call   801044b0 <popcli>
80103980:	83 c4 04             	add    $0x4,%esp
80103983:	89 d8                	mov    %ebx,%eax
80103985:	5b                   	pop    %ebx
80103986:	5d                   	pop    %ebp
80103987:	c3                   	ret    
80103988:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010398f:	90                   	nop

80103990 <userinit>:
80103990:	f3 0f 1e fb          	endbr32 
80103994:	55                   	push   %ebp
80103995:	89 e5                	mov    %esp,%ebp
80103997:	53                   	push   %ebx
80103998:	83 ec 04             	sub    $0x4,%esp
8010399b:	e8 f0 fd ff ff       	call   80103790 <allocproc>
801039a0:	89 c3                	mov    %eax,%ebx
801039a2:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
801039a7:	e8 a4 34 00 00       	call   80106e50 <setupkvm>
801039ac:	89 43 04             	mov    %eax,0x4(%ebx)
801039af:	85 c0                	test   %eax,%eax
801039b1:	0f 84 bd 00 00 00    	je     80103a74 <userinit+0xe4>
801039b7:	83 ec 04             	sub    $0x4,%esp
801039ba:	68 2c 00 00 00       	push   $0x2c
801039bf:	68 60 a4 10 80       	push   $0x8010a460
801039c4:	50                   	push   %eax
801039c5:	e8 56 31 00 00       	call   80106b20 <inituvm>
801039ca:	83 c4 0c             	add    $0xc,%esp
801039cd:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
801039d3:	6a 4c                	push   $0x4c
801039d5:	6a 00                	push   $0x0
801039d7:	ff 73 18             	pushl  0x18(%ebx)
801039da:	e8 91 0c 00 00       	call   80104670 <memset>
801039df:	8b 43 18             	mov    0x18(%ebx),%eax
801039e2:	ba 1b 00 00 00       	mov    $0x1b,%edx
801039e7:	83 c4 0c             	add    $0xc,%esp
801039ea:	b9 23 00 00 00       	mov    $0x23,%ecx
801039ef:	66 89 50 3c          	mov    %dx,0x3c(%eax)
801039f3:	8b 43 18             	mov    0x18(%ebx),%eax
801039f6:	66 89 48 2c          	mov    %cx,0x2c(%eax)
801039fa:	8b 43 18             	mov    0x18(%ebx),%eax
801039fd:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103a01:	66 89 50 28          	mov    %dx,0x28(%eax)
80103a05:	8b 43 18             	mov    0x18(%ebx),%eax
80103a08:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103a0c:	66 89 50 48          	mov    %dx,0x48(%eax)
80103a10:	8b 43 18             	mov    0x18(%ebx),%eax
80103a13:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
80103a1a:	8b 43 18             	mov    0x18(%ebx),%eax
80103a1d:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
80103a24:	8b 43 18             	mov    0x18(%ebx),%eax
80103a27:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
80103a2e:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103a31:	6a 10                	push   $0x10
80103a33:	68 50 76 10 80       	push   $0x80107650
80103a38:	50                   	push   %eax
80103a39:	e8 f2 0d 00 00       	call   80104830 <safestrcpy>
80103a3e:	c7 04 24 59 76 10 80 	movl   $0x80107659,(%esp)
80103a45:	e8 e6 e5 ff ff       	call   80102030 <namei>
80103a4a:	89 43 68             	mov    %eax,0x68(%ebx)
80103a4d:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103a54:	e8 07 0b 00 00       	call   80104560 <acquire>
80103a59:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103a60:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103a67:	e8 b4 0b 00 00       	call   80104620 <release>
80103a6c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a6f:	83 c4 10             	add    $0x10,%esp
80103a72:	c9                   	leave  
80103a73:	c3                   	ret    
80103a74:	83 ec 0c             	sub    $0xc,%esp
80103a77:	68 37 76 10 80       	push   $0x80107637
80103a7c:	e8 0f c9 ff ff       	call   80100390 <panic>
80103a81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a8f:	90                   	nop

80103a90 <growproc>:
80103a90:	f3 0f 1e fb          	endbr32 
80103a94:	55                   	push   %ebp
80103a95:	89 e5                	mov    %esp,%ebp
80103a97:	56                   	push   %esi
80103a98:	53                   	push   %ebx
80103a99:	8b 75 08             	mov    0x8(%ebp),%esi
80103a9c:	e8 bf 09 00 00       	call   80104460 <pushcli>
80103aa1:	e8 2a fe ff ff       	call   801038d0 <mycpu>
80103aa6:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103aac:	e8 ff 09 00 00       	call   801044b0 <popcli>
80103ab1:	8b 03                	mov    (%ebx),%eax
80103ab3:	85 f6                	test   %esi,%esi
80103ab5:	7f 19                	jg     80103ad0 <growproc+0x40>
80103ab7:	75 37                	jne    80103af0 <growproc+0x60>
80103ab9:	83 ec 0c             	sub    $0xc,%esp
80103abc:	89 03                	mov    %eax,(%ebx)
80103abe:	53                   	push   %ebx
80103abf:	e8 4c 2f 00 00       	call   80106a10 <switchuvm>
80103ac4:	83 c4 10             	add    $0x10,%esp
80103ac7:	31 c0                	xor    %eax,%eax
80103ac9:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103acc:	5b                   	pop    %ebx
80103acd:	5e                   	pop    %esi
80103ace:	5d                   	pop    %ebp
80103acf:	c3                   	ret    
80103ad0:	83 ec 04             	sub    $0x4,%esp
80103ad3:	01 c6                	add    %eax,%esi
80103ad5:	56                   	push   %esi
80103ad6:	50                   	push   %eax
80103ad7:	ff 73 04             	pushl  0x4(%ebx)
80103ada:	e8 91 31 00 00       	call   80106c70 <allocuvm>
80103adf:	83 c4 10             	add    $0x10,%esp
80103ae2:	85 c0                	test   %eax,%eax
80103ae4:	75 d3                	jne    80103ab9 <growproc+0x29>
80103ae6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103aeb:	eb dc                	jmp    80103ac9 <growproc+0x39>
80103aed:	8d 76 00             	lea    0x0(%esi),%esi
80103af0:	83 ec 04             	sub    $0x4,%esp
80103af3:	01 c6                	add    %eax,%esi
80103af5:	56                   	push   %esi
80103af6:	50                   	push   %eax
80103af7:	ff 73 04             	pushl  0x4(%ebx)
80103afa:	e8 a1 32 00 00       	call   80106da0 <deallocuvm>
80103aff:	83 c4 10             	add    $0x10,%esp
80103b02:	85 c0                	test   %eax,%eax
80103b04:	75 b3                	jne    80103ab9 <growproc+0x29>
80103b06:	eb de                	jmp    80103ae6 <growproc+0x56>
80103b08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b0f:	90                   	nop

80103b10 <fork>:
80103b10:	f3 0f 1e fb          	endbr32 
80103b14:	55                   	push   %ebp
80103b15:	89 e5                	mov    %esp,%ebp
80103b17:	57                   	push   %edi
80103b18:	56                   	push   %esi
80103b19:	53                   	push   %ebx
80103b1a:	83 ec 1c             	sub    $0x1c,%esp
80103b1d:	e8 3e 09 00 00       	call   80104460 <pushcli>
80103b22:	e8 a9 fd ff ff       	call   801038d0 <mycpu>
80103b27:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103b2d:	e8 7e 09 00 00       	call   801044b0 <popcli>
80103b32:	e8 59 fc ff ff       	call   80103790 <allocproc>
80103b37:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103b3a:	85 c0                	test   %eax,%eax
80103b3c:	0f 84 bb 00 00 00    	je     80103bfd <fork+0xed>
80103b42:	83 ec 08             	sub    $0x8,%esp
80103b45:	ff 33                	pushl  (%ebx)
80103b47:	89 c7                	mov    %eax,%edi
80103b49:	ff 73 04             	pushl  0x4(%ebx)
80103b4c:	e8 cf 33 00 00       	call   80106f20 <copyuvm>
80103b51:	83 c4 10             	add    $0x10,%esp
80103b54:	89 47 04             	mov    %eax,0x4(%edi)
80103b57:	85 c0                	test   %eax,%eax
80103b59:	0f 84 a5 00 00 00    	je     80103c04 <fork+0xf4>
80103b5f:	8b 03                	mov    (%ebx),%eax
80103b61:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103b64:	89 01                	mov    %eax,(%ecx)
80103b66:	8b 79 18             	mov    0x18(%ecx),%edi
80103b69:	89 c8                	mov    %ecx,%eax
80103b6b:	89 59 14             	mov    %ebx,0x14(%ecx)
80103b6e:	b9 13 00 00 00       	mov    $0x13,%ecx
80103b73:	8b 73 18             	mov    0x18(%ebx),%esi
80103b76:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80103b78:	31 f6                	xor    %esi,%esi
80103b7a:	8b 40 18             	mov    0x18(%eax),%eax
80103b7d:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103b88:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103b8c:	85 c0                	test   %eax,%eax
80103b8e:	74 13                	je     80103ba3 <fork+0x93>
80103b90:	83 ec 0c             	sub    $0xc,%esp
80103b93:	50                   	push   %eax
80103b94:	e8 d7 d2 ff ff       	call   80100e70 <filedup>
80103b99:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b9c:	83 c4 10             	add    $0x10,%esp
80103b9f:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
80103ba3:	83 c6 01             	add    $0x1,%esi
80103ba6:	83 fe 10             	cmp    $0x10,%esi
80103ba9:	75 dd                	jne    80103b88 <fork+0x78>
80103bab:	83 ec 0c             	sub    $0xc,%esp
80103bae:	ff 73 68             	pushl  0x68(%ebx)
80103bb1:	83 c3 6c             	add    $0x6c,%ebx
80103bb4:	e8 77 db ff ff       	call   80101730 <idup>
80103bb9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103bbc:	83 c4 0c             	add    $0xc,%esp
80103bbf:	89 47 68             	mov    %eax,0x68(%edi)
80103bc2:	8d 47 6c             	lea    0x6c(%edi),%eax
80103bc5:	6a 10                	push   $0x10
80103bc7:	53                   	push   %ebx
80103bc8:	50                   	push   %eax
80103bc9:	e8 62 0c 00 00       	call   80104830 <safestrcpy>
80103bce:	8b 5f 10             	mov    0x10(%edi),%ebx
80103bd1:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103bd8:	e8 83 09 00 00       	call   80104560 <acquire>
80103bdd:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
80103be4:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103beb:	e8 30 0a 00 00       	call   80104620 <release>
80103bf0:	83 c4 10             	add    $0x10,%esp
80103bf3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103bf6:	89 d8                	mov    %ebx,%eax
80103bf8:	5b                   	pop    %ebx
80103bf9:	5e                   	pop    %esi
80103bfa:	5f                   	pop    %edi
80103bfb:	5d                   	pop    %ebp
80103bfc:	c3                   	ret    
80103bfd:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103c02:	eb ef                	jmp    80103bf3 <fork+0xe3>
80103c04:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103c07:	83 ec 0c             	sub    $0xc,%esp
80103c0a:	ff 73 08             	pushl  0x8(%ebx)
80103c0d:	e8 5e e8 ff ff       	call   80102470 <kfree>
80103c12:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103c19:	83 c4 10             	add    $0x10,%esp
80103c1c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103c23:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103c28:	eb c9                	jmp    80103bf3 <fork+0xe3>
80103c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103c30 <scheduler>:
80103c30:	f3 0f 1e fb          	endbr32 
80103c34:	55                   	push   %ebp
80103c35:	89 e5                	mov    %esp,%ebp
80103c37:	57                   	push   %edi
80103c38:	56                   	push   %esi
80103c39:	53                   	push   %ebx
80103c3a:	83 ec 0c             	sub    $0xc,%esp
80103c3d:	e8 8e fc ff ff       	call   801038d0 <mycpu>
80103c42:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103c49:	00 00 00 
80103c4c:	89 c6                	mov    %eax,%esi
80103c4e:	8d 78 04             	lea    0x4(%eax),%edi
80103c51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103c58:	fb                   	sti    
80103c59:	83 ec 0c             	sub    $0xc,%esp
80103c5c:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103c61:	68 20 2d 11 80       	push   $0x80112d20
80103c66:	e8 f5 08 00 00       	call   80104560 <acquire>
80103c6b:	83 c4 10             	add    $0x10,%esp
80103c6e:	66 90                	xchg   %ax,%ax
80103c70:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103c74:	75 33                	jne    80103ca9 <scheduler+0x79>
80103c76:	83 ec 0c             	sub    $0xc,%esp
80103c79:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
80103c7f:	53                   	push   %ebx
80103c80:	e8 8b 2d 00 00       	call   80106a10 <switchuvm>
80103c85:	58                   	pop    %eax
80103c86:	5a                   	pop    %edx
80103c87:	ff 73 1c             	pushl  0x1c(%ebx)
80103c8a:	57                   	push   %edi
80103c8b:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
80103c92:	e8 fc 0b 00 00       	call   80104893 <swtch>
80103c97:	e8 54 2d 00 00       	call   801069f0 <switchkvm>
80103c9c:	83 c4 10             	add    $0x10,%esp
80103c9f:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103ca6:	00 00 00 
80103ca9:	83 c3 7c             	add    $0x7c,%ebx
80103cac:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103cb2:	75 bc                	jne    80103c70 <scheduler+0x40>
80103cb4:	83 ec 0c             	sub    $0xc,%esp
80103cb7:	68 20 2d 11 80       	push   $0x80112d20
80103cbc:	e8 5f 09 00 00       	call   80104620 <release>
80103cc1:	83 c4 10             	add    $0x10,%esp
80103cc4:	eb 92                	jmp    80103c58 <scheduler+0x28>
80103cc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ccd:	8d 76 00             	lea    0x0(%esi),%esi

80103cd0 <sched>:
80103cd0:	f3 0f 1e fb          	endbr32 
80103cd4:	55                   	push   %ebp
80103cd5:	89 e5                	mov    %esp,%ebp
80103cd7:	56                   	push   %esi
80103cd8:	53                   	push   %ebx
80103cd9:	e8 82 07 00 00       	call   80104460 <pushcli>
80103cde:	e8 ed fb ff ff       	call   801038d0 <mycpu>
80103ce3:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103ce9:	e8 c2 07 00 00       	call   801044b0 <popcli>
80103cee:	83 ec 0c             	sub    $0xc,%esp
80103cf1:	68 20 2d 11 80       	push   $0x80112d20
80103cf6:	e8 15 08 00 00       	call   80104510 <holding>
80103cfb:	83 c4 10             	add    $0x10,%esp
80103cfe:	85 c0                	test   %eax,%eax
80103d00:	74 4f                	je     80103d51 <sched+0x81>
80103d02:	e8 c9 fb ff ff       	call   801038d0 <mycpu>
80103d07:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103d0e:	75 68                	jne    80103d78 <sched+0xa8>
80103d10:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103d14:	74 55                	je     80103d6b <sched+0x9b>
80103d16:	9c                   	pushf  
80103d17:	58                   	pop    %eax
80103d18:	f6 c4 02             	test   $0x2,%ah
80103d1b:	75 41                	jne    80103d5e <sched+0x8e>
80103d1d:	e8 ae fb ff ff       	call   801038d0 <mycpu>
80103d22:	83 c3 1c             	add    $0x1c,%ebx
80103d25:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
80103d2b:	e8 a0 fb ff ff       	call   801038d0 <mycpu>
80103d30:	83 ec 08             	sub    $0x8,%esp
80103d33:	ff 70 04             	pushl  0x4(%eax)
80103d36:	53                   	push   %ebx
80103d37:	e8 57 0b 00 00       	call   80104893 <swtch>
80103d3c:	e8 8f fb ff ff       	call   801038d0 <mycpu>
80103d41:	83 c4 10             	add    $0x10,%esp
80103d44:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
80103d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103d4d:	5b                   	pop    %ebx
80103d4e:	5e                   	pop    %esi
80103d4f:	5d                   	pop    %ebp
80103d50:	c3                   	ret    
80103d51:	83 ec 0c             	sub    $0xc,%esp
80103d54:	68 5b 76 10 80       	push   $0x8010765b
80103d59:	e8 32 c6 ff ff       	call   80100390 <panic>
80103d5e:	83 ec 0c             	sub    $0xc,%esp
80103d61:	68 87 76 10 80       	push   $0x80107687
80103d66:	e8 25 c6 ff ff       	call   80100390 <panic>
80103d6b:	83 ec 0c             	sub    $0xc,%esp
80103d6e:	68 79 76 10 80       	push   $0x80107679
80103d73:	e8 18 c6 ff ff       	call   80100390 <panic>
80103d78:	83 ec 0c             	sub    $0xc,%esp
80103d7b:	68 6d 76 10 80       	push   $0x8010766d
80103d80:	e8 0b c6 ff ff       	call   80100390 <panic>
80103d85:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103d90 <exit>:
80103d90:	f3 0f 1e fb          	endbr32 
80103d94:	55                   	push   %ebp
80103d95:	89 e5                	mov    %esp,%ebp
80103d97:	57                   	push   %edi
80103d98:	56                   	push   %esi
80103d99:	53                   	push   %ebx
80103d9a:	83 ec 0c             	sub    $0xc,%esp
80103d9d:	e8 be 06 00 00       	call   80104460 <pushcli>
80103da2:	e8 29 fb ff ff       	call   801038d0 <mycpu>
80103da7:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103dad:	e8 fe 06 00 00       	call   801044b0 <popcli>
80103db2:	8d 5e 28             	lea    0x28(%esi),%ebx
80103db5:	8d 7e 68             	lea    0x68(%esi),%edi
80103db8:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103dbe:	0f 84 f3 00 00 00    	je     80103eb7 <exit+0x127>
80103dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103dc8:	8b 03                	mov    (%ebx),%eax
80103dca:	85 c0                	test   %eax,%eax
80103dcc:	74 12                	je     80103de0 <exit+0x50>
80103dce:	83 ec 0c             	sub    $0xc,%esp
80103dd1:	50                   	push   %eax
80103dd2:	e8 e9 d0 ff ff       	call   80100ec0 <fileclose>
80103dd7:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103ddd:	83 c4 10             	add    $0x10,%esp
80103de0:	83 c3 04             	add    $0x4,%ebx
80103de3:	39 df                	cmp    %ebx,%edi
80103de5:	75 e1                	jne    80103dc8 <exit+0x38>
80103de7:	e8 44 ef ff ff       	call   80102d30 <begin_op>
80103dec:	83 ec 0c             	sub    $0xc,%esp
80103def:	ff 76 68             	pushl  0x68(%esi)
80103df2:	e8 99 da ff ff       	call   80101890 <iput>
80103df7:	e8 a4 ef ff ff       	call   80102da0 <end_op>
80103dfc:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
80103e03:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103e0a:	e8 51 07 00 00       	call   80104560 <acquire>
80103e0f:	8b 56 14             	mov    0x14(%esi),%edx
80103e12:	83 c4 10             	add    $0x10,%esp
80103e15:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103e1a:	eb 0e                	jmp    80103e2a <exit+0x9a>
80103e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e20:	83 c0 7c             	add    $0x7c,%eax
80103e23:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103e28:	74 1c                	je     80103e46 <exit+0xb6>
80103e2a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e2e:	75 f0                	jne    80103e20 <exit+0x90>
80103e30:	3b 50 20             	cmp    0x20(%eax),%edx
80103e33:	75 eb                	jne    80103e20 <exit+0x90>
80103e35:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e3c:	83 c0 7c             	add    $0x7c,%eax
80103e3f:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103e44:	75 e4                	jne    80103e2a <exit+0x9a>
80103e46:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
80103e4c:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103e51:	eb 10                	jmp    80103e63 <exit+0xd3>
80103e53:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e57:	90                   	nop
80103e58:	83 c2 7c             	add    $0x7c,%edx
80103e5b:	81 fa 54 4c 11 80    	cmp    $0x80114c54,%edx
80103e61:	74 3b                	je     80103e9e <exit+0x10e>
80103e63:	39 72 14             	cmp    %esi,0x14(%edx)
80103e66:	75 f0                	jne    80103e58 <exit+0xc8>
80103e68:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
80103e6c:	89 4a 14             	mov    %ecx,0x14(%edx)
80103e6f:	75 e7                	jne    80103e58 <exit+0xc8>
80103e71:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103e76:	eb 12                	jmp    80103e8a <exit+0xfa>
80103e78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103e7f:	90                   	nop
80103e80:	83 c0 7c             	add    $0x7c,%eax
80103e83:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103e88:	74 ce                	je     80103e58 <exit+0xc8>
80103e8a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e8e:	75 f0                	jne    80103e80 <exit+0xf0>
80103e90:	3b 48 20             	cmp    0x20(%eax),%ecx
80103e93:	75 eb                	jne    80103e80 <exit+0xf0>
80103e95:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e9c:	eb e2                	jmp    80103e80 <exit+0xf0>
80103e9e:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
80103ea5:	e8 26 fe ff ff       	call   80103cd0 <sched>
80103eaa:	83 ec 0c             	sub    $0xc,%esp
80103ead:	68 a8 76 10 80       	push   $0x801076a8
80103eb2:	e8 d9 c4 ff ff       	call   80100390 <panic>
80103eb7:	83 ec 0c             	sub    $0xc,%esp
80103eba:	68 9b 76 10 80       	push   $0x8010769b
80103ebf:	e8 cc c4 ff ff       	call   80100390 <panic>
80103ec4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ecb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ecf:	90                   	nop

80103ed0 <yield>:
80103ed0:	f3 0f 1e fb          	endbr32 
80103ed4:	55                   	push   %ebp
80103ed5:	89 e5                	mov    %esp,%ebp
80103ed7:	53                   	push   %ebx
80103ed8:	83 ec 10             	sub    $0x10,%esp
80103edb:	68 20 2d 11 80       	push   $0x80112d20
80103ee0:	e8 7b 06 00 00       	call   80104560 <acquire>
80103ee5:	e8 76 05 00 00       	call   80104460 <pushcli>
80103eea:	e8 e1 f9 ff ff       	call   801038d0 <mycpu>
80103eef:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103ef5:	e8 b6 05 00 00       	call   801044b0 <popcli>
80103efa:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103f01:	e8 ca fd ff ff       	call   80103cd0 <sched>
80103f06:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103f0d:	e8 0e 07 00 00       	call   80104620 <release>
80103f12:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f15:	83 c4 10             	add    $0x10,%esp
80103f18:	c9                   	leave  
80103f19:	c3                   	ret    
80103f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103f20 <sleep>:
80103f20:	f3 0f 1e fb          	endbr32 
80103f24:	55                   	push   %ebp
80103f25:	89 e5                	mov    %esp,%ebp
80103f27:	57                   	push   %edi
80103f28:	56                   	push   %esi
80103f29:	53                   	push   %ebx
80103f2a:	83 ec 0c             	sub    $0xc,%esp
80103f2d:	8b 7d 08             	mov    0x8(%ebp),%edi
80103f30:	8b 75 0c             	mov    0xc(%ebp),%esi
80103f33:	e8 28 05 00 00       	call   80104460 <pushcli>
80103f38:	e8 93 f9 ff ff       	call   801038d0 <mycpu>
80103f3d:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103f43:	e8 68 05 00 00       	call   801044b0 <popcli>
80103f48:	85 db                	test   %ebx,%ebx
80103f4a:	0f 84 83 00 00 00    	je     80103fd3 <sleep+0xb3>
80103f50:	85 f6                	test   %esi,%esi
80103f52:	74 72                	je     80103fc6 <sleep+0xa6>
80103f54:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103f5a:	74 4c                	je     80103fa8 <sleep+0x88>
80103f5c:	83 ec 0c             	sub    $0xc,%esp
80103f5f:	68 20 2d 11 80       	push   $0x80112d20
80103f64:	e8 f7 05 00 00       	call   80104560 <acquire>
80103f69:	89 34 24             	mov    %esi,(%esp)
80103f6c:	e8 af 06 00 00       	call   80104620 <release>
80103f71:	89 7b 20             	mov    %edi,0x20(%ebx)
80103f74:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103f7b:	e8 50 fd ff ff       	call   80103cd0 <sched>
80103f80:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103f87:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103f8e:	e8 8d 06 00 00       	call   80104620 <release>
80103f93:	89 75 08             	mov    %esi,0x8(%ebp)
80103f96:	83 c4 10             	add    $0x10,%esp
80103f99:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f9c:	5b                   	pop    %ebx
80103f9d:	5e                   	pop    %esi
80103f9e:	5f                   	pop    %edi
80103f9f:	5d                   	pop    %ebp
80103fa0:	e9 bb 05 00 00       	jmp    80104560 <acquire>
80103fa5:	8d 76 00             	lea    0x0(%esi),%esi
80103fa8:	89 7b 20             	mov    %edi,0x20(%ebx)
80103fab:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103fb2:	e8 19 fd ff ff       	call   80103cd0 <sched>
80103fb7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103fbe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103fc1:	5b                   	pop    %ebx
80103fc2:	5e                   	pop    %esi
80103fc3:	5f                   	pop    %edi
80103fc4:	5d                   	pop    %ebp
80103fc5:	c3                   	ret    
80103fc6:	83 ec 0c             	sub    $0xc,%esp
80103fc9:	68 ba 76 10 80       	push   $0x801076ba
80103fce:	e8 bd c3 ff ff       	call   80100390 <panic>
80103fd3:	83 ec 0c             	sub    $0xc,%esp
80103fd6:	68 b4 76 10 80       	push   $0x801076b4
80103fdb:	e8 b0 c3 ff ff       	call   80100390 <panic>

80103fe0 <wait>:
80103fe0:	f3 0f 1e fb          	endbr32 
80103fe4:	55                   	push   %ebp
80103fe5:	89 e5                	mov    %esp,%ebp
80103fe7:	56                   	push   %esi
80103fe8:	53                   	push   %ebx
80103fe9:	e8 72 04 00 00       	call   80104460 <pushcli>
80103fee:	e8 dd f8 ff ff       	call   801038d0 <mycpu>
80103ff3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103ff9:	e8 b2 04 00 00       	call   801044b0 <popcli>
80103ffe:	83 ec 0c             	sub    $0xc,%esp
80104001:	68 20 2d 11 80       	push   $0x80112d20
80104006:	e8 55 05 00 00       	call   80104560 <acquire>
8010400b:	83 c4 10             	add    $0x10,%esp
8010400e:	31 c0                	xor    %eax,%eax
80104010:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80104015:	eb 14                	jmp    8010402b <wait+0x4b>
80104017:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010401e:	66 90                	xchg   %ax,%ax
80104020:	83 c3 7c             	add    $0x7c,%ebx
80104023:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80104029:	74 1b                	je     80104046 <wait+0x66>
8010402b:	39 73 14             	cmp    %esi,0x14(%ebx)
8010402e:	75 f0                	jne    80104020 <wait+0x40>
80104030:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80104034:	74 32                	je     80104068 <wait+0x88>
80104036:	83 c3 7c             	add    $0x7c,%ebx
80104039:	b8 01 00 00 00       	mov    $0x1,%eax
8010403e:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80104044:	75 e5                	jne    8010402b <wait+0x4b>
80104046:	85 c0                	test   %eax,%eax
80104048:	74 74                	je     801040be <wait+0xde>
8010404a:	8b 46 24             	mov    0x24(%esi),%eax
8010404d:	85 c0                	test   %eax,%eax
8010404f:	75 6d                	jne    801040be <wait+0xde>
80104051:	83 ec 08             	sub    $0x8,%esp
80104054:	68 20 2d 11 80       	push   $0x80112d20
80104059:	56                   	push   %esi
8010405a:	e8 c1 fe ff ff       	call   80103f20 <sleep>
8010405f:	83 c4 10             	add    $0x10,%esp
80104062:	eb aa                	jmp    8010400e <wait+0x2e>
80104064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104068:	83 ec 0c             	sub    $0xc,%esp
8010406b:	ff 73 08             	pushl  0x8(%ebx)
8010406e:	8b 73 10             	mov    0x10(%ebx),%esi
80104071:	e8 fa e3 ff ff       	call   80102470 <kfree>
80104076:	5a                   	pop    %edx
80104077:	ff 73 04             	pushl  0x4(%ebx)
8010407a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104081:	e8 4a 2d 00 00       	call   80106dd0 <freevm>
80104086:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
8010408d:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80104094:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
8010409b:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
8010409f:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
801040a6:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801040ad:	e8 6e 05 00 00       	call   80104620 <release>
801040b2:	83 c4 10             	add    $0x10,%esp
801040b5:	8d 65 f8             	lea    -0x8(%ebp),%esp
801040b8:	89 f0                	mov    %esi,%eax
801040ba:	5b                   	pop    %ebx
801040bb:	5e                   	pop    %esi
801040bc:	5d                   	pop    %ebp
801040bd:	c3                   	ret    
801040be:	83 ec 0c             	sub    $0xc,%esp
801040c1:	be ff ff ff ff       	mov    $0xffffffff,%esi
801040c6:	68 20 2d 11 80       	push   $0x80112d20
801040cb:	e8 50 05 00 00       	call   80104620 <release>
801040d0:	83 c4 10             	add    $0x10,%esp
801040d3:	eb e0                	jmp    801040b5 <wait+0xd5>
801040d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801040dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801040e0 <wakeup>:
801040e0:	f3 0f 1e fb          	endbr32 
801040e4:	55                   	push   %ebp
801040e5:	89 e5                	mov    %esp,%ebp
801040e7:	53                   	push   %ebx
801040e8:	83 ec 10             	sub    $0x10,%esp
801040eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801040ee:	68 20 2d 11 80       	push   $0x80112d20
801040f3:	e8 68 04 00 00       	call   80104560 <acquire>
801040f8:	83 c4 10             	add    $0x10,%esp
801040fb:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80104100:	eb 10                	jmp    80104112 <wakeup+0x32>
80104102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104108:	83 c0 7c             	add    $0x7c,%eax
8010410b:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80104110:	74 1c                	je     8010412e <wakeup+0x4e>
80104112:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104116:	75 f0                	jne    80104108 <wakeup+0x28>
80104118:	3b 58 20             	cmp    0x20(%eax),%ebx
8010411b:	75 eb                	jne    80104108 <wakeup+0x28>
8010411d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80104124:	83 c0 7c             	add    $0x7c,%eax
80104127:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
8010412c:	75 e4                	jne    80104112 <wakeup+0x32>
8010412e:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
80104135:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104138:	c9                   	leave  
80104139:	e9 e2 04 00 00       	jmp    80104620 <release>
8010413e:	66 90                	xchg   %ax,%ax

80104140 <kill>:
80104140:	f3 0f 1e fb          	endbr32 
80104144:	55                   	push   %ebp
80104145:	89 e5                	mov    %esp,%ebp
80104147:	53                   	push   %ebx
80104148:	83 ec 10             	sub    $0x10,%esp
8010414b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010414e:	68 20 2d 11 80       	push   $0x80112d20
80104153:	e8 08 04 00 00       	call   80104560 <acquire>
80104158:	83 c4 10             	add    $0x10,%esp
8010415b:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80104160:	eb 10                	jmp    80104172 <kill+0x32>
80104162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104168:	83 c0 7c             	add    $0x7c,%eax
8010416b:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80104170:	74 36                	je     801041a8 <kill+0x68>
80104172:	39 58 10             	cmp    %ebx,0x10(%eax)
80104175:	75 f1                	jne    80104168 <kill+0x28>
80104177:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
8010417b:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80104182:	75 07                	jne    8010418b <kill+0x4b>
80104184:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010418b:	83 ec 0c             	sub    $0xc,%esp
8010418e:	68 20 2d 11 80       	push   $0x80112d20
80104193:	e8 88 04 00 00       	call   80104620 <release>
80104198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010419b:	83 c4 10             	add    $0x10,%esp
8010419e:	31 c0                	xor    %eax,%eax
801041a0:	c9                   	leave  
801041a1:	c3                   	ret    
801041a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801041a8:	83 ec 0c             	sub    $0xc,%esp
801041ab:	68 20 2d 11 80       	push   $0x80112d20
801041b0:	e8 6b 04 00 00       	call   80104620 <release>
801041b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041b8:	83 c4 10             	add    $0x10,%esp
801041bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801041c0:	c9                   	leave  
801041c1:	c3                   	ret    
801041c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801041d0 <procdump>:
801041d0:	f3 0f 1e fb          	endbr32 
801041d4:	55                   	push   %ebp
801041d5:	89 e5                	mov    %esp,%ebp
801041d7:	57                   	push   %edi
801041d8:	56                   	push   %esi
801041d9:	8d 75 e8             	lea    -0x18(%ebp),%esi
801041dc:	53                   	push   %ebx
801041dd:	bb c0 2d 11 80       	mov    $0x80112dc0,%ebx
801041e2:	83 ec 3c             	sub    $0x3c,%esp
801041e5:	eb 28                	jmp    8010420f <procdump+0x3f>
801041e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041ee:	66 90                	xchg   %ax,%ax
801041f0:	83 ec 0c             	sub    $0xc,%esp
801041f3:	68 37 7a 10 80       	push   $0x80107a37
801041f8:	e8 b3 c4 ff ff       	call   801006b0 <cprintf>
801041fd:	83 c4 10             	add    $0x10,%esp
80104200:	83 c3 7c             	add    $0x7c,%ebx
80104203:	81 fb c0 4c 11 80    	cmp    $0x80114cc0,%ebx
80104209:	0f 84 81 00 00 00    	je     80104290 <procdump+0xc0>
8010420f:	8b 43 a0             	mov    -0x60(%ebx),%eax
80104212:	85 c0                	test   %eax,%eax
80104214:	74 ea                	je     80104200 <procdump+0x30>
80104216:	ba cb 76 10 80       	mov    $0x801076cb,%edx
8010421b:	83 f8 05             	cmp    $0x5,%eax
8010421e:	77 11                	ja     80104231 <procdump+0x61>
80104220:	8b 14 85 2c 77 10 80 	mov    -0x7fef88d4(,%eax,4),%edx
80104227:	b8 cb 76 10 80       	mov    $0x801076cb,%eax
8010422c:	85 d2                	test   %edx,%edx
8010422e:	0f 44 d0             	cmove  %eax,%edx
80104231:	53                   	push   %ebx
80104232:	52                   	push   %edx
80104233:	ff 73 a4             	pushl  -0x5c(%ebx)
80104236:	68 cf 76 10 80       	push   $0x801076cf
8010423b:	e8 70 c4 ff ff       	call   801006b0 <cprintf>
80104240:	83 c4 10             	add    $0x10,%esp
80104243:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80104247:	75 a7                	jne    801041f0 <procdump+0x20>
80104249:	83 ec 08             	sub    $0x8,%esp
8010424c:	8d 45 c0             	lea    -0x40(%ebp),%eax
8010424f:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104252:	50                   	push   %eax
80104253:	8b 43 b0             	mov    -0x50(%ebx),%eax
80104256:	8b 40 0c             	mov    0xc(%eax),%eax
80104259:	83 c0 08             	add    $0x8,%eax
8010425c:	50                   	push   %eax
8010425d:	e8 9e 01 00 00       	call   80104400 <getcallerpcs>
80104262:	83 c4 10             	add    $0x10,%esp
80104265:	8d 76 00             	lea    0x0(%esi),%esi
80104268:	8b 17                	mov    (%edi),%edx
8010426a:	85 d2                	test   %edx,%edx
8010426c:	74 82                	je     801041f0 <procdump+0x20>
8010426e:	83 ec 08             	sub    $0x8,%esp
80104271:	83 c7 04             	add    $0x4,%edi
80104274:	52                   	push   %edx
80104275:	68 21 71 10 80       	push   $0x80107121
8010427a:	e8 31 c4 ff ff       	call   801006b0 <cprintf>
8010427f:	83 c4 10             	add    $0x10,%esp
80104282:	39 fe                	cmp    %edi,%esi
80104284:	75 e2                	jne    80104268 <procdump+0x98>
80104286:	e9 65 ff ff ff       	jmp    801041f0 <procdump+0x20>
8010428b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010428f:	90                   	nop
80104290:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104293:	5b                   	pop    %ebx
80104294:	5e                   	pop    %esi
80104295:	5f                   	pop    %edi
80104296:	5d                   	pop    %ebp
80104297:	c3                   	ret    
80104298:	66 90                	xchg   %ax,%ax
8010429a:	66 90                	xchg   %ax,%ax
8010429c:	66 90                	xchg   %ax,%ax
8010429e:	66 90                	xchg   %ax,%ax

801042a0 <initsleeplock>:
801042a0:	f3 0f 1e fb          	endbr32 
801042a4:	55                   	push   %ebp
801042a5:	89 e5                	mov    %esp,%ebp
801042a7:	53                   	push   %ebx
801042a8:	83 ec 0c             	sub    $0xc,%esp
801042ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042ae:	68 44 77 10 80       	push   $0x80107744
801042b3:	8d 43 04             	lea    0x4(%ebx),%eax
801042b6:	50                   	push   %eax
801042b7:	e8 24 01 00 00       	call   801043e0 <initlock>
801042bc:	8b 45 0c             	mov    0xc(%ebp),%eax
801042bf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801042c5:	83 c4 10             	add    $0x10,%esp
801042c8:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801042cf:	89 43 38             	mov    %eax,0x38(%ebx)
801042d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042d5:	c9                   	leave  
801042d6:	c3                   	ret    
801042d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042de:	66 90                	xchg   %ax,%ax

801042e0 <acquiresleep>:
801042e0:	f3 0f 1e fb          	endbr32 
801042e4:	55                   	push   %ebp
801042e5:	89 e5                	mov    %esp,%ebp
801042e7:	56                   	push   %esi
801042e8:	53                   	push   %ebx
801042e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042ec:	8d 73 04             	lea    0x4(%ebx),%esi
801042ef:	83 ec 0c             	sub    $0xc,%esp
801042f2:	56                   	push   %esi
801042f3:	e8 68 02 00 00       	call   80104560 <acquire>
801042f8:	8b 13                	mov    (%ebx),%edx
801042fa:	83 c4 10             	add    $0x10,%esp
801042fd:	85 d2                	test   %edx,%edx
801042ff:	74 1a                	je     8010431b <acquiresleep+0x3b>
80104301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104308:	83 ec 08             	sub    $0x8,%esp
8010430b:	56                   	push   %esi
8010430c:	53                   	push   %ebx
8010430d:	e8 0e fc ff ff       	call   80103f20 <sleep>
80104312:	8b 03                	mov    (%ebx),%eax
80104314:	83 c4 10             	add    $0x10,%esp
80104317:	85 c0                	test   %eax,%eax
80104319:	75 ed                	jne    80104308 <acquiresleep+0x28>
8010431b:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104321:	e8 3a f6 ff ff       	call   80103960 <myproc>
80104326:	8b 40 10             	mov    0x10(%eax),%eax
80104329:	89 43 3c             	mov    %eax,0x3c(%ebx)
8010432c:	89 75 08             	mov    %esi,0x8(%ebp)
8010432f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104332:	5b                   	pop    %ebx
80104333:	5e                   	pop    %esi
80104334:	5d                   	pop    %ebp
80104335:	e9 e6 02 00 00       	jmp    80104620 <release>
8010433a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104340 <releasesleep>:
80104340:	f3 0f 1e fb          	endbr32 
80104344:	55                   	push   %ebp
80104345:	89 e5                	mov    %esp,%ebp
80104347:	56                   	push   %esi
80104348:	53                   	push   %ebx
80104349:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010434c:	8d 73 04             	lea    0x4(%ebx),%esi
8010434f:	83 ec 0c             	sub    $0xc,%esp
80104352:	56                   	push   %esi
80104353:	e8 08 02 00 00       	call   80104560 <acquire>
80104358:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010435e:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80104365:	89 1c 24             	mov    %ebx,(%esp)
80104368:	e8 73 fd ff ff       	call   801040e0 <wakeup>
8010436d:	89 75 08             	mov    %esi,0x8(%ebp)
80104370:	83 c4 10             	add    $0x10,%esp
80104373:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104376:	5b                   	pop    %ebx
80104377:	5e                   	pop    %esi
80104378:	5d                   	pop    %ebp
80104379:	e9 a2 02 00 00       	jmp    80104620 <release>
8010437e:	66 90                	xchg   %ax,%ax

80104380 <holdingsleep>:
80104380:	f3 0f 1e fb          	endbr32 
80104384:	55                   	push   %ebp
80104385:	89 e5                	mov    %esp,%ebp
80104387:	57                   	push   %edi
80104388:	31 ff                	xor    %edi,%edi
8010438a:	56                   	push   %esi
8010438b:	53                   	push   %ebx
8010438c:	83 ec 18             	sub    $0x18,%esp
8010438f:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104392:	8d 73 04             	lea    0x4(%ebx),%esi
80104395:	56                   	push   %esi
80104396:	e8 c5 01 00 00       	call   80104560 <acquire>
8010439b:	8b 03                	mov    (%ebx),%eax
8010439d:	83 c4 10             	add    $0x10,%esp
801043a0:	85 c0                	test   %eax,%eax
801043a2:	75 1c                	jne    801043c0 <holdingsleep+0x40>
801043a4:	83 ec 0c             	sub    $0xc,%esp
801043a7:	56                   	push   %esi
801043a8:	e8 73 02 00 00       	call   80104620 <release>
801043ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
801043b0:	89 f8                	mov    %edi,%eax
801043b2:	5b                   	pop    %ebx
801043b3:	5e                   	pop    %esi
801043b4:	5f                   	pop    %edi
801043b5:	5d                   	pop    %ebp
801043b6:	c3                   	ret    
801043b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801043be:	66 90                	xchg   %ax,%ax
801043c0:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
801043c3:	e8 98 f5 ff ff       	call   80103960 <myproc>
801043c8:	39 58 10             	cmp    %ebx,0x10(%eax)
801043cb:	0f 94 c0             	sete   %al
801043ce:	0f b6 c0             	movzbl %al,%eax
801043d1:	89 c7                	mov    %eax,%edi
801043d3:	eb cf                	jmp    801043a4 <holdingsleep+0x24>
801043d5:	66 90                	xchg   %ax,%ax
801043d7:	66 90                	xchg   %ax,%ax
801043d9:	66 90                	xchg   %ax,%ax
801043db:	66 90                	xchg   %ax,%ax
801043dd:	66 90                	xchg   %ax,%ax
801043df:	90                   	nop

801043e0 <initlock>:
801043e0:	f3 0f 1e fb          	endbr32 
801043e4:	55                   	push   %ebp
801043e5:	89 e5                	mov    %esp,%ebp
801043e7:	8b 45 08             	mov    0x8(%ebp),%eax
801043ea:	8b 55 0c             	mov    0xc(%ebp),%edx
801043ed:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801043f3:	89 50 04             	mov    %edx,0x4(%eax)
801043f6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
801043fd:	5d                   	pop    %ebp
801043fe:	c3                   	ret    
801043ff:	90                   	nop

80104400 <getcallerpcs>:
80104400:	f3 0f 1e fb          	endbr32 
80104404:	55                   	push   %ebp
80104405:	31 d2                	xor    %edx,%edx
80104407:	89 e5                	mov    %esp,%ebp
80104409:	53                   	push   %ebx
8010440a:	8b 45 08             	mov    0x8(%ebp),%eax
8010440d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104410:	83 e8 08             	sub    $0x8,%eax
80104413:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104417:	90                   	nop
80104418:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
8010441e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104424:	77 1a                	ja     80104440 <getcallerpcs+0x40>
80104426:	8b 58 04             	mov    0x4(%eax),%ebx
80104429:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
8010442c:	83 c2 01             	add    $0x1,%edx
8010442f:	8b 00                	mov    (%eax),%eax
80104431:	83 fa 0a             	cmp    $0xa,%edx
80104434:	75 e2                	jne    80104418 <getcallerpcs+0x18>
80104436:	5b                   	pop    %ebx
80104437:	5d                   	pop    %ebp
80104438:	c3                   	ret    
80104439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104440:	8d 04 91             	lea    (%ecx,%edx,4),%eax
80104443:	8d 51 28             	lea    0x28(%ecx),%edx
80104446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010444d:	8d 76 00             	lea    0x0(%esi),%esi
80104450:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104456:	83 c0 04             	add    $0x4,%eax
80104459:	39 d0                	cmp    %edx,%eax
8010445b:	75 f3                	jne    80104450 <getcallerpcs+0x50>
8010445d:	5b                   	pop    %ebx
8010445e:	5d                   	pop    %ebp
8010445f:	c3                   	ret    

80104460 <pushcli>:
80104460:	f3 0f 1e fb          	endbr32 
80104464:	55                   	push   %ebp
80104465:	89 e5                	mov    %esp,%ebp
80104467:	53                   	push   %ebx
80104468:	83 ec 04             	sub    $0x4,%esp
8010446b:	9c                   	pushf  
8010446c:	5b                   	pop    %ebx
8010446d:	fa                   	cli    
8010446e:	e8 5d f4 ff ff       	call   801038d0 <mycpu>
80104473:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104479:	85 c0                	test   %eax,%eax
8010447b:	74 13                	je     80104490 <pushcli+0x30>
8010447d:	e8 4e f4 ff ff       	call   801038d0 <mycpu>
80104482:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80104489:	83 c4 04             	add    $0x4,%esp
8010448c:	5b                   	pop    %ebx
8010448d:	5d                   	pop    %ebp
8010448e:	c3                   	ret    
8010448f:	90                   	nop
80104490:	e8 3b f4 ff ff       	call   801038d0 <mycpu>
80104495:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010449b:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
801044a1:	eb da                	jmp    8010447d <pushcli+0x1d>
801044a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801044b0 <popcli>:
801044b0:	f3 0f 1e fb          	endbr32 
801044b4:	55                   	push   %ebp
801044b5:	89 e5                	mov    %esp,%ebp
801044b7:	83 ec 08             	sub    $0x8,%esp
801044ba:	9c                   	pushf  
801044bb:	58                   	pop    %eax
801044bc:	f6 c4 02             	test   $0x2,%ah
801044bf:	75 31                	jne    801044f2 <popcli+0x42>
801044c1:	e8 0a f4 ff ff       	call   801038d0 <mycpu>
801044c6:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
801044cd:	78 30                	js     801044ff <popcli+0x4f>
801044cf:	e8 fc f3 ff ff       	call   801038d0 <mycpu>
801044d4:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801044da:	85 d2                	test   %edx,%edx
801044dc:	74 02                	je     801044e0 <popcli+0x30>
801044de:	c9                   	leave  
801044df:	c3                   	ret    
801044e0:	e8 eb f3 ff ff       	call   801038d0 <mycpu>
801044e5:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801044eb:	85 c0                	test   %eax,%eax
801044ed:	74 ef                	je     801044de <popcli+0x2e>
801044ef:	fb                   	sti    
801044f0:	c9                   	leave  
801044f1:	c3                   	ret    
801044f2:	83 ec 0c             	sub    $0xc,%esp
801044f5:	68 4f 77 10 80       	push   $0x8010774f
801044fa:	e8 91 be ff ff       	call   80100390 <panic>
801044ff:	83 ec 0c             	sub    $0xc,%esp
80104502:	68 66 77 10 80       	push   $0x80107766
80104507:	e8 84 be ff ff       	call   80100390 <panic>
8010450c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104510 <holding>:
80104510:	f3 0f 1e fb          	endbr32 
80104514:	55                   	push   %ebp
80104515:	89 e5                	mov    %esp,%ebp
80104517:	56                   	push   %esi
80104518:	53                   	push   %ebx
80104519:	8b 75 08             	mov    0x8(%ebp),%esi
8010451c:	31 db                	xor    %ebx,%ebx
8010451e:	e8 3d ff ff ff       	call   80104460 <pushcli>
80104523:	8b 06                	mov    (%esi),%eax
80104525:	85 c0                	test   %eax,%eax
80104527:	75 0f                	jne    80104538 <holding+0x28>
80104529:	e8 82 ff ff ff       	call   801044b0 <popcli>
8010452e:	89 d8                	mov    %ebx,%eax
80104530:	5b                   	pop    %ebx
80104531:	5e                   	pop    %esi
80104532:	5d                   	pop    %ebp
80104533:	c3                   	ret    
80104534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104538:	8b 5e 08             	mov    0x8(%esi),%ebx
8010453b:	e8 90 f3 ff ff       	call   801038d0 <mycpu>
80104540:	39 c3                	cmp    %eax,%ebx
80104542:	0f 94 c3             	sete   %bl
80104545:	e8 66 ff ff ff       	call   801044b0 <popcli>
8010454a:	0f b6 db             	movzbl %bl,%ebx
8010454d:	89 d8                	mov    %ebx,%eax
8010454f:	5b                   	pop    %ebx
80104550:	5e                   	pop    %esi
80104551:	5d                   	pop    %ebp
80104552:	c3                   	ret    
80104553:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010455a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104560 <acquire>:
80104560:	f3 0f 1e fb          	endbr32 
80104564:	55                   	push   %ebp
80104565:	89 e5                	mov    %esp,%ebp
80104567:	56                   	push   %esi
80104568:	53                   	push   %ebx
80104569:	e8 f2 fe ff ff       	call   80104460 <pushcli>
8010456e:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104571:	83 ec 0c             	sub    $0xc,%esp
80104574:	53                   	push   %ebx
80104575:	e8 96 ff ff ff       	call   80104510 <holding>
8010457a:	83 c4 10             	add    $0x10,%esp
8010457d:	85 c0                	test   %eax,%eax
8010457f:	0f 85 7f 00 00 00    	jne    80104604 <acquire+0xa4>
80104585:	89 c6                	mov    %eax,%esi
80104587:	ba 01 00 00 00       	mov    $0x1,%edx
8010458c:	eb 05                	jmp    80104593 <acquire+0x33>
8010458e:	66 90                	xchg   %ax,%ax
80104590:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104593:	89 d0                	mov    %edx,%eax
80104595:	f0 87 03             	lock xchg %eax,(%ebx)
80104598:	85 c0                	test   %eax,%eax
8010459a:	75 f4                	jne    80104590 <acquire+0x30>
8010459c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801045a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045a4:	e8 27 f3 ff ff       	call   801038d0 <mycpu>
801045a9:	89 43 08             	mov    %eax,0x8(%ebx)
801045ac:	89 e8                	mov    %ebp,%eax
801045ae:	66 90                	xchg   %ax,%ax
801045b0:	8d 90 00 00 00 80    	lea    -0x80000000(%eax),%edx
801045b6:	81 fa fe ff ff 7f    	cmp    $0x7ffffffe,%edx
801045bc:	77 22                	ja     801045e0 <acquire+0x80>
801045be:	8b 50 04             	mov    0x4(%eax),%edx
801045c1:	89 54 b3 0c          	mov    %edx,0xc(%ebx,%esi,4)
801045c5:	83 c6 01             	add    $0x1,%esi
801045c8:	8b 00                	mov    (%eax),%eax
801045ca:	83 fe 0a             	cmp    $0xa,%esi
801045cd:	75 e1                	jne    801045b0 <acquire+0x50>
801045cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801045d2:	5b                   	pop    %ebx
801045d3:	5e                   	pop    %esi
801045d4:	5d                   	pop    %ebp
801045d5:	c3                   	ret    
801045d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045dd:	8d 76 00             	lea    0x0(%esi),%esi
801045e0:	8d 44 b3 0c          	lea    0xc(%ebx,%esi,4),%eax
801045e4:	83 c3 34             	add    $0x34,%ebx
801045e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045ee:	66 90                	xchg   %ax,%ax
801045f0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801045f6:	83 c0 04             	add    $0x4,%eax
801045f9:	39 d8                	cmp    %ebx,%eax
801045fb:	75 f3                	jne    801045f0 <acquire+0x90>
801045fd:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104600:	5b                   	pop    %ebx
80104601:	5e                   	pop    %esi
80104602:	5d                   	pop    %ebp
80104603:	c3                   	ret    
80104604:	83 ec 0c             	sub    $0xc,%esp
80104607:	68 6d 77 10 80       	push   $0x8010776d
8010460c:	e8 7f bd ff ff       	call   80100390 <panic>
80104611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010461f:	90                   	nop

80104620 <release>:
80104620:	f3 0f 1e fb          	endbr32 
80104624:	55                   	push   %ebp
80104625:	89 e5                	mov    %esp,%ebp
80104627:	53                   	push   %ebx
80104628:	83 ec 10             	sub    $0x10,%esp
8010462b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010462e:	53                   	push   %ebx
8010462f:	e8 dc fe ff ff       	call   80104510 <holding>
80104634:	83 c4 10             	add    $0x10,%esp
80104637:	85 c0                	test   %eax,%eax
80104639:	74 22                	je     8010465d <release+0x3d>
8010463b:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80104642:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104649:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
8010464e:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104654:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104657:	c9                   	leave  
80104658:	e9 53 fe ff ff       	jmp    801044b0 <popcli>
8010465d:	83 ec 0c             	sub    $0xc,%esp
80104660:	68 75 77 10 80       	push   $0x80107775
80104665:	e8 26 bd ff ff       	call   80100390 <panic>
8010466a:	66 90                	xchg   %ax,%ax
8010466c:	66 90                	xchg   %ax,%ax
8010466e:	66 90                	xchg   %ax,%ax

80104670 <memset>:
80104670:	f3 0f 1e fb          	endbr32 
80104674:	55                   	push   %ebp
80104675:	89 e5                	mov    %esp,%ebp
80104677:	57                   	push   %edi
80104678:	8b 55 08             	mov    0x8(%ebp),%edx
8010467b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010467e:	53                   	push   %ebx
8010467f:	8b 45 0c             	mov    0xc(%ebp),%eax
80104682:	89 d7                	mov    %edx,%edi
80104684:	09 cf                	or     %ecx,%edi
80104686:	83 e7 03             	and    $0x3,%edi
80104689:	75 25                	jne    801046b0 <memset+0x40>
8010468b:	0f b6 f8             	movzbl %al,%edi
8010468e:	c1 e0 18             	shl    $0x18,%eax
80104691:	89 fb                	mov    %edi,%ebx
80104693:	c1 e9 02             	shr    $0x2,%ecx
80104696:	c1 e3 10             	shl    $0x10,%ebx
80104699:	09 d8                	or     %ebx,%eax
8010469b:	09 f8                	or     %edi,%eax
8010469d:	c1 e7 08             	shl    $0x8,%edi
801046a0:	09 f8                	or     %edi,%eax
801046a2:	89 d7                	mov    %edx,%edi
801046a4:	fc                   	cld    
801046a5:	f3 ab                	rep stos %eax,%es:(%edi)
801046a7:	5b                   	pop    %ebx
801046a8:	89 d0                	mov    %edx,%eax
801046aa:	5f                   	pop    %edi
801046ab:	5d                   	pop    %ebp
801046ac:	c3                   	ret    
801046ad:	8d 76 00             	lea    0x0(%esi),%esi
801046b0:	89 d7                	mov    %edx,%edi
801046b2:	fc                   	cld    
801046b3:	f3 aa                	rep stos %al,%es:(%edi)
801046b5:	5b                   	pop    %ebx
801046b6:	89 d0                	mov    %edx,%eax
801046b8:	5f                   	pop    %edi
801046b9:	5d                   	pop    %ebp
801046ba:	c3                   	ret    
801046bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046bf:	90                   	nop

801046c0 <memcmp>:
801046c0:	f3 0f 1e fb          	endbr32 
801046c4:	55                   	push   %ebp
801046c5:	89 e5                	mov    %esp,%ebp
801046c7:	56                   	push   %esi
801046c8:	8b 75 10             	mov    0x10(%ebp),%esi
801046cb:	8b 55 08             	mov    0x8(%ebp),%edx
801046ce:	53                   	push   %ebx
801046cf:	8b 45 0c             	mov    0xc(%ebp),%eax
801046d2:	85 f6                	test   %esi,%esi
801046d4:	74 2a                	je     80104700 <memcmp+0x40>
801046d6:	01 c6                	add    %eax,%esi
801046d8:	eb 10                	jmp    801046ea <memcmp+0x2a>
801046da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046e0:	83 c0 01             	add    $0x1,%eax
801046e3:	83 c2 01             	add    $0x1,%edx
801046e6:	39 f0                	cmp    %esi,%eax
801046e8:	74 16                	je     80104700 <memcmp+0x40>
801046ea:	0f b6 0a             	movzbl (%edx),%ecx
801046ed:	0f b6 18             	movzbl (%eax),%ebx
801046f0:	38 d9                	cmp    %bl,%cl
801046f2:	74 ec                	je     801046e0 <memcmp+0x20>
801046f4:	0f b6 c1             	movzbl %cl,%eax
801046f7:	29 d8                	sub    %ebx,%eax
801046f9:	5b                   	pop    %ebx
801046fa:	5e                   	pop    %esi
801046fb:	5d                   	pop    %ebp
801046fc:	c3                   	ret    
801046fd:	8d 76 00             	lea    0x0(%esi),%esi
80104700:	5b                   	pop    %ebx
80104701:	31 c0                	xor    %eax,%eax
80104703:	5e                   	pop    %esi
80104704:	5d                   	pop    %ebp
80104705:	c3                   	ret    
80104706:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010470d:	8d 76 00             	lea    0x0(%esi),%esi

80104710 <memmove>:
80104710:	f3 0f 1e fb          	endbr32 
80104714:	55                   	push   %ebp
80104715:	89 e5                	mov    %esp,%ebp
80104717:	57                   	push   %edi
80104718:	8b 55 08             	mov    0x8(%ebp),%edx
8010471b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010471e:	56                   	push   %esi
8010471f:	8b 75 0c             	mov    0xc(%ebp),%esi
80104722:	39 d6                	cmp    %edx,%esi
80104724:	73 2a                	jae    80104750 <memmove+0x40>
80104726:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
80104729:	39 fa                	cmp    %edi,%edx
8010472b:	73 23                	jae    80104750 <memmove+0x40>
8010472d:	8d 41 ff             	lea    -0x1(%ecx),%eax
80104730:	85 c9                	test   %ecx,%ecx
80104732:	74 13                	je     80104747 <memmove+0x37>
80104734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104738:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
8010473c:	88 0c 02             	mov    %cl,(%edx,%eax,1)
8010473f:	83 e8 01             	sub    $0x1,%eax
80104742:	83 f8 ff             	cmp    $0xffffffff,%eax
80104745:	75 f1                	jne    80104738 <memmove+0x28>
80104747:	5e                   	pop    %esi
80104748:	89 d0                	mov    %edx,%eax
8010474a:	5f                   	pop    %edi
8010474b:	5d                   	pop    %ebp
8010474c:	c3                   	ret    
8010474d:	8d 76 00             	lea    0x0(%esi),%esi
80104750:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
80104753:	89 d7                	mov    %edx,%edi
80104755:	85 c9                	test   %ecx,%ecx
80104757:	74 ee                	je     80104747 <memmove+0x37>
80104759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104760:	a4                   	movsb  %ds:(%esi),%es:(%edi)
80104761:	39 f0                	cmp    %esi,%eax
80104763:	75 fb                	jne    80104760 <memmove+0x50>
80104765:	5e                   	pop    %esi
80104766:	89 d0                	mov    %edx,%eax
80104768:	5f                   	pop    %edi
80104769:	5d                   	pop    %ebp
8010476a:	c3                   	ret    
8010476b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010476f:	90                   	nop

80104770 <memcpy>:
80104770:	f3 0f 1e fb          	endbr32 
80104774:	eb 9a                	jmp    80104710 <memmove>
80104776:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010477d:	8d 76 00             	lea    0x0(%esi),%esi

80104780 <strncmp>:
80104780:	f3 0f 1e fb          	endbr32 
80104784:	55                   	push   %ebp
80104785:	89 e5                	mov    %esp,%ebp
80104787:	56                   	push   %esi
80104788:	8b 75 10             	mov    0x10(%ebp),%esi
8010478b:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010478e:	53                   	push   %ebx
8010478f:	8b 45 0c             	mov    0xc(%ebp),%eax
80104792:	85 f6                	test   %esi,%esi
80104794:	74 32                	je     801047c8 <strncmp+0x48>
80104796:	01 c6                	add    %eax,%esi
80104798:	eb 14                	jmp    801047ae <strncmp+0x2e>
8010479a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047a0:	38 da                	cmp    %bl,%dl
801047a2:	75 14                	jne    801047b8 <strncmp+0x38>
801047a4:	83 c0 01             	add    $0x1,%eax
801047a7:	83 c1 01             	add    $0x1,%ecx
801047aa:	39 f0                	cmp    %esi,%eax
801047ac:	74 1a                	je     801047c8 <strncmp+0x48>
801047ae:	0f b6 11             	movzbl (%ecx),%edx
801047b1:	0f b6 18             	movzbl (%eax),%ebx
801047b4:	84 d2                	test   %dl,%dl
801047b6:	75 e8                	jne    801047a0 <strncmp+0x20>
801047b8:	0f b6 c2             	movzbl %dl,%eax
801047bb:	29 d8                	sub    %ebx,%eax
801047bd:	5b                   	pop    %ebx
801047be:	5e                   	pop    %esi
801047bf:	5d                   	pop    %ebp
801047c0:	c3                   	ret    
801047c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047c8:	5b                   	pop    %ebx
801047c9:	31 c0                	xor    %eax,%eax
801047cb:	5e                   	pop    %esi
801047cc:	5d                   	pop    %ebp
801047cd:	c3                   	ret    
801047ce:	66 90                	xchg   %ax,%ax

801047d0 <strncpy>:
801047d0:	f3 0f 1e fb          	endbr32 
801047d4:	55                   	push   %ebp
801047d5:	89 e5                	mov    %esp,%ebp
801047d7:	57                   	push   %edi
801047d8:	56                   	push   %esi
801047d9:	8b 75 08             	mov    0x8(%ebp),%esi
801047dc:	53                   	push   %ebx
801047dd:	8b 45 10             	mov    0x10(%ebp),%eax
801047e0:	89 f2                	mov    %esi,%edx
801047e2:	eb 1b                	jmp    801047ff <strncpy+0x2f>
801047e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801047e8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
801047ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
801047ef:	83 c2 01             	add    $0x1,%edx
801047f2:	0f b6 7f ff          	movzbl -0x1(%edi),%edi
801047f6:	89 f9                	mov    %edi,%ecx
801047f8:	88 4a ff             	mov    %cl,-0x1(%edx)
801047fb:	84 c9                	test   %cl,%cl
801047fd:	74 09                	je     80104808 <strncpy+0x38>
801047ff:	89 c3                	mov    %eax,%ebx
80104801:	83 e8 01             	sub    $0x1,%eax
80104804:	85 db                	test   %ebx,%ebx
80104806:	7f e0                	jg     801047e8 <strncpy+0x18>
80104808:	89 d1                	mov    %edx,%ecx
8010480a:	85 c0                	test   %eax,%eax
8010480c:	7e 15                	jle    80104823 <strncpy+0x53>
8010480e:	66 90                	xchg   %ax,%ax
80104810:	83 c1 01             	add    $0x1,%ecx
80104813:	c6 41 ff 00          	movb   $0x0,-0x1(%ecx)
80104817:	89 c8                	mov    %ecx,%eax
80104819:	f7 d0                	not    %eax
8010481b:	01 d0                	add    %edx,%eax
8010481d:	01 d8                	add    %ebx,%eax
8010481f:	85 c0                	test   %eax,%eax
80104821:	7f ed                	jg     80104810 <strncpy+0x40>
80104823:	5b                   	pop    %ebx
80104824:	89 f0                	mov    %esi,%eax
80104826:	5e                   	pop    %esi
80104827:	5f                   	pop    %edi
80104828:	5d                   	pop    %ebp
80104829:	c3                   	ret    
8010482a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104830 <safestrcpy>:
80104830:	f3 0f 1e fb          	endbr32 
80104834:	55                   	push   %ebp
80104835:	89 e5                	mov    %esp,%ebp
80104837:	56                   	push   %esi
80104838:	8b 55 10             	mov    0x10(%ebp),%edx
8010483b:	8b 75 08             	mov    0x8(%ebp),%esi
8010483e:	53                   	push   %ebx
8010483f:	8b 45 0c             	mov    0xc(%ebp),%eax
80104842:	85 d2                	test   %edx,%edx
80104844:	7e 21                	jle    80104867 <safestrcpy+0x37>
80104846:	8d 5c 10 ff          	lea    -0x1(%eax,%edx,1),%ebx
8010484a:	89 f2                	mov    %esi,%edx
8010484c:	eb 12                	jmp    80104860 <safestrcpy+0x30>
8010484e:	66 90                	xchg   %ax,%ax
80104850:	0f b6 08             	movzbl (%eax),%ecx
80104853:	83 c0 01             	add    $0x1,%eax
80104856:	83 c2 01             	add    $0x1,%edx
80104859:	88 4a ff             	mov    %cl,-0x1(%edx)
8010485c:	84 c9                	test   %cl,%cl
8010485e:	74 04                	je     80104864 <safestrcpy+0x34>
80104860:	39 d8                	cmp    %ebx,%eax
80104862:	75 ec                	jne    80104850 <safestrcpy+0x20>
80104864:	c6 02 00             	movb   $0x0,(%edx)
80104867:	89 f0                	mov    %esi,%eax
80104869:	5b                   	pop    %ebx
8010486a:	5e                   	pop    %esi
8010486b:	5d                   	pop    %ebp
8010486c:	c3                   	ret    
8010486d:	8d 76 00             	lea    0x0(%esi),%esi

80104870 <strlen>:
80104870:	f3 0f 1e fb          	endbr32 
80104874:	55                   	push   %ebp
80104875:	31 c0                	xor    %eax,%eax
80104877:	89 e5                	mov    %esp,%ebp
80104879:	8b 55 08             	mov    0x8(%ebp),%edx
8010487c:	80 3a 00             	cmpb   $0x0,(%edx)
8010487f:	74 10                	je     80104891 <strlen+0x21>
80104881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104888:	83 c0 01             	add    $0x1,%eax
8010488b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
8010488f:	75 f7                	jne    80104888 <strlen+0x18>
80104891:	5d                   	pop    %ebp
80104892:	c3                   	ret    

80104893 <swtch>:
80104893:	8b 44 24 04          	mov    0x4(%esp),%eax
80104897:	8b 54 24 08          	mov    0x8(%esp),%edx
8010489b:	55                   	push   %ebp
8010489c:	53                   	push   %ebx
8010489d:	56                   	push   %esi
8010489e:	57                   	push   %edi
8010489f:	89 20                	mov    %esp,(%eax)
801048a1:	89 d4                	mov    %edx,%esp
801048a3:	5f                   	pop    %edi
801048a4:	5e                   	pop    %esi
801048a5:	5b                   	pop    %ebx
801048a6:	5d                   	pop    %ebp
801048a7:	c3                   	ret    
801048a8:	66 90                	xchg   %ax,%ax
801048aa:	66 90                	xchg   %ax,%ax
801048ac:	66 90                	xchg   %ax,%ax
801048ae:	66 90                	xchg   %ax,%ax

801048b0 <fetchint>:
801048b0:	f3 0f 1e fb          	endbr32 
801048b4:	55                   	push   %ebp
801048b5:	89 e5                	mov    %esp,%ebp
801048b7:	53                   	push   %ebx
801048b8:	83 ec 04             	sub    $0x4,%esp
801048bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801048be:	e8 9d f0 ff ff       	call   80103960 <myproc>
801048c3:	8b 00                	mov    (%eax),%eax
801048c5:	39 d8                	cmp    %ebx,%eax
801048c7:	76 17                	jbe    801048e0 <fetchint+0x30>
801048c9:	8d 53 04             	lea    0x4(%ebx),%edx
801048cc:	39 d0                	cmp    %edx,%eax
801048ce:	72 10                	jb     801048e0 <fetchint+0x30>
801048d0:	8b 45 0c             	mov    0xc(%ebp),%eax
801048d3:	8b 13                	mov    (%ebx),%edx
801048d5:	89 10                	mov    %edx,(%eax)
801048d7:	31 c0                	xor    %eax,%eax
801048d9:	83 c4 04             	add    $0x4,%esp
801048dc:	5b                   	pop    %ebx
801048dd:	5d                   	pop    %ebp
801048de:	c3                   	ret    
801048df:	90                   	nop
801048e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801048e5:	eb f2                	jmp    801048d9 <fetchint+0x29>
801048e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048ee:	66 90                	xchg   %ax,%ax

801048f0 <fetchstr>:
801048f0:	f3 0f 1e fb          	endbr32 
801048f4:	55                   	push   %ebp
801048f5:	89 e5                	mov    %esp,%ebp
801048f7:	53                   	push   %ebx
801048f8:	83 ec 04             	sub    $0x4,%esp
801048fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801048fe:	e8 5d f0 ff ff       	call   80103960 <myproc>
80104903:	39 18                	cmp    %ebx,(%eax)
80104905:	76 31                	jbe    80104938 <fetchstr+0x48>
80104907:	8b 55 0c             	mov    0xc(%ebp),%edx
8010490a:	89 1a                	mov    %ebx,(%edx)
8010490c:	8b 10                	mov    (%eax),%edx
8010490e:	39 d3                	cmp    %edx,%ebx
80104910:	73 26                	jae    80104938 <fetchstr+0x48>
80104912:	89 d8                	mov    %ebx,%eax
80104914:	eb 11                	jmp    80104927 <fetchstr+0x37>
80104916:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010491d:	8d 76 00             	lea    0x0(%esi),%esi
80104920:	83 c0 01             	add    $0x1,%eax
80104923:	39 c2                	cmp    %eax,%edx
80104925:	76 11                	jbe    80104938 <fetchstr+0x48>
80104927:	80 38 00             	cmpb   $0x0,(%eax)
8010492a:	75 f4                	jne    80104920 <fetchstr+0x30>
8010492c:	83 c4 04             	add    $0x4,%esp
8010492f:	29 d8                	sub    %ebx,%eax
80104931:	5b                   	pop    %ebx
80104932:	5d                   	pop    %ebp
80104933:	c3                   	ret    
80104934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104938:	83 c4 04             	add    $0x4,%esp
8010493b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104940:	5b                   	pop    %ebx
80104941:	5d                   	pop    %ebp
80104942:	c3                   	ret    
80104943:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010494a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104950 <argint>:
80104950:	f3 0f 1e fb          	endbr32 
80104954:	55                   	push   %ebp
80104955:	89 e5                	mov    %esp,%ebp
80104957:	56                   	push   %esi
80104958:	53                   	push   %ebx
80104959:	e8 02 f0 ff ff       	call   80103960 <myproc>
8010495e:	8b 55 08             	mov    0x8(%ebp),%edx
80104961:	8b 40 18             	mov    0x18(%eax),%eax
80104964:	8b 40 44             	mov    0x44(%eax),%eax
80104967:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
8010496a:	e8 f1 ef ff ff       	call   80103960 <myproc>
8010496f:	8d 73 04             	lea    0x4(%ebx),%esi
80104972:	8b 00                	mov    (%eax),%eax
80104974:	39 c6                	cmp    %eax,%esi
80104976:	73 18                	jae    80104990 <argint+0x40>
80104978:	8d 53 08             	lea    0x8(%ebx),%edx
8010497b:	39 d0                	cmp    %edx,%eax
8010497d:	72 11                	jb     80104990 <argint+0x40>
8010497f:	8b 45 0c             	mov    0xc(%ebp),%eax
80104982:	8b 53 04             	mov    0x4(%ebx),%edx
80104985:	89 10                	mov    %edx,(%eax)
80104987:	31 c0                	xor    %eax,%eax
80104989:	5b                   	pop    %ebx
8010498a:	5e                   	pop    %esi
8010498b:	5d                   	pop    %ebp
8010498c:	c3                   	ret    
8010498d:	8d 76 00             	lea    0x0(%esi),%esi
80104990:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104995:	eb f2                	jmp    80104989 <argint+0x39>
80104997:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010499e:	66 90                	xchg   %ax,%ax

801049a0 <argptr>:
801049a0:	f3 0f 1e fb          	endbr32 
801049a4:	55                   	push   %ebp
801049a5:	89 e5                	mov    %esp,%ebp
801049a7:	56                   	push   %esi
801049a8:	53                   	push   %ebx
801049a9:	83 ec 10             	sub    $0x10,%esp
801049ac:	8b 5d 10             	mov    0x10(%ebp),%ebx
801049af:	e8 ac ef ff ff       	call   80103960 <myproc>
801049b4:	83 ec 08             	sub    $0x8,%esp
801049b7:	89 c6                	mov    %eax,%esi
801049b9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049bc:	50                   	push   %eax
801049bd:	ff 75 08             	pushl  0x8(%ebp)
801049c0:	e8 8b ff ff ff       	call   80104950 <argint>
801049c5:	83 c4 10             	add    $0x10,%esp
801049c8:	85 c0                	test   %eax,%eax
801049ca:	78 24                	js     801049f0 <argptr+0x50>
801049cc:	85 db                	test   %ebx,%ebx
801049ce:	78 20                	js     801049f0 <argptr+0x50>
801049d0:	8b 16                	mov    (%esi),%edx
801049d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801049d5:	39 c2                	cmp    %eax,%edx
801049d7:	76 17                	jbe    801049f0 <argptr+0x50>
801049d9:	01 c3                	add    %eax,%ebx
801049db:	39 da                	cmp    %ebx,%edx
801049dd:	72 11                	jb     801049f0 <argptr+0x50>
801049df:	8b 55 0c             	mov    0xc(%ebp),%edx
801049e2:	89 02                	mov    %eax,(%edx)
801049e4:	31 c0                	xor    %eax,%eax
801049e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801049e9:	5b                   	pop    %ebx
801049ea:	5e                   	pop    %esi
801049eb:	5d                   	pop    %ebp
801049ec:	c3                   	ret    
801049ed:	8d 76 00             	lea    0x0(%esi),%esi
801049f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049f5:	eb ef                	jmp    801049e6 <argptr+0x46>
801049f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049fe:	66 90                	xchg   %ax,%ax

80104a00 <argstr>:
80104a00:	f3 0f 1e fb          	endbr32 
80104a04:	55                   	push   %ebp
80104a05:	89 e5                	mov    %esp,%ebp
80104a07:	83 ec 20             	sub    $0x20,%esp
80104a0a:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a0d:	50                   	push   %eax
80104a0e:	ff 75 08             	pushl  0x8(%ebp)
80104a11:	e8 3a ff ff ff       	call   80104950 <argint>
80104a16:	83 c4 10             	add    $0x10,%esp
80104a19:	85 c0                	test   %eax,%eax
80104a1b:	78 13                	js     80104a30 <argstr+0x30>
80104a1d:	83 ec 08             	sub    $0x8,%esp
80104a20:	ff 75 0c             	pushl  0xc(%ebp)
80104a23:	ff 75 f4             	pushl  -0xc(%ebp)
80104a26:	e8 c5 fe ff ff       	call   801048f0 <fetchstr>
80104a2b:	83 c4 10             	add    $0x10,%esp
80104a2e:	c9                   	leave  
80104a2f:	c3                   	ret    
80104a30:	c9                   	leave  
80104a31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a36:	c3                   	ret    
80104a37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a3e:	66 90                	xchg   %ax,%ax

80104a40 <syscall>:
80104a40:	f3 0f 1e fb          	endbr32 
80104a44:	55                   	push   %ebp
80104a45:	89 e5                	mov    %esp,%ebp
80104a47:	53                   	push   %ebx
80104a48:	83 ec 04             	sub    $0x4,%esp
80104a4b:	e8 10 ef ff ff       	call   80103960 <myproc>
80104a50:	89 c3                	mov    %eax,%ebx
80104a52:	8b 40 18             	mov    0x18(%eax),%eax
80104a55:	8b 40 1c             	mov    0x1c(%eax),%eax
80104a58:	8d 50 ff             	lea    -0x1(%eax),%edx
80104a5b:	83 fa 14             	cmp    $0x14,%edx
80104a5e:	77 20                	ja     80104a80 <syscall+0x40>
80104a60:	8b 14 85 a0 77 10 80 	mov    -0x7fef8860(,%eax,4),%edx
80104a67:	85 d2                	test   %edx,%edx
80104a69:	74 15                	je     80104a80 <syscall+0x40>
80104a6b:	ff d2                	call   *%edx
80104a6d:	89 c2                	mov    %eax,%edx
80104a6f:	8b 43 18             	mov    0x18(%ebx),%eax
80104a72:	89 50 1c             	mov    %edx,0x1c(%eax)
80104a75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a78:	c9                   	leave  
80104a79:	c3                   	ret    
80104a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a80:	50                   	push   %eax
80104a81:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104a84:	50                   	push   %eax
80104a85:	ff 73 10             	pushl  0x10(%ebx)
80104a88:	68 7d 77 10 80       	push   $0x8010777d
80104a8d:	e8 1e bc ff ff       	call   801006b0 <cprintf>
80104a92:	8b 43 18             	mov    0x18(%ebx),%eax
80104a95:	83 c4 10             	add    $0x10,%esp
80104a98:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104a9f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104aa2:	c9                   	leave  
80104aa3:	c3                   	ret    
80104aa4:	66 90                	xchg   %ax,%ax
80104aa6:	66 90                	xchg   %ax,%ax
80104aa8:	66 90                	xchg   %ax,%ax
80104aaa:	66 90                	xchg   %ax,%ax
80104aac:	66 90                	xchg   %ax,%ax
80104aae:	66 90                	xchg   %ax,%ax

80104ab0 <create>:
80104ab0:	55                   	push   %ebp
80104ab1:	89 e5                	mov    %esp,%ebp
80104ab3:	57                   	push   %edi
80104ab4:	56                   	push   %esi
80104ab5:	8d 7d da             	lea    -0x26(%ebp),%edi
80104ab8:	53                   	push   %ebx
80104ab9:	83 ec 34             	sub    $0x34,%esp
80104abc:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104abf:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104ac2:	57                   	push   %edi
80104ac3:	50                   	push   %eax
80104ac4:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104ac7:	89 4d cc             	mov    %ecx,-0x34(%ebp)
80104aca:	e8 81 d5 ff ff       	call   80102050 <nameiparent>
80104acf:	83 c4 10             	add    $0x10,%esp
80104ad2:	85 c0                	test   %eax,%eax
80104ad4:	0f 84 46 01 00 00    	je     80104c20 <create+0x170>
80104ada:	83 ec 0c             	sub    $0xc,%esp
80104add:	89 c3                	mov    %eax,%ebx
80104adf:	50                   	push   %eax
80104ae0:	e8 7b cc ff ff       	call   80101760 <ilock>
80104ae5:	83 c4 0c             	add    $0xc,%esp
80104ae8:	6a 00                	push   $0x0
80104aea:	57                   	push   %edi
80104aeb:	53                   	push   %ebx
80104aec:	e8 bf d1 ff ff       	call   80101cb0 <dirlookup>
80104af1:	83 c4 10             	add    $0x10,%esp
80104af4:	89 c6                	mov    %eax,%esi
80104af6:	85 c0                	test   %eax,%eax
80104af8:	74 56                	je     80104b50 <create+0xa0>
80104afa:	83 ec 0c             	sub    $0xc,%esp
80104afd:	53                   	push   %ebx
80104afe:	e8 fd ce ff ff       	call   80101a00 <iunlockput>
80104b03:	89 34 24             	mov    %esi,(%esp)
80104b06:	e8 55 cc ff ff       	call   80101760 <ilock>
80104b0b:	83 c4 10             	add    $0x10,%esp
80104b0e:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104b13:	75 1b                	jne    80104b30 <create+0x80>
80104b15:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
80104b1a:	75 14                	jne    80104b30 <create+0x80>
80104b1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b1f:	89 f0                	mov    %esi,%eax
80104b21:	5b                   	pop    %ebx
80104b22:	5e                   	pop    %esi
80104b23:	5f                   	pop    %edi
80104b24:	5d                   	pop    %ebp
80104b25:	c3                   	ret    
80104b26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b2d:	8d 76 00             	lea    0x0(%esi),%esi
80104b30:	83 ec 0c             	sub    $0xc,%esp
80104b33:	56                   	push   %esi
80104b34:	31 f6                	xor    %esi,%esi
80104b36:	e8 c5 ce ff ff       	call   80101a00 <iunlockput>
80104b3b:	83 c4 10             	add    $0x10,%esp
80104b3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b41:	89 f0                	mov    %esi,%eax
80104b43:	5b                   	pop    %ebx
80104b44:	5e                   	pop    %esi
80104b45:	5f                   	pop    %edi
80104b46:	5d                   	pop    %ebp
80104b47:	c3                   	ret    
80104b48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b4f:	90                   	nop
80104b50:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104b54:	83 ec 08             	sub    $0x8,%esp
80104b57:	50                   	push   %eax
80104b58:	ff 33                	pushl  (%ebx)
80104b5a:	e8 81 ca ff ff       	call   801015e0 <ialloc>
80104b5f:	83 c4 10             	add    $0x10,%esp
80104b62:	89 c6                	mov    %eax,%esi
80104b64:	85 c0                	test   %eax,%eax
80104b66:	0f 84 cd 00 00 00    	je     80104c39 <create+0x189>
80104b6c:	83 ec 0c             	sub    $0xc,%esp
80104b6f:	50                   	push   %eax
80104b70:	e8 eb cb ff ff       	call   80101760 <ilock>
80104b75:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104b79:	66 89 46 52          	mov    %ax,0x52(%esi)
80104b7d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104b81:	66 89 46 54          	mov    %ax,0x54(%esi)
80104b85:	b8 01 00 00 00       	mov    $0x1,%eax
80104b8a:	66 89 46 56          	mov    %ax,0x56(%esi)
80104b8e:	89 34 24             	mov    %esi,(%esp)
80104b91:	e8 0a cb ff ff       	call   801016a0 <iupdate>
80104b96:	83 c4 10             	add    $0x10,%esp
80104b99:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104b9e:	74 30                	je     80104bd0 <create+0x120>
80104ba0:	83 ec 04             	sub    $0x4,%esp
80104ba3:	ff 76 04             	pushl  0x4(%esi)
80104ba6:	57                   	push   %edi
80104ba7:	53                   	push   %ebx
80104ba8:	e8 c3 d3 ff ff       	call   80101f70 <dirlink>
80104bad:	83 c4 10             	add    $0x10,%esp
80104bb0:	85 c0                	test   %eax,%eax
80104bb2:	78 78                	js     80104c2c <create+0x17c>
80104bb4:	83 ec 0c             	sub    $0xc,%esp
80104bb7:	53                   	push   %ebx
80104bb8:	e8 43 ce ff ff       	call   80101a00 <iunlockput>
80104bbd:	83 c4 10             	add    $0x10,%esp
80104bc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104bc3:	89 f0                	mov    %esi,%eax
80104bc5:	5b                   	pop    %ebx
80104bc6:	5e                   	pop    %esi
80104bc7:	5f                   	pop    %edi
80104bc8:	5d                   	pop    %ebp
80104bc9:	c3                   	ret    
80104bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104bd0:	83 ec 0c             	sub    $0xc,%esp
80104bd3:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104bd8:	53                   	push   %ebx
80104bd9:	e8 c2 ca ff ff       	call   801016a0 <iupdate>
80104bde:	83 c4 0c             	add    $0xc,%esp
80104be1:	ff 76 04             	pushl  0x4(%esi)
80104be4:	68 14 78 10 80       	push   $0x80107814
80104be9:	56                   	push   %esi
80104bea:	e8 81 d3 ff ff       	call   80101f70 <dirlink>
80104bef:	83 c4 10             	add    $0x10,%esp
80104bf2:	85 c0                	test   %eax,%eax
80104bf4:	78 18                	js     80104c0e <create+0x15e>
80104bf6:	83 ec 04             	sub    $0x4,%esp
80104bf9:	ff 73 04             	pushl  0x4(%ebx)
80104bfc:	68 13 78 10 80       	push   $0x80107813
80104c01:	56                   	push   %esi
80104c02:	e8 69 d3 ff ff       	call   80101f70 <dirlink>
80104c07:	83 c4 10             	add    $0x10,%esp
80104c0a:	85 c0                	test   %eax,%eax
80104c0c:	79 92                	jns    80104ba0 <create+0xf0>
80104c0e:	83 ec 0c             	sub    $0xc,%esp
80104c11:	68 07 78 10 80       	push   $0x80107807
80104c16:	e8 75 b7 ff ff       	call   80100390 <panic>
80104c1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c1f:	90                   	nop
80104c20:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c23:	31 f6                	xor    %esi,%esi
80104c25:	5b                   	pop    %ebx
80104c26:	89 f0                	mov    %esi,%eax
80104c28:	5e                   	pop    %esi
80104c29:	5f                   	pop    %edi
80104c2a:	5d                   	pop    %ebp
80104c2b:	c3                   	ret    
80104c2c:	83 ec 0c             	sub    $0xc,%esp
80104c2f:	68 16 78 10 80       	push   $0x80107816
80104c34:	e8 57 b7 ff ff       	call   80100390 <panic>
80104c39:	83 ec 0c             	sub    $0xc,%esp
80104c3c:	68 f8 77 10 80       	push   $0x801077f8
80104c41:	e8 4a b7 ff ff       	call   80100390 <panic>
80104c46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c4d:	8d 76 00             	lea    0x0(%esi),%esi

80104c50 <argfd.constprop.0>:
80104c50:	55                   	push   %ebp
80104c51:	89 e5                	mov    %esp,%ebp
80104c53:	56                   	push   %esi
80104c54:	89 d6                	mov    %edx,%esi
80104c56:	53                   	push   %ebx
80104c57:	89 c3                	mov    %eax,%ebx
80104c59:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c5c:	83 ec 18             	sub    $0x18,%esp
80104c5f:	50                   	push   %eax
80104c60:	6a 00                	push   $0x0
80104c62:	e8 e9 fc ff ff       	call   80104950 <argint>
80104c67:	83 c4 10             	add    $0x10,%esp
80104c6a:	85 c0                	test   %eax,%eax
80104c6c:	78 2a                	js     80104c98 <argfd.constprop.0+0x48>
80104c6e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104c72:	77 24                	ja     80104c98 <argfd.constprop.0+0x48>
80104c74:	e8 e7 ec ff ff       	call   80103960 <myproc>
80104c79:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104c7c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104c80:	85 c0                	test   %eax,%eax
80104c82:	74 14                	je     80104c98 <argfd.constprop.0+0x48>
80104c84:	85 db                	test   %ebx,%ebx
80104c86:	74 02                	je     80104c8a <argfd.constprop.0+0x3a>
80104c88:	89 13                	mov    %edx,(%ebx)
80104c8a:	89 06                	mov    %eax,(%esi)
80104c8c:	31 c0                	xor    %eax,%eax
80104c8e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c91:	5b                   	pop    %ebx
80104c92:	5e                   	pop    %esi
80104c93:	5d                   	pop    %ebp
80104c94:	c3                   	ret    
80104c95:	8d 76 00             	lea    0x0(%esi),%esi
80104c98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c9d:	eb ef                	jmp    80104c8e <argfd.constprop.0+0x3e>
80104c9f:	90                   	nop

80104ca0 <sys_dup>:
80104ca0:	f3 0f 1e fb          	endbr32 
80104ca4:	55                   	push   %ebp
80104ca5:	31 c0                	xor    %eax,%eax
80104ca7:	89 e5                	mov    %esp,%ebp
80104ca9:	56                   	push   %esi
80104caa:	53                   	push   %ebx
80104cab:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104cae:	83 ec 10             	sub    $0x10,%esp
80104cb1:	e8 9a ff ff ff       	call   80104c50 <argfd.constprop.0>
80104cb6:	85 c0                	test   %eax,%eax
80104cb8:	78 1e                	js     80104cd8 <sys_dup+0x38>
80104cba:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104cbd:	31 db                	xor    %ebx,%ebx
80104cbf:	e8 9c ec ff ff       	call   80103960 <myproc>
80104cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104cc8:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104ccc:	85 d2                	test   %edx,%edx
80104cce:	74 20                	je     80104cf0 <sys_dup+0x50>
80104cd0:	83 c3 01             	add    $0x1,%ebx
80104cd3:	83 fb 10             	cmp    $0x10,%ebx
80104cd6:	75 f0                	jne    80104cc8 <sys_dup+0x28>
80104cd8:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104cdb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104ce0:	89 d8                	mov    %ebx,%eax
80104ce2:	5b                   	pop    %ebx
80104ce3:	5e                   	pop    %esi
80104ce4:	5d                   	pop    %ebp
80104ce5:	c3                   	ret    
80104ce6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ced:	8d 76 00             	lea    0x0(%esi),%esi
80104cf0:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104cf4:	83 ec 0c             	sub    $0xc,%esp
80104cf7:	ff 75 f4             	pushl  -0xc(%ebp)
80104cfa:	e8 71 c1 ff ff       	call   80100e70 <filedup>
80104cff:	83 c4 10             	add    $0x10,%esp
80104d02:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d05:	89 d8                	mov    %ebx,%eax
80104d07:	5b                   	pop    %ebx
80104d08:	5e                   	pop    %esi
80104d09:	5d                   	pop    %ebp
80104d0a:	c3                   	ret    
80104d0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d0f:	90                   	nop

80104d10 <sys_read>:
80104d10:	f3 0f 1e fb          	endbr32 
80104d14:	55                   	push   %ebp
80104d15:	31 c0                	xor    %eax,%eax
80104d17:	89 e5                	mov    %esp,%ebp
80104d19:	83 ec 18             	sub    $0x18,%esp
80104d1c:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d1f:	e8 2c ff ff ff       	call   80104c50 <argfd.constprop.0>
80104d24:	85 c0                	test   %eax,%eax
80104d26:	78 48                	js     80104d70 <sys_read+0x60>
80104d28:	83 ec 08             	sub    $0x8,%esp
80104d2b:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d2e:	50                   	push   %eax
80104d2f:	6a 02                	push   $0x2
80104d31:	e8 1a fc ff ff       	call   80104950 <argint>
80104d36:	83 c4 10             	add    $0x10,%esp
80104d39:	85 c0                	test   %eax,%eax
80104d3b:	78 33                	js     80104d70 <sys_read+0x60>
80104d3d:	83 ec 04             	sub    $0x4,%esp
80104d40:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d43:	ff 75 f0             	pushl  -0x10(%ebp)
80104d46:	50                   	push   %eax
80104d47:	6a 01                	push   $0x1
80104d49:	e8 52 fc ff ff       	call   801049a0 <argptr>
80104d4e:	83 c4 10             	add    $0x10,%esp
80104d51:	85 c0                	test   %eax,%eax
80104d53:	78 1b                	js     80104d70 <sys_read+0x60>
80104d55:	83 ec 04             	sub    $0x4,%esp
80104d58:	ff 75 f0             	pushl  -0x10(%ebp)
80104d5b:	ff 75 f4             	pushl  -0xc(%ebp)
80104d5e:	ff 75 ec             	pushl  -0x14(%ebp)
80104d61:	e8 8a c2 ff ff       	call   80100ff0 <fileread>
80104d66:	83 c4 10             	add    $0x10,%esp
80104d69:	c9                   	leave  
80104d6a:	c3                   	ret    
80104d6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d6f:	90                   	nop
80104d70:	c9                   	leave  
80104d71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d76:	c3                   	ret    
80104d77:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d7e:	66 90                	xchg   %ax,%ax

80104d80 <sys_write>:
80104d80:	f3 0f 1e fb          	endbr32 
80104d84:	55                   	push   %ebp
80104d85:	31 c0                	xor    %eax,%eax
80104d87:	89 e5                	mov    %esp,%ebp
80104d89:	83 ec 18             	sub    $0x18,%esp
80104d8c:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d8f:	e8 bc fe ff ff       	call   80104c50 <argfd.constprop.0>
80104d94:	85 c0                	test   %eax,%eax
80104d96:	78 48                	js     80104de0 <sys_write+0x60>
80104d98:	83 ec 08             	sub    $0x8,%esp
80104d9b:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d9e:	50                   	push   %eax
80104d9f:	6a 02                	push   $0x2
80104da1:	e8 aa fb ff ff       	call   80104950 <argint>
80104da6:	83 c4 10             	add    $0x10,%esp
80104da9:	85 c0                	test   %eax,%eax
80104dab:	78 33                	js     80104de0 <sys_write+0x60>
80104dad:	83 ec 04             	sub    $0x4,%esp
80104db0:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104db3:	ff 75 f0             	pushl  -0x10(%ebp)
80104db6:	50                   	push   %eax
80104db7:	6a 01                	push   $0x1
80104db9:	e8 e2 fb ff ff       	call   801049a0 <argptr>
80104dbe:	83 c4 10             	add    $0x10,%esp
80104dc1:	85 c0                	test   %eax,%eax
80104dc3:	78 1b                	js     80104de0 <sys_write+0x60>
80104dc5:	83 ec 04             	sub    $0x4,%esp
80104dc8:	ff 75 f0             	pushl  -0x10(%ebp)
80104dcb:	ff 75 f4             	pushl  -0xc(%ebp)
80104dce:	ff 75 ec             	pushl  -0x14(%ebp)
80104dd1:	e8 ba c2 ff ff       	call   80101090 <filewrite>
80104dd6:	83 c4 10             	add    $0x10,%esp
80104dd9:	c9                   	leave  
80104dda:	c3                   	ret    
80104ddb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ddf:	90                   	nop
80104de0:	c9                   	leave  
80104de1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104de6:	c3                   	ret    
80104de7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104dee:	66 90                	xchg   %ax,%ax

80104df0 <sys_close>:
80104df0:	f3 0f 1e fb          	endbr32 
80104df4:	55                   	push   %ebp
80104df5:	89 e5                	mov    %esp,%ebp
80104df7:	83 ec 18             	sub    $0x18,%esp
80104dfa:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104dfd:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e00:	e8 4b fe ff ff       	call   80104c50 <argfd.constprop.0>
80104e05:	85 c0                	test   %eax,%eax
80104e07:	78 27                	js     80104e30 <sys_close+0x40>
80104e09:	e8 52 eb ff ff       	call   80103960 <myproc>
80104e0e:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104e11:	83 ec 0c             	sub    $0xc,%esp
80104e14:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104e1b:	00 
80104e1c:	ff 75 f4             	pushl  -0xc(%ebp)
80104e1f:	e8 9c c0 ff ff       	call   80100ec0 <fileclose>
80104e24:	83 c4 10             	add    $0x10,%esp
80104e27:	31 c0                	xor    %eax,%eax
80104e29:	c9                   	leave  
80104e2a:	c3                   	ret    
80104e2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104e2f:	90                   	nop
80104e30:	c9                   	leave  
80104e31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e36:	c3                   	ret    
80104e37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104e3e:	66 90                	xchg   %ax,%ax

80104e40 <sys_fstat>:
80104e40:	f3 0f 1e fb          	endbr32 
80104e44:	55                   	push   %ebp
80104e45:	31 c0                	xor    %eax,%eax
80104e47:	89 e5                	mov    %esp,%ebp
80104e49:	83 ec 18             	sub    $0x18,%esp
80104e4c:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104e4f:	e8 fc fd ff ff       	call   80104c50 <argfd.constprop.0>
80104e54:	85 c0                	test   %eax,%eax
80104e56:	78 30                	js     80104e88 <sys_fstat+0x48>
80104e58:	83 ec 04             	sub    $0x4,%esp
80104e5b:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e5e:	6a 14                	push   $0x14
80104e60:	50                   	push   %eax
80104e61:	6a 01                	push   $0x1
80104e63:	e8 38 fb ff ff       	call   801049a0 <argptr>
80104e68:	83 c4 10             	add    $0x10,%esp
80104e6b:	85 c0                	test   %eax,%eax
80104e6d:	78 19                	js     80104e88 <sys_fstat+0x48>
80104e6f:	83 ec 08             	sub    $0x8,%esp
80104e72:	ff 75 f4             	pushl  -0xc(%ebp)
80104e75:	ff 75 f0             	pushl  -0x10(%ebp)
80104e78:	e8 23 c1 ff ff       	call   80100fa0 <filestat>
80104e7d:	83 c4 10             	add    $0x10,%esp
80104e80:	c9                   	leave  
80104e81:	c3                   	ret    
80104e82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e88:	c9                   	leave  
80104e89:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e8e:	c3                   	ret    
80104e8f:	90                   	nop

80104e90 <sys_link>:
80104e90:	f3 0f 1e fb          	endbr32 
80104e94:	55                   	push   %ebp
80104e95:	89 e5                	mov    %esp,%ebp
80104e97:	57                   	push   %edi
80104e98:	56                   	push   %esi
80104e99:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104e9c:	53                   	push   %ebx
80104e9d:	83 ec 34             	sub    $0x34,%esp
80104ea0:	50                   	push   %eax
80104ea1:	6a 00                	push   $0x0
80104ea3:	e8 58 fb ff ff       	call   80104a00 <argstr>
80104ea8:	83 c4 10             	add    $0x10,%esp
80104eab:	85 c0                	test   %eax,%eax
80104ead:	0f 88 ff 00 00 00    	js     80104fb2 <sys_link+0x122>
80104eb3:	83 ec 08             	sub    $0x8,%esp
80104eb6:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104eb9:	50                   	push   %eax
80104eba:	6a 01                	push   $0x1
80104ebc:	e8 3f fb ff ff       	call   80104a00 <argstr>
80104ec1:	83 c4 10             	add    $0x10,%esp
80104ec4:	85 c0                	test   %eax,%eax
80104ec6:	0f 88 e6 00 00 00    	js     80104fb2 <sys_link+0x122>
80104ecc:	e8 5f de ff ff       	call   80102d30 <begin_op>
80104ed1:	83 ec 0c             	sub    $0xc,%esp
80104ed4:	ff 75 d4             	pushl  -0x2c(%ebp)
80104ed7:	e8 54 d1 ff ff       	call   80102030 <namei>
80104edc:	83 c4 10             	add    $0x10,%esp
80104edf:	89 c3                	mov    %eax,%ebx
80104ee1:	85 c0                	test   %eax,%eax
80104ee3:	0f 84 e8 00 00 00    	je     80104fd1 <sys_link+0x141>
80104ee9:	83 ec 0c             	sub    $0xc,%esp
80104eec:	50                   	push   %eax
80104eed:	e8 6e c8 ff ff       	call   80101760 <ilock>
80104ef2:	83 c4 10             	add    $0x10,%esp
80104ef5:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104efa:	0f 84 b9 00 00 00    	je     80104fb9 <sys_link+0x129>
80104f00:	83 ec 0c             	sub    $0xc,%esp
80104f03:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104f08:	8d 7d da             	lea    -0x26(%ebp),%edi
80104f0b:	53                   	push   %ebx
80104f0c:	e8 8f c7 ff ff       	call   801016a0 <iupdate>
80104f11:	89 1c 24             	mov    %ebx,(%esp)
80104f14:	e8 27 c9 ff ff       	call   80101840 <iunlock>
80104f19:	58                   	pop    %eax
80104f1a:	5a                   	pop    %edx
80104f1b:	57                   	push   %edi
80104f1c:	ff 75 d0             	pushl  -0x30(%ebp)
80104f1f:	e8 2c d1 ff ff       	call   80102050 <nameiparent>
80104f24:	83 c4 10             	add    $0x10,%esp
80104f27:	89 c6                	mov    %eax,%esi
80104f29:	85 c0                	test   %eax,%eax
80104f2b:	74 5f                	je     80104f8c <sys_link+0xfc>
80104f2d:	83 ec 0c             	sub    $0xc,%esp
80104f30:	50                   	push   %eax
80104f31:	e8 2a c8 ff ff       	call   80101760 <ilock>
80104f36:	8b 03                	mov    (%ebx),%eax
80104f38:	83 c4 10             	add    $0x10,%esp
80104f3b:	39 06                	cmp    %eax,(%esi)
80104f3d:	75 41                	jne    80104f80 <sys_link+0xf0>
80104f3f:	83 ec 04             	sub    $0x4,%esp
80104f42:	ff 73 04             	pushl  0x4(%ebx)
80104f45:	57                   	push   %edi
80104f46:	56                   	push   %esi
80104f47:	e8 24 d0 ff ff       	call   80101f70 <dirlink>
80104f4c:	83 c4 10             	add    $0x10,%esp
80104f4f:	85 c0                	test   %eax,%eax
80104f51:	78 2d                	js     80104f80 <sys_link+0xf0>
80104f53:	83 ec 0c             	sub    $0xc,%esp
80104f56:	56                   	push   %esi
80104f57:	e8 a4 ca ff ff       	call   80101a00 <iunlockput>
80104f5c:	89 1c 24             	mov    %ebx,(%esp)
80104f5f:	e8 2c c9 ff ff       	call   80101890 <iput>
80104f64:	e8 37 de ff ff       	call   80102da0 <end_op>
80104f69:	83 c4 10             	add    $0x10,%esp
80104f6c:	31 c0                	xor    %eax,%eax
80104f6e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f71:	5b                   	pop    %ebx
80104f72:	5e                   	pop    %esi
80104f73:	5f                   	pop    %edi
80104f74:	5d                   	pop    %ebp
80104f75:	c3                   	ret    
80104f76:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104f7d:	8d 76 00             	lea    0x0(%esi),%esi
80104f80:	83 ec 0c             	sub    $0xc,%esp
80104f83:	56                   	push   %esi
80104f84:	e8 77 ca ff ff       	call   80101a00 <iunlockput>
80104f89:	83 c4 10             	add    $0x10,%esp
80104f8c:	83 ec 0c             	sub    $0xc,%esp
80104f8f:	53                   	push   %ebx
80104f90:	e8 cb c7 ff ff       	call   80101760 <ilock>
80104f95:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104f9a:	89 1c 24             	mov    %ebx,(%esp)
80104f9d:	e8 fe c6 ff ff       	call   801016a0 <iupdate>
80104fa2:	89 1c 24             	mov    %ebx,(%esp)
80104fa5:	e8 56 ca ff ff       	call   80101a00 <iunlockput>
80104faa:	e8 f1 dd ff ff       	call   80102da0 <end_op>
80104faf:	83 c4 10             	add    $0x10,%esp
80104fb2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fb7:	eb b5                	jmp    80104f6e <sys_link+0xde>
80104fb9:	83 ec 0c             	sub    $0xc,%esp
80104fbc:	53                   	push   %ebx
80104fbd:	e8 3e ca ff ff       	call   80101a00 <iunlockput>
80104fc2:	e8 d9 dd ff ff       	call   80102da0 <end_op>
80104fc7:	83 c4 10             	add    $0x10,%esp
80104fca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fcf:	eb 9d                	jmp    80104f6e <sys_link+0xde>
80104fd1:	e8 ca dd ff ff       	call   80102da0 <end_op>
80104fd6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fdb:	eb 91                	jmp    80104f6e <sys_link+0xde>
80104fdd:	8d 76 00             	lea    0x0(%esi),%esi

80104fe0 <sys_unlink>:
80104fe0:	f3 0f 1e fb          	endbr32 
80104fe4:	55                   	push   %ebp
80104fe5:	89 e5                	mov    %esp,%ebp
80104fe7:	57                   	push   %edi
80104fe8:	56                   	push   %esi
80104fe9:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104fec:	53                   	push   %ebx
80104fed:	83 ec 54             	sub    $0x54,%esp
80104ff0:	50                   	push   %eax
80104ff1:	6a 00                	push   $0x0
80104ff3:	e8 08 fa ff ff       	call   80104a00 <argstr>
80104ff8:	83 c4 10             	add    $0x10,%esp
80104ffb:	85 c0                	test   %eax,%eax
80104ffd:	0f 88 7d 01 00 00    	js     80105180 <sys_unlink+0x1a0>
80105003:	e8 28 dd ff ff       	call   80102d30 <begin_op>
80105008:	8d 5d ca             	lea    -0x36(%ebp),%ebx
8010500b:	83 ec 08             	sub    $0x8,%esp
8010500e:	53                   	push   %ebx
8010500f:	ff 75 c0             	pushl  -0x40(%ebp)
80105012:	e8 39 d0 ff ff       	call   80102050 <nameiparent>
80105017:	83 c4 10             	add    $0x10,%esp
8010501a:	89 c6                	mov    %eax,%esi
8010501c:	85 c0                	test   %eax,%eax
8010501e:	0f 84 66 01 00 00    	je     8010518a <sys_unlink+0x1aa>
80105024:	83 ec 0c             	sub    $0xc,%esp
80105027:	50                   	push   %eax
80105028:	e8 33 c7 ff ff       	call   80101760 <ilock>
8010502d:	58                   	pop    %eax
8010502e:	5a                   	pop    %edx
8010502f:	68 14 78 10 80       	push   $0x80107814
80105034:	53                   	push   %ebx
80105035:	e8 56 cc ff ff       	call   80101c90 <namecmp>
8010503a:	83 c4 10             	add    $0x10,%esp
8010503d:	85 c0                	test   %eax,%eax
8010503f:	0f 84 03 01 00 00    	je     80105148 <sys_unlink+0x168>
80105045:	83 ec 08             	sub    $0x8,%esp
80105048:	68 13 78 10 80       	push   $0x80107813
8010504d:	53                   	push   %ebx
8010504e:	e8 3d cc ff ff       	call   80101c90 <namecmp>
80105053:	83 c4 10             	add    $0x10,%esp
80105056:	85 c0                	test   %eax,%eax
80105058:	0f 84 ea 00 00 00    	je     80105148 <sys_unlink+0x168>
8010505e:	83 ec 04             	sub    $0x4,%esp
80105061:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80105064:	50                   	push   %eax
80105065:	53                   	push   %ebx
80105066:	56                   	push   %esi
80105067:	e8 44 cc ff ff       	call   80101cb0 <dirlookup>
8010506c:	83 c4 10             	add    $0x10,%esp
8010506f:	89 c3                	mov    %eax,%ebx
80105071:	85 c0                	test   %eax,%eax
80105073:	0f 84 cf 00 00 00    	je     80105148 <sys_unlink+0x168>
80105079:	83 ec 0c             	sub    $0xc,%esp
8010507c:	50                   	push   %eax
8010507d:	e8 de c6 ff ff       	call   80101760 <ilock>
80105082:	83 c4 10             	add    $0x10,%esp
80105085:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010508a:	0f 8e 23 01 00 00    	jle    801051b3 <sys_unlink+0x1d3>
80105090:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105095:	8d 7d d8             	lea    -0x28(%ebp),%edi
80105098:	74 66                	je     80105100 <sys_unlink+0x120>
8010509a:	83 ec 04             	sub    $0x4,%esp
8010509d:	6a 10                	push   $0x10
8010509f:	6a 00                	push   $0x0
801050a1:	57                   	push   %edi
801050a2:	e8 c9 f5 ff ff       	call   80104670 <memset>
801050a7:	6a 10                	push   $0x10
801050a9:	ff 75 c4             	pushl  -0x3c(%ebp)
801050ac:	57                   	push   %edi
801050ad:	56                   	push   %esi
801050ae:	e8 ad ca ff ff       	call   80101b60 <writei>
801050b3:	83 c4 20             	add    $0x20,%esp
801050b6:	83 f8 10             	cmp    $0x10,%eax
801050b9:	0f 85 e7 00 00 00    	jne    801051a6 <sys_unlink+0x1c6>
801050bf:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801050c4:	0f 84 96 00 00 00    	je     80105160 <sys_unlink+0x180>
801050ca:	83 ec 0c             	sub    $0xc,%esp
801050cd:	56                   	push   %esi
801050ce:	e8 2d c9 ff ff       	call   80101a00 <iunlockput>
801050d3:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
801050d8:	89 1c 24             	mov    %ebx,(%esp)
801050db:	e8 c0 c5 ff ff       	call   801016a0 <iupdate>
801050e0:	89 1c 24             	mov    %ebx,(%esp)
801050e3:	e8 18 c9 ff ff       	call   80101a00 <iunlockput>
801050e8:	e8 b3 dc ff ff       	call   80102da0 <end_op>
801050ed:	83 c4 10             	add    $0x10,%esp
801050f0:	31 c0                	xor    %eax,%eax
801050f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050f5:	5b                   	pop    %ebx
801050f6:	5e                   	pop    %esi
801050f7:	5f                   	pop    %edi
801050f8:	5d                   	pop    %ebp
801050f9:	c3                   	ret    
801050fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105100:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105104:	76 94                	jbe    8010509a <sys_unlink+0xba>
80105106:	ba 20 00 00 00       	mov    $0x20,%edx
8010510b:	eb 0b                	jmp    80105118 <sys_unlink+0x138>
8010510d:	8d 76 00             	lea    0x0(%esi),%esi
80105110:	83 c2 10             	add    $0x10,%edx
80105113:	39 53 58             	cmp    %edx,0x58(%ebx)
80105116:	76 82                	jbe    8010509a <sys_unlink+0xba>
80105118:	6a 10                	push   $0x10
8010511a:	52                   	push   %edx
8010511b:	57                   	push   %edi
8010511c:	53                   	push   %ebx
8010511d:	89 55 b4             	mov    %edx,-0x4c(%ebp)
80105120:	e8 3b c9 ff ff       	call   80101a60 <readi>
80105125:	83 c4 10             	add    $0x10,%esp
80105128:	8b 55 b4             	mov    -0x4c(%ebp),%edx
8010512b:	83 f8 10             	cmp    $0x10,%eax
8010512e:	75 69                	jne    80105199 <sys_unlink+0x1b9>
80105130:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105135:	74 d9                	je     80105110 <sys_unlink+0x130>
80105137:	83 ec 0c             	sub    $0xc,%esp
8010513a:	53                   	push   %ebx
8010513b:	e8 c0 c8 ff ff       	call   80101a00 <iunlockput>
80105140:	83 c4 10             	add    $0x10,%esp
80105143:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105147:	90                   	nop
80105148:	83 ec 0c             	sub    $0xc,%esp
8010514b:	56                   	push   %esi
8010514c:	e8 af c8 ff ff       	call   80101a00 <iunlockput>
80105151:	e8 4a dc ff ff       	call   80102da0 <end_op>
80105156:	83 c4 10             	add    $0x10,%esp
80105159:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010515e:	eb 92                	jmp    801050f2 <sys_unlink+0x112>
80105160:	83 ec 0c             	sub    $0xc,%esp
80105163:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
80105168:	56                   	push   %esi
80105169:	e8 32 c5 ff ff       	call   801016a0 <iupdate>
8010516e:	83 c4 10             	add    $0x10,%esp
80105171:	e9 54 ff ff ff       	jmp    801050ca <sys_unlink+0xea>
80105176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010517d:	8d 76 00             	lea    0x0(%esi),%esi
80105180:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105185:	e9 68 ff ff ff       	jmp    801050f2 <sys_unlink+0x112>
8010518a:	e8 11 dc ff ff       	call   80102da0 <end_op>
8010518f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105194:	e9 59 ff ff ff       	jmp    801050f2 <sys_unlink+0x112>
80105199:	83 ec 0c             	sub    $0xc,%esp
8010519c:	68 38 78 10 80       	push   $0x80107838
801051a1:	e8 ea b1 ff ff       	call   80100390 <panic>
801051a6:	83 ec 0c             	sub    $0xc,%esp
801051a9:	68 4a 78 10 80       	push   $0x8010784a
801051ae:	e8 dd b1 ff ff       	call   80100390 <panic>
801051b3:	83 ec 0c             	sub    $0xc,%esp
801051b6:	68 26 78 10 80       	push   $0x80107826
801051bb:	e8 d0 b1 ff ff       	call   80100390 <panic>

801051c0 <sys_open>:
801051c0:	f3 0f 1e fb          	endbr32 
801051c4:	55                   	push   %ebp
801051c5:	89 e5                	mov    %esp,%ebp
801051c7:	57                   	push   %edi
801051c8:	56                   	push   %esi
801051c9:	8d 45 e0             	lea    -0x20(%ebp),%eax
801051cc:	53                   	push   %ebx
801051cd:	83 ec 24             	sub    $0x24,%esp
801051d0:	50                   	push   %eax
801051d1:	6a 00                	push   $0x0
801051d3:	e8 28 f8 ff ff       	call   80104a00 <argstr>
801051d8:	83 c4 10             	add    $0x10,%esp
801051db:	85 c0                	test   %eax,%eax
801051dd:	0f 88 8a 00 00 00    	js     8010526d <sys_open+0xad>
801051e3:	83 ec 08             	sub    $0x8,%esp
801051e6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801051e9:	50                   	push   %eax
801051ea:	6a 01                	push   $0x1
801051ec:	e8 5f f7 ff ff       	call   80104950 <argint>
801051f1:	83 c4 10             	add    $0x10,%esp
801051f4:	85 c0                	test   %eax,%eax
801051f6:	78 75                	js     8010526d <sys_open+0xad>
801051f8:	e8 33 db ff ff       	call   80102d30 <begin_op>
801051fd:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105201:	75 75                	jne    80105278 <sys_open+0xb8>
80105203:	83 ec 0c             	sub    $0xc,%esp
80105206:	ff 75 e0             	pushl  -0x20(%ebp)
80105209:	e8 22 ce ff ff       	call   80102030 <namei>
8010520e:	83 c4 10             	add    $0x10,%esp
80105211:	89 c6                	mov    %eax,%esi
80105213:	85 c0                	test   %eax,%eax
80105215:	74 7e                	je     80105295 <sys_open+0xd5>
80105217:	83 ec 0c             	sub    $0xc,%esp
8010521a:	50                   	push   %eax
8010521b:	e8 40 c5 ff ff       	call   80101760 <ilock>
80105220:	83 c4 10             	add    $0x10,%esp
80105223:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105228:	0f 84 c2 00 00 00    	je     801052f0 <sys_open+0x130>
8010522e:	e8 cd bb ff ff       	call   80100e00 <filealloc>
80105233:	89 c7                	mov    %eax,%edi
80105235:	85 c0                	test   %eax,%eax
80105237:	74 23                	je     8010525c <sys_open+0x9c>
80105239:	e8 22 e7 ff ff       	call   80103960 <myproc>
8010523e:	31 db                	xor    %ebx,%ebx
80105240:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105244:	85 d2                	test   %edx,%edx
80105246:	74 60                	je     801052a8 <sys_open+0xe8>
80105248:	83 c3 01             	add    $0x1,%ebx
8010524b:	83 fb 10             	cmp    $0x10,%ebx
8010524e:	75 f0                	jne    80105240 <sys_open+0x80>
80105250:	83 ec 0c             	sub    $0xc,%esp
80105253:	57                   	push   %edi
80105254:	e8 67 bc ff ff       	call   80100ec0 <fileclose>
80105259:	83 c4 10             	add    $0x10,%esp
8010525c:	83 ec 0c             	sub    $0xc,%esp
8010525f:	56                   	push   %esi
80105260:	e8 9b c7 ff ff       	call   80101a00 <iunlockput>
80105265:	e8 36 db ff ff       	call   80102da0 <end_op>
8010526a:	83 c4 10             	add    $0x10,%esp
8010526d:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105272:	eb 6d                	jmp    801052e1 <sys_open+0x121>
80105274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105278:	83 ec 0c             	sub    $0xc,%esp
8010527b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010527e:	31 c9                	xor    %ecx,%ecx
80105280:	ba 02 00 00 00       	mov    $0x2,%edx
80105285:	6a 00                	push   $0x0
80105287:	e8 24 f8 ff ff       	call   80104ab0 <create>
8010528c:	83 c4 10             	add    $0x10,%esp
8010528f:	89 c6                	mov    %eax,%esi
80105291:	85 c0                	test   %eax,%eax
80105293:	75 99                	jne    8010522e <sys_open+0x6e>
80105295:	e8 06 db ff ff       	call   80102da0 <end_op>
8010529a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010529f:	eb 40                	jmp    801052e1 <sys_open+0x121>
801052a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801052a8:	83 ec 0c             	sub    $0xc,%esp
801052ab:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
801052af:	56                   	push   %esi
801052b0:	e8 8b c5 ff ff       	call   80101840 <iunlock>
801052b5:	e8 e6 da ff ff       	call   80102da0 <end_op>
801052ba:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801052c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801052c3:	83 c4 10             	add    $0x10,%esp
801052c6:	89 77 10             	mov    %esi,0x10(%edi)
801052c9:	89 d0                	mov    %edx,%eax
801052cb:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
801052d2:	f7 d0                	not    %eax
801052d4:	83 e0 01             	and    $0x1,%eax
801052d7:	83 e2 03             	and    $0x3,%edx
801052da:	88 47 08             	mov    %al,0x8(%edi)
801052dd:	0f 95 47 09          	setne  0x9(%edi)
801052e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801052e4:	89 d8                	mov    %ebx,%eax
801052e6:	5b                   	pop    %ebx
801052e7:	5e                   	pop    %esi
801052e8:	5f                   	pop    %edi
801052e9:	5d                   	pop    %ebp
801052ea:	c3                   	ret    
801052eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801052ef:	90                   	nop
801052f0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801052f3:	85 c9                	test   %ecx,%ecx
801052f5:	0f 84 33 ff ff ff    	je     8010522e <sys_open+0x6e>
801052fb:	e9 5c ff ff ff       	jmp    8010525c <sys_open+0x9c>

80105300 <sys_mkdir>:
80105300:	f3 0f 1e fb          	endbr32 
80105304:	55                   	push   %ebp
80105305:	89 e5                	mov    %esp,%ebp
80105307:	83 ec 18             	sub    $0x18,%esp
8010530a:	e8 21 da ff ff       	call   80102d30 <begin_op>
8010530f:	83 ec 08             	sub    $0x8,%esp
80105312:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105315:	50                   	push   %eax
80105316:	6a 00                	push   $0x0
80105318:	e8 e3 f6 ff ff       	call   80104a00 <argstr>
8010531d:	83 c4 10             	add    $0x10,%esp
80105320:	85 c0                	test   %eax,%eax
80105322:	78 34                	js     80105358 <sys_mkdir+0x58>
80105324:	83 ec 0c             	sub    $0xc,%esp
80105327:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010532a:	31 c9                	xor    %ecx,%ecx
8010532c:	ba 01 00 00 00       	mov    $0x1,%edx
80105331:	6a 00                	push   $0x0
80105333:	e8 78 f7 ff ff       	call   80104ab0 <create>
80105338:	83 c4 10             	add    $0x10,%esp
8010533b:	85 c0                	test   %eax,%eax
8010533d:	74 19                	je     80105358 <sys_mkdir+0x58>
8010533f:	83 ec 0c             	sub    $0xc,%esp
80105342:	50                   	push   %eax
80105343:	e8 b8 c6 ff ff       	call   80101a00 <iunlockput>
80105348:	e8 53 da ff ff       	call   80102da0 <end_op>
8010534d:	83 c4 10             	add    $0x10,%esp
80105350:	31 c0                	xor    %eax,%eax
80105352:	c9                   	leave  
80105353:	c3                   	ret    
80105354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105358:	e8 43 da ff ff       	call   80102da0 <end_op>
8010535d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105362:	c9                   	leave  
80105363:	c3                   	ret    
80105364:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010536b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010536f:	90                   	nop

80105370 <sys_mknod>:
80105370:	f3 0f 1e fb          	endbr32 
80105374:	55                   	push   %ebp
80105375:	89 e5                	mov    %esp,%ebp
80105377:	83 ec 18             	sub    $0x18,%esp
8010537a:	e8 b1 d9 ff ff       	call   80102d30 <begin_op>
8010537f:	83 ec 08             	sub    $0x8,%esp
80105382:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105385:	50                   	push   %eax
80105386:	6a 00                	push   $0x0
80105388:	e8 73 f6 ff ff       	call   80104a00 <argstr>
8010538d:	83 c4 10             	add    $0x10,%esp
80105390:	85 c0                	test   %eax,%eax
80105392:	78 64                	js     801053f8 <sys_mknod+0x88>
80105394:	83 ec 08             	sub    $0x8,%esp
80105397:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010539a:	50                   	push   %eax
8010539b:	6a 01                	push   $0x1
8010539d:	e8 ae f5 ff ff       	call   80104950 <argint>
801053a2:	83 c4 10             	add    $0x10,%esp
801053a5:	85 c0                	test   %eax,%eax
801053a7:	78 4f                	js     801053f8 <sys_mknod+0x88>
801053a9:	83 ec 08             	sub    $0x8,%esp
801053ac:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053af:	50                   	push   %eax
801053b0:	6a 02                	push   $0x2
801053b2:	e8 99 f5 ff ff       	call   80104950 <argint>
801053b7:	83 c4 10             	add    $0x10,%esp
801053ba:	85 c0                	test   %eax,%eax
801053bc:	78 3a                	js     801053f8 <sys_mknod+0x88>
801053be:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801053c2:	83 ec 0c             	sub    $0xc,%esp
801053c5:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801053c9:	ba 03 00 00 00       	mov    $0x3,%edx
801053ce:	50                   	push   %eax
801053cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
801053d2:	e8 d9 f6 ff ff       	call   80104ab0 <create>
801053d7:	83 c4 10             	add    $0x10,%esp
801053da:	85 c0                	test   %eax,%eax
801053dc:	74 1a                	je     801053f8 <sys_mknod+0x88>
801053de:	83 ec 0c             	sub    $0xc,%esp
801053e1:	50                   	push   %eax
801053e2:	e8 19 c6 ff ff       	call   80101a00 <iunlockput>
801053e7:	e8 b4 d9 ff ff       	call   80102da0 <end_op>
801053ec:	83 c4 10             	add    $0x10,%esp
801053ef:	31 c0                	xor    %eax,%eax
801053f1:	c9                   	leave  
801053f2:	c3                   	ret    
801053f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801053f7:	90                   	nop
801053f8:	e8 a3 d9 ff ff       	call   80102da0 <end_op>
801053fd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105402:	c9                   	leave  
80105403:	c3                   	ret    
80105404:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010540b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010540f:	90                   	nop

80105410 <sys_chdir>:
80105410:	f3 0f 1e fb          	endbr32 
80105414:	55                   	push   %ebp
80105415:	89 e5                	mov    %esp,%ebp
80105417:	56                   	push   %esi
80105418:	53                   	push   %ebx
80105419:	83 ec 10             	sub    $0x10,%esp
8010541c:	e8 3f e5 ff ff       	call   80103960 <myproc>
80105421:	89 c6                	mov    %eax,%esi
80105423:	e8 08 d9 ff ff       	call   80102d30 <begin_op>
80105428:	83 ec 08             	sub    $0x8,%esp
8010542b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010542e:	50                   	push   %eax
8010542f:	6a 00                	push   $0x0
80105431:	e8 ca f5 ff ff       	call   80104a00 <argstr>
80105436:	83 c4 10             	add    $0x10,%esp
80105439:	85 c0                	test   %eax,%eax
8010543b:	78 73                	js     801054b0 <sys_chdir+0xa0>
8010543d:	83 ec 0c             	sub    $0xc,%esp
80105440:	ff 75 f4             	pushl  -0xc(%ebp)
80105443:	e8 e8 cb ff ff       	call   80102030 <namei>
80105448:	83 c4 10             	add    $0x10,%esp
8010544b:	89 c3                	mov    %eax,%ebx
8010544d:	85 c0                	test   %eax,%eax
8010544f:	74 5f                	je     801054b0 <sys_chdir+0xa0>
80105451:	83 ec 0c             	sub    $0xc,%esp
80105454:	50                   	push   %eax
80105455:	e8 06 c3 ff ff       	call   80101760 <ilock>
8010545a:	83 c4 10             	add    $0x10,%esp
8010545d:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105462:	75 2c                	jne    80105490 <sys_chdir+0x80>
80105464:	83 ec 0c             	sub    $0xc,%esp
80105467:	53                   	push   %ebx
80105468:	e8 d3 c3 ff ff       	call   80101840 <iunlock>
8010546d:	58                   	pop    %eax
8010546e:	ff 76 68             	pushl  0x68(%esi)
80105471:	e8 1a c4 ff ff       	call   80101890 <iput>
80105476:	e8 25 d9 ff ff       	call   80102da0 <end_op>
8010547b:	89 5e 68             	mov    %ebx,0x68(%esi)
8010547e:	83 c4 10             	add    $0x10,%esp
80105481:	31 c0                	xor    %eax,%eax
80105483:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105486:	5b                   	pop    %ebx
80105487:	5e                   	pop    %esi
80105488:	5d                   	pop    %ebp
80105489:	c3                   	ret    
8010548a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105490:	83 ec 0c             	sub    $0xc,%esp
80105493:	53                   	push   %ebx
80105494:	e8 67 c5 ff ff       	call   80101a00 <iunlockput>
80105499:	e8 02 d9 ff ff       	call   80102da0 <end_op>
8010549e:	83 c4 10             	add    $0x10,%esp
801054a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054a6:	eb db                	jmp    80105483 <sys_chdir+0x73>
801054a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801054af:	90                   	nop
801054b0:	e8 eb d8 ff ff       	call   80102da0 <end_op>
801054b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054ba:	eb c7                	jmp    80105483 <sys_chdir+0x73>
801054bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054c0 <sys_exec>:
801054c0:	f3 0f 1e fb          	endbr32 
801054c4:	55                   	push   %ebp
801054c5:	89 e5                	mov    %esp,%ebp
801054c7:	57                   	push   %edi
801054c8:	56                   	push   %esi
801054c9:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
801054cf:	53                   	push   %ebx
801054d0:	81 ec a4 00 00 00    	sub    $0xa4,%esp
801054d6:	50                   	push   %eax
801054d7:	6a 00                	push   $0x0
801054d9:	e8 22 f5 ff ff       	call   80104a00 <argstr>
801054de:	83 c4 10             	add    $0x10,%esp
801054e1:	85 c0                	test   %eax,%eax
801054e3:	0f 88 8b 00 00 00    	js     80105574 <sys_exec+0xb4>
801054e9:	83 ec 08             	sub    $0x8,%esp
801054ec:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801054f2:	50                   	push   %eax
801054f3:	6a 01                	push   $0x1
801054f5:	e8 56 f4 ff ff       	call   80104950 <argint>
801054fa:	83 c4 10             	add    $0x10,%esp
801054fd:	85 c0                	test   %eax,%eax
801054ff:	78 73                	js     80105574 <sys_exec+0xb4>
80105501:	83 ec 04             	sub    $0x4,%esp
80105504:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010550a:	31 db                	xor    %ebx,%ebx
8010550c:	68 80 00 00 00       	push   $0x80
80105511:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105517:	6a 00                	push   $0x0
80105519:	50                   	push   %eax
8010551a:	e8 51 f1 ff ff       	call   80104670 <memset>
8010551f:	83 c4 10             	add    $0x10,%esp
80105522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105528:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
8010552e:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80105535:	83 ec 08             	sub    $0x8,%esp
80105538:	57                   	push   %edi
80105539:	01 f0                	add    %esi,%eax
8010553b:	50                   	push   %eax
8010553c:	e8 6f f3 ff ff       	call   801048b0 <fetchint>
80105541:	83 c4 10             	add    $0x10,%esp
80105544:	85 c0                	test   %eax,%eax
80105546:	78 2c                	js     80105574 <sys_exec+0xb4>
80105548:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
8010554e:	85 c0                	test   %eax,%eax
80105550:	74 36                	je     80105588 <sys_exec+0xc8>
80105552:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105558:	83 ec 08             	sub    $0x8,%esp
8010555b:	8d 14 31             	lea    (%ecx,%esi,1),%edx
8010555e:	52                   	push   %edx
8010555f:	50                   	push   %eax
80105560:	e8 8b f3 ff ff       	call   801048f0 <fetchstr>
80105565:	83 c4 10             	add    $0x10,%esp
80105568:	85 c0                	test   %eax,%eax
8010556a:	78 08                	js     80105574 <sys_exec+0xb4>
8010556c:	83 c3 01             	add    $0x1,%ebx
8010556f:	83 fb 20             	cmp    $0x20,%ebx
80105572:	75 b4                	jne    80105528 <sys_exec+0x68>
80105574:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105577:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010557c:	5b                   	pop    %ebx
8010557d:	5e                   	pop    %esi
8010557e:	5f                   	pop    %edi
8010557f:	5d                   	pop    %ebp
80105580:	c3                   	ret    
80105581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105588:	83 ec 08             	sub    $0x8,%esp
8010558b:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105591:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105598:	00 00 00 00 
8010559c:	50                   	push   %eax
8010559d:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801055a3:	e8 d8 b4 ff ff       	call   80100a80 <exec>
801055a8:	83 c4 10             	add    $0x10,%esp
801055ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
801055ae:	5b                   	pop    %ebx
801055af:	5e                   	pop    %esi
801055b0:	5f                   	pop    %edi
801055b1:	5d                   	pop    %ebp
801055b2:	c3                   	ret    
801055b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801055ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801055c0 <sys_pipe>:
801055c0:	f3 0f 1e fb          	endbr32 
801055c4:	55                   	push   %ebp
801055c5:	89 e5                	mov    %esp,%ebp
801055c7:	57                   	push   %edi
801055c8:	56                   	push   %esi
801055c9:	8d 45 dc             	lea    -0x24(%ebp),%eax
801055cc:	53                   	push   %ebx
801055cd:	83 ec 20             	sub    $0x20,%esp
801055d0:	6a 08                	push   $0x8
801055d2:	50                   	push   %eax
801055d3:	6a 00                	push   $0x0
801055d5:	e8 c6 f3 ff ff       	call   801049a0 <argptr>
801055da:	83 c4 10             	add    $0x10,%esp
801055dd:	85 c0                	test   %eax,%eax
801055df:	78 4e                	js     8010562f <sys_pipe+0x6f>
801055e1:	83 ec 08             	sub    $0x8,%esp
801055e4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801055e7:	50                   	push   %eax
801055e8:	8d 45 e0             	lea    -0x20(%ebp),%eax
801055eb:	50                   	push   %eax
801055ec:	e8 ff dd ff ff       	call   801033f0 <pipealloc>
801055f1:	83 c4 10             	add    $0x10,%esp
801055f4:	85 c0                	test   %eax,%eax
801055f6:	78 37                	js     8010562f <sys_pipe+0x6f>
801055f8:	8b 7d e0             	mov    -0x20(%ebp),%edi
801055fb:	31 db                	xor    %ebx,%ebx
801055fd:	e8 5e e3 ff ff       	call   80103960 <myproc>
80105602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105608:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
8010560c:	85 f6                	test   %esi,%esi
8010560e:	74 30                	je     80105640 <sys_pipe+0x80>
80105610:	83 c3 01             	add    $0x1,%ebx
80105613:	83 fb 10             	cmp    $0x10,%ebx
80105616:	75 f0                	jne    80105608 <sys_pipe+0x48>
80105618:	83 ec 0c             	sub    $0xc,%esp
8010561b:	ff 75 e0             	pushl  -0x20(%ebp)
8010561e:	e8 9d b8 ff ff       	call   80100ec0 <fileclose>
80105623:	58                   	pop    %eax
80105624:	ff 75 e4             	pushl  -0x1c(%ebp)
80105627:	e8 94 b8 ff ff       	call   80100ec0 <fileclose>
8010562c:	83 c4 10             	add    $0x10,%esp
8010562f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105634:	eb 5b                	jmp    80105691 <sys_pipe+0xd1>
80105636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010563d:	8d 76 00             	lea    0x0(%esi),%esi
80105640:	8d 73 08             	lea    0x8(%ebx),%esi
80105643:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
80105647:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010564a:	e8 11 e3 ff ff       	call   80103960 <myproc>
8010564f:	31 d2                	xor    %edx,%edx
80105651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105658:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
8010565c:	85 c9                	test   %ecx,%ecx
8010565e:	74 20                	je     80105680 <sys_pipe+0xc0>
80105660:	83 c2 01             	add    $0x1,%edx
80105663:	83 fa 10             	cmp    $0x10,%edx
80105666:	75 f0                	jne    80105658 <sys_pipe+0x98>
80105668:	e8 f3 e2 ff ff       	call   80103960 <myproc>
8010566d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105674:	00 
80105675:	eb a1                	jmp    80105618 <sys_pipe+0x58>
80105677:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010567e:	66 90                	xchg   %ax,%ax
80105680:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
80105684:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105687:	89 18                	mov    %ebx,(%eax)
80105689:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010568c:	89 50 04             	mov    %edx,0x4(%eax)
8010568f:	31 c0                	xor    %eax,%eax
80105691:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105694:	5b                   	pop    %ebx
80105695:	5e                   	pop    %esi
80105696:	5f                   	pop    %edi
80105697:	5d                   	pop    %ebp
80105698:	c3                   	ret    
80105699:	66 90                	xchg   %ax,%ax
8010569b:	66 90                	xchg   %ax,%ax
8010569d:	66 90                	xchg   %ax,%ax
8010569f:	90                   	nop

801056a0 <sys_fork>:
801056a0:	f3 0f 1e fb          	endbr32 
801056a4:	e9 67 e4 ff ff       	jmp    80103b10 <fork>
801056a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801056b0 <sys_exit>:
801056b0:	f3 0f 1e fb          	endbr32 
801056b4:	55                   	push   %ebp
801056b5:	89 e5                	mov    %esp,%ebp
801056b7:	83 ec 08             	sub    $0x8,%esp
801056ba:	e8 d1 e6 ff ff       	call   80103d90 <exit>
801056bf:	31 c0                	xor    %eax,%eax
801056c1:	c9                   	leave  
801056c2:	c3                   	ret    
801056c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801056ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801056d0 <sys_wait>:
801056d0:	f3 0f 1e fb          	endbr32 
801056d4:	e9 07 e9 ff ff       	jmp    80103fe0 <wait>
801056d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801056e0 <sys_kill>:
801056e0:	f3 0f 1e fb          	endbr32 
801056e4:	55                   	push   %ebp
801056e5:	89 e5                	mov    %esp,%ebp
801056e7:	83 ec 20             	sub    $0x20,%esp
801056ea:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056ed:	50                   	push   %eax
801056ee:	6a 00                	push   $0x0
801056f0:	e8 5b f2 ff ff       	call   80104950 <argint>
801056f5:	83 c4 10             	add    $0x10,%esp
801056f8:	85 c0                	test   %eax,%eax
801056fa:	78 14                	js     80105710 <sys_kill+0x30>
801056fc:	83 ec 0c             	sub    $0xc,%esp
801056ff:	ff 75 f4             	pushl  -0xc(%ebp)
80105702:	e8 39 ea ff ff       	call   80104140 <kill>
80105707:	83 c4 10             	add    $0x10,%esp
8010570a:	c9                   	leave  
8010570b:	c3                   	ret    
8010570c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105710:	c9                   	leave  
80105711:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105716:	c3                   	ret    
80105717:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010571e:	66 90                	xchg   %ax,%ax

80105720 <sys_getpid>:
80105720:	f3 0f 1e fb          	endbr32 
80105724:	55                   	push   %ebp
80105725:	89 e5                	mov    %esp,%ebp
80105727:	83 ec 08             	sub    $0x8,%esp
8010572a:	e8 31 e2 ff ff       	call   80103960 <myproc>
8010572f:	8b 40 10             	mov    0x10(%eax),%eax
80105732:	c9                   	leave  
80105733:	c3                   	ret    
80105734:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010573b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010573f:	90                   	nop

80105740 <sys_sbrk>:
80105740:	f3 0f 1e fb          	endbr32 
80105744:	55                   	push   %ebp
80105745:	89 e5                	mov    %esp,%ebp
80105747:	53                   	push   %ebx
80105748:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010574b:	83 ec 1c             	sub    $0x1c,%esp
8010574e:	50                   	push   %eax
8010574f:	6a 00                	push   $0x0
80105751:	e8 fa f1 ff ff       	call   80104950 <argint>
80105756:	83 c4 10             	add    $0x10,%esp
80105759:	85 c0                	test   %eax,%eax
8010575b:	78 23                	js     80105780 <sys_sbrk+0x40>
8010575d:	e8 fe e1 ff ff       	call   80103960 <myproc>
80105762:	83 ec 0c             	sub    $0xc,%esp
80105765:	8b 18                	mov    (%eax),%ebx
80105767:	ff 75 f4             	pushl  -0xc(%ebp)
8010576a:	e8 21 e3 ff ff       	call   80103a90 <growproc>
8010576f:	83 c4 10             	add    $0x10,%esp
80105772:	85 c0                	test   %eax,%eax
80105774:	78 0a                	js     80105780 <sys_sbrk+0x40>
80105776:	89 d8                	mov    %ebx,%eax
80105778:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010577b:	c9                   	leave  
8010577c:	c3                   	ret    
8010577d:	8d 76 00             	lea    0x0(%esi),%esi
80105780:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105785:	eb ef                	jmp    80105776 <sys_sbrk+0x36>
80105787:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010578e:	66 90                	xchg   %ax,%ax

80105790 <sys_sleep>:
80105790:	f3 0f 1e fb          	endbr32 
80105794:	55                   	push   %ebp
80105795:	89 e5                	mov    %esp,%ebp
80105797:	53                   	push   %ebx
80105798:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010579b:	83 ec 1c             	sub    $0x1c,%esp
8010579e:	50                   	push   %eax
8010579f:	6a 00                	push   $0x0
801057a1:	e8 aa f1 ff ff       	call   80104950 <argint>
801057a6:	83 c4 10             	add    $0x10,%esp
801057a9:	85 c0                	test   %eax,%eax
801057ab:	0f 88 86 00 00 00    	js     80105837 <sys_sleep+0xa7>
801057b1:	83 ec 0c             	sub    $0xc,%esp
801057b4:	68 60 4c 11 80       	push   $0x80114c60
801057b9:	e8 a2 ed ff ff       	call   80104560 <acquire>
801057be:	8b 55 f4             	mov    -0xc(%ebp),%edx
801057c1:	8b 1d a0 54 11 80    	mov    0x801154a0,%ebx
801057c7:	83 c4 10             	add    $0x10,%esp
801057ca:	85 d2                	test   %edx,%edx
801057cc:	75 23                	jne    801057f1 <sys_sleep+0x61>
801057ce:	eb 50                	jmp    80105820 <sys_sleep+0x90>
801057d0:	83 ec 08             	sub    $0x8,%esp
801057d3:	68 60 4c 11 80       	push   $0x80114c60
801057d8:	68 a0 54 11 80       	push   $0x801154a0
801057dd:	e8 3e e7 ff ff       	call   80103f20 <sleep>
801057e2:	a1 a0 54 11 80       	mov    0x801154a0,%eax
801057e7:	83 c4 10             	add    $0x10,%esp
801057ea:	29 d8                	sub    %ebx,%eax
801057ec:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801057ef:	73 2f                	jae    80105820 <sys_sleep+0x90>
801057f1:	e8 6a e1 ff ff       	call   80103960 <myproc>
801057f6:	8b 40 24             	mov    0x24(%eax),%eax
801057f9:	85 c0                	test   %eax,%eax
801057fb:	74 d3                	je     801057d0 <sys_sleep+0x40>
801057fd:	83 ec 0c             	sub    $0xc,%esp
80105800:	68 60 4c 11 80       	push   $0x80114c60
80105805:	e8 16 ee ff ff       	call   80104620 <release>
8010580a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010580d:	83 c4 10             	add    $0x10,%esp
80105810:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105815:	c9                   	leave  
80105816:	c3                   	ret    
80105817:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010581e:	66 90                	xchg   %ax,%ax
80105820:	83 ec 0c             	sub    $0xc,%esp
80105823:	68 60 4c 11 80       	push   $0x80114c60
80105828:	e8 f3 ed ff ff       	call   80104620 <release>
8010582d:	83 c4 10             	add    $0x10,%esp
80105830:	31 c0                	xor    %eax,%eax
80105832:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105835:	c9                   	leave  
80105836:	c3                   	ret    
80105837:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010583c:	eb f4                	jmp    80105832 <sys_sleep+0xa2>
8010583e:	66 90                	xchg   %ax,%ax

80105840 <sys_uptime>:
80105840:	f3 0f 1e fb          	endbr32 
80105844:	55                   	push   %ebp
80105845:	89 e5                	mov    %esp,%ebp
80105847:	53                   	push   %ebx
80105848:	83 ec 10             	sub    $0x10,%esp
8010584b:	68 60 4c 11 80       	push   $0x80114c60
80105850:	e8 0b ed ff ff       	call   80104560 <acquire>
80105855:	8b 1d a0 54 11 80    	mov    0x801154a0,%ebx
8010585b:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
80105862:	e8 b9 ed ff ff       	call   80104620 <release>
80105867:	89 d8                	mov    %ebx,%eax
80105869:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010586c:	c9                   	leave  
8010586d:	c3                   	ret    

8010586e <alltraps>:
8010586e:	1e                   	push   %ds
8010586f:	06                   	push   %es
80105870:	0f a0                	push   %fs
80105872:	0f a8                	push   %gs
80105874:	60                   	pusha  
80105875:	66 b8 10 00          	mov    $0x10,%ax
80105879:	8e d8                	mov    %eax,%ds
8010587b:	8e c0                	mov    %eax,%es
8010587d:	54                   	push   %esp
8010587e:	e8 cd 00 00 00       	call   80105950 <trap>
80105883:	83 c4 04             	add    $0x4,%esp

80105886 <trapret>:
80105886:	61                   	popa   
80105887:	0f a9                	pop    %gs
80105889:	0f a1                	pop    %fs
8010588b:	07                   	pop    %es
8010588c:	1f                   	pop    %ds
8010588d:	83 c4 08             	add    $0x8,%esp
80105890:	cf                   	iret   
80105891:	66 90                	xchg   %ax,%ax
80105893:	66 90                	xchg   %ax,%ax
80105895:	66 90                	xchg   %ax,%ax
80105897:	66 90                	xchg   %ax,%ax
80105899:	66 90                	xchg   %ax,%ax
8010589b:	66 90                	xchg   %ax,%ax
8010589d:	66 90                	xchg   %ax,%ax
8010589f:	90                   	nop

801058a0 <tvinit>:
801058a0:	f3 0f 1e fb          	endbr32 
801058a4:	55                   	push   %ebp
801058a5:	31 c0                	xor    %eax,%eax
801058a7:	89 e5                	mov    %esp,%ebp
801058a9:	83 ec 08             	sub    $0x8,%esp
801058ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801058b0:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801058b7:	c7 04 c5 a2 4c 11 80 	movl   $0x8e000008,-0x7feeb35e(,%eax,8)
801058be:	08 00 00 8e 
801058c2:	66 89 14 c5 a0 4c 11 	mov    %dx,-0x7feeb360(,%eax,8)
801058c9:	80 
801058ca:	c1 ea 10             	shr    $0x10,%edx
801058cd:	66 89 14 c5 a6 4c 11 	mov    %dx,-0x7feeb35a(,%eax,8)
801058d4:	80 
801058d5:	83 c0 01             	add    $0x1,%eax
801058d8:	3d 00 01 00 00       	cmp    $0x100,%eax
801058dd:	75 d1                	jne    801058b0 <tvinit+0x10>
801058df:	83 ec 08             	sub    $0x8,%esp
801058e2:	a1 08 a1 10 80       	mov    0x8010a108,%eax
801058e7:	c7 05 a2 4e 11 80 08 	movl   $0xef000008,0x80114ea2
801058ee:	00 00 ef 
801058f1:	68 59 78 10 80       	push   $0x80107859
801058f6:	68 60 4c 11 80       	push   $0x80114c60
801058fb:	66 a3 a0 4e 11 80    	mov    %ax,0x80114ea0
80105901:	c1 e8 10             	shr    $0x10,%eax
80105904:	66 a3 a6 4e 11 80    	mov    %ax,0x80114ea6
8010590a:	e8 d1 ea ff ff       	call   801043e0 <initlock>
8010590f:	83 c4 10             	add    $0x10,%esp
80105912:	c9                   	leave  
80105913:	c3                   	ret    
80105914:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010591b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010591f:	90                   	nop

80105920 <idtinit>:
80105920:	f3 0f 1e fb          	endbr32 
80105924:	55                   	push   %ebp
80105925:	b8 ff 07 00 00       	mov    $0x7ff,%eax
8010592a:	89 e5                	mov    %esp,%ebp
8010592c:	83 ec 10             	sub    $0x10,%esp
8010592f:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
80105933:	b8 a0 4c 11 80       	mov    $0x80114ca0,%eax
80105938:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
8010593c:	c1 e8 10             	shr    $0x10,%eax
8010593f:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
80105943:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105946:	0f 01 18             	lidtl  (%eax)
80105949:	c9                   	leave  
8010594a:	c3                   	ret    
8010594b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010594f:	90                   	nop

80105950 <trap>:
80105950:	f3 0f 1e fb          	endbr32 
80105954:	55                   	push   %ebp
80105955:	89 e5                	mov    %esp,%ebp
80105957:	57                   	push   %edi
80105958:	56                   	push   %esi
80105959:	53                   	push   %ebx
8010595a:	83 ec 1c             	sub    $0x1c,%esp
8010595d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105960:	8b 43 30             	mov    0x30(%ebx),%eax
80105963:	83 f8 40             	cmp    $0x40,%eax
80105966:	0f 84 bc 01 00 00    	je     80105b28 <trap+0x1d8>
8010596c:	83 e8 20             	sub    $0x20,%eax
8010596f:	83 f8 1f             	cmp    $0x1f,%eax
80105972:	77 08                	ja     8010597c <trap+0x2c>
80105974:	3e ff 24 85 00 79 10 	notrack jmp *-0x7fef8700(,%eax,4)
8010597b:	80 
8010597c:	e8 df df ff ff       	call   80103960 <myproc>
80105981:	8b 7b 38             	mov    0x38(%ebx),%edi
80105984:	85 c0                	test   %eax,%eax
80105986:	0f 84 eb 01 00 00    	je     80105b77 <trap+0x227>
8010598c:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105990:	0f 84 e1 01 00 00    	je     80105b77 <trap+0x227>
80105996:	0f 20 d1             	mov    %cr2,%ecx
80105999:	89 4d d8             	mov    %ecx,-0x28(%ebp)
8010599c:	e8 9f df ff ff       	call   80103940 <cpuid>
801059a1:	8b 73 30             	mov    0x30(%ebx),%esi
801059a4:	89 45 dc             	mov    %eax,-0x24(%ebp)
801059a7:	8b 43 34             	mov    0x34(%ebx),%eax
801059aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801059ad:	e8 ae df ff ff       	call   80103960 <myproc>
801059b2:	89 45 e0             	mov    %eax,-0x20(%ebp)
801059b5:	e8 a6 df ff ff       	call   80103960 <myproc>
801059ba:	8b 4d d8             	mov    -0x28(%ebp),%ecx
801059bd:	8b 55 dc             	mov    -0x24(%ebp),%edx
801059c0:	51                   	push   %ecx
801059c1:	57                   	push   %edi
801059c2:	52                   	push   %edx
801059c3:	ff 75 e4             	pushl  -0x1c(%ebp)
801059c6:	56                   	push   %esi
801059c7:	8b 75 e0             	mov    -0x20(%ebp),%esi
801059ca:	83 c6 6c             	add    $0x6c,%esi
801059cd:	56                   	push   %esi
801059ce:	ff 70 10             	pushl  0x10(%eax)
801059d1:	68 bc 78 10 80       	push   $0x801078bc
801059d6:	e8 d5 ac ff ff       	call   801006b0 <cprintf>
801059db:	83 c4 20             	add    $0x20,%esp
801059de:	e8 7d df ff ff       	call   80103960 <myproc>
801059e3:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801059ea:	e8 71 df ff ff       	call   80103960 <myproc>
801059ef:	85 c0                	test   %eax,%eax
801059f1:	74 1d                	je     80105a10 <trap+0xc0>
801059f3:	e8 68 df ff ff       	call   80103960 <myproc>
801059f8:	8b 50 24             	mov    0x24(%eax),%edx
801059fb:	85 d2                	test   %edx,%edx
801059fd:	74 11                	je     80105a10 <trap+0xc0>
801059ff:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105a03:	83 e0 03             	and    $0x3,%eax
80105a06:	66 83 f8 03          	cmp    $0x3,%ax
80105a0a:	0f 84 50 01 00 00    	je     80105b60 <trap+0x210>
80105a10:	e8 4b df ff ff       	call   80103960 <myproc>
80105a15:	85 c0                	test   %eax,%eax
80105a17:	74 0f                	je     80105a28 <trap+0xd8>
80105a19:	e8 42 df ff ff       	call   80103960 <myproc>
80105a1e:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105a22:	0f 84 e8 00 00 00    	je     80105b10 <trap+0x1c0>
80105a28:	e8 33 df ff ff       	call   80103960 <myproc>
80105a2d:	85 c0                	test   %eax,%eax
80105a2f:	74 1d                	je     80105a4e <trap+0xfe>
80105a31:	e8 2a df ff ff       	call   80103960 <myproc>
80105a36:	8b 40 24             	mov    0x24(%eax),%eax
80105a39:	85 c0                	test   %eax,%eax
80105a3b:	74 11                	je     80105a4e <trap+0xfe>
80105a3d:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105a41:	83 e0 03             	and    $0x3,%eax
80105a44:	66 83 f8 03          	cmp    $0x3,%ax
80105a48:	0f 84 03 01 00 00    	je     80105b51 <trap+0x201>
80105a4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a51:	5b                   	pop    %ebx
80105a52:	5e                   	pop    %esi
80105a53:	5f                   	pop    %edi
80105a54:	5d                   	pop    %ebp
80105a55:	c3                   	ret    
80105a56:	e8 85 c7 ff ff       	call   801021e0 <ideintr>
80105a5b:	e8 60 ce ff ff       	call   801028c0 <lapiceoi>
80105a60:	e8 fb de ff ff       	call   80103960 <myproc>
80105a65:	85 c0                	test   %eax,%eax
80105a67:	75 8a                	jne    801059f3 <trap+0xa3>
80105a69:	eb a5                	jmp    80105a10 <trap+0xc0>
80105a6b:	e8 d0 de ff ff       	call   80103940 <cpuid>
80105a70:	85 c0                	test   %eax,%eax
80105a72:	75 e7                	jne    80105a5b <trap+0x10b>
80105a74:	83 ec 0c             	sub    $0xc,%esp
80105a77:	68 60 4c 11 80       	push   $0x80114c60
80105a7c:	e8 df ea ff ff       	call   80104560 <acquire>
80105a81:	c7 04 24 a0 54 11 80 	movl   $0x801154a0,(%esp)
80105a88:	83 05 a0 54 11 80 01 	addl   $0x1,0x801154a0
80105a8f:	e8 4c e6 ff ff       	call   801040e0 <wakeup>
80105a94:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
80105a9b:	e8 80 eb ff ff       	call   80104620 <release>
80105aa0:	83 c4 10             	add    $0x10,%esp
80105aa3:	eb b6                	jmp    80105a5b <trap+0x10b>
80105aa5:	e8 d6 cc ff ff       	call   80102780 <kbdintr>
80105aaa:	e8 11 ce ff ff       	call   801028c0 <lapiceoi>
80105aaf:	e8 ac de ff ff       	call   80103960 <myproc>
80105ab4:	85 c0                	test   %eax,%eax
80105ab6:	0f 85 37 ff ff ff    	jne    801059f3 <trap+0xa3>
80105abc:	e9 4f ff ff ff       	jmp    80105a10 <trap+0xc0>
80105ac1:	e8 4a 02 00 00       	call   80105d10 <uartintr>
80105ac6:	e8 f5 cd ff ff       	call   801028c0 <lapiceoi>
80105acb:	e8 90 de ff ff       	call   80103960 <myproc>
80105ad0:	85 c0                	test   %eax,%eax
80105ad2:	0f 85 1b ff ff ff    	jne    801059f3 <trap+0xa3>
80105ad8:	e9 33 ff ff ff       	jmp    80105a10 <trap+0xc0>
80105add:	8b 7b 38             	mov    0x38(%ebx),%edi
80105ae0:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105ae4:	e8 57 de ff ff       	call   80103940 <cpuid>
80105ae9:	57                   	push   %edi
80105aea:	56                   	push   %esi
80105aeb:	50                   	push   %eax
80105aec:	68 64 78 10 80       	push   $0x80107864
80105af1:	e8 ba ab ff ff       	call   801006b0 <cprintf>
80105af6:	e8 c5 cd ff ff       	call   801028c0 <lapiceoi>
80105afb:	83 c4 10             	add    $0x10,%esp
80105afe:	e8 5d de ff ff       	call   80103960 <myproc>
80105b03:	85 c0                	test   %eax,%eax
80105b05:	0f 85 e8 fe ff ff    	jne    801059f3 <trap+0xa3>
80105b0b:	e9 00 ff ff ff       	jmp    80105a10 <trap+0xc0>
80105b10:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105b14:	0f 85 0e ff ff ff    	jne    80105a28 <trap+0xd8>
80105b1a:	e8 b1 e3 ff ff       	call   80103ed0 <yield>
80105b1f:	e9 04 ff ff ff       	jmp    80105a28 <trap+0xd8>
80105b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105b28:	e8 33 de ff ff       	call   80103960 <myproc>
80105b2d:	8b 70 24             	mov    0x24(%eax),%esi
80105b30:	85 f6                	test   %esi,%esi
80105b32:	75 3c                	jne    80105b70 <trap+0x220>
80105b34:	e8 27 de ff ff       	call   80103960 <myproc>
80105b39:	89 58 18             	mov    %ebx,0x18(%eax)
80105b3c:	e8 ff ee ff ff       	call   80104a40 <syscall>
80105b41:	e8 1a de ff ff       	call   80103960 <myproc>
80105b46:	8b 48 24             	mov    0x24(%eax),%ecx
80105b49:	85 c9                	test   %ecx,%ecx
80105b4b:	0f 84 fd fe ff ff    	je     80105a4e <trap+0xfe>
80105b51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b54:	5b                   	pop    %ebx
80105b55:	5e                   	pop    %esi
80105b56:	5f                   	pop    %edi
80105b57:	5d                   	pop    %ebp
80105b58:	e9 33 e2 ff ff       	jmp    80103d90 <exit>
80105b5d:	8d 76 00             	lea    0x0(%esi),%esi
80105b60:	e8 2b e2 ff ff       	call   80103d90 <exit>
80105b65:	e9 a6 fe ff ff       	jmp    80105a10 <trap+0xc0>
80105b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105b70:	e8 1b e2 ff ff       	call   80103d90 <exit>
80105b75:	eb bd                	jmp    80105b34 <trap+0x1e4>
80105b77:	0f 20 d6             	mov    %cr2,%esi
80105b7a:	e8 c1 dd ff ff       	call   80103940 <cpuid>
80105b7f:	83 ec 0c             	sub    $0xc,%esp
80105b82:	56                   	push   %esi
80105b83:	57                   	push   %edi
80105b84:	50                   	push   %eax
80105b85:	ff 73 30             	pushl  0x30(%ebx)
80105b88:	68 88 78 10 80       	push   $0x80107888
80105b8d:	e8 1e ab ff ff       	call   801006b0 <cprintf>
80105b92:	83 c4 14             	add    $0x14,%esp
80105b95:	68 5e 78 10 80       	push   $0x8010785e
80105b9a:	e8 f1 a7 ff ff       	call   80100390 <panic>
80105b9f:	90                   	nop

80105ba0 <uartgetc>:
80105ba0:	f3 0f 1e fb          	endbr32 
80105ba4:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
80105ba9:	85 c0                	test   %eax,%eax
80105bab:	74 1b                	je     80105bc8 <uartgetc+0x28>
80105bad:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105bb2:	ec                   	in     (%dx),%al
80105bb3:	a8 01                	test   $0x1,%al
80105bb5:	74 11                	je     80105bc8 <uartgetc+0x28>
80105bb7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105bbc:	ec                   	in     (%dx),%al
80105bbd:	0f b6 c0             	movzbl %al,%eax
80105bc0:	c3                   	ret    
80105bc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105bc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105bcd:	c3                   	ret    
80105bce:	66 90                	xchg   %ax,%ax

80105bd0 <uartputc.part.0>:
80105bd0:	55                   	push   %ebp
80105bd1:	89 e5                	mov    %esp,%ebp
80105bd3:	57                   	push   %edi
80105bd4:	89 c7                	mov    %eax,%edi
80105bd6:	56                   	push   %esi
80105bd7:	be fd 03 00 00       	mov    $0x3fd,%esi
80105bdc:	53                   	push   %ebx
80105bdd:	bb 80 00 00 00       	mov    $0x80,%ebx
80105be2:	83 ec 0c             	sub    $0xc,%esp
80105be5:	eb 1b                	jmp    80105c02 <uartputc.part.0+0x32>
80105be7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105bee:	66 90                	xchg   %ax,%ax
80105bf0:	83 ec 0c             	sub    $0xc,%esp
80105bf3:	6a 0a                	push   $0xa
80105bf5:	e8 e6 cc ff ff       	call   801028e0 <microdelay>
80105bfa:	83 c4 10             	add    $0x10,%esp
80105bfd:	83 eb 01             	sub    $0x1,%ebx
80105c00:	74 07                	je     80105c09 <uartputc.part.0+0x39>
80105c02:	89 f2                	mov    %esi,%edx
80105c04:	ec                   	in     (%dx),%al
80105c05:	a8 20                	test   $0x20,%al
80105c07:	74 e7                	je     80105bf0 <uartputc.part.0+0x20>
80105c09:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c0e:	89 f8                	mov    %edi,%eax
80105c10:	ee                   	out    %al,(%dx)
80105c11:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c14:	5b                   	pop    %ebx
80105c15:	5e                   	pop    %esi
80105c16:	5f                   	pop    %edi
80105c17:	5d                   	pop    %ebp
80105c18:	c3                   	ret    
80105c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105c20 <uartinit>:
80105c20:	f3 0f 1e fb          	endbr32 
80105c24:	55                   	push   %ebp
80105c25:	31 c9                	xor    %ecx,%ecx
80105c27:	89 c8                	mov    %ecx,%eax
80105c29:	89 e5                	mov    %esp,%ebp
80105c2b:	57                   	push   %edi
80105c2c:	56                   	push   %esi
80105c2d:	53                   	push   %ebx
80105c2e:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105c33:	89 da                	mov    %ebx,%edx
80105c35:	83 ec 0c             	sub    $0xc,%esp
80105c38:	ee                   	out    %al,(%dx)
80105c39:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105c3e:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105c43:	89 fa                	mov    %edi,%edx
80105c45:	ee                   	out    %al,(%dx)
80105c46:	b8 0c 00 00 00       	mov    $0xc,%eax
80105c4b:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c50:	ee                   	out    %al,(%dx)
80105c51:	be f9 03 00 00       	mov    $0x3f9,%esi
80105c56:	89 c8                	mov    %ecx,%eax
80105c58:	89 f2                	mov    %esi,%edx
80105c5a:	ee                   	out    %al,(%dx)
80105c5b:	b8 03 00 00 00       	mov    $0x3,%eax
80105c60:	89 fa                	mov    %edi,%edx
80105c62:	ee                   	out    %al,(%dx)
80105c63:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105c68:	89 c8                	mov    %ecx,%eax
80105c6a:	ee                   	out    %al,(%dx)
80105c6b:	b8 01 00 00 00       	mov    $0x1,%eax
80105c70:	89 f2                	mov    %esi,%edx
80105c72:	ee                   	out    %al,(%dx)
80105c73:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105c78:	ec                   	in     (%dx),%al
80105c79:	3c ff                	cmp    $0xff,%al
80105c7b:	74 52                	je     80105ccf <uartinit+0xaf>
80105c7d:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105c84:	00 00 00 
80105c87:	89 da                	mov    %ebx,%edx
80105c89:	ec                   	in     (%dx),%al
80105c8a:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c8f:	ec                   	in     (%dx),%al
80105c90:	83 ec 08             	sub    $0x8,%esp
80105c93:	be 76 00 00 00       	mov    $0x76,%esi
80105c98:	bb 80 79 10 80       	mov    $0x80107980,%ebx
80105c9d:	6a 00                	push   $0x0
80105c9f:	6a 04                	push   $0x4
80105ca1:	e8 8a c7 ff ff       	call   80102430 <ioapicenable>
80105ca6:	83 c4 10             	add    $0x10,%esp
80105ca9:	b8 78 00 00 00       	mov    $0x78,%eax
80105cae:	eb 04                	jmp    80105cb4 <uartinit+0x94>
80105cb0:	0f b6 73 01          	movzbl 0x1(%ebx),%esi
80105cb4:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105cba:	85 d2                	test   %edx,%edx
80105cbc:	74 08                	je     80105cc6 <uartinit+0xa6>
80105cbe:	0f be c0             	movsbl %al,%eax
80105cc1:	e8 0a ff ff ff       	call   80105bd0 <uartputc.part.0>
80105cc6:	89 f0                	mov    %esi,%eax
80105cc8:	83 c3 01             	add    $0x1,%ebx
80105ccb:	84 c0                	test   %al,%al
80105ccd:	75 e1                	jne    80105cb0 <uartinit+0x90>
80105ccf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cd2:	5b                   	pop    %ebx
80105cd3:	5e                   	pop    %esi
80105cd4:	5f                   	pop    %edi
80105cd5:	5d                   	pop    %ebp
80105cd6:	c3                   	ret    
80105cd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105cde:	66 90                	xchg   %ax,%ax

80105ce0 <uartputc>:
80105ce0:	f3 0f 1e fb          	endbr32 
80105ce4:	55                   	push   %ebp
80105ce5:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105ceb:	89 e5                	mov    %esp,%ebp
80105ced:	8b 45 08             	mov    0x8(%ebp),%eax
80105cf0:	85 d2                	test   %edx,%edx
80105cf2:	74 0c                	je     80105d00 <uartputc+0x20>
80105cf4:	5d                   	pop    %ebp
80105cf5:	e9 d6 fe ff ff       	jmp    80105bd0 <uartputc.part.0>
80105cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105d00:	5d                   	pop    %ebp
80105d01:	c3                   	ret    
80105d02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105d10 <uartintr>:
80105d10:	f3 0f 1e fb          	endbr32 
80105d14:	55                   	push   %ebp
80105d15:	89 e5                	mov    %esp,%ebp
80105d17:	83 ec 14             	sub    $0x14,%esp
80105d1a:	68 a0 5b 10 80       	push   $0x80105ba0
80105d1f:	e8 3c ab ff ff       	call   80100860 <consoleintr>
80105d24:	83 c4 10             	add    $0x10,%esp
80105d27:	c9                   	leave  
80105d28:	c3                   	ret    

80105d29 <vector0>:
80105d29:	6a 00                	push   $0x0
80105d2b:	6a 00                	push   $0x0
80105d2d:	e9 3c fb ff ff       	jmp    8010586e <alltraps>

80105d32 <vector1>:
80105d32:	6a 00                	push   $0x0
80105d34:	6a 01                	push   $0x1
80105d36:	e9 33 fb ff ff       	jmp    8010586e <alltraps>

80105d3b <vector2>:
80105d3b:	6a 00                	push   $0x0
80105d3d:	6a 02                	push   $0x2
80105d3f:	e9 2a fb ff ff       	jmp    8010586e <alltraps>

80105d44 <vector3>:
80105d44:	6a 00                	push   $0x0
80105d46:	6a 03                	push   $0x3
80105d48:	e9 21 fb ff ff       	jmp    8010586e <alltraps>

80105d4d <vector4>:
80105d4d:	6a 00                	push   $0x0
80105d4f:	6a 04                	push   $0x4
80105d51:	e9 18 fb ff ff       	jmp    8010586e <alltraps>

80105d56 <vector5>:
80105d56:	6a 00                	push   $0x0
80105d58:	6a 05                	push   $0x5
80105d5a:	e9 0f fb ff ff       	jmp    8010586e <alltraps>

80105d5f <vector6>:
80105d5f:	6a 00                	push   $0x0
80105d61:	6a 06                	push   $0x6
80105d63:	e9 06 fb ff ff       	jmp    8010586e <alltraps>

80105d68 <vector7>:
80105d68:	6a 00                	push   $0x0
80105d6a:	6a 07                	push   $0x7
80105d6c:	e9 fd fa ff ff       	jmp    8010586e <alltraps>

80105d71 <vector8>:
80105d71:	6a 08                	push   $0x8
80105d73:	e9 f6 fa ff ff       	jmp    8010586e <alltraps>

80105d78 <vector9>:
80105d78:	6a 00                	push   $0x0
80105d7a:	6a 09                	push   $0x9
80105d7c:	e9 ed fa ff ff       	jmp    8010586e <alltraps>

80105d81 <vector10>:
80105d81:	6a 0a                	push   $0xa
80105d83:	e9 e6 fa ff ff       	jmp    8010586e <alltraps>

80105d88 <vector11>:
80105d88:	6a 0b                	push   $0xb
80105d8a:	e9 df fa ff ff       	jmp    8010586e <alltraps>

80105d8f <vector12>:
80105d8f:	6a 0c                	push   $0xc
80105d91:	e9 d8 fa ff ff       	jmp    8010586e <alltraps>

80105d96 <vector13>:
80105d96:	6a 0d                	push   $0xd
80105d98:	e9 d1 fa ff ff       	jmp    8010586e <alltraps>

80105d9d <vector14>:
80105d9d:	6a 0e                	push   $0xe
80105d9f:	e9 ca fa ff ff       	jmp    8010586e <alltraps>

80105da4 <vector15>:
80105da4:	6a 00                	push   $0x0
80105da6:	6a 0f                	push   $0xf
80105da8:	e9 c1 fa ff ff       	jmp    8010586e <alltraps>

80105dad <vector16>:
80105dad:	6a 00                	push   $0x0
80105daf:	6a 10                	push   $0x10
80105db1:	e9 b8 fa ff ff       	jmp    8010586e <alltraps>

80105db6 <vector17>:
80105db6:	6a 11                	push   $0x11
80105db8:	e9 b1 fa ff ff       	jmp    8010586e <alltraps>

80105dbd <vector18>:
80105dbd:	6a 00                	push   $0x0
80105dbf:	6a 12                	push   $0x12
80105dc1:	e9 a8 fa ff ff       	jmp    8010586e <alltraps>

80105dc6 <vector19>:
80105dc6:	6a 00                	push   $0x0
80105dc8:	6a 13                	push   $0x13
80105dca:	e9 9f fa ff ff       	jmp    8010586e <alltraps>

80105dcf <vector20>:
80105dcf:	6a 00                	push   $0x0
80105dd1:	6a 14                	push   $0x14
80105dd3:	e9 96 fa ff ff       	jmp    8010586e <alltraps>

80105dd8 <vector21>:
80105dd8:	6a 00                	push   $0x0
80105dda:	6a 15                	push   $0x15
80105ddc:	e9 8d fa ff ff       	jmp    8010586e <alltraps>

80105de1 <vector22>:
80105de1:	6a 00                	push   $0x0
80105de3:	6a 16                	push   $0x16
80105de5:	e9 84 fa ff ff       	jmp    8010586e <alltraps>

80105dea <vector23>:
80105dea:	6a 00                	push   $0x0
80105dec:	6a 17                	push   $0x17
80105dee:	e9 7b fa ff ff       	jmp    8010586e <alltraps>

80105df3 <vector24>:
80105df3:	6a 00                	push   $0x0
80105df5:	6a 18                	push   $0x18
80105df7:	e9 72 fa ff ff       	jmp    8010586e <alltraps>

80105dfc <vector25>:
80105dfc:	6a 00                	push   $0x0
80105dfe:	6a 19                	push   $0x19
80105e00:	e9 69 fa ff ff       	jmp    8010586e <alltraps>

80105e05 <vector26>:
80105e05:	6a 00                	push   $0x0
80105e07:	6a 1a                	push   $0x1a
80105e09:	e9 60 fa ff ff       	jmp    8010586e <alltraps>

80105e0e <vector27>:
80105e0e:	6a 00                	push   $0x0
80105e10:	6a 1b                	push   $0x1b
80105e12:	e9 57 fa ff ff       	jmp    8010586e <alltraps>

80105e17 <vector28>:
80105e17:	6a 00                	push   $0x0
80105e19:	6a 1c                	push   $0x1c
80105e1b:	e9 4e fa ff ff       	jmp    8010586e <alltraps>

80105e20 <vector29>:
80105e20:	6a 00                	push   $0x0
80105e22:	6a 1d                	push   $0x1d
80105e24:	e9 45 fa ff ff       	jmp    8010586e <alltraps>

80105e29 <vector30>:
80105e29:	6a 00                	push   $0x0
80105e2b:	6a 1e                	push   $0x1e
80105e2d:	e9 3c fa ff ff       	jmp    8010586e <alltraps>

80105e32 <vector31>:
80105e32:	6a 00                	push   $0x0
80105e34:	6a 1f                	push   $0x1f
80105e36:	e9 33 fa ff ff       	jmp    8010586e <alltraps>

80105e3b <vector32>:
80105e3b:	6a 00                	push   $0x0
80105e3d:	6a 20                	push   $0x20
80105e3f:	e9 2a fa ff ff       	jmp    8010586e <alltraps>

80105e44 <vector33>:
80105e44:	6a 00                	push   $0x0
80105e46:	6a 21                	push   $0x21
80105e48:	e9 21 fa ff ff       	jmp    8010586e <alltraps>

80105e4d <vector34>:
80105e4d:	6a 00                	push   $0x0
80105e4f:	6a 22                	push   $0x22
80105e51:	e9 18 fa ff ff       	jmp    8010586e <alltraps>

80105e56 <vector35>:
80105e56:	6a 00                	push   $0x0
80105e58:	6a 23                	push   $0x23
80105e5a:	e9 0f fa ff ff       	jmp    8010586e <alltraps>

80105e5f <vector36>:
80105e5f:	6a 00                	push   $0x0
80105e61:	6a 24                	push   $0x24
80105e63:	e9 06 fa ff ff       	jmp    8010586e <alltraps>

80105e68 <vector37>:
80105e68:	6a 00                	push   $0x0
80105e6a:	6a 25                	push   $0x25
80105e6c:	e9 fd f9 ff ff       	jmp    8010586e <alltraps>

80105e71 <vector38>:
80105e71:	6a 00                	push   $0x0
80105e73:	6a 26                	push   $0x26
80105e75:	e9 f4 f9 ff ff       	jmp    8010586e <alltraps>

80105e7a <vector39>:
80105e7a:	6a 00                	push   $0x0
80105e7c:	6a 27                	push   $0x27
80105e7e:	e9 eb f9 ff ff       	jmp    8010586e <alltraps>

80105e83 <vector40>:
80105e83:	6a 00                	push   $0x0
80105e85:	6a 28                	push   $0x28
80105e87:	e9 e2 f9 ff ff       	jmp    8010586e <alltraps>

80105e8c <vector41>:
80105e8c:	6a 00                	push   $0x0
80105e8e:	6a 29                	push   $0x29
80105e90:	e9 d9 f9 ff ff       	jmp    8010586e <alltraps>

80105e95 <vector42>:
80105e95:	6a 00                	push   $0x0
80105e97:	6a 2a                	push   $0x2a
80105e99:	e9 d0 f9 ff ff       	jmp    8010586e <alltraps>

80105e9e <vector43>:
80105e9e:	6a 00                	push   $0x0
80105ea0:	6a 2b                	push   $0x2b
80105ea2:	e9 c7 f9 ff ff       	jmp    8010586e <alltraps>

80105ea7 <vector44>:
80105ea7:	6a 00                	push   $0x0
80105ea9:	6a 2c                	push   $0x2c
80105eab:	e9 be f9 ff ff       	jmp    8010586e <alltraps>

80105eb0 <vector45>:
80105eb0:	6a 00                	push   $0x0
80105eb2:	6a 2d                	push   $0x2d
80105eb4:	e9 b5 f9 ff ff       	jmp    8010586e <alltraps>

80105eb9 <vector46>:
80105eb9:	6a 00                	push   $0x0
80105ebb:	6a 2e                	push   $0x2e
80105ebd:	e9 ac f9 ff ff       	jmp    8010586e <alltraps>

80105ec2 <vector47>:
80105ec2:	6a 00                	push   $0x0
80105ec4:	6a 2f                	push   $0x2f
80105ec6:	e9 a3 f9 ff ff       	jmp    8010586e <alltraps>

80105ecb <vector48>:
80105ecb:	6a 00                	push   $0x0
80105ecd:	6a 30                	push   $0x30
80105ecf:	e9 9a f9 ff ff       	jmp    8010586e <alltraps>

80105ed4 <vector49>:
80105ed4:	6a 00                	push   $0x0
80105ed6:	6a 31                	push   $0x31
80105ed8:	e9 91 f9 ff ff       	jmp    8010586e <alltraps>

80105edd <vector50>:
80105edd:	6a 00                	push   $0x0
80105edf:	6a 32                	push   $0x32
80105ee1:	e9 88 f9 ff ff       	jmp    8010586e <alltraps>

80105ee6 <vector51>:
80105ee6:	6a 00                	push   $0x0
80105ee8:	6a 33                	push   $0x33
80105eea:	e9 7f f9 ff ff       	jmp    8010586e <alltraps>

80105eef <vector52>:
80105eef:	6a 00                	push   $0x0
80105ef1:	6a 34                	push   $0x34
80105ef3:	e9 76 f9 ff ff       	jmp    8010586e <alltraps>

80105ef8 <vector53>:
80105ef8:	6a 00                	push   $0x0
80105efa:	6a 35                	push   $0x35
80105efc:	e9 6d f9 ff ff       	jmp    8010586e <alltraps>

80105f01 <vector54>:
80105f01:	6a 00                	push   $0x0
80105f03:	6a 36                	push   $0x36
80105f05:	e9 64 f9 ff ff       	jmp    8010586e <alltraps>

80105f0a <vector55>:
80105f0a:	6a 00                	push   $0x0
80105f0c:	6a 37                	push   $0x37
80105f0e:	e9 5b f9 ff ff       	jmp    8010586e <alltraps>

80105f13 <vector56>:
80105f13:	6a 00                	push   $0x0
80105f15:	6a 38                	push   $0x38
80105f17:	e9 52 f9 ff ff       	jmp    8010586e <alltraps>

80105f1c <vector57>:
80105f1c:	6a 00                	push   $0x0
80105f1e:	6a 39                	push   $0x39
80105f20:	e9 49 f9 ff ff       	jmp    8010586e <alltraps>

80105f25 <vector58>:
80105f25:	6a 00                	push   $0x0
80105f27:	6a 3a                	push   $0x3a
80105f29:	e9 40 f9 ff ff       	jmp    8010586e <alltraps>

80105f2e <vector59>:
80105f2e:	6a 00                	push   $0x0
80105f30:	6a 3b                	push   $0x3b
80105f32:	e9 37 f9 ff ff       	jmp    8010586e <alltraps>

80105f37 <vector60>:
80105f37:	6a 00                	push   $0x0
80105f39:	6a 3c                	push   $0x3c
80105f3b:	e9 2e f9 ff ff       	jmp    8010586e <alltraps>

80105f40 <vector61>:
80105f40:	6a 00                	push   $0x0
80105f42:	6a 3d                	push   $0x3d
80105f44:	e9 25 f9 ff ff       	jmp    8010586e <alltraps>

80105f49 <vector62>:
80105f49:	6a 00                	push   $0x0
80105f4b:	6a 3e                	push   $0x3e
80105f4d:	e9 1c f9 ff ff       	jmp    8010586e <alltraps>

80105f52 <vector63>:
80105f52:	6a 00                	push   $0x0
80105f54:	6a 3f                	push   $0x3f
80105f56:	e9 13 f9 ff ff       	jmp    8010586e <alltraps>

80105f5b <vector64>:
80105f5b:	6a 00                	push   $0x0
80105f5d:	6a 40                	push   $0x40
80105f5f:	e9 0a f9 ff ff       	jmp    8010586e <alltraps>

80105f64 <vector65>:
80105f64:	6a 00                	push   $0x0
80105f66:	6a 41                	push   $0x41
80105f68:	e9 01 f9 ff ff       	jmp    8010586e <alltraps>

80105f6d <vector66>:
80105f6d:	6a 00                	push   $0x0
80105f6f:	6a 42                	push   $0x42
80105f71:	e9 f8 f8 ff ff       	jmp    8010586e <alltraps>

80105f76 <vector67>:
80105f76:	6a 00                	push   $0x0
80105f78:	6a 43                	push   $0x43
80105f7a:	e9 ef f8 ff ff       	jmp    8010586e <alltraps>

80105f7f <vector68>:
80105f7f:	6a 00                	push   $0x0
80105f81:	6a 44                	push   $0x44
80105f83:	e9 e6 f8 ff ff       	jmp    8010586e <alltraps>

80105f88 <vector69>:
80105f88:	6a 00                	push   $0x0
80105f8a:	6a 45                	push   $0x45
80105f8c:	e9 dd f8 ff ff       	jmp    8010586e <alltraps>

80105f91 <vector70>:
80105f91:	6a 00                	push   $0x0
80105f93:	6a 46                	push   $0x46
80105f95:	e9 d4 f8 ff ff       	jmp    8010586e <alltraps>

80105f9a <vector71>:
80105f9a:	6a 00                	push   $0x0
80105f9c:	6a 47                	push   $0x47
80105f9e:	e9 cb f8 ff ff       	jmp    8010586e <alltraps>

80105fa3 <vector72>:
80105fa3:	6a 00                	push   $0x0
80105fa5:	6a 48                	push   $0x48
80105fa7:	e9 c2 f8 ff ff       	jmp    8010586e <alltraps>

80105fac <vector73>:
80105fac:	6a 00                	push   $0x0
80105fae:	6a 49                	push   $0x49
80105fb0:	e9 b9 f8 ff ff       	jmp    8010586e <alltraps>

80105fb5 <vector74>:
80105fb5:	6a 00                	push   $0x0
80105fb7:	6a 4a                	push   $0x4a
80105fb9:	e9 b0 f8 ff ff       	jmp    8010586e <alltraps>

80105fbe <vector75>:
80105fbe:	6a 00                	push   $0x0
80105fc0:	6a 4b                	push   $0x4b
80105fc2:	e9 a7 f8 ff ff       	jmp    8010586e <alltraps>

80105fc7 <vector76>:
80105fc7:	6a 00                	push   $0x0
80105fc9:	6a 4c                	push   $0x4c
80105fcb:	e9 9e f8 ff ff       	jmp    8010586e <alltraps>

80105fd0 <vector77>:
80105fd0:	6a 00                	push   $0x0
80105fd2:	6a 4d                	push   $0x4d
80105fd4:	e9 95 f8 ff ff       	jmp    8010586e <alltraps>

80105fd9 <vector78>:
80105fd9:	6a 00                	push   $0x0
80105fdb:	6a 4e                	push   $0x4e
80105fdd:	e9 8c f8 ff ff       	jmp    8010586e <alltraps>

80105fe2 <vector79>:
80105fe2:	6a 00                	push   $0x0
80105fe4:	6a 4f                	push   $0x4f
80105fe6:	e9 83 f8 ff ff       	jmp    8010586e <alltraps>

80105feb <vector80>:
80105feb:	6a 00                	push   $0x0
80105fed:	6a 50                	push   $0x50
80105fef:	e9 7a f8 ff ff       	jmp    8010586e <alltraps>

80105ff4 <vector81>:
80105ff4:	6a 00                	push   $0x0
80105ff6:	6a 51                	push   $0x51
80105ff8:	e9 71 f8 ff ff       	jmp    8010586e <alltraps>

80105ffd <vector82>:
80105ffd:	6a 00                	push   $0x0
80105fff:	6a 52                	push   $0x52
80106001:	e9 68 f8 ff ff       	jmp    8010586e <alltraps>

80106006 <vector83>:
80106006:	6a 00                	push   $0x0
80106008:	6a 53                	push   $0x53
8010600a:	e9 5f f8 ff ff       	jmp    8010586e <alltraps>

8010600f <vector84>:
8010600f:	6a 00                	push   $0x0
80106011:	6a 54                	push   $0x54
80106013:	e9 56 f8 ff ff       	jmp    8010586e <alltraps>

80106018 <vector85>:
80106018:	6a 00                	push   $0x0
8010601a:	6a 55                	push   $0x55
8010601c:	e9 4d f8 ff ff       	jmp    8010586e <alltraps>

80106021 <vector86>:
80106021:	6a 00                	push   $0x0
80106023:	6a 56                	push   $0x56
80106025:	e9 44 f8 ff ff       	jmp    8010586e <alltraps>

8010602a <vector87>:
8010602a:	6a 00                	push   $0x0
8010602c:	6a 57                	push   $0x57
8010602e:	e9 3b f8 ff ff       	jmp    8010586e <alltraps>

80106033 <vector88>:
80106033:	6a 00                	push   $0x0
80106035:	6a 58                	push   $0x58
80106037:	e9 32 f8 ff ff       	jmp    8010586e <alltraps>

8010603c <vector89>:
8010603c:	6a 00                	push   $0x0
8010603e:	6a 59                	push   $0x59
80106040:	e9 29 f8 ff ff       	jmp    8010586e <alltraps>

80106045 <vector90>:
80106045:	6a 00                	push   $0x0
80106047:	6a 5a                	push   $0x5a
80106049:	e9 20 f8 ff ff       	jmp    8010586e <alltraps>

8010604e <vector91>:
8010604e:	6a 00                	push   $0x0
80106050:	6a 5b                	push   $0x5b
80106052:	e9 17 f8 ff ff       	jmp    8010586e <alltraps>

80106057 <vector92>:
80106057:	6a 00                	push   $0x0
80106059:	6a 5c                	push   $0x5c
8010605b:	e9 0e f8 ff ff       	jmp    8010586e <alltraps>

80106060 <vector93>:
80106060:	6a 00                	push   $0x0
80106062:	6a 5d                	push   $0x5d
80106064:	e9 05 f8 ff ff       	jmp    8010586e <alltraps>

80106069 <vector94>:
80106069:	6a 00                	push   $0x0
8010606b:	6a 5e                	push   $0x5e
8010606d:	e9 fc f7 ff ff       	jmp    8010586e <alltraps>

80106072 <vector95>:
80106072:	6a 00                	push   $0x0
80106074:	6a 5f                	push   $0x5f
80106076:	e9 f3 f7 ff ff       	jmp    8010586e <alltraps>

8010607b <vector96>:
8010607b:	6a 00                	push   $0x0
8010607d:	6a 60                	push   $0x60
8010607f:	e9 ea f7 ff ff       	jmp    8010586e <alltraps>

80106084 <vector97>:
80106084:	6a 00                	push   $0x0
80106086:	6a 61                	push   $0x61
80106088:	e9 e1 f7 ff ff       	jmp    8010586e <alltraps>

8010608d <vector98>:
8010608d:	6a 00                	push   $0x0
8010608f:	6a 62                	push   $0x62
80106091:	e9 d8 f7 ff ff       	jmp    8010586e <alltraps>

80106096 <vector99>:
80106096:	6a 00                	push   $0x0
80106098:	6a 63                	push   $0x63
8010609a:	e9 cf f7 ff ff       	jmp    8010586e <alltraps>

8010609f <vector100>:
8010609f:	6a 00                	push   $0x0
801060a1:	6a 64                	push   $0x64
801060a3:	e9 c6 f7 ff ff       	jmp    8010586e <alltraps>

801060a8 <vector101>:
801060a8:	6a 00                	push   $0x0
801060aa:	6a 65                	push   $0x65
801060ac:	e9 bd f7 ff ff       	jmp    8010586e <alltraps>

801060b1 <vector102>:
801060b1:	6a 00                	push   $0x0
801060b3:	6a 66                	push   $0x66
801060b5:	e9 b4 f7 ff ff       	jmp    8010586e <alltraps>

801060ba <vector103>:
801060ba:	6a 00                	push   $0x0
801060bc:	6a 67                	push   $0x67
801060be:	e9 ab f7 ff ff       	jmp    8010586e <alltraps>

801060c3 <vector104>:
801060c3:	6a 00                	push   $0x0
801060c5:	6a 68                	push   $0x68
801060c7:	e9 a2 f7 ff ff       	jmp    8010586e <alltraps>

801060cc <vector105>:
801060cc:	6a 00                	push   $0x0
801060ce:	6a 69                	push   $0x69
801060d0:	e9 99 f7 ff ff       	jmp    8010586e <alltraps>

801060d5 <vector106>:
801060d5:	6a 00                	push   $0x0
801060d7:	6a 6a                	push   $0x6a
801060d9:	e9 90 f7 ff ff       	jmp    8010586e <alltraps>

801060de <vector107>:
801060de:	6a 00                	push   $0x0
801060e0:	6a 6b                	push   $0x6b
801060e2:	e9 87 f7 ff ff       	jmp    8010586e <alltraps>

801060e7 <vector108>:
801060e7:	6a 00                	push   $0x0
801060e9:	6a 6c                	push   $0x6c
801060eb:	e9 7e f7 ff ff       	jmp    8010586e <alltraps>

801060f0 <vector109>:
801060f0:	6a 00                	push   $0x0
801060f2:	6a 6d                	push   $0x6d
801060f4:	e9 75 f7 ff ff       	jmp    8010586e <alltraps>

801060f9 <vector110>:
801060f9:	6a 00                	push   $0x0
801060fb:	6a 6e                	push   $0x6e
801060fd:	e9 6c f7 ff ff       	jmp    8010586e <alltraps>

80106102 <vector111>:
80106102:	6a 00                	push   $0x0
80106104:	6a 6f                	push   $0x6f
80106106:	e9 63 f7 ff ff       	jmp    8010586e <alltraps>

8010610b <vector112>:
8010610b:	6a 00                	push   $0x0
8010610d:	6a 70                	push   $0x70
8010610f:	e9 5a f7 ff ff       	jmp    8010586e <alltraps>

80106114 <vector113>:
80106114:	6a 00                	push   $0x0
80106116:	6a 71                	push   $0x71
80106118:	e9 51 f7 ff ff       	jmp    8010586e <alltraps>

8010611d <vector114>:
8010611d:	6a 00                	push   $0x0
8010611f:	6a 72                	push   $0x72
80106121:	e9 48 f7 ff ff       	jmp    8010586e <alltraps>

80106126 <vector115>:
80106126:	6a 00                	push   $0x0
80106128:	6a 73                	push   $0x73
8010612a:	e9 3f f7 ff ff       	jmp    8010586e <alltraps>

8010612f <vector116>:
8010612f:	6a 00                	push   $0x0
80106131:	6a 74                	push   $0x74
80106133:	e9 36 f7 ff ff       	jmp    8010586e <alltraps>

80106138 <vector117>:
80106138:	6a 00                	push   $0x0
8010613a:	6a 75                	push   $0x75
8010613c:	e9 2d f7 ff ff       	jmp    8010586e <alltraps>

80106141 <vector118>:
80106141:	6a 00                	push   $0x0
80106143:	6a 76                	push   $0x76
80106145:	e9 24 f7 ff ff       	jmp    8010586e <alltraps>

8010614a <vector119>:
8010614a:	6a 00                	push   $0x0
8010614c:	6a 77                	push   $0x77
8010614e:	e9 1b f7 ff ff       	jmp    8010586e <alltraps>

80106153 <vector120>:
80106153:	6a 00                	push   $0x0
80106155:	6a 78                	push   $0x78
80106157:	e9 12 f7 ff ff       	jmp    8010586e <alltraps>

8010615c <vector121>:
8010615c:	6a 00                	push   $0x0
8010615e:	6a 79                	push   $0x79
80106160:	e9 09 f7 ff ff       	jmp    8010586e <alltraps>

80106165 <vector122>:
80106165:	6a 00                	push   $0x0
80106167:	6a 7a                	push   $0x7a
80106169:	e9 00 f7 ff ff       	jmp    8010586e <alltraps>

8010616e <vector123>:
8010616e:	6a 00                	push   $0x0
80106170:	6a 7b                	push   $0x7b
80106172:	e9 f7 f6 ff ff       	jmp    8010586e <alltraps>

80106177 <vector124>:
80106177:	6a 00                	push   $0x0
80106179:	6a 7c                	push   $0x7c
8010617b:	e9 ee f6 ff ff       	jmp    8010586e <alltraps>

80106180 <vector125>:
80106180:	6a 00                	push   $0x0
80106182:	6a 7d                	push   $0x7d
80106184:	e9 e5 f6 ff ff       	jmp    8010586e <alltraps>

80106189 <vector126>:
80106189:	6a 00                	push   $0x0
8010618b:	6a 7e                	push   $0x7e
8010618d:	e9 dc f6 ff ff       	jmp    8010586e <alltraps>

80106192 <vector127>:
80106192:	6a 00                	push   $0x0
80106194:	6a 7f                	push   $0x7f
80106196:	e9 d3 f6 ff ff       	jmp    8010586e <alltraps>

8010619b <vector128>:
8010619b:	6a 00                	push   $0x0
8010619d:	68 80 00 00 00       	push   $0x80
801061a2:	e9 c7 f6 ff ff       	jmp    8010586e <alltraps>

801061a7 <vector129>:
801061a7:	6a 00                	push   $0x0
801061a9:	68 81 00 00 00       	push   $0x81
801061ae:	e9 bb f6 ff ff       	jmp    8010586e <alltraps>

801061b3 <vector130>:
801061b3:	6a 00                	push   $0x0
801061b5:	68 82 00 00 00       	push   $0x82
801061ba:	e9 af f6 ff ff       	jmp    8010586e <alltraps>

801061bf <vector131>:
801061bf:	6a 00                	push   $0x0
801061c1:	68 83 00 00 00       	push   $0x83
801061c6:	e9 a3 f6 ff ff       	jmp    8010586e <alltraps>

801061cb <vector132>:
801061cb:	6a 00                	push   $0x0
801061cd:	68 84 00 00 00       	push   $0x84
801061d2:	e9 97 f6 ff ff       	jmp    8010586e <alltraps>

801061d7 <vector133>:
801061d7:	6a 00                	push   $0x0
801061d9:	68 85 00 00 00       	push   $0x85
801061de:	e9 8b f6 ff ff       	jmp    8010586e <alltraps>

801061e3 <vector134>:
801061e3:	6a 00                	push   $0x0
801061e5:	68 86 00 00 00       	push   $0x86
801061ea:	e9 7f f6 ff ff       	jmp    8010586e <alltraps>

801061ef <vector135>:
801061ef:	6a 00                	push   $0x0
801061f1:	68 87 00 00 00       	push   $0x87
801061f6:	e9 73 f6 ff ff       	jmp    8010586e <alltraps>

801061fb <vector136>:
801061fb:	6a 00                	push   $0x0
801061fd:	68 88 00 00 00       	push   $0x88
80106202:	e9 67 f6 ff ff       	jmp    8010586e <alltraps>

80106207 <vector137>:
80106207:	6a 00                	push   $0x0
80106209:	68 89 00 00 00       	push   $0x89
8010620e:	e9 5b f6 ff ff       	jmp    8010586e <alltraps>

80106213 <vector138>:
80106213:	6a 00                	push   $0x0
80106215:	68 8a 00 00 00       	push   $0x8a
8010621a:	e9 4f f6 ff ff       	jmp    8010586e <alltraps>

8010621f <vector139>:
8010621f:	6a 00                	push   $0x0
80106221:	68 8b 00 00 00       	push   $0x8b
80106226:	e9 43 f6 ff ff       	jmp    8010586e <alltraps>

8010622b <vector140>:
8010622b:	6a 00                	push   $0x0
8010622d:	68 8c 00 00 00       	push   $0x8c
80106232:	e9 37 f6 ff ff       	jmp    8010586e <alltraps>

80106237 <vector141>:
80106237:	6a 00                	push   $0x0
80106239:	68 8d 00 00 00       	push   $0x8d
8010623e:	e9 2b f6 ff ff       	jmp    8010586e <alltraps>

80106243 <vector142>:
80106243:	6a 00                	push   $0x0
80106245:	68 8e 00 00 00       	push   $0x8e
8010624a:	e9 1f f6 ff ff       	jmp    8010586e <alltraps>

8010624f <vector143>:
8010624f:	6a 00                	push   $0x0
80106251:	68 8f 00 00 00       	push   $0x8f
80106256:	e9 13 f6 ff ff       	jmp    8010586e <alltraps>

8010625b <vector144>:
8010625b:	6a 00                	push   $0x0
8010625d:	68 90 00 00 00       	push   $0x90
80106262:	e9 07 f6 ff ff       	jmp    8010586e <alltraps>

80106267 <vector145>:
80106267:	6a 00                	push   $0x0
80106269:	68 91 00 00 00       	push   $0x91
8010626e:	e9 fb f5 ff ff       	jmp    8010586e <alltraps>

80106273 <vector146>:
80106273:	6a 00                	push   $0x0
80106275:	68 92 00 00 00       	push   $0x92
8010627a:	e9 ef f5 ff ff       	jmp    8010586e <alltraps>

8010627f <vector147>:
8010627f:	6a 00                	push   $0x0
80106281:	68 93 00 00 00       	push   $0x93
80106286:	e9 e3 f5 ff ff       	jmp    8010586e <alltraps>

8010628b <vector148>:
8010628b:	6a 00                	push   $0x0
8010628d:	68 94 00 00 00       	push   $0x94
80106292:	e9 d7 f5 ff ff       	jmp    8010586e <alltraps>

80106297 <vector149>:
80106297:	6a 00                	push   $0x0
80106299:	68 95 00 00 00       	push   $0x95
8010629e:	e9 cb f5 ff ff       	jmp    8010586e <alltraps>

801062a3 <vector150>:
801062a3:	6a 00                	push   $0x0
801062a5:	68 96 00 00 00       	push   $0x96
801062aa:	e9 bf f5 ff ff       	jmp    8010586e <alltraps>

801062af <vector151>:
801062af:	6a 00                	push   $0x0
801062b1:	68 97 00 00 00       	push   $0x97
801062b6:	e9 b3 f5 ff ff       	jmp    8010586e <alltraps>

801062bb <vector152>:
801062bb:	6a 00                	push   $0x0
801062bd:	68 98 00 00 00       	push   $0x98
801062c2:	e9 a7 f5 ff ff       	jmp    8010586e <alltraps>

801062c7 <vector153>:
801062c7:	6a 00                	push   $0x0
801062c9:	68 99 00 00 00       	push   $0x99
801062ce:	e9 9b f5 ff ff       	jmp    8010586e <alltraps>

801062d3 <vector154>:
801062d3:	6a 00                	push   $0x0
801062d5:	68 9a 00 00 00       	push   $0x9a
801062da:	e9 8f f5 ff ff       	jmp    8010586e <alltraps>

801062df <vector155>:
801062df:	6a 00                	push   $0x0
801062e1:	68 9b 00 00 00       	push   $0x9b
801062e6:	e9 83 f5 ff ff       	jmp    8010586e <alltraps>

801062eb <vector156>:
801062eb:	6a 00                	push   $0x0
801062ed:	68 9c 00 00 00       	push   $0x9c
801062f2:	e9 77 f5 ff ff       	jmp    8010586e <alltraps>

801062f7 <vector157>:
801062f7:	6a 00                	push   $0x0
801062f9:	68 9d 00 00 00       	push   $0x9d
801062fe:	e9 6b f5 ff ff       	jmp    8010586e <alltraps>

80106303 <vector158>:
80106303:	6a 00                	push   $0x0
80106305:	68 9e 00 00 00       	push   $0x9e
8010630a:	e9 5f f5 ff ff       	jmp    8010586e <alltraps>

8010630f <vector159>:
8010630f:	6a 00                	push   $0x0
80106311:	68 9f 00 00 00       	push   $0x9f
80106316:	e9 53 f5 ff ff       	jmp    8010586e <alltraps>

8010631b <vector160>:
8010631b:	6a 00                	push   $0x0
8010631d:	68 a0 00 00 00       	push   $0xa0
80106322:	e9 47 f5 ff ff       	jmp    8010586e <alltraps>

80106327 <vector161>:
80106327:	6a 00                	push   $0x0
80106329:	68 a1 00 00 00       	push   $0xa1
8010632e:	e9 3b f5 ff ff       	jmp    8010586e <alltraps>

80106333 <vector162>:
80106333:	6a 00                	push   $0x0
80106335:	68 a2 00 00 00       	push   $0xa2
8010633a:	e9 2f f5 ff ff       	jmp    8010586e <alltraps>

8010633f <vector163>:
8010633f:	6a 00                	push   $0x0
80106341:	68 a3 00 00 00       	push   $0xa3
80106346:	e9 23 f5 ff ff       	jmp    8010586e <alltraps>

8010634b <vector164>:
8010634b:	6a 00                	push   $0x0
8010634d:	68 a4 00 00 00       	push   $0xa4
80106352:	e9 17 f5 ff ff       	jmp    8010586e <alltraps>

80106357 <vector165>:
80106357:	6a 00                	push   $0x0
80106359:	68 a5 00 00 00       	push   $0xa5
8010635e:	e9 0b f5 ff ff       	jmp    8010586e <alltraps>

80106363 <vector166>:
80106363:	6a 00                	push   $0x0
80106365:	68 a6 00 00 00       	push   $0xa6
8010636a:	e9 ff f4 ff ff       	jmp    8010586e <alltraps>

8010636f <vector167>:
8010636f:	6a 00                	push   $0x0
80106371:	68 a7 00 00 00       	push   $0xa7
80106376:	e9 f3 f4 ff ff       	jmp    8010586e <alltraps>

8010637b <vector168>:
8010637b:	6a 00                	push   $0x0
8010637d:	68 a8 00 00 00       	push   $0xa8
80106382:	e9 e7 f4 ff ff       	jmp    8010586e <alltraps>

80106387 <vector169>:
80106387:	6a 00                	push   $0x0
80106389:	68 a9 00 00 00       	push   $0xa9
8010638e:	e9 db f4 ff ff       	jmp    8010586e <alltraps>

80106393 <vector170>:
80106393:	6a 00                	push   $0x0
80106395:	68 aa 00 00 00       	push   $0xaa
8010639a:	e9 cf f4 ff ff       	jmp    8010586e <alltraps>

8010639f <vector171>:
8010639f:	6a 00                	push   $0x0
801063a1:	68 ab 00 00 00       	push   $0xab
801063a6:	e9 c3 f4 ff ff       	jmp    8010586e <alltraps>

801063ab <vector172>:
801063ab:	6a 00                	push   $0x0
801063ad:	68 ac 00 00 00       	push   $0xac
801063b2:	e9 b7 f4 ff ff       	jmp    8010586e <alltraps>

801063b7 <vector173>:
801063b7:	6a 00                	push   $0x0
801063b9:	68 ad 00 00 00       	push   $0xad
801063be:	e9 ab f4 ff ff       	jmp    8010586e <alltraps>

801063c3 <vector174>:
801063c3:	6a 00                	push   $0x0
801063c5:	68 ae 00 00 00       	push   $0xae
801063ca:	e9 9f f4 ff ff       	jmp    8010586e <alltraps>

801063cf <vector175>:
801063cf:	6a 00                	push   $0x0
801063d1:	68 af 00 00 00       	push   $0xaf
801063d6:	e9 93 f4 ff ff       	jmp    8010586e <alltraps>

801063db <vector176>:
801063db:	6a 00                	push   $0x0
801063dd:	68 b0 00 00 00       	push   $0xb0
801063e2:	e9 87 f4 ff ff       	jmp    8010586e <alltraps>

801063e7 <vector177>:
801063e7:	6a 00                	push   $0x0
801063e9:	68 b1 00 00 00       	push   $0xb1
801063ee:	e9 7b f4 ff ff       	jmp    8010586e <alltraps>

801063f3 <vector178>:
801063f3:	6a 00                	push   $0x0
801063f5:	68 b2 00 00 00       	push   $0xb2
801063fa:	e9 6f f4 ff ff       	jmp    8010586e <alltraps>

801063ff <vector179>:
801063ff:	6a 00                	push   $0x0
80106401:	68 b3 00 00 00       	push   $0xb3
80106406:	e9 63 f4 ff ff       	jmp    8010586e <alltraps>

8010640b <vector180>:
8010640b:	6a 00                	push   $0x0
8010640d:	68 b4 00 00 00       	push   $0xb4
80106412:	e9 57 f4 ff ff       	jmp    8010586e <alltraps>

80106417 <vector181>:
80106417:	6a 00                	push   $0x0
80106419:	68 b5 00 00 00       	push   $0xb5
8010641e:	e9 4b f4 ff ff       	jmp    8010586e <alltraps>

80106423 <vector182>:
80106423:	6a 00                	push   $0x0
80106425:	68 b6 00 00 00       	push   $0xb6
8010642a:	e9 3f f4 ff ff       	jmp    8010586e <alltraps>

8010642f <vector183>:
8010642f:	6a 00                	push   $0x0
80106431:	68 b7 00 00 00       	push   $0xb7
80106436:	e9 33 f4 ff ff       	jmp    8010586e <alltraps>

8010643b <vector184>:
8010643b:	6a 00                	push   $0x0
8010643d:	68 b8 00 00 00       	push   $0xb8
80106442:	e9 27 f4 ff ff       	jmp    8010586e <alltraps>

80106447 <vector185>:
80106447:	6a 00                	push   $0x0
80106449:	68 b9 00 00 00       	push   $0xb9
8010644e:	e9 1b f4 ff ff       	jmp    8010586e <alltraps>

80106453 <vector186>:
80106453:	6a 00                	push   $0x0
80106455:	68 ba 00 00 00       	push   $0xba
8010645a:	e9 0f f4 ff ff       	jmp    8010586e <alltraps>

8010645f <vector187>:
8010645f:	6a 00                	push   $0x0
80106461:	68 bb 00 00 00       	push   $0xbb
80106466:	e9 03 f4 ff ff       	jmp    8010586e <alltraps>

8010646b <vector188>:
8010646b:	6a 00                	push   $0x0
8010646d:	68 bc 00 00 00       	push   $0xbc
80106472:	e9 f7 f3 ff ff       	jmp    8010586e <alltraps>

80106477 <vector189>:
80106477:	6a 00                	push   $0x0
80106479:	68 bd 00 00 00       	push   $0xbd
8010647e:	e9 eb f3 ff ff       	jmp    8010586e <alltraps>

80106483 <vector190>:
80106483:	6a 00                	push   $0x0
80106485:	68 be 00 00 00       	push   $0xbe
8010648a:	e9 df f3 ff ff       	jmp    8010586e <alltraps>

8010648f <vector191>:
8010648f:	6a 00                	push   $0x0
80106491:	68 bf 00 00 00       	push   $0xbf
80106496:	e9 d3 f3 ff ff       	jmp    8010586e <alltraps>

8010649b <vector192>:
8010649b:	6a 00                	push   $0x0
8010649d:	68 c0 00 00 00       	push   $0xc0
801064a2:	e9 c7 f3 ff ff       	jmp    8010586e <alltraps>

801064a7 <vector193>:
801064a7:	6a 00                	push   $0x0
801064a9:	68 c1 00 00 00       	push   $0xc1
801064ae:	e9 bb f3 ff ff       	jmp    8010586e <alltraps>

801064b3 <vector194>:
801064b3:	6a 00                	push   $0x0
801064b5:	68 c2 00 00 00       	push   $0xc2
801064ba:	e9 af f3 ff ff       	jmp    8010586e <alltraps>

801064bf <vector195>:
801064bf:	6a 00                	push   $0x0
801064c1:	68 c3 00 00 00       	push   $0xc3
801064c6:	e9 a3 f3 ff ff       	jmp    8010586e <alltraps>

801064cb <vector196>:
801064cb:	6a 00                	push   $0x0
801064cd:	68 c4 00 00 00       	push   $0xc4
801064d2:	e9 97 f3 ff ff       	jmp    8010586e <alltraps>

801064d7 <vector197>:
801064d7:	6a 00                	push   $0x0
801064d9:	68 c5 00 00 00       	push   $0xc5
801064de:	e9 8b f3 ff ff       	jmp    8010586e <alltraps>

801064e3 <vector198>:
801064e3:	6a 00                	push   $0x0
801064e5:	68 c6 00 00 00       	push   $0xc6
801064ea:	e9 7f f3 ff ff       	jmp    8010586e <alltraps>

801064ef <vector199>:
801064ef:	6a 00                	push   $0x0
801064f1:	68 c7 00 00 00       	push   $0xc7
801064f6:	e9 73 f3 ff ff       	jmp    8010586e <alltraps>

801064fb <vector200>:
801064fb:	6a 00                	push   $0x0
801064fd:	68 c8 00 00 00       	push   $0xc8
80106502:	e9 67 f3 ff ff       	jmp    8010586e <alltraps>

80106507 <vector201>:
80106507:	6a 00                	push   $0x0
80106509:	68 c9 00 00 00       	push   $0xc9
8010650e:	e9 5b f3 ff ff       	jmp    8010586e <alltraps>

80106513 <vector202>:
80106513:	6a 00                	push   $0x0
80106515:	68 ca 00 00 00       	push   $0xca
8010651a:	e9 4f f3 ff ff       	jmp    8010586e <alltraps>

8010651f <vector203>:
8010651f:	6a 00                	push   $0x0
80106521:	68 cb 00 00 00       	push   $0xcb
80106526:	e9 43 f3 ff ff       	jmp    8010586e <alltraps>

8010652b <vector204>:
8010652b:	6a 00                	push   $0x0
8010652d:	68 cc 00 00 00       	push   $0xcc
80106532:	e9 37 f3 ff ff       	jmp    8010586e <alltraps>

80106537 <vector205>:
80106537:	6a 00                	push   $0x0
80106539:	68 cd 00 00 00       	push   $0xcd
8010653e:	e9 2b f3 ff ff       	jmp    8010586e <alltraps>

80106543 <vector206>:
80106543:	6a 00                	push   $0x0
80106545:	68 ce 00 00 00       	push   $0xce
8010654a:	e9 1f f3 ff ff       	jmp    8010586e <alltraps>

8010654f <vector207>:
8010654f:	6a 00                	push   $0x0
80106551:	68 cf 00 00 00       	push   $0xcf
80106556:	e9 13 f3 ff ff       	jmp    8010586e <alltraps>

8010655b <vector208>:
8010655b:	6a 00                	push   $0x0
8010655d:	68 d0 00 00 00       	push   $0xd0
80106562:	e9 07 f3 ff ff       	jmp    8010586e <alltraps>

80106567 <vector209>:
80106567:	6a 00                	push   $0x0
80106569:	68 d1 00 00 00       	push   $0xd1
8010656e:	e9 fb f2 ff ff       	jmp    8010586e <alltraps>

80106573 <vector210>:
80106573:	6a 00                	push   $0x0
80106575:	68 d2 00 00 00       	push   $0xd2
8010657a:	e9 ef f2 ff ff       	jmp    8010586e <alltraps>

8010657f <vector211>:
8010657f:	6a 00                	push   $0x0
80106581:	68 d3 00 00 00       	push   $0xd3
80106586:	e9 e3 f2 ff ff       	jmp    8010586e <alltraps>

8010658b <vector212>:
8010658b:	6a 00                	push   $0x0
8010658d:	68 d4 00 00 00       	push   $0xd4
80106592:	e9 d7 f2 ff ff       	jmp    8010586e <alltraps>

80106597 <vector213>:
80106597:	6a 00                	push   $0x0
80106599:	68 d5 00 00 00       	push   $0xd5
8010659e:	e9 cb f2 ff ff       	jmp    8010586e <alltraps>

801065a3 <vector214>:
801065a3:	6a 00                	push   $0x0
801065a5:	68 d6 00 00 00       	push   $0xd6
801065aa:	e9 bf f2 ff ff       	jmp    8010586e <alltraps>

801065af <vector215>:
801065af:	6a 00                	push   $0x0
801065b1:	68 d7 00 00 00       	push   $0xd7
801065b6:	e9 b3 f2 ff ff       	jmp    8010586e <alltraps>

801065bb <vector216>:
801065bb:	6a 00                	push   $0x0
801065bd:	68 d8 00 00 00       	push   $0xd8
801065c2:	e9 a7 f2 ff ff       	jmp    8010586e <alltraps>

801065c7 <vector217>:
801065c7:	6a 00                	push   $0x0
801065c9:	68 d9 00 00 00       	push   $0xd9
801065ce:	e9 9b f2 ff ff       	jmp    8010586e <alltraps>

801065d3 <vector218>:
801065d3:	6a 00                	push   $0x0
801065d5:	68 da 00 00 00       	push   $0xda
801065da:	e9 8f f2 ff ff       	jmp    8010586e <alltraps>

801065df <vector219>:
801065df:	6a 00                	push   $0x0
801065e1:	68 db 00 00 00       	push   $0xdb
801065e6:	e9 83 f2 ff ff       	jmp    8010586e <alltraps>

801065eb <vector220>:
801065eb:	6a 00                	push   $0x0
801065ed:	68 dc 00 00 00       	push   $0xdc
801065f2:	e9 77 f2 ff ff       	jmp    8010586e <alltraps>

801065f7 <vector221>:
801065f7:	6a 00                	push   $0x0
801065f9:	68 dd 00 00 00       	push   $0xdd
801065fe:	e9 6b f2 ff ff       	jmp    8010586e <alltraps>

80106603 <vector222>:
80106603:	6a 00                	push   $0x0
80106605:	68 de 00 00 00       	push   $0xde
8010660a:	e9 5f f2 ff ff       	jmp    8010586e <alltraps>

8010660f <vector223>:
8010660f:	6a 00                	push   $0x0
80106611:	68 df 00 00 00       	push   $0xdf
80106616:	e9 53 f2 ff ff       	jmp    8010586e <alltraps>

8010661b <vector224>:
8010661b:	6a 00                	push   $0x0
8010661d:	68 e0 00 00 00       	push   $0xe0
80106622:	e9 47 f2 ff ff       	jmp    8010586e <alltraps>

80106627 <vector225>:
80106627:	6a 00                	push   $0x0
80106629:	68 e1 00 00 00       	push   $0xe1
8010662e:	e9 3b f2 ff ff       	jmp    8010586e <alltraps>

80106633 <vector226>:
80106633:	6a 00                	push   $0x0
80106635:	68 e2 00 00 00       	push   $0xe2
8010663a:	e9 2f f2 ff ff       	jmp    8010586e <alltraps>

8010663f <vector227>:
8010663f:	6a 00                	push   $0x0
80106641:	68 e3 00 00 00       	push   $0xe3
80106646:	e9 23 f2 ff ff       	jmp    8010586e <alltraps>

8010664b <vector228>:
8010664b:	6a 00                	push   $0x0
8010664d:	68 e4 00 00 00       	push   $0xe4
80106652:	e9 17 f2 ff ff       	jmp    8010586e <alltraps>

80106657 <vector229>:
80106657:	6a 00                	push   $0x0
80106659:	68 e5 00 00 00       	push   $0xe5
8010665e:	e9 0b f2 ff ff       	jmp    8010586e <alltraps>

80106663 <vector230>:
80106663:	6a 00                	push   $0x0
80106665:	68 e6 00 00 00       	push   $0xe6
8010666a:	e9 ff f1 ff ff       	jmp    8010586e <alltraps>

8010666f <vector231>:
8010666f:	6a 00                	push   $0x0
80106671:	68 e7 00 00 00       	push   $0xe7
80106676:	e9 f3 f1 ff ff       	jmp    8010586e <alltraps>

8010667b <vector232>:
8010667b:	6a 00                	push   $0x0
8010667d:	68 e8 00 00 00       	push   $0xe8
80106682:	e9 e7 f1 ff ff       	jmp    8010586e <alltraps>

80106687 <vector233>:
80106687:	6a 00                	push   $0x0
80106689:	68 e9 00 00 00       	push   $0xe9
8010668e:	e9 db f1 ff ff       	jmp    8010586e <alltraps>

80106693 <vector234>:
80106693:	6a 00                	push   $0x0
80106695:	68 ea 00 00 00       	push   $0xea
8010669a:	e9 cf f1 ff ff       	jmp    8010586e <alltraps>

8010669f <vector235>:
8010669f:	6a 00                	push   $0x0
801066a1:	68 eb 00 00 00       	push   $0xeb
801066a6:	e9 c3 f1 ff ff       	jmp    8010586e <alltraps>

801066ab <vector236>:
801066ab:	6a 00                	push   $0x0
801066ad:	68 ec 00 00 00       	push   $0xec
801066b2:	e9 b7 f1 ff ff       	jmp    8010586e <alltraps>

801066b7 <vector237>:
801066b7:	6a 00                	push   $0x0
801066b9:	68 ed 00 00 00       	push   $0xed
801066be:	e9 ab f1 ff ff       	jmp    8010586e <alltraps>

801066c3 <vector238>:
801066c3:	6a 00                	push   $0x0
801066c5:	68 ee 00 00 00       	push   $0xee
801066ca:	e9 9f f1 ff ff       	jmp    8010586e <alltraps>

801066cf <vector239>:
801066cf:	6a 00                	push   $0x0
801066d1:	68 ef 00 00 00       	push   $0xef
801066d6:	e9 93 f1 ff ff       	jmp    8010586e <alltraps>

801066db <vector240>:
801066db:	6a 00                	push   $0x0
801066dd:	68 f0 00 00 00       	push   $0xf0
801066e2:	e9 87 f1 ff ff       	jmp    8010586e <alltraps>

801066e7 <vector241>:
801066e7:	6a 00                	push   $0x0
801066e9:	68 f1 00 00 00       	push   $0xf1
801066ee:	e9 7b f1 ff ff       	jmp    8010586e <alltraps>

801066f3 <vector242>:
801066f3:	6a 00                	push   $0x0
801066f5:	68 f2 00 00 00       	push   $0xf2
801066fa:	e9 6f f1 ff ff       	jmp    8010586e <alltraps>

801066ff <vector243>:
801066ff:	6a 00                	push   $0x0
80106701:	68 f3 00 00 00       	push   $0xf3
80106706:	e9 63 f1 ff ff       	jmp    8010586e <alltraps>

8010670b <vector244>:
8010670b:	6a 00                	push   $0x0
8010670d:	68 f4 00 00 00       	push   $0xf4
80106712:	e9 57 f1 ff ff       	jmp    8010586e <alltraps>

80106717 <vector245>:
80106717:	6a 00                	push   $0x0
80106719:	68 f5 00 00 00       	push   $0xf5
8010671e:	e9 4b f1 ff ff       	jmp    8010586e <alltraps>

80106723 <vector246>:
80106723:	6a 00                	push   $0x0
80106725:	68 f6 00 00 00       	push   $0xf6
8010672a:	e9 3f f1 ff ff       	jmp    8010586e <alltraps>

8010672f <vector247>:
8010672f:	6a 00                	push   $0x0
80106731:	68 f7 00 00 00       	push   $0xf7
80106736:	e9 33 f1 ff ff       	jmp    8010586e <alltraps>

8010673b <vector248>:
8010673b:	6a 00                	push   $0x0
8010673d:	68 f8 00 00 00       	push   $0xf8
80106742:	e9 27 f1 ff ff       	jmp    8010586e <alltraps>

80106747 <vector249>:
80106747:	6a 00                	push   $0x0
80106749:	68 f9 00 00 00       	push   $0xf9
8010674e:	e9 1b f1 ff ff       	jmp    8010586e <alltraps>

80106753 <vector250>:
80106753:	6a 00                	push   $0x0
80106755:	68 fa 00 00 00       	push   $0xfa
8010675a:	e9 0f f1 ff ff       	jmp    8010586e <alltraps>

8010675f <vector251>:
8010675f:	6a 00                	push   $0x0
80106761:	68 fb 00 00 00       	push   $0xfb
80106766:	e9 03 f1 ff ff       	jmp    8010586e <alltraps>

8010676b <vector252>:
8010676b:	6a 00                	push   $0x0
8010676d:	68 fc 00 00 00       	push   $0xfc
80106772:	e9 f7 f0 ff ff       	jmp    8010586e <alltraps>

80106777 <vector253>:
80106777:	6a 00                	push   $0x0
80106779:	68 fd 00 00 00       	push   $0xfd
8010677e:	e9 eb f0 ff ff       	jmp    8010586e <alltraps>

80106783 <vector254>:
80106783:	6a 00                	push   $0x0
80106785:	68 fe 00 00 00       	push   $0xfe
8010678a:	e9 df f0 ff ff       	jmp    8010586e <alltraps>

8010678f <vector255>:
8010678f:	6a 00                	push   $0x0
80106791:	68 ff 00 00 00       	push   $0xff
80106796:	e9 d3 f0 ff ff       	jmp    8010586e <alltraps>
8010679b:	66 90                	xchg   %ax,%ax
8010679d:	66 90                	xchg   %ax,%ax
8010679f:	90                   	nop

801067a0 <walkpgdir>:
801067a0:	55                   	push   %ebp
801067a1:	89 e5                	mov    %esp,%ebp
801067a3:	57                   	push   %edi
801067a4:	56                   	push   %esi
801067a5:	89 d6                	mov    %edx,%esi
801067a7:	c1 ea 16             	shr    $0x16,%edx
801067aa:	53                   	push   %ebx
801067ab:	8d 3c 90             	lea    (%eax,%edx,4),%edi
801067ae:	83 ec 0c             	sub    $0xc,%esp
801067b1:	8b 1f                	mov    (%edi),%ebx
801067b3:	f6 c3 01             	test   $0x1,%bl
801067b6:	74 28                	je     801067e0 <walkpgdir+0x40>
801067b8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801067be:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
801067c4:	89 f0                	mov    %esi,%eax
801067c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801067c9:	c1 e8 0a             	shr    $0xa,%eax
801067cc:	25 fc 0f 00 00       	and    $0xffc,%eax
801067d1:	01 d8                	add    %ebx,%eax
801067d3:	5b                   	pop    %ebx
801067d4:	5e                   	pop    %esi
801067d5:	5f                   	pop    %edi
801067d6:	5d                   	pop    %ebp
801067d7:	c3                   	ret    
801067d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801067df:	90                   	nop
801067e0:	85 c9                	test   %ecx,%ecx
801067e2:	74 2c                	je     80106810 <walkpgdir+0x70>
801067e4:	e8 47 be ff ff       	call   80102630 <kalloc>
801067e9:	89 c3                	mov    %eax,%ebx
801067eb:	85 c0                	test   %eax,%eax
801067ed:	74 21                	je     80106810 <walkpgdir+0x70>
801067ef:	83 ec 04             	sub    $0x4,%esp
801067f2:	68 00 10 00 00       	push   $0x1000
801067f7:	6a 00                	push   $0x0
801067f9:	50                   	push   %eax
801067fa:	e8 71 de ff ff       	call   80104670 <memset>
801067ff:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106805:	83 c4 10             	add    $0x10,%esp
80106808:	83 c8 07             	or     $0x7,%eax
8010680b:	89 07                	mov    %eax,(%edi)
8010680d:	eb b5                	jmp    801067c4 <walkpgdir+0x24>
8010680f:	90                   	nop
80106810:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106813:	31 c0                	xor    %eax,%eax
80106815:	5b                   	pop    %ebx
80106816:	5e                   	pop    %esi
80106817:	5f                   	pop    %edi
80106818:	5d                   	pop    %ebp
80106819:	c3                   	ret    
8010681a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106820 <mappages>:
80106820:	55                   	push   %ebp
80106821:	89 e5                	mov    %esp,%ebp
80106823:	57                   	push   %edi
80106824:	89 c7                	mov    %eax,%edi
80106826:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
8010682a:	56                   	push   %esi
8010682b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106830:	89 d6                	mov    %edx,%esi
80106832:	53                   	push   %ebx
80106833:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106839:	83 ec 1c             	sub    $0x1c,%esp
8010683c:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010683f:	8b 45 08             	mov    0x8(%ebp),%eax
80106842:	29 f0                	sub    %esi,%eax
80106844:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106847:	eb 1f                	jmp    80106868 <mappages+0x48>
80106849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106850:	f6 00 01             	testb  $0x1,(%eax)
80106853:	75 45                	jne    8010689a <mappages+0x7a>
80106855:	0b 5d 0c             	or     0xc(%ebp),%ebx
80106858:	83 cb 01             	or     $0x1,%ebx
8010685b:	89 18                	mov    %ebx,(%eax)
8010685d:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80106860:	74 2e                	je     80106890 <mappages+0x70>
80106862:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106868:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010686b:	b9 01 00 00 00       	mov    $0x1,%ecx
80106870:	89 f2                	mov    %esi,%edx
80106872:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
80106875:	89 f8                	mov    %edi,%eax
80106877:	e8 24 ff ff ff       	call   801067a0 <walkpgdir>
8010687c:	85 c0                	test   %eax,%eax
8010687e:	75 d0                	jne    80106850 <mappages+0x30>
80106880:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106883:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106888:	5b                   	pop    %ebx
80106889:	5e                   	pop    %esi
8010688a:	5f                   	pop    %edi
8010688b:	5d                   	pop    %ebp
8010688c:	c3                   	ret    
8010688d:	8d 76 00             	lea    0x0(%esi),%esi
80106890:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106893:	31 c0                	xor    %eax,%eax
80106895:	5b                   	pop    %ebx
80106896:	5e                   	pop    %esi
80106897:	5f                   	pop    %edi
80106898:	5d                   	pop    %ebp
80106899:	c3                   	ret    
8010689a:	83 ec 0c             	sub    $0xc,%esp
8010689d:	68 88 79 10 80       	push   $0x80107988
801068a2:	e8 e9 9a ff ff       	call   80100390 <panic>
801068a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068ae:	66 90                	xchg   %ax,%ax

801068b0 <deallocuvm.part.0>:
801068b0:	55                   	push   %ebp
801068b1:	89 e5                	mov    %esp,%ebp
801068b3:	57                   	push   %edi
801068b4:	56                   	push   %esi
801068b5:	89 c6                	mov    %eax,%esi
801068b7:	53                   	push   %ebx
801068b8:	89 d3                	mov    %edx,%ebx
801068ba:	8d 91 ff 0f 00 00    	lea    0xfff(%ecx),%edx
801068c0:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801068c6:	83 ec 1c             	sub    $0x1c,%esp
801068c9:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801068cc:	39 da                	cmp    %ebx,%edx
801068ce:	73 5b                	jae    8010692b <deallocuvm.part.0+0x7b>
801068d0:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801068d3:	89 d7                	mov    %edx,%edi
801068d5:	eb 14                	jmp    801068eb <deallocuvm.part.0+0x3b>
801068d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068de:	66 90                	xchg   %ax,%ax
801068e0:	81 c7 00 10 00 00    	add    $0x1000,%edi
801068e6:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801068e9:	76 40                	jbe    8010692b <deallocuvm.part.0+0x7b>
801068eb:	31 c9                	xor    %ecx,%ecx
801068ed:	89 fa                	mov    %edi,%edx
801068ef:	89 f0                	mov    %esi,%eax
801068f1:	e8 aa fe ff ff       	call   801067a0 <walkpgdir>
801068f6:	89 c3                	mov    %eax,%ebx
801068f8:	85 c0                	test   %eax,%eax
801068fa:	74 44                	je     80106940 <deallocuvm.part.0+0x90>
801068fc:	8b 00                	mov    (%eax),%eax
801068fe:	a8 01                	test   $0x1,%al
80106900:	74 de                	je     801068e0 <deallocuvm.part.0+0x30>
80106902:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106907:	74 47                	je     80106950 <deallocuvm.part.0+0xa0>
80106909:	83 ec 0c             	sub    $0xc,%esp
8010690c:	05 00 00 00 80       	add    $0x80000000,%eax
80106911:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106917:	50                   	push   %eax
80106918:	e8 53 bb ff ff       	call   80102470 <kfree>
8010691d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80106923:	83 c4 10             	add    $0x10,%esp
80106926:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80106929:	77 c0                	ja     801068eb <deallocuvm.part.0+0x3b>
8010692b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010692e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106931:	5b                   	pop    %ebx
80106932:	5e                   	pop    %esi
80106933:	5f                   	pop    %edi
80106934:	5d                   	pop    %ebp
80106935:	c3                   	ret    
80106936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010693d:	8d 76 00             	lea    0x0(%esi),%esi
80106940:	89 fa                	mov    %edi,%edx
80106942:	81 e2 00 00 c0 ff    	and    $0xffc00000,%edx
80106948:	8d ba 00 00 40 00    	lea    0x400000(%edx),%edi
8010694e:	eb 96                	jmp    801068e6 <deallocuvm.part.0+0x36>
80106950:	83 ec 0c             	sub    $0xc,%esp
80106953:	68 46 73 10 80       	push   $0x80107346
80106958:	e8 33 9a ff ff       	call   80100390 <panic>
8010695d:	8d 76 00             	lea    0x0(%esi),%esi

80106960 <seginit>:
80106960:	f3 0f 1e fb          	endbr32 
80106964:	55                   	push   %ebp
80106965:	89 e5                	mov    %esp,%ebp
80106967:	83 ec 18             	sub    $0x18,%esp
8010696a:	e8 d1 cf ff ff       	call   80103940 <cpuid>
8010696f:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106974:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
8010697a:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
8010697e:	c7 80 f8 27 11 80 ff 	movl   $0xffff,-0x7feed808(%eax)
80106985:	ff 00 00 
80106988:	c7 80 fc 27 11 80 00 	movl   $0xcf9a00,-0x7feed804(%eax)
8010698f:	9a cf 00 
80106992:	c7 80 00 28 11 80 ff 	movl   $0xffff,-0x7feed800(%eax)
80106999:	ff 00 00 
8010699c:	c7 80 04 28 11 80 00 	movl   $0xcf9200,-0x7feed7fc(%eax)
801069a3:	92 cf 00 
801069a6:	c7 80 08 28 11 80 ff 	movl   $0xffff,-0x7feed7f8(%eax)
801069ad:	ff 00 00 
801069b0:	c7 80 0c 28 11 80 00 	movl   $0xcffa00,-0x7feed7f4(%eax)
801069b7:	fa cf 00 
801069ba:	c7 80 10 28 11 80 ff 	movl   $0xffff,-0x7feed7f0(%eax)
801069c1:	ff 00 00 
801069c4:	c7 80 14 28 11 80 00 	movl   $0xcff200,-0x7feed7ec(%eax)
801069cb:	f2 cf 00 
801069ce:	05 f0 27 11 80       	add    $0x801127f0,%eax
801069d3:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
801069d7:	c1 e8 10             	shr    $0x10,%eax
801069da:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
801069de:	8d 45 f2             	lea    -0xe(%ebp),%eax
801069e1:	0f 01 10             	lgdtl  (%eax)
801069e4:	c9                   	leave  
801069e5:	c3                   	ret    
801069e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069ed:	8d 76 00             	lea    0x0(%esi),%esi

801069f0 <switchkvm>:
801069f0:	f3 0f 1e fb          	endbr32 
801069f4:	a1 a4 54 11 80       	mov    0x801154a4,%eax
801069f9:	05 00 00 00 80       	add    $0x80000000,%eax
801069fe:	0f 22 d8             	mov    %eax,%cr3
80106a01:	c3                   	ret    
80106a02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106a10 <switchuvm>:
80106a10:	f3 0f 1e fb          	endbr32 
80106a14:	55                   	push   %ebp
80106a15:	89 e5                	mov    %esp,%ebp
80106a17:	57                   	push   %edi
80106a18:	56                   	push   %esi
80106a19:	53                   	push   %ebx
80106a1a:	83 ec 1c             	sub    $0x1c,%esp
80106a1d:	8b 75 08             	mov    0x8(%ebp),%esi
80106a20:	85 f6                	test   %esi,%esi
80106a22:	0f 84 cb 00 00 00    	je     80106af3 <switchuvm+0xe3>
80106a28:	8b 46 08             	mov    0x8(%esi),%eax
80106a2b:	85 c0                	test   %eax,%eax
80106a2d:	0f 84 da 00 00 00    	je     80106b0d <switchuvm+0xfd>
80106a33:	8b 46 04             	mov    0x4(%esi),%eax
80106a36:	85 c0                	test   %eax,%eax
80106a38:	0f 84 c2 00 00 00    	je     80106b00 <switchuvm+0xf0>
80106a3e:	e8 1d da ff ff       	call   80104460 <pushcli>
80106a43:	e8 88 ce ff ff       	call   801038d0 <mycpu>
80106a48:	89 c3                	mov    %eax,%ebx
80106a4a:	e8 81 ce ff ff       	call   801038d0 <mycpu>
80106a4f:	89 c7                	mov    %eax,%edi
80106a51:	e8 7a ce ff ff       	call   801038d0 <mycpu>
80106a56:	83 c7 08             	add    $0x8,%edi
80106a59:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106a5c:	e8 6f ce ff ff       	call   801038d0 <mycpu>
80106a61:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106a64:	ba 67 00 00 00       	mov    $0x67,%edx
80106a69:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106a70:	83 c0 08             	add    $0x8,%eax
80106a73:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106a7a:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80106a7f:	83 c1 08             	add    $0x8,%ecx
80106a82:	c1 e8 18             	shr    $0x18,%eax
80106a85:	c1 e9 10             	shr    $0x10,%ecx
80106a88:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106a8e:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106a94:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106a99:	66 89 8b 9d 00 00 00 	mov    %cx,0x9d(%ebx)
80106aa0:	bb 10 00 00 00       	mov    $0x10,%ebx
80106aa5:	e8 26 ce ff ff       	call   801038d0 <mycpu>
80106aaa:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80106ab1:	e8 1a ce ff ff       	call   801038d0 <mycpu>
80106ab6:	66 89 58 10          	mov    %bx,0x10(%eax)
80106aba:	8b 5e 08             	mov    0x8(%esi),%ebx
80106abd:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ac3:	e8 08 ce ff ff       	call   801038d0 <mycpu>
80106ac8:	89 58 0c             	mov    %ebx,0xc(%eax)
80106acb:	e8 00 ce ff ff       	call   801038d0 <mycpu>
80106ad0:	66 89 78 6e          	mov    %di,0x6e(%eax)
80106ad4:	b8 28 00 00 00       	mov    $0x28,%eax
80106ad9:	0f 00 d8             	ltr    %ax
80106adc:	8b 46 04             	mov    0x4(%esi),%eax
80106adf:	05 00 00 00 80       	add    $0x80000000,%eax
80106ae4:	0f 22 d8             	mov    %eax,%cr3
80106ae7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106aea:	5b                   	pop    %ebx
80106aeb:	5e                   	pop    %esi
80106aec:	5f                   	pop    %edi
80106aed:	5d                   	pop    %ebp
80106aee:	e9 bd d9 ff ff       	jmp    801044b0 <popcli>
80106af3:	83 ec 0c             	sub    $0xc,%esp
80106af6:	68 8e 79 10 80       	push   $0x8010798e
80106afb:	e8 90 98 ff ff       	call   80100390 <panic>
80106b00:	83 ec 0c             	sub    $0xc,%esp
80106b03:	68 b9 79 10 80       	push   $0x801079b9
80106b08:	e8 83 98 ff ff       	call   80100390 <panic>
80106b0d:	83 ec 0c             	sub    $0xc,%esp
80106b10:	68 a4 79 10 80       	push   $0x801079a4
80106b15:	e8 76 98 ff ff       	call   80100390 <panic>
80106b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106b20 <inituvm>:
80106b20:	f3 0f 1e fb          	endbr32 
80106b24:	55                   	push   %ebp
80106b25:	89 e5                	mov    %esp,%ebp
80106b27:	57                   	push   %edi
80106b28:	56                   	push   %esi
80106b29:	53                   	push   %ebx
80106b2a:	83 ec 1c             	sub    $0x1c,%esp
80106b2d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106b30:	8b 75 10             	mov    0x10(%ebp),%esi
80106b33:	8b 7d 08             	mov    0x8(%ebp),%edi
80106b36:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106b39:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106b3f:	77 4b                	ja     80106b8c <inituvm+0x6c>
80106b41:	e8 ea ba ff ff       	call   80102630 <kalloc>
80106b46:	83 ec 04             	sub    $0x4,%esp
80106b49:	68 00 10 00 00       	push   $0x1000
80106b4e:	89 c3                	mov    %eax,%ebx
80106b50:	6a 00                	push   $0x0
80106b52:	50                   	push   %eax
80106b53:	e8 18 db ff ff       	call   80104670 <memset>
80106b58:	58                   	pop    %eax
80106b59:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106b5f:	5a                   	pop    %edx
80106b60:	6a 06                	push   $0x6
80106b62:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b67:	31 d2                	xor    %edx,%edx
80106b69:	50                   	push   %eax
80106b6a:	89 f8                	mov    %edi,%eax
80106b6c:	e8 af fc ff ff       	call   80106820 <mappages>
80106b71:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b74:	89 75 10             	mov    %esi,0x10(%ebp)
80106b77:	83 c4 10             	add    $0x10,%esp
80106b7a:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106b7d:	89 45 0c             	mov    %eax,0xc(%ebp)
80106b80:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b83:	5b                   	pop    %ebx
80106b84:	5e                   	pop    %esi
80106b85:	5f                   	pop    %edi
80106b86:	5d                   	pop    %ebp
80106b87:	e9 84 db ff ff       	jmp    80104710 <memmove>
80106b8c:	83 ec 0c             	sub    $0xc,%esp
80106b8f:	68 cd 79 10 80       	push   $0x801079cd
80106b94:	e8 f7 97 ff ff       	call   80100390 <panic>
80106b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106ba0 <loaduvm>:
80106ba0:	f3 0f 1e fb          	endbr32 
80106ba4:	55                   	push   %ebp
80106ba5:	89 e5                	mov    %esp,%ebp
80106ba7:	57                   	push   %edi
80106ba8:	56                   	push   %esi
80106ba9:	53                   	push   %ebx
80106baa:	83 ec 1c             	sub    $0x1c,%esp
80106bad:	8b 45 0c             	mov    0xc(%ebp),%eax
80106bb0:	8b 75 18             	mov    0x18(%ebp),%esi
80106bb3:	a9 ff 0f 00 00       	test   $0xfff,%eax
80106bb8:	0f 85 99 00 00 00    	jne    80106c57 <loaduvm+0xb7>
80106bbe:	01 f0                	add    %esi,%eax
80106bc0:	89 f3                	mov    %esi,%ebx
80106bc2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106bc5:	8b 45 14             	mov    0x14(%ebp),%eax
80106bc8:	01 f0                	add    %esi,%eax
80106bca:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106bcd:	85 f6                	test   %esi,%esi
80106bcf:	75 15                	jne    80106be6 <loaduvm+0x46>
80106bd1:	eb 6d                	jmp    80106c40 <loaduvm+0xa0>
80106bd3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106bd7:	90                   	nop
80106bd8:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
80106bde:	89 f0                	mov    %esi,%eax
80106be0:	29 d8                	sub    %ebx,%eax
80106be2:	39 c6                	cmp    %eax,%esi
80106be4:	76 5a                	jbe    80106c40 <loaduvm+0xa0>
80106be6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106be9:	8b 45 08             	mov    0x8(%ebp),%eax
80106bec:	31 c9                	xor    %ecx,%ecx
80106bee:	29 da                	sub    %ebx,%edx
80106bf0:	e8 ab fb ff ff       	call   801067a0 <walkpgdir>
80106bf5:	85 c0                	test   %eax,%eax
80106bf7:	74 51                	je     80106c4a <loaduvm+0xaa>
80106bf9:	8b 00                	mov    (%eax),%eax
80106bfb:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80106bfe:	bf 00 10 00 00       	mov    $0x1000,%edi
80106c03:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106c08:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
80106c0e:	0f 46 fb             	cmovbe %ebx,%edi
80106c11:	29 d9                	sub    %ebx,%ecx
80106c13:	05 00 00 00 80       	add    $0x80000000,%eax
80106c18:	57                   	push   %edi
80106c19:	51                   	push   %ecx
80106c1a:	50                   	push   %eax
80106c1b:	ff 75 10             	pushl  0x10(%ebp)
80106c1e:	e8 3d ae ff ff       	call   80101a60 <readi>
80106c23:	83 c4 10             	add    $0x10,%esp
80106c26:	39 f8                	cmp    %edi,%eax
80106c28:	74 ae                	je     80106bd8 <loaduvm+0x38>
80106c2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c2d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106c32:	5b                   	pop    %ebx
80106c33:	5e                   	pop    %esi
80106c34:	5f                   	pop    %edi
80106c35:	5d                   	pop    %ebp
80106c36:	c3                   	ret    
80106c37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c3e:	66 90                	xchg   %ax,%ax
80106c40:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c43:	31 c0                	xor    %eax,%eax
80106c45:	5b                   	pop    %ebx
80106c46:	5e                   	pop    %esi
80106c47:	5f                   	pop    %edi
80106c48:	5d                   	pop    %ebp
80106c49:	c3                   	ret    
80106c4a:	83 ec 0c             	sub    $0xc,%esp
80106c4d:	68 e7 79 10 80       	push   $0x801079e7
80106c52:	e8 39 97 ff ff       	call   80100390 <panic>
80106c57:	83 ec 0c             	sub    $0xc,%esp
80106c5a:	68 88 7a 10 80       	push   $0x80107a88
80106c5f:	e8 2c 97 ff ff       	call   80100390 <panic>
80106c64:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106c6f:	90                   	nop

80106c70 <allocuvm>:
80106c70:	f3 0f 1e fb          	endbr32 
80106c74:	55                   	push   %ebp
80106c75:	89 e5                	mov    %esp,%ebp
80106c77:	57                   	push   %edi
80106c78:	56                   	push   %esi
80106c79:	53                   	push   %ebx
80106c7a:	83 ec 1c             	sub    $0x1c,%esp
80106c7d:	8b 45 10             	mov    0x10(%ebp),%eax
80106c80:	8b 7d 08             	mov    0x8(%ebp),%edi
80106c83:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106c86:	85 c0                	test   %eax,%eax
80106c88:	0f 88 b2 00 00 00    	js     80106d40 <allocuvm+0xd0>
80106c8e:	3b 45 0c             	cmp    0xc(%ebp),%eax
80106c91:	8b 45 0c             	mov    0xc(%ebp),%eax
80106c94:	0f 82 96 00 00 00    	jb     80106d30 <allocuvm+0xc0>
80106c9a:	8d b0 ff 0f 00 00    	lea    0xfff(%eax),%esi
80106ca0:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106ca6:	39 75 10             	cmp    %esi,0x10(%ebp)
80106ca9:	77 40                	ja     80106ceb <allocuvm+0x7b>
80106cab:	e9 83 00 00 00       	jmp    80106d33 <allocuvm+0xc3>
80106cb0:	83 ec 04             	sub    $0x4,%esp
80106cb3:	68 00 10 00 00       	push   $0x1000
80106cb8:	6a 00                	push   $0x0
80106cba:	50                   	push   %eax
80106cbb:	e8 b0 d9 ff ff       	call   80104670 <memset>
80106cc0:	58                   	pop    %eax
80106cc1:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106cc7:	5a                   	pop    %edx
80106cc8:	6a 06                	push   $0x6
80106cca:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106ccf:	89 f2                	mov    %esi,%edx
80106cd1:	50                   	push   %eax
80106cd2:	89 f8                	mov    %edi,%eax
80106cd4:	e8 47 fb ff ff       	call   80106820 <mappages>
80106cd9:	83 c4 10             	add    $0x10,%esp
80106cdc:	85 c0                	test   %eax,%eax
80106cde:	78 78                	js     80106d58 <allocuvm+0xe8>
80106ce0:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106ce6:	39 75 10             	cmp    %esi,0x10(%ebp)
80106ce9:	76 48                	jbe    80106d33 <allocuvm+0xc3>
80106ceb:	e8 40 b9 ff ff       	call   80102630 <kalloc>
80106cf0:	89 c3                	mov    %eax,%ebx
80106cf2:	85 c0                	test   %eax,%eax
80106cf4:	75 ba                	jne    80106cb0 <allocuvm+0x40>
80106cf6:	83 ec 0c             	sub    $0xc,%esp
80106cf9:	68 05 7a 10 80       	push   $0x80107a05
80106cfe:	e8 ad 99 ff ff       	call   801006b0 <cprintf>
80106d03:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d06:	83 c4 10             	add    $0x10,%esp
80106d09:	39 45 10             	cmp    %eax,0x10(%ebp)
80106d0c:	74 32                	je     80106d40 <allocuvm+0xd0>
80106d0e:	8b 55 10             	mov    0x10(%ebp),%edx
80106d11:	89 c1                	mov    %eax,%ecx
80106d13:	89 f8                	mov    %edi,%eax
80106d15:	e8 96 fb ff ff       	call   801068b0 <deallocuvm.part.0>
80106d1a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80106d21:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d24:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d27:	5b                   	pop    %ebx
80106d28:	5e                   	pop    %esi
80106d29:	5f                   	pop    %edi
80106d2a:	5d                   	pop    %ebp
80106d2b:	c3                   	ret    
80106d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106d30:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106d33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d36:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d39:	5b                   	pop    %ebx
80106d3a:	5e                   	pop    %esi
80106d3b:	5f                   	pop    %edi
80106d3c:	5d                   	pop    %ebp
80106d3d:	c3                   	ret    
80106d3e:	66 90                	xchg   %ax,%ax
80106d40:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80106d47:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d4d:	5b                   	pop    %ebx
80106d4e:	5e                   	pop    %esi
80106d4f:	5f                   	pop    %edi
80106d50:	5d                   	pop    %ebp
80106d51:	c3                   	ret    
80106d52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d58:	83 ec 0c             	sub    $0xc,%esp
80106d5b:	68 1d 7a 10 80       	push   $0x80107a1d
80106d60:	e8 4b 99 ff ff       	call   801006b0 <cprintf>
80106d65:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d68:	83 c4 10             	add    $0x10,%esp
80106d6b:	39 45 10             	cmp    %eax,0x10(%ebp)
80106d6e:	74 0c                	je     80106d7c <allocuvm+0x10c>
80106d70:	8b 55 10             	mov    0x10(%ebp),%edx
80106d73:	89 c1                	mov    %eax,%ecx
80106d75:	89 f8                	mov    %edi,%eax
80106d77:	e8 34 fb ff ff       	call   801068b0 <deallocuvm.part.0>
80106d7c:	83 ec 0c             	sub    $0xc,%esp
80106d7f:	53                   	push   %ebx
80106d80:	e8 eb b6 ff ff       	call   80102470 <kfree>
80106d85:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80106d8c:	83 c4 10             	add    $0x10,%esp
80106d8f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d92:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d95:	5b                   	pop    %ebx
80106d96:	5e                   	pop    %esi
80106d97:	5f                   	pop    %edi
80106d98:	5d                   	pop    %ebp
80106d99:	c3                   	ret    
80106d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106da0 <deallocuvm>:
80106da0:	f3 0f 1e fb          	endbr32 
80106da4:	55                   	push   %ebp
80106da5:	89 e5                	mov    %esp,%ebp
80106da7:	8b 55 0c             	mov    0xc(%ebp),%edx
80106daa:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106dad:	8b 45 08             	mov    0x8(%ebp),%eax
80106db0:	39 d1                	cmp    %edx,%ecx
80106db2:	73 0c                	jae    80106dc0 <deallocuvm+0x20>
80106db4:	5d                   	pop    %ebp
80106db5:	e9 f6 fa ff ff       	jmp    801068b0 <deallocuvm.part.0>
80106dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106dc0:	89 d0                	mov    %edx,%eax
80106dc2:	5d                   	pop    %ebp
80106dc3:	c3                   	ret    
80106dc4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106dcb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106dcf:	90                   	nop

80106dd0 <freevm>:
80106dd0:	f3 0f 1e fb          	endbr32 
80106dd4:	55                   	push   %ebp
80106dd5:	89 e5                	mov    %esp,%ebp
80106dd7:	57                   	push   %edi
80106dd8:	56                   	push   %esi
80106dd9:	53                   	push   %ebx
80106dda:	83 ec 0c             	sub    $0xc,%esp
80106ddd:	8b 75 08             	mov    0x8(%ebp),%esi
80106de0:	85 f6                	test   %esi,%esi
80106de2:	74 55                	je     80106e39 <freevm+0x69>
80106de4:	31 c9                	xor    %ecx,%ecx
80106de6:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106deb:	89 f0                	mov    %esi,%eax
80106ded:	89 f3                	mov    %esi,%ebx
80106def:	e8 bc fa ff ff       	call   801068b0 <deallocuvm.part.0>
80106df4:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106dfa:	eb 0b                	jmp    80106e07 <freevm+0x37>
80106dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e00:	83 c3 04             	add    $0x4,%ebx
80106e03:	39 df                	cmp    %ebx,%edi
80106e05:	74 23                	je     80106e2a <freevm+0x5a>
80106e07:	8b 03                	mov    (%ebx),%eax
80106e09:	a8 01                	test   $0x1,%al
80106e0b:	74 f3                	je     80106e00 <freevm+0x30>
80106e0d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106e12:	83 ec 0c             	sub    $0xc,%esp
80106e15:	83 c3 04             	add    $0x4,%ebx
80106e18:	05 00 00 00 80       	add    $0x80000000,%eax
80106e1d:	50                   	push   %eax
80106e1e:	e8 4d b6 ff ff       	call   80102470 <kfree>
80106e23:	83 c4 10             	add    $0x10,%esp
80106e26:	39 df                	cmp    %ebx,%edi
80106e28:	75 dd                	jne    80106e07 <freevm+0x37>
80106e2a:	89 75 08             	mov    %esi,0x8(%ebp)
80106e2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e30:	5b                   	pop    %ebx
80106e31:	5e                   	pop    %esi
80106e32:	5f                   	pop    %edi
80106e33:	5d                   	pop    %ebp
80106e34:	e9 37 b6 ff ff       	jmp    80102470 <kfree>
80106e39:	83 ec 0c             	sub    $0xc,%esp
80106e3c:	68 39 7a 10 80       	push   $0x80107a39
80106e41:	e8 4a 95 ff ff       	call   80100390 <panic>
80106e46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e4d:	8d 76 00             	lea    0x0(%esi),%esi

80106e50 <setupkvm>:
80106e50:	f3 0f 1e fb          	endbr32 
80106e54:	55                   	push   %ebp
80106e55:	89 e5                	mov    %esp,%ebp
80106e57:	56                   	push   %esi
80106e58:	53                   	push   %ebx
80106e59:	e8 d2 b7 ff ff       	call   80102630 <kalloc>
80106e5e:	89 c6                	mov    %eax,%esi
80106e60:	85 c0                	test   %eax,%eax
80106e62:	74 42                	je     80106ea6 <setupkvm+0x56>
80106e64:	83 ec 04             	sub    $0x4,%esp
80106e67:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106e6c:	68 00 10 00 00       	push   $0x1000
80106e71:	6a 00                	push   $0x0
80106e73:	50                   	push   %eax
80106e74:	e8 f7 d7 ff ff       	call   80104670 <memset>
80106e79:	83 c4 10             	add    $0x10,%esp
80106e7c:	8b 43 04             	mov    0x4(%ebx),%eax
80106e7f:	83 ec 08             	sub    $0x8,%esp
80106e82:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106e85:	ff 73 0c             	pushl  0xc(%ebx)
80106e88:	8b 13                	mov    (%ebx),%edx
80106e8a:	50                   	push   %eax
80106e8b:	29 c1                	sub    %eax,%ecx
80106e8d:	89 f0                	mov    %esi,%eax
80106e8f:	e8 8c f9 ff ff       	call   80106820 <mappages>
80106e94:	83 c4 10             	add    $0x10,%esp
80106e97:	85 c0                	test   %eax,%eax
80106e99:	78 15                	js     80106eb0 <setupkvm+0x60>
80106e9b:	83 c3 10             	add    $0x10,%ebx
80106e9e:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106ea4:	75 d6                	jne    80106e7c <setupkvm+0x2c>
80106ea6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106ea9:	89 f0                	mov    %esi,%eax
80106eab:	5b                   	pop    %ebx
80106eac:	5e                   	pop    %esi
80106ead:	5d                   	pop    %ebp
80106eae:	c3                   	ret    
80106eaf:	90                   	nop
80106eb0:	83 ec 0c             	sub    $0xc,%esp
80106eb3:	56                   	push   %esi
80106eb4:	31 f6                	xor    %esi,%esi
80106eb6:	e8 15 ff ff ff       	call   80106dd0 <freevm>
80106ebb:	83 c4 10             	add    $0x10,%esp
80106ebe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106ec1:	89 f0                	mov    %esi,%eax
80106ec3:	5b                   	pop    %ebx
80106ec4:	5e                   	pop    %esi
80106ec5:	5d                   	pop    %ebp
80106ec6:	c3                   	ret    
80106ec7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ece:	66 90                	xchg   %ax,%ax

80106ed0 <kvmalloc>:
80106ed0:	f3 0f 1e fb          	endbr32 
80106ed4:	55                   	push   %ebp
80106ed5:	89 e5                	mov    %esp,%ebp
80106ed7:	83 ec 08             	sub    $0x8,%esp
80106eda:	e8 71 ff ff ff       	call   80106e50 <setupkvm>
80106edf:	a3 a4 54 11 80       	mov    %eax,0x801154a4
80106ee4:	05 00 00 00 80       	add    $0x80000000,%eax
80106ee9:	0f 22 d8             	mov    %eax,%cr3
80106eec:	c9                   	leave  
80106eed:	c3                   	ret    
80106eee:	66 90                	xchg   %ax,%ax

80106ef0 <clearpteu>:
80106ef0:	f3 0f 1e fb          	endbr32 
80106ef4:	55                   	push   %ebp
80106ef5:	31 c9                	xor    %ecx,%ecx
80106ef7:	89 e5                	mov    %esp,%ebp
80106ef9:	83 ec 08             	sub    $0x8,%esp
80106efc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106eff:	8b 45 08             	mov    0x8(%ebp),%eax
80106f02:	e8 99 f8 ff ff       	call   801067a0 <walkpgdir>
80106f07:	85 c0                	test   %eax,%eax
80106f09:	74 05                	je     80106f10 <clearpteu+0x20>
80106f0b:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106f0e:	c9                   	leave  
80106f0f:	c3                   	ret    
80106f10:	83 ec 0c             	sub    $0xc,%esp
80106f13:	68 4a 7a 10 80       	push   $0x80107a4a
80106f18:	e8 73 94 ff ff       	call   80100390 <panic>
80106f1d:	8d 76 00             	lea    0x0(%esi),%esi

80106f20 <copyuvm>:
80106f20:	f3 0f 1e fb          	endbr32 
80106f24:	55                   	push   %ebp
80106f25:	89 e5                	mov    %esp,%ebp
80106f27:	57                   	push   %edi
80106f28:	56                   	push   %esi
80106f29:	53                   	push   %ebx
80106f2a:	83 ec 1c             	sub    $0x1c,%esp
80106f2d:	e8 1e ff ff ff       	call   80106e50 <setupkvm>
80106f32:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106f35:	85 c0                	test   %eax,%eax
80106f37:	0f 84 9b 00 00 00    	je     80106fd8 <copyuvm+0xb8>
80106f3d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f40:	85 c9                	test   %ecx,%ecx
80106f42:	0f 84 90 00 00 00    	je     80106fd8 <copyuvm+0xb8>
80106f48:	31 f6                	xor    %esi,%esi
80106f4a:	eb 46                	jmp    80106f92 <copyuvm+0x72>
80106f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106f50:	83 ec 04             	sub    $0x4,%esp
80106f53:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106f59:	68 00 10 00 00       	push   $0x1000
80106f5e:	57                   	push   %edi
80106f5f:	50                   	push   %eax
80106f60:	e8 ab d7 ff ff       	call   80104710 <memmove>
80106f65:	58                   	pop    %eax
80106f66:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106f6c:	5a                   	pop    %edx
80106f6d:	ff 75 e4             	pushl  -0x1c(%ebp)
80106f70:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f75:	89 f2                	mov    %esi,%edx
80106f77:	50                   	push   %eax
80106f78:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106f7b:	e8 a0 f8 ff ff       	call   80106820 <mappages>
80106f80:	83 c4 10             	add    $0x10,%esp
80106f83:	85 c0                	test   %eax,%eax
80106f85:	78 61                	js     80106fe8 <copyuvm+0xc8>
80106f87:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106f8d:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106f90:	76 46                	jbe    80106fd8 <copyuvm+0xb8>
80106f92:	8b 45 08             	mov    0x8(%ebp),%eax
80106f95:	31 c9                	xor    %ecx,%ecx
80106f97:	89 f2                	mov    %esi,%edx
80106f99:	e8 02 f8 ff ff       	call   801067a0 <walkpgdir>
80106f9e:	85 c0                	test   %eax,%eax
80106fa0:	74 61                	je     80107003 <copyuvm+0xe3>
80106fa2:	8b 00                	mov    (%eax),%eax
80106fa4:	a8 01                	test   $0x1,%al
80106fa6:	74 4e                	je     80106ff6 <copyuvm+0xd6>
80106fa8:	89 c7                	mov    %eax,%edi
80106faa:	25 ff 0f 00 00       	and    $0xfff,%eax
80106faf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106fb2:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80106fb8:	e8 73 b6 ff ff       	call   80102630 <kalloc>
80106fbd:	89 c3                	mov    %eax,%ebx
80106fbf:	85 c0                	test   %eax,%eax
80106fc1:	75 8d                	jne    80106f50 <copyuvm+0x30>
80106fc3:	83 ec 0c             	sub    $0xc,%esp
80106fc6:	ff 75 e0             	pushl  -0x20(%ebp)
80106fc9:	e8 02 fe ff ff       	call   80106dd0 <freevm>
80106fce:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80106fd5:	83 c4 10             	add    $0x10,%esp
80106fd8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106fdb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fde:	5b                   	pop    %ebx
80106fdf:	5e                   	pop    %esi
80106fe0:	5f                   	pop    %edi
80106fe1:	5d                   	pop    %ebp
80106fe2:	c3                   	ret    
80106fe3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106fe7:	90                   	nop
80106fe8:	83 ec 0c             	sub    $0xc,%esp
80106feb:	53                   	push   %ebx
80106fec:	e8 7f b4 ff ff       	call   80102470 <kfree>
80106ff1:	83 c4 10             	add    $0x10,%esp
80106ff4:	eb cd                	jmp    80106fc3 <copyuvm+0xa3>
80106ff6:	83 ec 0c             	sub    $0xc,%esp
80106ff9:	68 6e 7a 10 80       	push   $0x80107a6e
80106ffe:	e8 8d 93 ff ff       	call   80100390 <panic>
80107003:	83 ec 0c             	sub    $0xc,%esp
80107006:	68 54 7a 10 80       	push   $0x80107a54
8010700b:	e8 80 93 ff ff       	call   80100390 <panic>

80107010 <uva2ka>:
80107010:	f3 0f 1e fb          	endbr32 
80107014:	55                   	push   %ebp
80107015:	31 c9                	xor    %ecx,%ecx
80107017:	89 e5                	mov    %esp,%ebp
80107019:	83 ec 08             	sub    $0x8,%esp
8010701c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010701f:	8b 45 08             	mov    0x8(%ebp),%eax
80107022:	e8 79 f7 ff ff       	call   801067a0 <walkpgdir>
80107027:	8b 00                	mov    (%eax),%eax
80107029:	c9                   	leave  
8010702a:	89 c2                	mov    %eax,%edx
8010702c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107031:	83 e2 05             	and    $0x5,%edx
80107034:	05 00 00 00 80       	add    $0x80000000,%eax
80107039:	83 fa 05             	cmp    $0x5,%edx
8010703c:	ba 00 00 00 00       	mov    $0x0,%edx
80107041:	0f 45 c2             	cmovne %edx,%eax
80107044:	c3                   	ret    
80107045:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010704c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107050 <copyout>:
80107050:	f3 0f 1e fb          	endbr32 
80107054:	55                   	push   %ebp
80107055:	89 e5                	mov    %esp,%ebp
80107057:	57                   	push   %edi
80107058:	56                   	push   %esi
80107059:	53                   	push   %ebx
8010705a:	83 ec 0c             	sub    $0xc,%esp
8010705d:	8b 75 14             	mov    0x14(%ebp),%esi
80107060:	8b 55 0c             	mov    0xc(%ebp),%edx
80107063:	85 f6                	test   %esi,%esi
80107065:	75 3c                	jne    801070a3 <copyout+0x53>
80107067:	eb 67                	jmp    801070d0 <copyout+0x80>
80107069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107070:	8b 55 0c             	mov    0xc(%ebp),%edx
80107073:	89 fb                	mov    %edi,%ebx
80107075:	29 d3                	sub    %edx,%ebx
80107077:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010707d:	39 f3                	cmp    %esi,%ebx
8010707f:	0f 47 de             	cmova  %esi,%ebx
80107082:	29 fa                	sub    %edi,%edx
80107084:	83 ec 04             	sub    $0x4,%esp
80107087:	01 c2                	add    %eax,%edx
80107089:	53                   	push   %ebx
8010708a:	ff 75 10             	pushl  0x10(%ebp)
8010708d:	52                   	push   %edx
8010708e:	e8 7d d6 ff ff       	call   80104710 <memmove>
80107093:	01 5d 10             	add    %ebx,0x10(%ebp)
80107096:	8d 97 00 10 00 00    	lea    0x1000(%edi),%edx
8010709c:	83 c4 10             	add    $0x10,%esp
8010709f:	29 de                	sub    %ebx,%esi
801070a1:	74 2d                	je     801070d0 <copyout+0x80>
801070a3:	89 d7                	mov    %edx,%edi
801070a5:	83 ec 08             	sub    $0x8,%esp
801070a8:	89 55 0c             	mov    %edx,0xc(%ebp)
801070ab:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
801070b1:	57                   	push   %edi
801070b2:	ff 75 08             	pushl  0x8(%ebp)
801070b5:	e8 56 ff ff ff       	call   80107010 <uva2ka>
801070ba:	83 c4 10             	add    $0x10,%esp
801070bd:	85 c0                	test   %eax,%eax
801070bf:	75 af                	jne    80107070 <copyout+0x20>
801070c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801070c9:	5b                   	pop    %ebx
801070ca:	5e                   	pop    %esi
801070cb:	5f                   	pop    %edi
801070cc:	5d                   	pop    %ebp
801070cd:	c3                   	ret    
801070ce:	66 90                	xchg   %ax,%ax
801070d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070d3:	31 c0                	xor    %eax,%eax
801070d5:	5b                   	pop    %ebx
801070d6:	5e                   	pop    %esi
801070d7:	5f                   	pop    %edi
801070d8:	5d                   	pop    %ebp
801070d9:	c3                   	ret    
