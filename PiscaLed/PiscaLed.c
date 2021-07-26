//hardware
//ARM    PIC       STLINK
// -      VDD   ->   5V
// -      GND   ->   GND
//  1      -    ->   3v3
//  7      -    ->   SWDIO
//  8      -    ->   GND
//  9      -    ->   SWCLK

//PA1  -> RA1
//PE15 -> RD6
//PE14 -> RD5
//PE13 -> RD4
//PE12 -> RD3
//PE11 -> RD2
//PE10 -> RD1
//PE9  -> RD0
//PE8  -> RC5
//PE7  -> RC4
//PB1  -> RE2
//PB0  -> RA3
//PC6  -> RB2
//PC7  -> RB1
//PC8  -> RB0
//PC9  -> RB3
//PC10 -> RA4
//PC11 -> RA5
//PD2  -> RE1
//PD3  -> RE0
//PD4  -> RB4
//PD5  -> RB5
//PD6  -> RB6
//PD7  -> RB7
//--------------

// set LCD
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
    //btn k0 e k1       PINO E
    GPIO_Config(&GPIOE_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4,_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);
    
    //btn rb0,1,2,3 ra4,5
    GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6 | _GPIO_PINMASK_7 | _GPIO_PINMASK_8 | _GPIO_PINMASK_9 ,_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);
    GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11,_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
    //gpio_config(&gpioa_base, _gpio_pinmask_4 ,_gpio_cfg_mode_input);
    
    //displays led
    GPIO_Digital_Output(&GPIOB_ODR, _GPIO_PINMASK_0 |_GPIO_PINMASK_1);

    // Pino E
    GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_7|_GPIO_PINMASK_8|_GPIO_PINMASK_9|_GPIO_PINMASK_10|_GPIO_PINMASK_11|_GPIO_PINMASK_12|_GPIO_PINMASK_13|_GPIO_PINMASK_14);

    // Pino D Saida
    GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_13|_GPIO_PINMASK_14);
    
    // Pino D Entrada
    GPIO_Digital_Input(&GPIOD_IDR, _GPIO_PINMASK_15);
    
    // Pino C Saída
    GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_2);
    
    // Pino A Entrada
    GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_4);

    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);
    
    ADC1_Init();
    Lcd_Out(1,1,"Status:");
    Lcd_Out(2,14,"ppm");
    
    ADC_Set_Input_Channel(_ADC_CHANNEL_4);
    
    for(i=0;i<=20;i++)          //média da leitura
        {
            analogico();
        }
    
    while(1)
    {

       /*limiar = valor;
       IntToStr(valor, txt2);*/
       
       analogico();
       
       /*if(valor < 1000)
        {
            Lcd_Out(2,10," ");
            Lcd_Out(2,11,Ltrim(txt2));
        }
        else
        {
            Lcd_Out(2,10,Ltrim(txt2));
        }

       if(limiar >= 1450){
             Lcd_Out(1,8,"PERIGO!");
             if(GPIOD_IDR.B15 = 1){
                  GPIOD_ODR.B14 = 1;
                  GPIOC_ODR.B2 = 1;
             }
        }
        else{
             Lcd_Out(1,8,"SEGURO!");
             if(GPIOD_IDR.B15 = 0){
                   GPIOD_ODR.B14 = 0;
                   GPIOC_ODR.B2 = 0;
             }
        }*/
        
       /*if(gpioe_idr.b3 == 0)       //k1
        {
            gpiod_odr.B14 = 1;
        }
        else{
            gpiod_odr.B14 = 0;
        }
        if(gpioe_idr.b4 == 0)       //k1
        {
            gpioc_odr.B2 = 1;
        }
        else{
            gpioc_odr.B2 = 0;
        }*/
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
          tensao = tensao - (tensao * 100 /515); //ajusta volt ;
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