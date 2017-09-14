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
 497                     ; 272  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 497                     ; 273 {
 498                     .text:	section	.text,new
 499  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 501  0000 8a            	push	cc
 502  0001 84            	pop	a
 503  0002 a4bf          	and	a,#191
 504  0004 88            	push	a
 505  0005 86            	pop	cc
 506  0006 3b0002        	push	c_x+2
 507  0009 be00          	ldw	x,c_x
 508  000b 89            	pushw	x
 509  000c 3b0002        	push	c_y+2
 510  000f be00          	ldw	x,c_y
 511  0011 89            	pushw	x
 514                     ; 277 	GPIO_WriteReverse(GPIOB,GPIO_PIN_5);
 516  0012 4b20          	push	#32
 517  0014 ae5005        	ldw	x,#20485
 518  0017 cd0000        	call	_GPIO_WriteReverse
 520  001a 84            	pop	a
 521                     ; 278 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 523  001b a601          	ld	a,#1
 524  001d cd0000        	call	_TIM2_ClearITPendingBit
 526                     ; 279 	return;
 529  0020 85            	popw	x
 530  0021 bf00          	ldw	c_y,x
 531  0023 320002        	pop	c_y+2
 532  0026 85            	popw	x
 533  0027 bf00          	ldw	c_x,x
 534  0029 320002        	pop	c_x+2
 535  002c 80            	iret
 558                     ; 287  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 558                     ; 288 {
 559                     .text:	section	.text,new
 560  0000               f_TIM2_CAP_COM_IRQHandler:
 564                     ; 292 }
 567  0000 80            	iret
 590                     ; 329  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 590                     ; 330 {
 591                     .text:	section	.text,new
 592  0000               f_UART1_TX_IRQHandler:
 596                     ; 334 }
 599  0000 80            	iret
 622                     ; 341  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 622                     ; 342 {
 623                     .text:	section	.text,new
 624  0000               f_UART1_RX_IRQHandler:
 628                     ; 346 }
 631  0000 80            	iret
 653                     ; 354 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 653                     ; 355 {
 654                     .text:	section	.text,new
 655  0000               f_I2C_IRQHandler:
 659                     ; 359 }
 662  0000 80            	iret
 684                     ; 432  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 684                     ; 433 {
 685                     .text:	section	.text,new
 686  0000               f_ADC1_IRQHandler:
 690                     ; 438 }
 693  0000 80            	iret
 716                     ; 459  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 716                     ; 460 {
 717                     .text:	section	.text,new
 718  0000               f_TIM4_UPD_OVF_IRQHandler:
 722                     ; 464 }
 725  0000 80            	iret
 748                     ; 472 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 748                     ; 473 {
 749                     .text:	section	.text,new
 750  0000               f_EEPROM_EEC_IRQHandler:
 754                     ; 477 }
 757  0000 80            	iret
 769                     	xdef	f_EEPROM_EEC_IRQHandler
 770                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 771                     	xdef	f_ADC1_IRQHandler
 772                     	xdef	f_I2C_IRQHandler
 773                     	xdef	f_UART1_RX_IRQHandler
 774                     	xdef	f_UART1_TX_IRQHandler
 775                     	xdef	f_TIM2_CAP_COM_IRQHandler
 776                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 777                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 778                     	xdef	f_TIM1_CAP_COM_IRQHandler
 779                     	xdef	f_SPI_IRQHandler
 780                     	xdef	f_EXTI_PORTE_IRQHandler
 781                     	xdef	f_EXTI_PORTD_IRQHandler
 782                     	xdef	f_EXTI_PORTC_IRQHandler
 783                     	xdef	f_EXTI_PORTB_IRQHandler
 784                     	xdef	f_EXTI_PORTA_IRQHandler
 785                     	xdef	f_CLK_IRQHandler
 786                     	xdef	f_AWU_IRQHandler
 787                     	xdef	f_TLI_IRQHandler
 788                     	xdef	f_TRAP_IRQHandler
 789                     	xdef	f_NonHandledInterrupt
 790                     	xref	_TIM2_ClearITPendingBit
 791                     	xref	_GPIO_WriteReverse
 792                     	xref.b	c_x
 793                     	xref.b	c_y
 812                     	end
