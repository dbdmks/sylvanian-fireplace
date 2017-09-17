   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  52                     ; 13 main()
  52                     ; 14 {  
  54                     .text:	section	.text,new
  55  0000               _main:
  59                     ; 15 	CLK_DeInit();
  61  0000 cd0000        	call	_CLK_DeInit
  63                     ; 16 	GoGreen();
  65  0003 cd0000        	call	L7_GoGreen
  67                     ; 17   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  69  0006 4f            	clr	a
  70  0007 cd0000        	call	_CLK_HSIPrescalerConfig
  72                     ; 19 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
  74  000a 4b40          	push	#64
  75  000c 4bff          	push	#255
  76  000e ae5000        	ldw	x,#20480
  77  0011 cd0000        	call	_GPIO_Init
  79  0014 85            	popw	x
  80                     ; 20 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
  82  0015 4b40          	push	#64
  83  0017 4bff          	push	#255
  84  0019 ae5005        	ldw	x,#20485
  85  001c cd0000        	call	_GPIO_Init
  87  001f 85            	popw	x
  88                     ; 21 	GPIO_Init(GPIOC,GPIO_PIN_ALL&~(GPIO_PIN_3|GPIO_PIN_6|GPIO_PIN_7),GPIO_MODE_IN_PU_NO_IT);
  90  0020 4b40          	push	#64
  91  0022 4b37          	push	#55
  92  0024 ae500a        	ldw	x,#20490
  93  0027 cd0000        	call	_GPIO_Init
  95  002a 85            	popw	x
  96                     ; 22 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
  98  002b 4b40          	push	#64
  99  002d 4bff          	push	#255
 100  002f ae500f        	ldw	x,#20495
 101  0032 cd0000        	call	_GPIO_Init
 103  0035 85            	popw	x
 104                     ; 26 	TIM1_pwm_setup();
 106  0036 cd0000        	call	L3_TIM1_pwm_setup
 108                     ; 27 	TIM2_wakeup_setup();
 110  0039 cd0000        	call	L5_TIM2_wakeup_setup
 112                     ; 28 	CFG->GCR |= CFG_GCR_AL;
 114  003c 72127f60      	bset	32608,#1
 115                     ; 30 	wfi();
 118  0040 8f            wfi
 120                     ; 31 	halt();
 124  0041 8e            halt
 126                     ; 32 }
 130  0042 81            	ret
 153                     ; 34 static void GoGreen(void) {
 154                     .text:	section	.text,new
 155  0000               L7_GoGreen:
 159                     ; 35 	CLK->PCKENR1 = (1<<CLK_PERIPHERAL_TIMER1) | (1<<CLK_PERIPHERAL_TIMER2);
 161  0000 35a050c7      	mov	20679,#160
 162                     ; 36 	CLK->PCKENR2 = 0;
 164  0004 725f50ca      	clr	20682
 165                     ; 37 }
 168  0008 81            	ret
 198                     ; 39 static void TIM2_wakeup_setup(void) {
 199                     .text:	section	.text,new
 200  0000               L5_TIM2_wakeup_setup:
 204                     ; 40 	TIM2_DeInit();
 206  0000 cd0000        	call	_TIM2_DeInit
 208                     ; 41 	TIM2_TimeBaseInit(TIM2_PRESCALER_2048, 235); //~30ms
 210  0003 ae00eb        	ldw	x,#235
 211  0006 89            	pushw	x
 212  0007 a60b          	ld	a,#11
 213  0009 cd0000        	call	_TIM2_TimeBaseInit
 215  000c 85            	popw	x
 216                     ; 42 	TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL);
 218  000d 4f            	clr	a
 219  000e cd0000        	call	_TIM2_UpdateRequestConfig
 221                     ; 43 	TIM2_UpdateDisableConfig(DISABLE);
 223  0011 4f            	clr	a
 224  0012 cd0000        	call	_TIM2_UpdateDisableConfig
 226                     ; 44 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 228  0015 ae0101        	ldw	x,#257
 229  0018 cd0000        	call	_TIM2_ITConfig
 231                     ; 45 	enableInterrupts();
 234  001b 9a            rim
 236                     ; 46 	TIM2_Cmd(ENABLE);
 239  001c a601          	ld	a,#1
 240  001e cd0000        	call	_TIM2_Cmd
 242                     ; 47 }
 245  0021 81            	ret
 275                     ; 50 static void TIM1_pwm_setup(void) {
 276                     .text:	section	.text,new
 277  0000               L3_TIM1_pwm_setup:
 281                     ; 51 	TIM1_DeInit();
 283  0000 cd0000        	call	_TIM1_DeInit
 285                     ; 52 	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 99, 0);
 287  0003 4b00          	push	#0
 288  0005 ae0063        	ldw	x,#99
 289  0008 89            	pushw	x
 290  0009 4b00          	push	#0
 291  000b 5f            	clrw	x
 292  000c cd0000        	call	_TIM1_TimeBaseInit
 294  000f 5b04          	addw	sp,#4
 295                     ; 53 	TIM1_OC1Init(TIM1_OCMODE_PWM2, 
 295                     ; 54 							 TIM1_OUTPUTSTATE_ENABLE, 
 295                     ; 55 							 TIM1_OUTPUTNSTATE_DISABLE,
 295                     ; 56 							 100,
 295                     ; 57 							 TIM1_OCPOLARITY_HIGH,
 295                     ; 58 							 TIM1_OCNPOLARITY_LOW,
 295                     ; 59 							 TIM1_OCIDLESTATE_RESET,
 295                     ; 60 							 TIM1_OCNIDLESTATE_RESET);
 297  0011 4b00          	push	#0
 298  0013 4b00          	push	#0
 299  0015 4b88          	push	#136
 300  0017 4b00          	push	#0
 301  0019 ae0064        	ldw	x,#100
 302  001c 89            	pushw	x
 303  001d 4b00          	push	#0
 304  001f ae7011        	ldw	x,#28689
 305  0022 cd0000        	call	_TIM1_OC1Init
 307  0025 5b07          	addw	sp,#7
 308                     ; 62 	TIM1_OC2Init(TIM1_OCMODE_PWM2, 
 308                     ; 63 							 TIM1_OUTPUTSTATE_ENABLE, 
 308                     ; 64 							 TIM1_OUTPUTNSTATE_DISABLE,
 308                     ; 65 							 100,
 308                     ; 66 							 TIM1_OCPOLARITY_HIGH,
 308                     ; 67 							 TIM1_OCNPOLARITY_LOW,
 308                     ; 68 							 TIM1_OCIDLESTATE_RESET,
 308                     ; 69 							 TIM1_OCNIDLESTATE_RESET);
 310  0027 4b00          	push	#0
 311  0029 4b00          	push	#0
 312  002b 4b88          	push	#136
 313  002d 4b00          	push	#0
 314  002f ae0064        	ldw	x,#100
 315  0032 89            	pushw	x
 316  0033 4b00          	push	#0
 317  0035 ae7011        	ldw	x,#28689
 318  0038 cd0000        	call	_TIM1_OC2Init
 320  003b 5b07          	addw	sp,#7
 321                     ; 71 	TIM1_OC3Init(TIM1_OCMODE_PWM2, 
 321                     ; 72 							 TIM1_OUTPUTSTATE_ENABLE, 
 321                     ; 73 							 TIM1_OUTPUTNSTATE_DISABLE,
 321                     ; 74 							 100,
 321                     ; 75 							 TIM1_OCPOLARITY_HIGH,
 321                     ; 76 							 TIM1_OCNPOLARITY_LOW,
 321                     ; 77 							 TIM1_OCIDLESTATE_RESET,
 321                     ; 78 							 TIM1_OCNIDLESTATE_RESET);
 323  003d 4b00          	push	#0
 324  003f 4b00          	push	#0
 325  0041 4b88          	push	#136
 326  0043 4b00          	push	#0
 327  0045 ae0064        	ldw	x,#100
 328  0048 89            	pushw	x
 329  0049 4b00          	push	#0
 330  004b ae7011        	ldw	x,#28689
 331  004e cd0000        	call	_TIM1_OC3Init
 333  0051 5b07          	addw	sp,#7
 334                     ; 79 	TIM1_Cmd(ENABLE);
 336  0053 a601          	ld	a,#1
 337  0055 cd0000        	call	_TIM1_Cmd
 339                     ; 80 	TIM1_CtrlPWMOutputs(ENABLE);
 341  0058 a601          	ld	a,#1
 342  005a cd0000        	call	_TIM1_CtrlPWMOutputs
 344                     ; 83 }
 347  005d 81            	ret
 381                     ; 85 void Delay(uint16_t count) {
 382                     .text:	section	.text,new
 383  0000               _Delay:
 385  0000 89            	pushw	x
 386       00000000      OFST:	set	0
 389  0001               L77:
 390                     ; 86 	while (count--);
 392  0001 1e01          	ldw	x,(OFST+1,sp)
 393  0003 1d0001        	subw	x,#1
 394  0006 1f01          	ldw	(OFST+1,sp),x
 395  0008 1c0001        	addw	x,#1
 396  000b a30000        	cpw	x,#0
 397  000e 26f1          	jrne	L77
 398                     ; 87 }
 401  0010 85            	popw	x
 402  0011 81            	ret
 437                     ; 98 void assert_failed(uint8_t* file, uint32_t line)
 437                     ; 99 { 
 438                     .text:	section	.text,new
 439  0000               _assert_failed:
 443  0000               L121:
 444  0000 20fe          	jra	L121
 457                     	xdef	_main
 458                     	xdef	_Delay
 459                     	xdef	_assert_failed
 460                     	xref	_TIM2_UpdateRequestConfig
 461                     	xref	_TIM2_UpdateDisableConfig
 462                     	xref	_TIM2_ITConfig
 463                     	xref	_TIM2_Cmd
 464                     	xref	_TIM2_TimeBaseInit
 465                     	xref	_TIM2_DeInit
 466                     	xref	_TIM1_CtrlPWMOutputs
 467                     	xref	_TIM1_Cmd
 468                     	xref	_TIM1_OC3Init
 469                     	xref	_TIM1_OC2Init
 470                     	xref	_TIM1_OC1Init
 471                     	xref	_TIM1_TimeBaseInit
 472                     	xref	_TIM1_DeInit
 473                     	xref	_GPIO_Init
 474                     	xref	_CLK_HSIPrescalerConfig
 475                     	xref	_CLK_DeInit
 494                     	end
