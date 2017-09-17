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
  72                     ; 18 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
  74  000a 4b40          	push	#64
  75  000c 4bff          	push	#255
  76  000e ae5000        	ldw	x,#20480
  77  0011 cd0000        	call	_GPIO_Init
  79  0014 85            	popw	x
  80                     ; 19 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
  82  0015 4b40          	push	#64
  83  0017 4bff          	push	#255
  84  0019 ae5005        	ldw	x,#20485
  85  001c cd0000        	call	_GPIO_Init
  87  001f 85            	popw	x
  88                     ; 20 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
  90  0020 4b40          	push	#64
  91  0022 4bff          	push	#255
  92  0024 ae500a        	ldw	x,#20490
  93  0027 cd0000        	call	_GPIO_Init
  95  002a 85            	popw	x
  96                     ; 21 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
  98  002b 4b40          	push	#64
  99  002d 4bff          	push	#255
 100  002f ae500f        	ldw	x,#20495
 101  0032 cd0000        	call	_GPIO_Init
 103  0035 85            	popw	x
 104                     ; 25 	TIM1_pwm_setup();
 106  0036 cd0000        	call	L3_TIM1_pwm_setup
 108                     ; 26 	TIM2_wakeup_setup();
 110  0039 cd0000        	call	L5_TIM2_wakeup_setup
 112                     ; 27 	CFG->GCR |= CFG_GCR_AL;
 114  003c 72127f60      	bset	32608,#1
 115  0040               L72:
 116                     ; 28 while(1);
 118  0040 20fe          	jra	L72
 141                     ; 33 static void GoGreen(void) {
 142                     .text:	section	.text,new
 143  0000               L7_GoGreen:
 147                     ; 34 	CLK->PCKENR1 = (1<<CLK_PERIPHERAL_TIMER1) | (1<<CLK_PERIPHERAL_TIMER2);
 149  0000 35a050c7      	mov	20679,#160
 150                     ; 35 	CLK->PCKENR2 = 0;
 152  0004 725f50ca      	clr	20682
 153                     ; 36 }
 156  0008 81            	ret
 186                     ; 38 static void TIM2_wakeup_setup(void) {
 187                     .text:	section	.text,new
 188  0000               L5_TIM2_wakeup_setup:
 192                     ; 39 	TIM2_DeInit();
 194  0000 cd0000        	call	_TIM2_DeInit
 196                     ; 40 	TIM2_TimeBaseInit(TIM2_PRESCALER_2048, 235); //~30ms
 198  0003 ae00eb        	ldw	x,#235
 199  0006 89            	pushw	x
 200  0007 a60b          	ld	a,#11
 201  0009 cd0000        	call	_TIM2_TimeBaseInit
 203  000c 85            	popw	x
 204                     ; 41 	TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL);
 206  000d 4f            	clr	a
 207  000e cd0000        	call	_TIM2_UpdateRequestConfig
 209                     ; 42 	TIM2_UpdateDisableConfig(DISABLE);
 211  0011 4f            	clr	a
 212  0012 cd0000        	call	_TIM2_UpdateDisableConfig
 214                     ; 43 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 216  0015 ae0101        	ldw	x,#257
 217  0018 cd0000        	call	_TIM2_ITConfig
 219                     ; 44 	enableInterrupts();
 222  001b 9a            rim
 224                     ; 45 	TIM2_Cmd(ENABLE);
 227  001c a601          	ld	a,#1
 228  001e cd0000        	call	_TIM2_Cmd
 230                     ; 46 }
 233  0021 81            	ret
 263                     ; 49 static void TIM1_pwm_setup(void) {
 264                     .text:	section	.text,new
 265  0000               L3_TIM1_pwm_setup:
 269                     ; 50 	TIM1_DeInit();
 271  0000 cd0000        	call	_TIM1_DeInit
 273                     ; 51 	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 99, 0);
 275  0003 4b00          	push	#0
 276  0005 ae0063        	ldw	x,#99
 277  0008 89            	pushw	x
 278  0009 4b00          	push	#0
 279  000b 5f            	clrw	x
 280  000c cd0000        	call	_TIM1_TimeBaseInit
 282  000f 5b04          	addw	sp,#4
 283                     ; 52 	TIM1_OC1Init(TIM1_OCMODE_PWM2, 
 283                     ; 53 							 TIM1_OUTPUTSTATE_ENABLE, 
 283                     ; 54 							 TIM1_OUTPUTNSTATE_DISABLE,
 283                     ; 55 							 100,
 283                     ; 56 							 TIM1_OCPOLARITY_HIGH,
 283                     ; 57 							 TIM1_OCNPOLARITY_LOW,
 283                     ; 58 							 TIM1_OCIDLESTATE_RESET,
 283                     ; 59 							 TIM1_OCNIDLESTATE_RESET);
 285  0011 4b00          	push	#0
 286  0013 4b00          	push	#0
 287  0015 4b88          	push	#136
 288  0017 4b00          	push	#0
 289  0019 ae0064        	ldw	x,#100
 290  001c 89            	pushw	x
 291  001d 4b00          	push	#0
 292  001f ae7011        	ldw	x,#28689
 293  0022 cd0000        	call	_TIM1_OC1Init
 295  0025 5b07          	addw	sp,#7
 296                     ; 61 	TIM1_OC2Init(TIM1_OCMODE_PWM2, 
 296                     ; 62 							 TIM1_OUTPUTSTATE_ENABLE, 
 296                     ; 63 							 TIM1_OUTPUTNSTATE_DISABLE,
 296                     ; 64 							 100,
 296                     ; 65 							 TIM1_OCPOLARITY_HIGH,
 296                     ; 66 							 TIM1_OCNPOLARITY_LOW,
 296                     ; 67 							 TIM1_OCIDLESTATE_RESET,
 296                     ; 68 							 TIM1_OCNIDLESTATE_RESET);
 298  0027 4b00          	push	#0
 299  0029 4b00          	push	#0
 300  002b 4b88          	push	#136
 301  002d 4b00          	push	#0
 302  002f ae0064        	ldw	x,#100
 303  0032 89            	pushw	x
 304  0033 4b00          	push	#0
 305  0035 ae7011        	ldw	x,#28689
 306  0038 cd0000        	call	_TIM1_OC2Init
 308  003b 5b07          	addw	sp,#7
 309                     ; 70 	TIM1_OC3Init(TIM1_OCMODE_PWM2, 
 309                     ; 71 							 TIM1_OUTPUTSTATE_ENABLE, 
 309                     ; 72 							 TIM1_OUTPUTNSTATE_DISABLE,
 309                     ; 73 							 100,
 309                     ; 74 							 TIM1_OCPOLARITY_HIGH,
 309                     ; 75 							 TIM1_OCNPOLARITY_LOW,
 309                     ; 76 							 TIM1_OCIDLESTATE_RESET,
 309                     ; 77 							 TIM1_OCNIDLESTATE_RESET);
 311  003d 4b00          	push	#0
 312  003f 4b00          	push	#0
 313  0041 4b88          	push	#136
 314  0043 4b00          	push	#0
 315  0045 ae0064        	ldw	x,#100
 316  0048 89            	pushw	x
 317  0049 4b00          	push	#0
 318  004b ae7011        	ldw	x,#28689
 319  004e cd0000        	call	_TIM1_OC3Init
 321  0051 5b07          	addw	sp,#7
 322                     ; 78 	TIM1_Cmd(ENABLE);
 324  0053 a601          	ld	a,#1
 325  0055 cd0000        	call	_TIM1_Cmd
 327                     ; 79 	TIM1_CtrlPWMOutputs(ENABLE);
 329  0058 a601          	ld	a,#1
 330  005a cd0000        	call	_TIM1_CtrlPWMOutputs
 332                     ; 82 }
 335  005d 81            	ret
 369                     ; 84 void Delay(uint16_t count) {
 370                     .text:	section	.text,new
 371  0000               _Delay:
 373  0000 89            	pushw	x
 374       00000000      OFST:	set	0
 377  0001               L301:
 378                     ; 85 	while (count--);
 380  0001 1e01          	ldw	x,(OFST+1,sp)
 381  0003 1d0001        	subw	x,#1
 382  0006 1f01          	ldw	(OFST+1,sp),x
 383  0008 1c0001        	addw	x,#1
 384  000b a30000        	cpw	x,#0
 385  000e 26f1          	jrne	L301
 386                     ; 86 }
 389  0010 85            	popw	x
 390  0011 81            	ret
 425                     ; 97 void assert_failed(uint8_t* file, uint32_t line)
 425                     ; 98 { 
 426                     .text:	section	.text,new
 427  0000               _assert_failed:
 431  0000               L521:
 432  0000 20fe          	jra	L521
 445                     	xdef	_main
 446                     	xdef	_Delay
 447                     	xdef	_assert_failed
 448                     	xref	_TIM2_UpdateRequestConfig
 449                     	xref	_TIM2_UpdateDisableConfig
 450                     	xref	_TIM2_ITConfig
 451                     	xref	_TIM2_Cmd
 452                     	xref	_TIM2_TimeBaseInit
 453                     	xref	_TIM2_DeInit
 454                     	xref	_TIM1_CtrlPWMOutputs
 455                     	xref	_TIM1_Cmd
 456                     	xref	_TIM1_OC3Init
 457                     	xref	_TIM1_OC2Init
 458                     	xref	_TIM1_OC1Init
 459                     	xref	_TIM1_TimeBaseInit
 460                     	xref	_TIM1_DeInit
 461                     	xref	_GPIO_Init
 462                     	xref	_CLK_HSIPrescalerConfig
 463                     	xref	_CLK_DeInit
 482                     	end
