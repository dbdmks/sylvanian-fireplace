   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 51 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  45                     ; 52 {
  46                     .text:	section	.text,new
  47  0000               f_NonHandledInterrupt:
  51                     ; 56 }
  54  0000 80            	iret
  76                     ; 64 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  76                     ; 65 {
  77                     .text:	section	.text,new
  78  0000               f_TRAP_IRQHandler:
  82                     ; 69 }
  85  0000 80            	iret
 107                     ; 75 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 107                     ; 76 {
 108                     .text:	section	.text,new
 109  0000               f_TLI_IRQHandler:
 113                     ; 80 }
 116  0000 80            	iret
 138                     ; 87 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 138                     ; 88 {
 139                     .text:	section	.text,new
 140  0000               f_AWU_IRQHandler:
 144                     ; 92 }
 147  0000 80            	iret
 169                     ; 99 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 169                     ; 100 {
 170                     .text:	section	.text,new
 171  0000               f_CLK_IRQHandler:
 175                     ; 104 }
 178  0000 80            	iret
 201                     ; 111 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 201                     ; 112 {
 202                     .text:	section	.text,new
 203  0000               f_EXTI_PORTA_IRQHandler:
 207                     ; 116 }
 210  0000 80            	iret
 233                     ; 123 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 233                     ; 124 {
 234                     .text:	section	.text,new
 235  0000               f_EXTI_PORTB_IRQHandler:
 239                     ; 128 }
 242  0000 80            	iret
 278                     ; 135 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 278                     ; 136 {
 279                     .text:	section	.text,new
 280  0000               f_EXTI_PORTC_IRQHandler:
 282  0000 8a            	push	cc
 283  0001 84            	pop	a
 284  0002 a4bf          	and	a,#191
 285  0004 88            	push	a
 286  0005 86            	pop	cc
 287       00000002      OFST:	set	2
 288  0006 3b0002        	push	c_x+2
 289  0009 be00          	ldw	x,c_x
 290  000b 89            	pushw	x
 291  000c 3b0002        	push	c_y+2
 292  000f be00          	ldw	x,c_y
 293  0011 89            	pushw	x
 294  0012 89            	pushw	x
 297                     ; 139     Jump_Function = (Function_Pointer) 0x9FFF;
 299                     ; 140     Jump_Function();
 301  0013 cd9fff        	call	40959
 303                     ; 141 }
 306  0016 5b02          	addw	sp,#2
 307  0018 85            	popw	x
 308  0019 bf00          	ldw	c_y,x
 309  001b 320002        	pop	c_y+2
 310  001e 85            	popw	x
 311  001f bf00          	ldw	c_x,x
 312  0021 320002        	pop	c_x+2
 313  0024 80            	iret
 336                     ; 148 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 336                     ; 149 {
 337                     .text:	section	.text,new
 338  0000               f_EXTI_PORTD_IRQHandler:
 342                     ; 153 }
 345  0000 80            	iret
 368                     ; 160 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 368                     ; 161 {
 369                     .text:	section	.text,new
 370  0000               f_EXTI_PORTE_IRQHandler:
 374                     ; 165 }
 377  0000 80            	iret
 399                     ; 211 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 399                     ; 212 {
 400                     .text:	section	.text,new
 401  0000               f_SPI_IRQHandler:
 405                     ; 216 }
 408  0000 80            	iret
 431                     ; 223 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 431                     ; 224 {
 432                     .text:	section	.text,new
 433  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 437                     ; 228 }
 440  0000 80            	iret
 463                     ; 235 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 463                     ; 236 {
 464                     .text:	section	.text,new
 465  0000               f_TIM1_CAP_COM_IRQHandler:
 469                     ; 240 }
 472  0000 80            	iret
 474                     	bsct
 475  0000               L761_counter:
 476  0000 012c          	dc.w	300
 513                     ; 272  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 513                     ; 273 {
 514                     .text:	section	.text,new
 515  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 517  0000 8a            	push	cc
 518  0001 84            	pop	a
 519  0002 a4bf          	and	a,#191
 520  0004 88            	push	a
 521  0005 86            	pop	cc
 522  0006 3b0002        	push	c_x+2
 523  0009 be00          	ldw	x,c_x
 524  000b 89            	pushw	x
 525  000c 3b0002        	push	c_y+2
 526  000f be00          	ldw	x,c_y
 527  0011 89            	pushw	x
 530                     ; 278 	GPIO_WriteReverse(GPIOB,GPIO_PIN_5);
 532  0012 4b20          	push	#32
 533  0014 ae5005        	ldw	x,#20485
 534  0017 cd0000        	call	_GPIO_WriteReverse
 536  001a 84            	pop	a
 537                     ; 279 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 539  001b a601          	ld	a,#1
 540  001d cd0000        	call	_TIM2_ClearITPendingBit
 542                     ; 280 	if(!counter--) {
 544  0020 be00          	ldw	x,L761_counter
 545  0022 1d0001        	subw	x,#1
 546  0025 bf00          	ldw	L761_counter,x
 547  0027 1c0001        	addw	x,#1
 548  002a a30000        	cpw	x,#0
 549  002d 260a          	jrne	L702
 550                     ; 281 		GPIO_WriteHigh(GPIOB,GPIO_PIN_5);
 552  002f 4b20          	push	#32
 553  0031 ae5005        	ldw	x,#20485
 554  0034 cd0000        	call	_GPIO_WriteHigh
 556  0037 84            	pop	a
 557                     ; 282 		halt();
 560  0038 8e            halt
 563  0039               L702:
 564                     ; 285 	return;
 567  0039 85            	popw	x
 568  003a bf00          	ldw	c_y,x
 569  003c 320002        	pop	c_y+2
 570  003f 85            	popw	x
 571  0040 bf00          	ldw	c_x,x
 572  0042 320002        	pop	c_x+2
 573  0045 80            	iret
 596                     ; 293  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 596                     ; 294 {
 597                     .text:	section	.text,new
 598  0000               f_TIM2_CAP_COM_IRQHandler:
 602                     ; 298 }
 605  0000 80            	iret
 628                     ; 335  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 628                     ; 336 {
 629                     .text:	section	.text,new
 630  0000               f_UART1_TX_IRQHandler:
 634                     ; 340 }
 637  0000 80            	iret
 660                     ; 347  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 660                     ; 348 {
 661                     .text:	section	.text,new
 662  0000               f_UART1_RX_IRQHandler:
 666                     ; 352 }
 669  0000 80            	iret
 691                     ; 360 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 691                     ; 361 {
 692                     .text:	section	.text,new
 693  0000               f_I2C_IRQHandler:
 697                     ; 365 }
 700  0000 80            	iret
 722                     ; 438  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 722                     ; 439 {
 723                     .text:	section	.text,new
 724  0000               f_ADC1_IRQHandler:
 728                     ; 444 }
 731  0000 80            	iret
 754                     ; 465  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 754                     ; 466 {
 755                     .text:	section	.text,new
 756  0000               f_TIM4_UPD_OVF_IRQHandler:
 760                     ; 470 }
 763  0000 80            	iret
 786                     ; 478 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 786                     ; 479 {
 787                     .text:	section	.text,new
 788  0000               f_EEPROM_EEC_IRQHandler:
 792                     ; 483 }
 795  0000 80            	iret
 807                     	xdef	f_EEPROM_EEC_IRQHandler
 808                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 809                     	xdef	f_ADC1_IRQHandler
 810                     	xdef	f_I2C_IRQHandler
 811                     	xdef	f_UART1_RX_IRQHandler
 812                     	xdef	f_UART1_TX_IRQHandler
 813                     	xdef	f_TIM2_CAP_COM_IRQHandler
 814                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 815                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 816                     	xdef	f_TIM1_CAP_COM_IRQHandler
 817                     	xdef	f_SPI_IRQHandler
 818                     	xdef	f_EXTI_PORTE_IRQHandler
 819                     	xdef	f_EXTI_PORTD_IRQHandler
 820                     	xdef	f_EXTI_PORTC_IRQHandler
 821                     	xdef	f_EXTI_PORTB_IRQHandler
 822                     	xdef	f_EXTI_PORTA_IRQHandler
 823                     	xdef	f_CLK_IRQHandler
 824                     	xdef	f_AWU_IRQHandler
 825                     	xdef	f_TLI_IRQHandler
 826                     	xdef	f_TRAP_IRQHandler
 827                     	xdef	f_NonHandledInterrupt
 828                     	xref	_TIM2_ClearITPendingBit
 829                     	xref	_GPIO_WriteReverse
 830                     	xref	_GPIO_WriteHigh
 831                     	xref.b	c_x
 832                     	xref.b	c_y
 851                     	end
