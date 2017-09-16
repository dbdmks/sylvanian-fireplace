   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  49                     ; 12 main()
  49                     ; 13 {
  51                     .text:	section	.text,new
  52  0000               _main:
  56                     ; 14 	CLK_DeInit();
  58  0000 cd0000        	call	_CLK_DeInit
  60                     ; 15   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);	
  62  0003 4f            	clr	a
  63  0004 cd0000        	call	_CLK_HSIPrescalerConfig
  65                     ; 17 	GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_HIZ_SLOW);	
  67  0007 4b90          	push	#144
  68  0009 4b20          	push	#32
  69  000b ae5005        	ldw	x,#20485
  70  000e cd0000        	call	_GPIO_Init
  72  0011 85            	popw	x
  73                     ; 19 	TIM1_pwm_setup();
  75  0012 cd0000        	call	L3_TIM1_pwm_setup
  77                     ; 20 	TIM2_wakeup_setup();
  79  0015 cd0000        	call	L5_TIM2_wakeup_setup
  81  0018               L52:
  83  0018 20fe          	jra	L52
 113                     ; 27 static void TIM2_wakeup_setup(void) {
 114                     .text:	section	.text,new
 115  0000               L5_TIM2_wakeup_setup:
 119                     ; 28 	TIM2_DeInit();
 121  0000 cd0000        	call	_TIM2_DeInit
 123                     ; 29 	TIM2_TimeBaseInit(TIM2_PRESCALER_2048, 235); //~30ms
 125  0003 ae00eb        	ldw	x,#235
 126  0006 89            	pushw	x
 127  0007 a60b          	ld	a,#11
 128  0009 cd0000        	call	_TIM2_TimeBaseInit
 130  000c 85            	popw	x
 131                     ; 30 	TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL);
 133  000d 4f            	clr	a
 134  000e cd0000        	call	_TIM2_UpdateRequestConfig
 136                     ; 31 	TIM2_UpdateDisableConfig(DISABLE);
 138  0011 4f            	clr	a
 139  0012 cd0000        	call	_TIM2_UpdateDisableConfig
 141                     ; 32 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 143  0015 ae0101        	ldw	x,#257
 144  0018 cd0000        	call	_TIM2_ITConfig
 146                     ; 33 	enableInterrupts();
 149  001b 9a            rim
 151                     ; 34 	TIM2_Cmd(ENABLE);
 154  001c a601          	ld	a,#1
 155  001e cd0000        	call	_TIM2_Cmd
 157                     ; 35 }
 160  0021 81            	ret
 190                     ; 38 static void TIM1_pwm_setup(void) {
 191                     .text:	section	.text,new
 192  0000               L3_TIM1_pwm_setup:
 196                     ; 39 	TIM1_DeInit();
 198  0000 cd0000        	call	_TIM1_DeInit
 200                     ; 40 	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 99, 0);
 202  0003 4b00          	push	#0
 203  0005 ae0063        	ldw	x,#99
 204  0008 89            	pushw	x
 205  0009 4b00          	push	#0
 206  000b 5f            	clrw	x
 207  000c cd0000        	call	_TIM1_TimeBaseInit
 209  000f 5b04          	addw	sp,#4
 210                     ; 41 	TIM1_OC1Init(TIM1_OCMODE_PWM2, 
 210                     ; 42 							 TIM1_OUTPUTSTATE_ENABLE, 
 210                     ; 43 							 TIM1_OUTPUTNSTATE_DISABLE,
 210                     ; 44 							 100,
 210                     ; 45 							 TIM1_OCPOLARITY_HIGH,
 210                     ; 46 							 TIM1_OCNPOLARITY_LOW,
 210                     ; 47 							 TIM1_OCIDLESTATE_RESET,
 210                     ; 48 							 TIM1_OCNIDLESTATE_RESET);
 212  0011 4b00          	push	#0
 213  0013 4b00          	push	#0
 214  0015 4b88          	push	#136
 215  0017 4b00          	push	#0
 216  0019 ae0064        	ldw	x,#100
 217  001c 89            	pushw	x
 218  001d 4b00          	push	#0
 219  001f ae7011        	ldw	x,#28689
 220  0022 cd0000        	call	_TIM1_OC1Init
 222  0025 5b07          	addw	sp,#7
 223                     ; 50 	TIM1_OC2Init(TIM1_OCMODE_PWM2, 
 223                     ; 51 							 TIM1_OUTPUTSTATE_ENABLE, 
 223                     ; 52 							 TIM1_OUTPUTNSTATE_DISABLE,
 223                     ; 53 							 100,
 223                     ; 54 							 TIM1_OCPOLARITY_HIGH,
 223                     ; 55 							 TIM1_OCNPOLARITY_LOW,
 223                     ; 56 							 TIM1_OCIDLESTATE_RESET,
 223                     ; 57 							 TIM1_OCNIDLESTATE_RESET);
 225  0027 4b00          	push	#0
 226  0029 4b00          	push	#0
 227  002b 4b88          	push	#136
 228  002d 4b00          	push	#0
 229  002f ae0064        	ldw	x,#100
 230  0032 89            	pushw	x
 231  0033 4b00          	push	#0
 232  0035 ae7011        	ldw	x,#28689
 233  0038 cd0000        	call	_TIM1_OC2Init
 235  003b 5b07          	addw	sp,#7
 236                     ; 59 	TIM1_OC3Init(TIM1_OCMODE_PWM2, 
 236                     ; 60 							 TIM1_OUTPUTSTATE_ENABLE, 
 236                     ; 61 							 TIM1_OUTPUTNSTATE_DISABLE,
 236                     ; 62 							 100,
 236                     ; 63 							 TIM1_OCPOLARITY_HIGH,
 236                     ; 64 							 TIM1_OCNPOLARITY_LOW,
 236                     ; 65 							 TIM1_OCIDLESTATE_RESET,
 236                     ; 66 							 TIM1_OCNIDLESTATE_RESET);
 238  003d 4b00          	push	#0
 239  003f 4b00          	push	#0
 240  0041 4b88          	push	#136
 241  0043 4b00          	push	#0
 242  0045 ae0064        	ldw	x,#100
 243  0048 89            	pushw	x
 244  0049 4b00          	push	#0
 245  004b ae7011        	ldw	x,#28689
 246  004e cd0000        	call	_TIM1_OC3Init
 248  0051 5b07          	addw	sp,#7
 249                     ; 67 	TIM1_Cmd(ENABLE);
 251  0053 a601          	ld	a,#1
 252  0055 cd0000        	call	_TIM1_Cmd
 254                     ; 68 	TIM1_CtrlPWMOutputs(ENABLE);
 256  0058 a601          	ld	a,#1
 257  005a cd0000        	call	_TIM1_CtrlPWMOutputs
 259                     ; 71 }
 262  005d 81            	ret
 296                     ; 73 void Delay(uint16_t count) {
 297                     .text:	section	.text,new
 298  0000               _Delay:
 300  0000 89            	pushw	x
 301       00000000      OFST:	set	0
 304  0001               L17:
 305                     ; 74 	while (count--);
 307  0001 1e01          	ldw	x,(OFST+1,sp)
 308  0003 1d0001        	subw	x,#1
 309  0006 1f01          	ldw	(OFST+1,sp),x
 310  0008 1c0001        	addw	x,#1
 311  000b a30000        	cpw	x,#0
 312  000e 26f1          	jrne	L17
 313                     ; 75 }
 316  0010 85            	popw	x
 317  0011 81            	ret
 352                     ; 86 void assert_failed(uint8_t* file, uint32_t line)
 352                     ; 87 { 
 353                     .text:	section	.text,new
 354  0000               _assert_failed:
 358  0000               L311:
 359  0000 20fe          	jra	L311
 372                     	xdef	_main
 373                     	xdef	_Delay
 374                     	xdef	_assert_failed
 375                     	xref	_TIM2_UpdateRequestConfig
 376                     	xref	_TIM2_UpdateDisableConfig
 377                     	xref	_TIM2_ITConfig
 378                     	xref	_TIM2_Cmd
 379                     	xref	_TIM2_TimeBaseInit
 380                     	xref	_TIM2_DeInit
 381                     	xref	_TIM1_CtrlPWMOutputs
 382                     	xref	_TIM1_Cmd
 383                     	xref	_TIM1_OC3Init
 384                     	xref	_TIM1_OC2Init
 385                     	xref	_TIM1_OC1Init
 386                     	xref	_TIM1_TimeBaseInit
 387                     	xref	_TIM1_DeInit
 388                     	xref	_GPIO_Init
 389                     	xref	_CLK_HSIPrescalerConfig
 390                     	xref	_CLK_DeInit
 409                     	end
