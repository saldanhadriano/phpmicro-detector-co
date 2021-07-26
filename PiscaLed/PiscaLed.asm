_main:
;PiscaLed.c,51 :: 		void main(){
;PiscaLed.c,53 :: 		GPIO_Config(&GPIOE_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4,_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);
MOVS	R2, #130
MOVS	R1, #24
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Config+0
;PiscaLed.c,56 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6 | _GPIO_PINMASK_7 | _GPIO_PINMASK_8 | _GPIO_PINMASK_9 ,_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);
MOVS	R2, #130
MOVW	R1, #960
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;PiscaLed.c,57 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11,_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #258
MOVW	R1, #3072
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;PiscaLed.c,61 :: 		GPIO_Digital_Output(&GPIOB_ODR, _GPIO_PINMASK_0 |_GPIO_PINMASK_1);
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
BL	_GPIO_Digital_Output+0
;PiscaLed.c,64 :: 		GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_7|_GPIO_PINMASK_8|_GPIO_PINMASK_9|_GPIO_PINMASK_10|_GPIO_PINMASK_11|_GPIO_PINMASK_12|_GPIO_PINMASK_13|_GPIO_PINMASK_14);
MOVW	R1, #32640
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;PiscaLed.c,67 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_13|_GPIO_PINMASK_14);
MOVW	R1, #24576
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;PiscaLed.c,70 :: 		GPIO_Digital_Input(&GPIOD_IDR, _GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;PiscaLed.c,73 :: 		GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;PiscaLed.c,76 :: 		GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Analog_Input+0
;PiscaLed.c,78 :: 		Lcd_Init();
BL	_Lcd_Init+0
;PiscaLed.c,79 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;PiscaLed.c,80 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;PiscaLed.c,82 :: 		ADC1_Init();
BL	_ADC1_Init+0
;PiscaLed.c,83 :: 		Lcd_Out(1,1,"Status:");
MOVW	R0, #lo_addr(?lstr1_PiscaLed+0)
MOVT	R0, #hi_addr(?lstr1_PiscaLed+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;PiscaLed.c,84 :: 		Lcd_Out(2,14,"ppm");
MOVW	R0, #lo_addr(?lstr2_PiscaLed+0)
MOVT	R0, #hi_addr(?lstr2_PiscaLed+0)
MOV	R2, R0
MOVS	R1, #14
MOVS	R0, #2
BL	_Lcd_Out+0
;PiscaLed.c,86 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_4);
MOVW	R0, #16
BL	_ADC_Set_Input_Channel+0
;PiscaLed.c,88 :: 		for(i=0;i<=20;i++)          //média da leitura
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main0:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #20
IT	GT
BGT	L_main1
;PiscaLed.c,90 :: 		analogico();
BL	_analogico+0
;PiscaLed.c,88 :: 		for(i=0;i<=20;i++)          //média da leitura
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;PiscaLed.c,91 :: 		}
IT	AL
BAL	L_main0
L_main1:
;PiscaLed.c,93 :: 		while(1)
L_main3:
;PiscaLed.c,99 :: 		analogico();
BL	_analogico+0
;PiscaLed.c,140 :: 		}
IT	AL
BAL	L_main3
;PiscaLed.c,141 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_analogico:
;PiscaLed.c,143 :: 		void analogico(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PiscaLed.c,144 :: 		valor = adc1_read(4);
MOVS	R0, #4
BL	_ADC1_Read+0
MOVW	R1, #lo_addr(_valor+0)
MOVT	R1, #hi_addr(_valor+0)
STRH	R0, [R1, #0]
;PiscaLed.c,145 :: 		media = media + valor;
SXTH	R2, R0
MOVW	R1, #lo_addr(_media+0)
MOVT	R1, #hi_addr(_media+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, R2
STRH	R0, [R1, #0]
;PiscaLed.c,146 :: 		contador2 ++;
MOVW	R1, #lo_addr(_contador2+0)
MOVT	R1, #hi_addr(_contador2+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;PiscaLed.c,147 :: 		if (contador2 == 15)
CMP	R0, #15
IT	NE
BNE	L_analogico5
;PiscaLed.c,149 :: 		tensao = media / contador2;
MOVW	R4, #lo_addr(_contador2+0)
MOVT	R4, #hi_addr(_contador2+0)
LDRSH	R2, [R4, #0]
MOVW	R1, #lo_addr(_media+0)
MOVT	R1, #hi_addr(_media+0)
LDRSH	R0, [R1, #0]
SDIV	R3, R0, R2
SXTH	R3, R3
MOVW	R2, #lo_addr(_tensao+0)
MOVT	R2, #hi_addr(_tensao+0)
STRH	R3, [R2, #0]
;PiscaLed.c,150 :: 		contador2 = 0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [R4, #0]
;PiscaLed.c,151 :: 		media = 0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [R1, #0]
;PiscaLed.c,152 :: 		tensao = tensao - (tensao * 100 /515); //ajusta volt ;
MOVS	R0, #100
SXTH	R0, R0
MUL	R1, R3, R0
SXTH	R1, R1
MOVW	R0, #515
SXTH	R0, R0
SDIV	R0, R1, R0
SXTH	R0, R0
SUB	R0, R3, R0
STRH	R0, [R2, #0]
;PiscaLed.c,153 :: 		tensao = ((valor * 3.3 / 4096) /0.01);
MOVW	R0, #lo_addr(_valor+0)
MOVT	R0, #hi_addr(_valor+0)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #13107
MOVT	R0, #16467
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOV	R0, #1166016512
VMOV	S0, R0
VDIV.F32	S1, S1, S0
MOVW	R0, #55050
MOVT	R0, #15395
VMOV	S0, R0
VDIV.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
STRH	R0, [R2, #0]
;PiscaLed.c,154 :: 		inttostr (tensao, txt2);
MOVW	R1, #lo_addr(_txt2+0)
MOVT	R1, #hi_addr(_txt2+0)
BL	_IntToStr+0
;PiscaLed.c,155 :: 		if(tensao < 100 && tensao >= 10)
MOVW	R0, #lo_addr(_tensao+0)
MOVT	R0, #hi_addr(_tensao+0)
LDRSH	R0, [R0, #0]
CMP	R0, #100
IT	GE
BGE	L__analogico14
MOVW	R0, #lo_addr(_tensao+0)
MOVT	R0, #hi_addr(_tensao+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	LT
BLT	L__analogico13
L__analogico12:
;PiscaLed.c,157 :: 		Lcd_Out(2,11," ");
MOVW	R0, #lo_addr(?lstr3_PiscaLed+0)
MOVT	R0, #hi_addr(?lstr3_PiscaLed+0)
MOV	R2, R0
MOVS	R1, #11
MOVS	R0, #2
BL	_Lcd_Out+0
;PiscaLed.c,158 :: 		Lcd_Out(2,12,Ltrim(txt2));
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_Ltrim+0
MOV	R2, R0
MOVS	R1, #12
MOVS	R0, #2
BL	_Lcd_Out+0
;PiscaLed.c,159 :: 		}
IT	AL
BAL	L_analogico9
;PiscaLed.c,155 :: 		if(tensao < 100 && tensao >= 10)
L__analogico14:
L__analogico13:
;PiscaLed.c,160 :: 		else if(tensao < 10)
MOVW	R0, #lo_addr(_tensao+0)
MOVT	R0, #hi_addr(_tensao+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L_analogico10
;PiscaLed.c,162 :: 		Lcd_Out(2,12," ");
MOVW	R0, #lo_addr(?lstr4_PiscaLed+0)
MOVT	R0, #hi_addr(?lstr4_PiscaLed+0)
MOV	R2, R0
MOVS	R1, #12
MOVS	R0, #2
BL	_Lcd_Out+0
;PiscaLed.c,163 :: 		Lcd_Out(2,13,Ltrim(txt2));
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_Ltrim+0
MOV	R2, R0
MOVS	R1, #13
MOVS	R0, #2
BL	_Lcd_Out+0
;PiscaLed.c,164 :: 		}
IT	AL
BAL	L_analogico11
L_analogico10:
;PiscaLed.c,167 :: 		Lcd_Out(2,11,Ltrim(txt2));
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_Ltrim+0
MOV	R2, R0
MOVS	R1, #11
MOVS	R0, #2
BL	_Lcd_Out+0
;PiscaLed.c,168 :: 		}
L_analogico11:
L_analogico9:
;PiscaLed.c,169 :: 		}
L_analogico5:
;PiscaLed.c,170 :: 		}
L_end_analogico:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _analogico
