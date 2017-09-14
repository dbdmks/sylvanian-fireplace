   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  61                     ; 13 main()
  61                     ; 14 {
  63                     .text:	section	.text,new
  64  0000               _main:
  66  0000 88            	push	a
  67       00000001      OFST:	set	1
  70                     ; 15 	CLK_DeInit();
  72  0001 cd0000        	call	_CLK_DeInit
  74                     ; 16   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);	
  76  0004 4f            	clr	a
  77  0005 cd0000        	call	_CLK_HSIPrescalerConfig
  79                     ; 18 	GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_HIZ_SLOW);	
  81  0008 4b90          	push	#144
  82  000a 4b20          	push	#32
  83  000c ae5005        	ldw	x,#20485
  84  000f cd0000        	call	_GPIO_Init
  86  0012 85            	popw	x
  87                     ; 20 	TIM1_pwm_setup();
  89  0013 cd0000        	call	L3_TIM1_pwm_setup
  91                     ; 21 	TIM2_wakeup_setup();
  93  0016 cd0000        	call	L5_TIM2_wakeup_setup
  95  0019               L33:
  96                     ; 25 		uint8_t i = 3;
  98  0019 a603          	ld	a,#3
  99  001b 6b01          	ld	(OFST+0,sp),a
 101                     ; 27 		wfi();
 104  001d 8f            wfi
 108  001e 2002          	jra	L14
 109  0020               L73:
 110                     ; 30 			i--;
 112  0020 0a01          	dec	(OFST+0,sp)
 114  0022               L14:
 115                     ; 29 		while (i) {
 117  0022 0d01          	tnz	(OFST+0,sp)
 118  0024 26fa          	jrne	L73
 120  0026 20f1          	jra	L33
 150                     ; 37 static void TIM2_wakeup_setup(void) {
 151                     .text:	section	.text,new
 152  0000               L5_TIM2_wakeup_setup:
 156                     ; 38 	TIM2_DeInit();
 158  0000 cd0000        	call	_TIM2_DeInit
 160                     ; 39 	TIM2_TimeBaseInit(TIM2_PRESCALER_2048, 235); //~30ms
 162  0003 ae00eb        	ldw	x,#235
 163  0006 89            	pushw	x
 164  0007 a60b          	ld	a,#11
 165  0009 cd0000        	call	_TIM2_TimeBaseInit
 167  000c 85            	popw	x
 168                     ; 40 	TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL);
 170  000d 4f            	clr	a
 171  000e cd0000        	call	_TIM2_UpdateRequestConfig
 173                     ; 41 	TIM2_UpdateDisableConfig(DISABLE);
 175  0011 4f            	clr	a
 176  0012 cd0000        	call	_TIM2_UpdateDisableConfig
 178                     ; 42 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 180  0015 ae0101        	ldw	x,#257
 181  0018 cd0000        	call	_TIM2_ITConfig
 183                     ; 43 	enableInterrupts();
 186  001b 9a            rim
 188                     ; 44 	TIM2_Cmd(ENABLE);
 191  001c a601          	ld	a,#1
 192  001e cd0000        	call	_TIM2_Cmd
 194                     ; 45 }
 197  0021 81            	ret
 223                     ; 47 void Sleep(void) {
 224                     .text:	section	.text,new
 225  0000               _Sleep:
 229                     ; 48 	TIM1_CtrlPWMOutputs(DISABLE);
 231  0000 4f            	clr	a
 232  0001 cd0000        	call	_TIM1_CtrlPWMOutputs
 234                     ; 49 	TIM1_Cmd(DISABLE);		
 236  0004 4f            	clr	a
 237  0005 cd0000        	call	_TIM1_Cmd
 239                     ; 50   halt();
 242  0008 8e            halt
 244                     ; 51 }
 248  0009 81            	ret
 278                     ; 53 static void TIM1_pwm_setup(void) {
 279                     .text:	section	.text,new
 280  0000               L3_TIM1_pwm_setup:
 284                     ; 54 	TIM1_DeInit();
 286  0000 cd0000        	call	_TIM1_DeInit
 288                     ; 55 	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 99, 0);
 290  0003 4b00          	push	#0
 291  0005 ae0063        	ldw	x,#99
 292  0008 89            	pushw	x
 293  0009 4b00          	push	#0
 294  000b 5f            	clrw	x
 295  000c cd0000        	call	_TIM1_TimeBaseInit
 297  000f 5b04          	addw	sp,#4
 298                     ; 56 	TIM1_OC1Init(TIM1_OCMODE_PWM2, 
 298                     ; 57 							 TIM1_OUTPUTSTATE_ENABLE, 
 298                     ; 58 							 TIM1_OUTPUTNSTATE_DISABLE,
 298                     ; 59 							 0,
 298                     ; 60 							 TIM1_OCPOLARITY_HIGH,
 298                     ; 61 							 TIM1_OCNPOLARITY_LOW,
 298                     ; 62 							 TIM1_OCIDLESTATE_RESET,
 298                     ; 63 							 TIM1_OCNIDLESTATE_RESET);
 300  0011 4b00          	push	#0
 301  0013 4b00          	push	#0
 302  0015 4b88          	push	#136
 303  0017 4b00          	push	#0
 304  0019 5f            	clrw	x
 305  001a 89            	pushw	x
 306  001b 4b00          	push	#0
 307  001d ae7011        	ldw	x,#28689
 308  0020 cd0000        	call	_TIM1_OC1Init
 310  0023 5b07          	addw	sp,#7
 311                     ; 65 	TIM1_OC2Init(TIM1_OCMODE_PWM2, 
 311                     ; 66 							 TIM1_OUTPUTSTATE_ENABLE, 
 311                     ; 67 							 TIM1_OUTPUTNSTATE_DISABLE,
 311                     ; 68 							 50,
 311                     ; 69 							 TIM1_OCPOLARITY_HIGH,
 311                     ; 70 							 TIM1_OCNPOLARITY_LOW,
 311                     ; 71 							 TIM1_OCIDLESTATE_RESET,
 311                     ; 72 							 TIM1_OCNIDLESTATE_RESET);
 313  0025 4b00          	push	#0
 314  0027 4b00          	push	#0
 315  0029 4b88          	push	#136
 316  002b 4b00          	push	#0
 317  002d ae0032        	ldw	x,#50
 318  0030 89            	pushw	x
 319  0031 4b00          	push	#0
 320  0033 ae7011        	ldw	x,#28689
 321  0036 cd0000        	call	_TIM1_OC2Init
 323  0039 5b07          	addw	sp,#7
 324                     ; 74 	TIM1_OC3Init(TIM1_OCMODE_PWM2, 
 324                     ; 75 							 TIM1_OUTPUTSTATE_ENABLE, 
 324                     ; 76 							 TIM1_OUTPUTNSTATE_DISABLE,
 324                     ; 77 							 100,
 324                     ; 78 							 TIM1_OCPOLARITY_HIGH,
 324                     ; 79 							 TIM1_OCNPOLARITY_LOW,
 324                     ; 80 							 TIM1_OCIDLESTATE_RESET,
 324                     ; 81 							 TIM1_OCNIDLESTATE_RESET);
 326  003b 4b00          	push	#0
 327  003d 4b00          	push	#0
 328  003f 4b88          	push	#136
 329  0041 4b00          	push	#0
 330  0043 ae0064        	ldw	x,#100
 331  0046 89            	pushw	x
 332  0047 4b00          	push	#0
 333  0049 ae7011        	ldw	x,#28689
 334  004c cd0000        	call	_TIM1_OC3Init
 336  004f 5b07          	addw	sp,#7
 337                     ; 82 	TIM1_Cmd(ENABLE);
 339  0051 a601          	ld	a,#1
 340  0053 cd0000        	call	_TIM1_Cmd
 342                     ; 83 	TIM1_CtrlPWMOutputs(ENABLE);
 344  0056 a601          	ld	a,#1
 345  0058 cd0000        	call	_TIM1_CtrlPWMOutputs
 347                     ; 86 }
 350  005b 81            	ret
 384                     ; 88 void Delay(uint16_t count) {
 385                     .text:	section	.text,new
 386  0000               _Delay:
 388  0000 89            	pushw	x
 389       00000000      OFST:	set	0
 392  0001               L511:
 393                     ; 89 	while (count--);
 395  0001 1e01          	ldw	x,(OFST+1,sp)
 396  0003 1d0001        	subw	x,#1
 397  0006 1f01          	ldw	(OFST+1,sp),x
 398  0008 1c0001        	addw	x,#1
 399  000b a30000        	cpw	x,#0
 400  000e 26f1          	jrne	L511
 401                     ; 90 }
 404  0010 85            	popw	x
 405  0011 81            	ret
 440                     ; 101 void assert_failed(uint8_t* file, uint32_t line)
 440                     ; 102 { 
 441                     .text:	section	.text,new
 442  0000               _assert_failed:
 446  0000               L731:
 447  0000 20fe          	jra	L731
 460                     	xdef	_main
 461                     	xdef	_Sleep
 462                     	xdef	_Delay
 463                     	xdef	_assert_failed
 464                     	xref	_TIM2_UpdateRequestConfig
 465                     	xref	_TIM2_UpdateDisableConfig
 466                     	xref	_TIM2_ITConfig
 467                     	xref	_TIM2_Cmd
 468                     	xref	_TIM2_TimeBaseInit
 469                     	xref	_TIM2_DeInit
 470                     	xref	_TIM1_CtrlPWMOutputs
 471                     	xref	_TIM1_Cmd
 472                     	xref	_TIM1_OC3Init
 473                     	xref	_TIM1_OC2Init
 474                     	xref	_TIM1_OC1Init
 475                     	xref	_TIM1_TimeBaseInit
 476                     	xref	_TIM1_DeInit
 477                     	xref	_GPIO_Init
 478                     	xref	_CLK_HSIPrescalerConfig
 479                     	xref	_CLK_DeInit
 498                     	end
