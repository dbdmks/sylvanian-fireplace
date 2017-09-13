   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  61                     ; 13 main()
  61                     ; 14 {
  63                     .text:	section	.text,new
  64  0000               _main:
  66  0000 88            	push	a
  67       00000001      OFST:	set	1
  70                     ; 17 	GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_HIZ_SLOW);	
  72  0001 4b90          	push	#144
  73  0003 4b20          	push	#32
  74  0005 ae5005        	ldw	x,#20485
  75  0008 cd0000        	call	_GPIO_Init
  77  000b 85            	popw	x
  78                     ; 20 	TIM2_wakeup_setup();
  80  000c cd0000        	call	L5_TIM2_wakeup_setup
  82  000f               L33:
  83                     ; 24 		uint8_t i = 3;
  85  000f a603          	ld	a,#3
  86  0011 6b01          	ld	(OFST+0,sp),a
  88                     ; 26 		GPIO_WriteLow(GPIOB,GPIO_PIN_5);		
  90  0013 4b20          	push	#32
  91  0015 ae5005        	ldw	x,#20485
  92  0018 cd0000        	call	_GPIO_WriteLow
  94  001b 84            	pop	a
  95                     ; 27 		Delay(0xFFFF);		
  97  001c aeffff        	ldw	x,#65535
  98  001f cd0000        	call	_Delay
 100                     ; 28 		GPIO_WriteHigh(GPIOB,GPIO_PIN_5);
 102  0022 4b20          	push	#32
 103  0024 ae5005        	ldw	x,#20485
 104  0027 cd0000        	call	_GPIO_WriteHigh
 106  002a 84            	pop	a
 107                     ; 33 		wfi();
 110  002b 8f            wfi
 114  002c 201a          	jra	L14
 115  002e               L73:
 116                     ; 36 			i--;
 118  002e 0a01          	dec	(OFST+0,sp)
 120                     ; 37 		GPIO_WriteLow(GPIOB,GPIO_PIN_5);		
 122  0030 4b20          	push	#32
 123  0032 ae5005        	ldw	x,#20485
 124  0035 cd0000        	call	_GPIO_WriteLow
 126  0038 84            	pop	a
 127                     ; 38 		Delay(0xFFFF);		
 129  0039 aeffff        	ldw	x,#65535
 130  003c cd0000        	call	_Delay
 132                     ; 39 		GPIO_WriteHigh(GPIOB,GPIO_PIN_5);
 134  003f 4b20          	push	#32
 135  0041 ae5005        	ldw	x,#20485
 136  0044 cd0000        	call	_GPIO_WriteHigh
 138  0047 84            	pop	a
 139  0048               L14:
 140                     ; 35 		while (i) {
 142  0048 0d01          	tnz	(OFST+0,sp)
 143  004a 26e2          	jrne	L73
 145  004c 20c1          	jra	L33
 175                     ; 46 static void TIM2_wakeup_setup(void) {
 176                     .text:	section	.text,new
 177  0000               L5_TIM2_wakeup_setup:
 181                     ; 47 	TIM2_DeInit();
 183  0000 cd0000        	call	_TIM2_DeInit
 185                     ; 48 	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 1032);
 187  0003 ae0408        	ldw	x,#1032
 188  0006 89            	pushw	x
 189  0007 a606          	ld	a,#6
 190  0009 cd0000        	call	_TIM2_TimeBaseInit
 192  000c 85            	popw	x
 193                     ; 49 	TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL);
 195  000d 4f            	clr	a
 196  000e cd0000        	call	_TIM2_UpdateRequestConfig
 198                     ; 50 	TIM2_UpdateDisableConfig(DISABLE);
 200  0011 4f            	clr	a
 201  0012 cd0000        	call	_TIM2_UpdateDisableConfig
 203                     ; 51 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 205  0015 ae0101        	ldw	x,#257
 206  0018 cd0000        	call	_TIM2_ITConfig
 208                     ; 52 	enableInterrupts();
 211  001b 9a            rim
 213                     ; 53 	TIM2_Cmd(ENABLE);
 216  001c a601          	ld	a,#1
 217  001e cd0000        	call	_TIM2_Cmd
 219                     ; 54 }
 222  0021 81            	ret
 248                     ; 56 void Sleep(void) {
 249                     .text:	section	.text,new
 250  0000               _Sleep:
 254                     ; 57 	TIM1_CtrlPWMOutputs(DISABLE);
 256  0000 4f            	clr	a
 257  0001 cd0000        	call	_TIM1_CtrlPWMOutputs
 259                     ; 58 	TIM1_Cmd(DISABLE);		
 261  0004 4f            	clr	a
 262  0005 cd0000        	call	_TIM1_Cmd
 264                     ; 59   halt();
 267  0008 8e            halt
 269                     ; 60 }
 273  0009 81            	ret
 303                     ; 62 static void TIM1_pwm_setup(void) {
 304                     .text:	section	.text,new
 305  0000               L3_TIM1_pwm_setup:
 309                     ; 63 	TIM1_DeInit();
 311  0000 cd0000        	call	_TIM1_DeInit
 313                     ; 64 	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 99, 0);
 315  0003 4b00          	push	#0
 316  0005 ae0063        	ldw	x,#99
 317  0008 89            	pushw	x
 318  0009 4b00          	push	#0
 319  000b 5f            	clrw	x
 320  000c cd0000        	call	_TIM1_TimeBaseInit
 322  000f 5b04          	addw	sp,#4
 323                     ; 65 	TIM1_OC1Init(TIM1_OCMODE_PWM2, 
 323                     ; 66 							 TIM1_OUTPUTSTATE_ENABLE, 
 323                     ; 67 							 TIM1_OUTPUTNSTATE_DISABLE,
 323                     ; 68 							 0,
 323                     ; 69 							 TIM1_OCPOLARITY_HIGH,
 323                     ; 70 							 TIM1_OCNPOLARITY_LOW,
 323                     ; 71 							 TIM1_OCIDLESTATE_RESET,
 323                     ; 72 							 TIM1_OCNIDLESTATE_RESET);
 325  0011 4b00          	push	#0
 326  0013 4b00          	push	#0
 327  0015 4b88          	push	#136
 328  0017 4b00          	push	#0
 329  0019 5f            	clrw	x
 330  001a 89            	pushw	x
 331  001b 4b00          	push	#0
 332  001d ae7011        	ldw	x,#28689
 333  0020 cd0000        	call	_TIM1_OC1Init
 335  0023 5b07          	addw	sp,#7
 336                     ; 74 	TIM1_OC2Init(TIM1_OCMODE_PWM2, 
 336                     ; 75 							 TIM1_OUTPUTSTATE_ENABLE, 
 336                     ; 76 							 TIM1_OUTPUTNSTATE_DISABLE,
 336                     ; 77 							 50,
 336                     ; 78 							 TIM1_OCPOLARITY_HIGH,
 336                     ; 79 							 TIM1_OCNPOLARITY_LOW,
 336                     ; 80 							 TIM1_OCIDLESTATE_RESET,
 336                     ; 81 							 TIM1_OCNIDLESTATE_RESET);
 338  0025 4b00          	push	#0
 339  0027 4b00          	push	#0
 340  0029 4b88          	push	#136
 341  002b 4b00          	push	#0
 342  002d ae0032        	ldw	x,#50
 343  0030 89            	pushw	x
 344  0031 4b00          	push	#0
 345  0033 ae7011        	ldw	x,#28689
 346  0036 cd0000        	call	_TIM1_OC2Init
 348  0039 5b07          	addw	sp,#7
 349                     ; 83 	TIM1_OC3Init(TIM1_OCMODE_PWM2, 
 349                     ; 84 							 TIM1_OUTPUTSTATE_ENABLE, 
 349                     ; 85 							 TIM1_OUTPUTNSTATE_DISABLE,
 349                     ; 86 							 100,
 349                     ; 87 							 TIM1_OCPOLARITY_HIGH,
 349                     ; 88 							 TIM1_OCNPOLARITY_LOW,
 349                     ; 89 							 TIM1_OCIDLESTATE_RESET,
 349                     ; 90 							 TIM1_OCNIDLESTATE_RESET);
 351  003b 4b00          	push	#0
 352  003d 4b00          	push	#0
 353  003f 4b88          	push	#136
 354  0041 4b00          	push	#0
 355  0043 ae0064        	ldw	x,#100
 356  0046 89            	pushw	x
 357  0047 4b00          	push	#0
 358  0049 ae7011        	ldw	x,#28689
 359  004c cd0000        	call	_TIM1_OC3Init
 361  004f 5b07          	addw	sp,#7
 362                     ; 91 	TIM1_Cmd(ENABLE);
 364  0051 a601          	ld	a,#1
 365  0053 cd0000        	call	_TIM1_Cmd
 367                     ; 92 	TIM1_CtrlPWMOutputs(ENABLE);
 369  0056 a601          	ld	a,#1
 370  0058 cd0000        	call	_TIM1_CtrlPWMOutputs
 372                     ; 95 }
 375  005b 81            	ret
 409                     ; 97 void Delay(uint16_t count) {
 410                     .text:	section	.text,new
 411  0000               _Delay:
 413  0000 89            	pushw	x
 414       00000000      OFST:	set	0
 417  0001               L511:
 418                     ; 98 	while (count--);
 420  0001 1e01          	ldw	x,(OFST+1,sp)
 421  0003 1d0001        	subw	x,#1
 422  0006 1f01          	ldw	(OFST+1,sp),x
 423  0008 1c0001        	addw	x,#1
 424  000b a30000        	cpw	x,#0
 425  000e 26f1          	jrne	L511
 426                     ; 99 }
 429  0010 85            	popw	x
 430  0011 81            	ret
 465                     ; 110 void assert_failed(uint8_t* file, uint32_t line)
 465                     ; 111 { 
 466                     .text:	section	.text,new
 467  0000               _assert_failed:
 471  0000               L731:
 472  0000 20fe          	jra	L731
 485                     	xdef	_main
 486                     	xdef	_Sleep
 487                     	xdef	_Delay
 488                     	xdef	_assert_failed
 489                     	xref	_TIM2_UpdateRequestConfig
 490                     	xref	_TIM2_UpdateDisableConfig
 491                     	xref	_TIM2_ITConfig
 492                     	xref	_TIM2_Cmd
 493                     	xref	_TIM2_TimeBaseInit
 494                     	xref	_TIM2_DeInit
 495                     	xref	_TIM1_CtrlPWMOutputs
 496                     	xref	_TIM1_Cmd
 497                     	xref	_TIM1_OC3Init
 498                     	xref	_TIM1_OC2Init
 499                     	xref	_TIM1_OC1Init
 500                     	xref	_TIM1_TimeBaseInit
 501                     	xref	_TIM1_DeInit
 502                     	xref	_GPIO_WriteLow
 503                     	xref	_GPIO_WriteHigh
 504                     	xref	_GPIO_Init
 523                     	end
