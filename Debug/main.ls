   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  60                     ; 13 main()
  60                     ; 14 {
  62                     .text:	section	.text,new
  63  0000               _main:
  65  0000 88            	push	a
  66       00000001      OFST:	set	1
  69                     ; 15 	CLK_DeInit();
  71  0001 cd0000        	call	_CLK_DeInit
  73                     ; 16   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  75  0004 4f            	clr	a
  76  0005 cd0000        	call	_CLK_HSIPrescalerConfig
  78                     ; 20 	GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_HIZ_SLOW);	
  80  0008 4b90          	push	#144
  81  000a 4b20          	push	#32
  82  000c ae5005        	ldw	x,#20485
  83  000f cd0000        	call	_GPIO_Init
  85  0012 85            	popw	x
  86                     ; 23 	TIM2_wakeup_setup();
  88  0013 cd0000        	call	L5_TIM2_wakeup_setup
  90  0016               L33:
  91                     ; 27 		uint8_t i = 3;
  93  0016 a603          	ld	a,#3
  94  0018 6b01          	ld	(OFST+0,sp),a
  96                     ; 36 		wfi();
  99  001a 8f            wfi
 103  001b 2002          	jra	L14
 104  001d               L73:
 105                     ; 39 			i--;
 107  001d 0a01          	dec	(OFST+0,sp)
 109  001f               L14:
 110                     ; 38 		while (i) {
 112  001f 0d01          	tnz	(OFST+0,sp)
 113  0021 26fa          	jrne	L73
 115  0023 20f1          	jra	L33
 145                     ; 46 static void TIM2_wakeup_setup(void) {
 146                     .text:	section	.text,new
 147  0000               L5_TIM2_wakeup_setup:
 151                     ; 47 	TIM2_DeInit();
 153  0000 cd0000        	call	_TIM2_DeInit
 155                     ; 48 	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 1032);
 157  0003 ae0408        	ldw	x,#1032
 158  0006 89            	pushw	x
 159  0007 a606          	ld	a,#6
 160  0009 cd0000        	call	_TIM2_TimeBaseInit
 162  000c 85            	popw	x
 163                     ; 49 	TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL);
 165  000d 4f            	clr	a
 166  000e cd0000        	call	_TIM2_UpdateRequestConfig
 168                     ; 50 	TIM2_UpdateDisableConfig(DISABLE);
 170  0011 4f            	clr	a
 171  0012 cd0000        	call	_TIM2_UpdateDisableConfig
 173                     ; 51 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 175  0015 ae0101        	ldw	x,#257
 176  0018 cd0000        	call	_TIM2_ITConfig
 178                     ; 52 	enableInterrupts();
 181  001b 9a            rim
 183                     ; 53 	TIM2_Cmd(ENABLE);
 186  001c a601          	ld	a,#1
 187  001e cd0000        	call	_TIM2_Cmd
 189                     ; 54 }
 192  0021 81            	ret
 218                     ; 56 void Sleep(void) {
 219                     .text:	section	.text,new
 220  0000               _Sleep:
 224                     ; 57 	TIM1_CtrlPWMOutputs(DISABLE);
 226  0000 4f            	clr	a
 227  0001 cd0000        	call	_TIM1_CtrlPWMOutputs
 229                     ; 58 	TIM1_Cmd(DISABLE);		
 231  0004 4f            	clr	a
 232  0005 cd0000        	call	_TIM1_Cmd
 234                     ; 59   halt();
 237  0008 8e            halt
 239                     ; 60 }
 243  0009 81            	ret
 273                     ; 62 static void TIM1_pwm_setup(void) {
 274                     .text:	section	.text,new
 275  0000               L3_TIM1_pwm_setup:
 279                     ; 63 	TIM1_DeInit();
 281  0000 cd0000        	call	_TIM1_DeInit
 283                     ; 64 	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 99, 0);
 285  0003 4b00          	push	#0
 286  0005 ae0063        	ldw	x,#99
 287  0008 89            	pushw	x
 288  0009 4b00          	push	#0
 289  000b 5f            	clrw	x
 290  000c cd0000        	call	_TIM1_TimeBaseInit
 292  000f 5b04          	addw	sp,#4
 293                     ; 65 	TIM1_OC1Init(TIM1_OCMODE_PWM2, 
 293                     ; 66 							 TIM1_OUTPUTSTATE_ENABLE, 
 293                     ; 67 							 TIM1_OUTPUTNSTATE_DISABLE,
 293                     ; 68 							 0,
 293                     ; 69 							 TIM1_OCPOLARITY_HIGH,
 293                     ; 70 							 TIM1_OCNPOLARITY_LOW,
 293                     ; 71 							 TIM1_OCIDLESTATE_RESET,
 293                     ; 72 							 TIM1_OCNIDLESTATE_RESET);
 295  0011 4b00          	push	#0
 296  0013 4b00          	push	#0
 297  0015 4b88          	push	#136
 298  0017 4b00          	push	#0
 299  0019 5f            	clrw	x
 300  001a 89            	pushw	x
 301  001b 4b00          	push	#0
 302  001d ae7011        	ldw	x,#28689
 303  0020 cd0000        	call	_TIM1_OC1Init
 305  0023 5b07          	addw	sp,#7
 306                     ; 74 	TIM1_OC2Init(TIM1_OCMODE_PWM2, 
 306                     ; 75 							 TIM1_OUTPUTSTATE_ENABLE, 
 306                     ; 76 							 TIM1_OUTPUTNSTATE_DISABLE,
 306                     ; 77 							 50,
 306                     ; 78 							 TIM1_OCPOLARITY_HIGH,
 306                     ; 79 							 TIM1_OCNPOLARITY_LOW,
 306                     ; 80 							 TIM1_OCIDLESTATE_RESET,
 306                     ; 81 							 TIM1_OCNIDLESTATE_RESET);
 308  0025 4b00          	push	#0
 309  0027 4b00          	push	#0
 310  0029 4b88          	push	#136
 311  002b 4b00          	push	#0
 312  002d ae0032        	ldw	x,#50
 313  0030 89            	pushw	x
 314  0031 4b00          	push	#0
 315  0033 ae7011        	ldw	x,#28689
 316  0036 cd0000        	call	_TIM1_OC2Init
 318  0039 5b07          	addw	sp,#7
 319                     ; 83 	TIM1_OC3Init(TIM1_OCMODE_PWM2, 
 319                     ; 84 							 TIM1_OUTPUTSTATE_ENABLE, 
 319                     ; 85 							 TIM1_OUTPUTNSTATE_DISABLE,
 319                     ; 86 							 100,
 319                     ; 87 							 TIM1_OCPOLARITY_HIGH,
 319                     ; 88 							 TIM1_OCNPOLARITY_LOW,
 319                     ; 89 							 TIM1_OCIDLESTATE_RESET,
 319                     ; 90 							 TIM1_OCNIDLESTATE_RESET);
 321  003b 4b00          	push	#0
 322  003d 4b00          	push	#0
 323  003f 4b88          	push	#136
 324  0041 4b00          	push	#0
 325  0043 ae0064        	ldw	x,#100
 326  0046 89            	pushw	x
 327  0047 4b00          	push	#0
 328  0049 ae7011        	ldw	x,#28689
 329  004c cd0000        	call	_TIM1_OC3Init
 331  004f 5b07          	addw	sp,#7
 332                     ; 91 	TIM1_Cmd(ENABLE);
 334  0051 a601          	ld	a,#1
 335  0053 cd0000        	call	_TIM1_Cmd
 337                     ; 92 	TIM1_CtrlPWMOutputs(ENABLE);
 339  0056 a601          	ld	a,#1
 340  0058 cd0000        	call	_TIM1_CtrlPWMOutputs
 342                     ; 95 }
 345  005b 81            	ret
 379                     ; 97 void Delay(uint16_t count) {
 380                     .text:	section	.text,new
 381  0000               _Delay:
 383  0000 89            	pushw	x
 384       00000000      OFST:	set	0
 387  0001               L511:
 388                     ; 98 	while (count--);
 390  0001 1e01          	ldw	x,(OFST+1,sp)
 391  0003 1d0001        	subw	x,#1
 392  0006 1f01          	ldw	(OFST+1,sp),x
 393  0008 1c0001        	addw	x,#1
 394  000b a30000        	cpw	x,#0
 395  000e 26f1          	jrne	L511
 396                     ; 99 }
 399  0010 85            	popw	x
 400  0011 81            	ret
 435                     ; 110 void assert_failed(uint8_t* file, uint32_t line)
 435                     ; 111 { 
 436                     .text:	section	.text,new
 437  0000               _assert_failed:
 441  0000               L731:
 442  0000 20fe          	jra	L731
 455                     	xdef	_main
 456                     	xdef	_Sleep
 457                     	xdef	_Delay
 458                     	xdef	_assert_failed
 459                     	xref	_TIM2_UpdateRequestConfig
 460                     	xref	_TIM2_UpdateDisableConfig
 461                     	xref	_TIM2_ITConfig
 462                     	xref	_TIM2_Cmd
 463                     	xref	_TIM2_TimeBaseInit
 464                     	xref	_TIM2_DeInit
 465                     	xref	_TIM1_CtrlPWMOutputs
 466                     	xref	_TIM1_Cmd
 467                     	xref	_TIM1_OC3Init
 468                     	xref	_TIM1_OC2Init
 469                     	xref	_TIM1_OC1Init
 470                     	xref	_TIM1_TimeBaseInit
 471                     	xref	_TIM1_DeInit
 472                     	xref	_GPIO_Init
 473                     	xref	_CLK_HSIPrescalerConfig
 474                     	xref	_CLK_DeInit
 493                     	end
