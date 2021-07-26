#line 1 "C:/Users/saldanhaz/Desktop/Embarcados/TesteMikroC/PiscaLed/PiscaLed.c"
#line 37 "C:/Users/saldanhaz/Desktop/Embarcados/TesteMikroC/PiscaLed/PiscaLed.c"
sbit LCD_RS at GPIOD_ODR.B2;
sbit LCD_EN at GPIOD_ODR.B3;
sbit LCD_D4 at GPIOD_ODR.B4 ;
sbit LCD_D5 at GPIOD_ODR.B5 ;
sbit LCD_D6 at GPIOD_ODR.B6 ;
sbit LCD_D7 at GPIOD_ODR.B7 ;

void GPIO_Analog_Input(unsigned long *port, unsigned long pin_mask);

int valor, media, limiar, tensao, contador2, i;
char txt2[7];

void analogico();

void main(){

 GPIO_Config(&GPIOE_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4,_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);


 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6 | _GPIO_PINMASK_7 | _GPIO_PINMASK_8 | _GPIO_PINMASK_9 ,_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);
 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11,_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);



 GPIO_Digital_Output(&GPIOB_ODR, _GPIO_PINMASK_0 |_GPIO_PINMASK_1);


 GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_7|_GPIO_PINMASK_8|_GPIO_PINMASK_9|_GPIO_PINMASK_10|_GPIO_PINMASK_11|_GPIO_PINMASK_12|_GPIO_PINMASK_13|_GPIO_PINMASK_14);


 GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_13|_GPIO_PINMASK_14);


 GPIO_Digital_Input(&GPIOD_IDR, _GPIO_PINMASK_15);


 GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_2);


 GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_4);

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 ADC1_Init();
 Lcd_Out(1,1,"Status:");
 Lcd_Out(2,14,"ppm");

 ADC_Set_Input_Channel(_ADC_CHANNEL_4);

 for(i=0;i<=20;i++)
 {
 analogico();
 }

 while(1)
 {
#line 99 "C:/Users/saldanhaz/Desktop/Embarcados/TesteMikroC/PiscaLed/PiscaLed.c"
 analogico();
#line 140 "C:/Users/saldanhaz/Desktop/Embarcados/TesteMikroC/PiscaLed/PiscaLed.c"
 }
}

void analogico(){
 valor = adc1_read(4);
 media = media + valor;
 contador2 ++;
 if (contador2 == 15)
 {
 tensao = media / contador2;
 contador2 = 0;
 media = 0;
 tensao = tensao - (tensao * 100 /515);
 tensao = ((valor * 3.3 / 4096) /0.01);
 inttostr (tensao, txt2);
 if(tensao < 100 && tensao >= 10)
 {
 Lcd_Out(2,11," ");
 Lcd_Out(2,12,Ltrim(txt2));
 }
 else if(tensao < 10)
 {
 Lcd_Out(2,12," ");
 Lcd_Out(2,13,Ltrim(txt2));
 }
 else
 {
 Lcd_Out(2,11,Ltrim(txt2));
 }
 }
}
