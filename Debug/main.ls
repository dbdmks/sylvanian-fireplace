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
  72                     ; 19 	GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_HIZ_SLOW);	
  74  000a 4b90          	push	#144
  75  000c 4b20          	push	#32
  76  000e ae5005        	ldw	x,#20485
  77  0011 cd0000        	call	_GPIO_Init
  79  0014 85            	popw	x
  80                     ; 21 	TIM1_pwm_setup();
  82  0015 cd0000        	call	L3_TIM1_pwm_setup
  84                     ; 22 	TIM2_wakeup_setup();
  86  0018 cd0000        	call	L5_TIM2_wakeup_setup
  88                     ; 23 	CFG->GCR |= CFG_GCR_AL;
  90  001b 72127f60      	bset	32608,#1
  91  001f               L72:
  92                     ; 24 while(1);
  94  001f 20fe          	jra	L72
 117                     ; 29 static void GoGreen(void) {
 118                     .text:	section	.text,new
 119  0000               L7_GoGreen:
 123                     ; 30 	CLK->PCKENR1 = (1<<CLK_PERIPHERAL_TIMER1) | (1<<CLK_PERIPHERAL_TIMER2);
 125  0000 35a050c7      	mov	20679,#160
 126                     ; 31 	CLK->PCKENR2 = 0;
 128  0004 725f50ca      	clr	20682
 129                     ; 32 }
 132  0008 81            	ret
 162                     ; 34 static void TIM2_wakeup_setup(void) {
 163                     .text:	section	.text,new
 164  0000               L5_TIM2_wakeup_setup:
 168                     ; 35 	TIM2_DeInit();
 170  0000 cd0000        	call	_TIM2_DeInit
 172                     ; 36 	TIM2_TimeBaseInit(TIM2_PRESCALER_2048, 235); //~30ms
 174  0003 ae00eb        	ldw	x,#235
 175  0006 89            	pushw	x
 176  0007 a60b          	ld	a,#11
 177  0009 cd0000        	call	_TIM2_TimeBaseInit
 179  000c 85            	popw	x
 180                     ; 37 	TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL);
 182  000d 4f            	clr	a
 183  000e cd0000        	call	_TIM2_UpdateRequestConfig
 185                     ; 38 	TIM2_UpdateDisableConfig(DISABLE);
 187  0011 4f            	clr	a
 188  0012 cd0000        	call	_TIM2_UpdateDisableConfig
 190                     ; 39 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 192  0015 ae0101        	ldw	x,#257
 193  0018 cd0000        	call	_TIM2_ITConfig
 195                     ; 40 	enableInterrupts();
 198  001b 9a            rim
 200                     ; 41 	TIM2_Cmd(ENABLE);
 203  001c a601          	ld	a,#1
 204  001e cd0000        	call	_TIM2_Cmd
 206                     ; 42 }
 209  0021 81            	ret
 239                     ; 45 static void TIM1_pwm_setup(void) {
 240                     .text:	section	.text,new
 241  0000               L3_TIM1_pwm_setup:
 245                     ; 46 	TIM1_DeInit();
 247  0000 cd0000        	call	_TIM1_DeInit
 249                     ; 47 	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 99, 0);
 251  0003 4b00          	push	#0
 252  0005 ae0063        	ldw	x,#99
 253  0008 89            	pushw	x
 254  0009 4b00          	push	#0
 255  000b 5f            	clrw	x
 256  000c cd0000        	call	_TIM1_TimeBaseInit
 258  000f 5b04          	addw	sp,#4
 259                     ; 48 	TIM1_OC1Init(TIM1_OCMODE_PWM2, 
 259                     ; 49 							 TIM1_OUTPUTSTATE_ENABLE, 
 259                     ; 50 							 TIM1_OUTPUTNSTATE_DISABLE,
 259                     ; 51 							 100,
 259                     ; 52 							 TIM1_OCPOLARITY_HIGH,
 259                     ; 53 							 TIM1_OCNPOLARITY_LOW,
 259                     ; 54 							 TIM1_OCIDLESTATE_RESET,
 259                     ; 55 							 TIM1_OCNIDLESTATE_RESET);
 261  0011 4b00          	push	#0
 262  0013 4b00          	push	#0
 263  0015 4b88          	push	#136
 264  0017 4b00          	push	#0
 265  0019 ae0064        	ldw	x,#100
 266  001c 89            	pushw	x
 267  001d 4b00          	push	#0
 268  001f ae7011        	ldw	x,#28689
 269  0022 cd0000        	call	_TIM1_OC1Init
 271  0025 5b07          	addw	sp,#7
 272                     ; 57 	TIM1_OC2Init(TIM1_OCMODE_PWM2, 
 272                     ; 58 							 TIM1_OUTPUTSTATE_ENABLE, 
 272                     ; 59 							 TIM1_OUTPUTNSTATE_DISABLE,
 272                     ; 60 							 100,
 272                     ; 61 							 TIM1_OCPOLARITY_HIGH,
 272                     ; 62 							 TIM1_OCNPOLARITY_LOW,
 272                     ; 63 							 TIM1_OCIDLESTATE_RESET,
 272                     ; 64 							 TIM1_OCNIDLESTATE_RESET);
 274  0027 4b00          	push	#0
 275  0029 4b00          	push	#0
 276  002b 4b88          	push	#136
 277  002d 4b00          	push	#0
 278  002f ae0064        	ldw	x,#100
 279  0032 89            	pushw	x
 280  0033 4b00          	push	#0
 281  0035 ae7011        	ldw	x,#28689
 282  0038 cd0000        	call	_TIM1_OC2Init
 284  003b 5b07          	addw	sp,#7
 285                     ; 66 	TIM1_OC3Init(TIM1_OCMODE_PWM2, 
 285                     ; 67 							 TIM1_OUTPUTSTATE_ENABLE, 
 285                     ; 68 							 TIM1_OUTPUTNSTATE_DISABLE,
 285                     ; 69 							 100,
 285                     ; 70 							 TIM1_OCPOLARITY_HIGH,
 285                     ; 71 							 TIM1_OCNPOLARITY_LOW,
 285                     ; 72 							 TIM1_OCIDLESTATE_RESET,
 285                     ; 73 							 TIM1_OCNIDLESTATE_RESET);
 287  003d 4b00          	push	#0
 288  003f 4b00          	push	#0
 289  0041 4b88          	push	#136
 290  0043 4b00          	push	#0
 291  0045 ae0064        	ldw	x,#100
 292  0048 89            	pushw	x
 293  0049 4b00          	push	#0
 294  004b ae7011        	ldw	x,#28689
 295  004e cd0000        	call	_TIM1_OC3Init
 297  0051 5b07          	addw	sp,#7
 298                     ; 74 	TIM1_Cmd(ENABLE);
 300  0053 a601          	ld	a,#1
 301  0055 cd0000        	call	_TIM1_Cmd
 303                     ; 75 	TIM1_CtrlPWMOutputs(ENABLE);
 305  0058 a601          	ld	a,#1
 306  005a cd0000        	call	_TIM1_CtrlPWMOutputs
 308                     ; 78 }
 311  005d 81            	ret
 345                     ; 80 void Delay(uint16_t count) {
 346                     .text:	section	.text,new
 347  0000               _Delay:
 349  0000 89            	pushw	x
 350       00000000      OFST:	set	0
 353  0001               L301:
 354                     ; 81 	while (count--);
 356  0001 1e01          	ldw	x,(OFST+1,sp)
 357  0003 1d0001        	subw	x,#1
 358  0006 1f01          	ldw	(OFST+1,sp),x
 359  0008 1c0001        	addw	x,#1
 360  000b a30000        	cpw	x,#0
 361  000e 26f1          	jrne	L301
 362                     ; 82 }
 365  0010 85            	popw	x
 366  0011 81            	ret
 401                     ; 93 void assert_failed(uint8_t* file, uint32_t line)
 401                     ; 94 { 
 402                     .text:	section	.text,new
 403  0000               _assert_failed:
 407  0000               L521:
 408  0000 20fe          	jra	L521
 421                     	xdef	_main
 422                     	xdef	_Delay
 423                     	xdef	_assert_failed
 424                     	xref	_TIM2_UpdateRequestConfig
 425                     	xref	_TIM2_UpdateDisableConfig
 426                     	xref	_TIM2_ITConfig
 427                     	xref	_TIM2_Cmd
 428                     	xref	_TIM2_TimeBaseInit
 429                     	xref	_TIM2_DeInit
 430                     	xref	_TIM1_CtrlPWMOutputs
 431                     	xref	_TIM1_Cmd
 432                     	xref	_TIM1_OC3Init
 433                     	xref	_TIM1_OC2Init
 434                     	xref	_TIM1_OC1Init
 435                     	xref	_TIM1_TimeBaseInit
 436                     	xref	_TIM1_DeInit
 437                     	xref	_GPIO_Init
 438                     	xref	_CLK_HSIPrescalerConfig
 439                     	xref	_CLK_DeInit
 458                     	end
