/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include <stm8s.h>

void Delay(uint16_t count);
static void TIM1_pwm_setup(void);
static void TIM2_wakeup_setup(void); //1032/2mhz/64psc = reload in ~33ms

void Sleep(void);
 
main()
{
	CLK_DeInit();
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);

	
	//GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_SLOW);	
	GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_HIZ_SLOW);	
	
	//TIM1_pwm_setup();
	TIM2_wakeup_setup();
	
	while (1) {
		
		uint8_t i = 3;
		
	//	GPIO_WriteLow(GPIOB,GPIO_PIN_5);		
	//	Delay(0xFFFF);		
	//	GPIO_WriteHigh(GPIOB,GPIO_PIN_5);
	//	GPIO_WriteLow(GPIOB,GPIO_PIN_5);		
	//	Delay(0xFFFF);		Delay(0xFFFF);		Delay(0xFFFF);		
	//	GPIO_WriteHigh(GPIOB,GPIO_PIN_5);
		
		wfi();

		while (i) {
			i--;
		}
		
		//Sleep();
		}
}

static void TIM2_wakeup_setup(void) {
	TIM2_DeInit();
	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 1032);
	TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL);
	TIM2_UpdateDisableConfig(DISABLE);
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	enableInterrupts();
	TIM2_Cmd(ENABLE);
}

void Sleep(void) {
	TIM1_CtrlPWMOutputs(DISABLE);
	TIM1_Cmd(DISABLE);		
  halt();
}

static void TIM1_pwm_setup(void) {
	TIM1_DeInit();
	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 99, 0);
	TIM1_OC1Init(TIM1_OCMODE_PWM2, 
							 TIM1_OUTPUTSTATE_ENABLE, 
							 TIM1_OUTPUTNSTATE_DISABLE,
							 0,
							 TIM1_OCPOLARITY_HIGH,
							 TIM1_OCNPOLARITY_LOW,
							 TIM1_OCIDLESTATE_RESET,
							 TIM1_OCNIDLESTATE_RESET);
	
	TIM1_OC2Init(TIM1_OCMODE_PWM2, 
							 TIM1_OUTPUTSTATE_ENABLE, 
							 TIM1_OUTPUTNSTATE_DISABLE,
							 50,
							 TIM1_OCPOLARITY_HIGH,
							 TIM1_OCNPOLARITY_LOW,
							 TIM1_OCIDLESTATE_RESET,
							 TIM1_OCNIDLESTATE_RESET);
							 
	TIM1_OC3Init(TIM1_OCMODE_PWM2, 
							 TIM1_OUTPUTSTATE_ENABLE, 
							 TIM1_OUTPUTNSTATE_DISABLE,
							 100,
							 TIM1_OCPOLARITY_HIGH,
							 TIM1_OCNPOLARITY_LOW,
							 TIM1_OCIDLESTATE_RESET,
							 TIM1_OCNIDLESTATE_RESET);
	TIM1_Cmd(ENABLE);
	TIM1_CtrlPWMOutputs(ENABLE);

	
}

void Delay(uint16_t count) {
	while (count--);
}


#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif