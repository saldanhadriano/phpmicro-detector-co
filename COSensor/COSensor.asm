_main:
;AlcoolSensor.c,26 :: 		void main(){
;AlcoolSensor.c,27 :: 		setup_inicial();
BL	_setup_inicial+0
;AlcoolSensor.c,28 :: 		Lcd_Init();                        // Initialize LCD
BL	_Lcd_Init+0
;AlcoolSensor.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
MOVS	R0, #1
BL	_Lcd_Cmd+0
;AlcoolSensor.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
MOVS	R0, #12
BL	_Lcd_Cmd+0
;AlcoolSensor.c,31 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
MOVS	R0, #128
BL	_Lcd_Cmd+0
;AlcoolSensor.c,32 :: 		while(chave_pa0() == 1) factory_reset();
L_main0:
BL	_chave_pa0+0
CMP	R0, #1
IT	NE
BNE	L_main1
BL	_factory_reset+0
IT	AL
BAL	L_main0
L_main1:
;AlcoolSensor.c,33 :: 		Lcd_Out(1,1," Teste ESP 8266 ");
MOVW	R0, #lo_addr(?lstr1_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr1_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;AlcoolSensor.c,34 :: 		configura_ap();
BL	_configura_ap+0
;AlcoolSensor.c,35 :: 		delay_ms(2000);
MOVW	R7, #49833
MOVT	R7, #162
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
;AlcoolSensor.c,36 :: 		conecta_ap();
BL	_conecta_ap+0
;AlcoolSensor.c,37 :: 		delay_ms(2000);
MOVW	R7, #49833
MOVT	R7, #162
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
;AlcoolSensor.c,38 :: 		while(1){
L_main6:
;AlcoolSensor.c,42 :: 		resultado_conexao = verifica_conexao();
BL	_verifica_conexao+0
MOVW	R1, #lo_addr(_resultado_conexao+0)
MOVT	R1, #hi_addr(_resultado_conexao+0)
STRB	R0, [R1, #0]
;AlcoolSensor.c,43 :: 		if((resultado_conexao == 2) || (resultado_conexao == 4)){
CMP	R0, #2
IT	EQ
BEQ	L__main93
MOVW	R0, #lo_addr(_resultado_conexao+0)
MOVT	R0, #hi_addr(_resultado_conexao+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L__main92
IT	AL
BAL	L_main10
L__main93:
L__main92:
;AlcoolSensor.c,45 :: 		resultado_web = verifica_web();
BL	_verifica_web+0
MOVW	R1, #lo_addr(_resultado_web+0)
MOVT	R1, #hi_addr(_resultado_web+0)
STRB	R0, [R1, #0]
;AlcoolSensor.c,46 :: 		if((resultado_web ==  2)||(resultado_web == 3)){
CMP	R0, #2
IT	EQ
BEQ	L__main95
MOVW	R0, #lo_addr(_resultado_web+0)
MOVT	R0, #hi_addr(_resultado_web+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L__main94
IT	AL
BAL	L_main13
L__main95:
L__main94:
;AlcoolSensor.c,49 :: 		resultado_tamanho = envia_tamanho();
BL	_envia_tamanho+0
MOVW	R1, #lo_addr(_resultado_tamanho+0)
MOVT	R1, #hi_addr(_resultado_tamanho+0)
STRB	R0, [R1, #0]
;AlcoolSensor.c,50 :: 		if(resultado_tamanho == 1){
CMP	R0, #1
IT	NE
BNE	L_main14
;AlcoolSensor.c,52 :: 		resultado_mensagem = envia_dados();
BL	_envia_dados+0
MOVW	R1, #lo_addr(_resultado_mensagem+0)
MOVT	R1, #hi_addr(_resultado_mensagem+0)
STRB	R0, [R1, #0]
;AlcoolSensor.c,53 :: 		if(resultado_mensagem == 1){
CMP	R0, #1
IT	NE
BNE	L_main15
;AlcoolSensor.c,54 :: 		Lcd_Out(1,1,output);
MOVW	R2, #lo_addr(_output+0)
MOVT	R2, #hi_addr(_output+0)
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;AlcoolSensor.c,56 :: 		}
L_main15:
;AlcoolSensor.c,57 :: 		}
L_main14:
;AlcoolSensor.c,58 :: 		}
L_main13:
;AlcoolSensor.c,59 :: 		}else
IT	AL
BAL	L_main16
L_main10:
;AlcoolSensor.c,60 :: 		if(resultado_conexao == 3){//ja esta conectado
MOVW	R0, #lo_addr(_resultado_conexao+0)
MOVT	R0, #hi_addr(_resultado_conexao+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_main17
;AlcoolSensor.c,62 :: 		resultado_tamanho = envia_tamanho();
BL	_envia_tamanho+0
MOVW	R1, #lo_addr(_resultado_tamanho+0)
MOVT	R1, #hi_addr(_resultado_tamanho+0)
STRB	R0, [R1, #0]
;AlcoolSensor.c,63 :: 		if(resultado_tamanho == 1){
CMP	R0, #1
IT	NE
BNE	L_main18
;AlcoolSensor.c,65 :: 		resultado_mensagem = envia_dados();
BL	_envia_dados+0
MOVW	R1, #lo_addr(_resultado_mensagem+0)
MOVT	R1, #hi_addr(_resultado_mensagem+0)
STRB	R0, [R1, #0]
;AlcoolSensor.c,66 :: 		if(resultado_mensagem == 1){
CMP	R0, #1
IT	NE
BNE	L_main19
;AlcoolSensor.c,67 :: 		Lcd_Out(1,1,output);
MOVW	R2, #lo_addr(_output+0)
MOVT	R2, #hi_addr(_output+0)
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;AlcoolSensor.c,69 :: 		}
L_main19:
;AlcoolSensor.c,70 :: 		}
L_main18:
;AlcoolSensor.c,71 :: 		}else lcd_out(1,1," Sem conexao AP ");
IT	AL
BAL	L_main20
L_main17:
MOVW	R0, #lo_addr(?lstr2_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr2_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
L_main20:
L_main16:
;AlcoolSensor.c,73 :: 		}
IT	AL
BAL	L_main6
;AlcoolSensor.c,74 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_verifica_conexao:
;AlcoolSensor.c,76 :: 		char verifica_conexao(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;AlcoolSensor.c,77 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,78 :: 		lcd_out(1,1,"Testa Conexao...");
MOVW	R0, #lo_addr(?lstr3_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr3_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;AlcoolSensor.c,79 :: 		lcd_out(2,1,"AT+CIPSTATUS    ");
MOVW	R0, #lo_addr(?lstr4_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr4_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,80 :: 		output[0] = '\0';//inicia a string com null
MOVS	R1, #0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,81 :: 		indice_output = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
;AlcoolSensor.c,82 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,83 :: 		UART2_Write_Text("AT+CIPSTATUS\r\n");//envia o comando
MOVW	R0, #lo_addr(?lstr5_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr5_AlcoolSensor+0)
BL	_UART2_Write_Text+0
;AlcoolSensor.c,84 :: 		while(segundo < 1){
L_verifica_conexao21:
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	CS
BCS	L_verifica_conexao22
;AlcoolSensor.c,86 :: 		if(UART2_Data_Ready()==1){
BL	_UART2_Data_Ready+0
CMP	R0, #1
IT	NE
BNE	L_verifica_conexao23
;AlcoolSensor.c,87 :: 		output[indice_output] = UART2_Read();
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STR	R0, [SP, #8]
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
BL	_UART2_Read+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;AlcoolSensor.c,88 :: 		indice_output ++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;AlcoolSensor.c,89 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,90 :: 		}
L_verifica_conexao23:
;AlcoolSensor.c,91 :: 		}
IT	AL
BAL	L_verifica_conexao21
L_verifica_conexao22:
;AlcoolSensor.c,92 :: 		if(indice_output >= 510) indice_output = 510;
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R0, [R0, #0]
CMP	R0, #510
IT	LT
BLT	L_verifica_conexao24
MOVW	R1, #510
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
L_verifica_conexao24:
;AlcoolSensor.c,93 :: 		output[indice_output] = '\0';//finaliza string com null
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;AlcoolSensor.c,94 :: 		if(strstr(output,"STATUS:2")){
MOVW	R0, #lo_addr(?lstr6_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr6_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_conexao25
;AlcoolSensor.c,96 :: 		saida = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,97 :: 		}else
IT	AL
BAL	L_verifica_conexao26
L_verifica_conexao25:
;AlcoolSensor.c,98 :: 		if(strstr(output,"STATUS:3")){
MOVW	R0, #lo_addr(?lstr7_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr7_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_conexao27
;AlcoolSensor.c,100 :: 		saida = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,101 :: 		}else
IT	AL
BAL	L_verifica_conexao28
L_verifica_conexao27:
;AlcoolSensor.c,102 :: 		if(strstr(output,"STATUS:4")){
MOVW	R0, #lo_addr(?lstr8_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr8_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_conexao29
;AlcoolSensor.c,104 :: 		saida = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,105 :: 		lcd_out(2,1,"Desconectado  ");
MOVW	R0, #lo_addr(?lstr9_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr9_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,106 :: 		}else
IT	AL
BAL	L_verifica_conexao30
L_verifica_conexao29:
;AlcoolSensor.c,107 :: 		if(strstr(output,"STATUS:5")){
MOVW	R0, #lo_addr(?lstr10_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr10_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_conexao31
;AlcoolSensor.c,109 :: 		saida = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,110 :: 		}else
IT	AL
BAL	L_verifica_conexao32
L_verifica_conexao31:
;AlcoolSensor.c,111 :: 		if(strstr(output,"busy")){
MOVW	R0, #lo_addr(?lstr11_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr11_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_conexao33
;AlcoolSensor.c,113 :: 		saida = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,114 :: 		}
L_verifica_conexao33:
L_verifica_conexao32:
L_verifica_conexao30:
L_verifica_conexao28:
L_verifica_conexao26:
;AlcoolSensor.c,115 :: 		return(saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;AlcoolSensor.c,116 :: 		}
L_end_verifica_conexao:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _verifica_conexao
_verifica_web:
;AlcoolSensor.c,118 :: 		char verifica_web(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;AlcoolSensor.c,119 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,120 :: 		lcd_out(1,1,"Verifica WEB ...");
MOVW	R0, #lo_addr(?lstr12_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr12_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;AlcoolSensor.c,121 :: 		lcd_out(2,1,"AT+CIPSTART=\"TCP");
MOVW	R0, #lo_addr(?lstr13_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr13_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,122 :: 		output[0] = '\0';//inicia a string com null
MOVS	R1, #0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,123 :: 		indice_output = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
;AlcoolSensor.c,124 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,125 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"192.168.43.118\",8080\r\n");
MOVW	R0, #lo_addr(?lstr14_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr14_AlcoolSensor+0)
BL	_UART2_Write_Text+0
;AlcoolSensor.c,127 :: 		while(segundo < 2){
L_verifica_web34:
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	CS
BCS	L_verifica_web35
;AlcoolSensor.c,129 :: 		if(UART2_Data_Ready()){
BL	_UART2_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_web36
;AlcoolSensor.c,130 :: 		output[indice_output] = UART2_Read();
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STR	R0, [SP, #8]
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
BL	_UART2_Read+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;AlcoolSensor.c,131 :: 		indice_output ++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;AlcoolSensor.c,132 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,133 :: 		}
L_verifica_web36:
;AlcoolSensor.c,134 :: 		}
IT	AL
BAL	L_verifica_web34
L_verifica_web35:
;AlcoolSensor.c,135 :: 		if(indice_output >= 510) indice_output = 510;
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R0, [R0, #0]
CMP	R0, #510
IT	LT
BLT	L_verifica_web37
MOVW	R1, #510
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
L_verifica_web37:
;AlcoolSensor.c,136 :: 		output[indice_output] = '\0';//finaliza string com null
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;AlcoolSensor.c,137 :: 		if(strstr(output,"CONNECT")){
MOVW	R0, #lo_addr(?lstr15_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr15_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_web38
;AlcoolSensor.c,139 :: 		saida = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,140 :: 		lcd_out(2,1,"CONNECT         ");
MOVW	R0, #lo_addr(?lstr16_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr16_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,141 :: 		}else
IT	AL
BAL	L_verifica_web39
L_verifica_web38:
;AlcoolSensor.c,142 :: 		if(strstr(output,"ALREADY")){
MOVW	R0, #lo_addr(?lstr17_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr17_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_web40
;AlcoolSensor.c,144 :: 		saida = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,145 :: 		lcd_out(2,1,"ALREADY         ");
MOVW	R0, #lo_addr(?lstr18_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr18_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,146 :: 		}else
IT	AL
BAL	L_verifica_web41
L_verifica_web40:
;AlcoolSensor.c,147 :: 		if(strstr(output,"CLOSED")){
MOVW	R0, #lo_addr(?lstr19_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr19_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_web42
;AlcoolSensor.c,149 :: 		saida = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,150 :: 		lcd_out(2,1,"CLOSED          ");
MOVW	R0, #lo_addr(?lstr20_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr20_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,151 :: 		}
L_verifica_web42:
L_verifica_web41:
L_verifica_web39:
;AlcoolSensor.c,152 :: 		return(saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;AlcoolSensor.c,153 :: 		}
L_end_verifica_web:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _verifica_web
_envia_dados:
;AlcoolSensor.c,155 :: 		char envia_dados(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;AlcoolSensor.c,156 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,157 :: 		valor = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_valor+0)
MOVT	R0, #hi_addr(_valor+0)
STRH	R1, [R0, #0]
;AlcoolSensor.c,158 :: 		lcd_out(1,1,"Envia   Dados");
MOVW	R0, #lo_addr(?lstr21_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr21_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;AlcoolSensor.c,159 :: 		lcd_out(2,1,"POST ");
MOVW	R0, #lo_addr(?lstr22_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr22_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,160 :: 		output[0] = '\0';//inicia a string com null
MOVS	R1, #0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,161 :: 		indice_output = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
;AlcoolSensor.c,162 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,164 :: 		for(i=0;i<=20;i++)          //média da leitura
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_envia_dados43:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #20
IT	GT
BGT	L_envia_dados44
;AlcoolSensor.c,166 :: 		analogico();
BL	_analogico+0
;AlcoolSensor.c,164 :: 		for(i=0;i<=20;i++)          //média da leitura
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;AlcoolSensor.c,167 :: 		}
IT	AL
BAL	L_envia_dados43
L_envia_dados44:
;AlcoolSensor.c,173 :: 		strcpy(txt1, "POST /workspace/Projeto/sensor/ {\"id\":0,\"valor\":999} HTTP/1.1\r\nHost: 192.168.43.118\r\n\r\n");
MOVW	R0, #lo_addr(?lstr23_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr23_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_strcpy+0
;AlcoolSensor.c,178 :: 		UART2_Write_Text(txt1);
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_UART2_Write_Text+0
;AlcoolSensor.c,182 :: 		while(segundo < 3){
L_envia_dados46:
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	CS
BCS	L_envia_dados47
;AlcoolSensor.c,183 :: 		if(UART2_Data_Ready()){
BL	_UART2_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_envia_dados48
;AlcoolSensor.c,184 :: 		output[indice_output] = UART2_Read();
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STR	R0, [SP, #8]
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
BL	_UART2_Read+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;AlcoolSensor.c,185 :: 		indice_output ++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;AlcoolSensor.c,186 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,187 :: 		}
L_envia_dados48:
;AlcoolSensor.c,188 :: 		}
IT	AL
BAL	L_envia_dados46
L_envia_dados47:
;AlcoolSensor.c,189 :: 		if(indice_output >= 510) indice_output = 510;
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R0, [R0, #0]
CMP	R0, #510
IT	LT
BLT	L_envia_dados49
MOVW	R1, #510
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
L_envia_dados49:
;AlcoolSensor.c,190 :: 		output[indice_output] = '\0';//finaliza string com null
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;AlcoolSensor.c,191 :: 		if(strstr(output,"SEND OK")){
MOVW	R0, #lo_addr(?lstr24_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr24_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_envia_dados50
;AlcoolSensor.c,192 :: 		saida = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,193 :: 		lcd_out(2,1,"HTTP/1.1 200 OK ");
MOVW	R0, #lo_addr(?lstr25_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr25_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,194 :: 		}
L_envia_dados50:
;AlcoolSensor.c,195 :: 		return(saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;AlcoolSensor.c,196 :: 		}
L_end_envia_dados:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _envia_dados
_envia_tamanho:
;AlcoolSensor.c,198 :: 		char envia_tamanho(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;AlcoolSensor.c,199 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,200 :: 		lcd_out(1,1,"Envia tamanho...");
MOVW	R0, #lo_addr(?lstr26_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr26_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;AlcoolSensor.c,201 :: 		lcd_out(2,1,"AT+CIPSEND=87   ");
MOVW	R0, #lo_addr(?lstr27_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr27_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,202 :: 		output[0] = '\0';//inicia a string com null
MOVS	R1, #0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,203 :: 		UART2_Write_Text("AT+CIPSEND=87\r\n");
MOVW	R0, #lo_addr(?lstr28_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr28_AlcoolSensor+0)
BL	_UART2_Write_Text+0
;AlcoolSensor.c,204 :: 		indice_output = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
;AlcoolSensor.c,205 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,206 :: 		while(segundo < 1){
L_envia_tamanho51:
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	CS
BCS	L_envia_tamanho52
;AlcoolSensor.c,207 :: 		if(UART2_Data_Ready()){
BL	_UART2_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_envia_tamanho53
;AlcoolSensor.c,208 :: 		output[indice_output] = UART2_Read();
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STR	R0, [SP, #8]
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
BL	_UART2_Read+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;AlcoolSensor.c,209 :: 		indice_output ++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;AlcoolSensor.c,210 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,211 :: 		}
L_envia_tamanho53:
;AlcoolSensor.c,212 :: 		}
IT	AL
BAL	L_envia_tamanho51
L_envia_tamanho52:
;AlcoolSensor.c,213 :: 		if(indice_output >= 510) indice_output = 510;
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R0, [R0, #0]
CMP	R0, #510
IT	LT
BLT	L_envia_tamanho54
MOVW	R1, #510
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
L_envia_tamanho54:
;AlcoolSensor.c,214 :: 		output[indice_output] = '\0';//finaliza string ocm null
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;AlcoolSensor.c,215 :: 		if(strstr(output,"OK\r\n>")){
MOVW	R0, #lo_addr(?lstr29_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr29_AlcoolSensor+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_envia_tamanho55
;AlcoolSensor.c,216 :: 		saida = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,217 :: 		lcd_out(2,1,"OK >            ");
MOVW	R0, #lo_addr(?lstr30_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr30_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,218 :: 		}
L_envia_tamanho55:
;AlcoolSensor.c,219 :: 		return(saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;AlcoolSensor.c,220 :: 		}
L_end_envia_tamanho:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _envia_tamanho
_chave_pa0:
;AlcoolSensor.c,222 :: 		char chave_pa0(){
;AlcoolSensor.c,223 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,224 :: 		if(gpioa_idr.b0 == 1){//verifica se o bit PA0 foi acionado
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_chave_pa056
;AlcoolSensor.c,225 :: 		while(gpioa_idr.b0 == 1) delay_ms(100);
L_chave_pa057:
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_chave_pa058
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_chave_pa059:
SUBS	R7, R7, #1
BNE	L_chave_pa059
NOP
NOP
NOP
NOP
IT	AL
BAL	L_chave_pa057
L_chave_pa058:
;AlcoolSensor.c,226 :: 		saida = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,227 :: 		}
L_chave_pa056:
;AlcoolSensor.c,228 :: 		return (saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;AlcoolSensor.c,229 :: 		}
L_end_chave_pa0:
BX	LR
; end of _chave_pa0
_chave_pe3:
;AlcoolSensor.c,231 :: 		char chave_pe3(){
;AlcoolSensor.c,232 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,233 :: 		if(gpioe_idr.b3 == 0){//Verifica se o bit PE3 foi acionado
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_chave_pe361
;AlcoolSensor.c,234 :: 		while(gpioe_idr.b3 == 0) delay_ms(100);
L_chave_pe362:
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_chave_pe363
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_chave_pe364:
SUBS	R7, R7, #1
BNE	L_chave_pe364
NOP
NOP
NOP
NOP
IT	AL
BAL	L_chave_pe362
L_chave_pe363:
;AlcoolSensor.c,235 :: 		saida = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,236 :: 		}
L_chave_pe361:
;AlcoolSensor.c,237 :: 		return (saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;AlcoolSensor.c,238 :: 		}
L_end_chave_pe3:
BX	LR
; end of _chave_pe3
_chave_pe4:
;AlcoolSensor.c,240 :: 		char chave_pe4(){
;AlcoolSensor.c,241 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,242 :: 		if(gpioe_idr.b4 == 0){//Verifica se o bit PE4 foi acionado
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_chave_pe466
;AlcoolSensor.c,243 :: 		while(gpioe_idr.b4 == 0)delay_ms(100);
L_chave_pe467:
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_chave_pe468
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_chave_pe469:
SUBS	R7, R7, #1
BNE	L_chave_pe469
NOP
NOP
NOP
NOP
IT	AL
BAL	L_chave_pe467
L_chave_pe468:
;AlcoolSensor.c,244 :: 		saida = 1;//saida_pe4 = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;AlcoolSensor.c,245 :: 		}
L_chave_pe466:
;AlcoolSensor.c,246 :: 		return(saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;AlcoolSensor.c,247 :: 		}
L_end_chave_pe4:
BX	LR
; end of _chave_pe4
_setup_inicial:
;AlcoolSensor.c,249 :: 		void setup_inicial(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;AlcoolSensor.c,252 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_up);
MOVS	R2, #130
;AlcoolSensor.c,251 :: 		_gpio_pinmask_3 | _gpio_pinmask_4,/*bits 3 e 4*/
MOVS	R1, #24
;AlcoolSensor.c,250 :: 		gpio_config(&gpioe_base,/*Configura??o do Porte*/
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
;AlcoolSensor.c,252 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_up);
BL	_GPIO_Config+0
;AlcoolSensor.c,256 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_down);
MOVW	R2, #258
;AlcoolSensor.c,255 :: 		_gpio_pinmask_0,/*bit 0*/
MOVW	R1, #1
;AlcoolSensor.c,254 :: 		gpio_config(&gpioa_base,/*Configura??o do Porta*/
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;AlcoolSensor.c,256 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_down);
BL	_GPIO_Config+0
;AlcoolSensor.c,259 :: 		GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Analog_Input+0
;AlcoolSensor.c,261 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_4);
MOVW	R0, #16
BL	_ADC_Set_Input_Channel+0
;AlcoolSensor.c,262 :: 		ADC1_Init();
BL	_ADC1_Init+0
;AlcoolSensor.c,263 :: 		uart2_init(115200);
MOV	R0, #115200
BL	_UART2_Init+0
;AlcoolSensor.c,266 :: 		rcc_apb1enr.tim2en = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;AlcoolSensor.c,267 :: 		tim2_cr1.cen = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;AlcoolSensor.c,268 :: 		tim2_psc = 25000;
MOVW	R1, #25000
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;AlcoolSensor.c,269 :: 		tim2_arr = 500;
MOVW	R1, #500
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;AlcoolSensor.c,270 :: 		nvic_intenable(ivt_int_tim2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;AlcoolSensor.c,271 :: 		tim2_dier.uie = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;AlcoolSensor.c,272 :: 		tim2_cr1.cen = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;AlcoolSensor.c,273 :: 		factory_reset();
BL	_factory_reset+0
;AlcoolSensor.c,274 :: 		delay_ms(2000);
MOVW	R7, #49833
MOVT	R7, #162
NOP
NOP
L_setup_inicial71:
SUBS	R7, R7, #1
BNE	L_setup_inicial71
NOP
NOP
;AlcoolSensor.c,275 :: 		}
L_end_setup_inicial:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_inicial
_conecta_ap:
;AlcoolSensor.c,277 :: 		void conecta_ap(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;AlcoolSensor.c,278 :: 		UART2_write_text("AT+CWJAP_DEF=\"ASUS\",\"teste12345\"\r\n");
MOVW	R0, #lo_addr(?lstr31_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr31_AlcoolSensor+0)
BL	_UART2_Write_Text+0
;AlcoolSensor.c,279 :: 		Lcd_Out(1,1,"Conecta ao AP    ");
MOVW	R0, #lo_addr(?lstr32_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr32_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;AlcoolSensor.c,280 :: 		Lcd_Out(2,1,"AT+CWJAP_DEF     ");
MOVW	R0, #lo_addr(?lstr33_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr33_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,281 :: 		}
L_end_conecta_ap:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _conecta_ap
_configura_ap:
;AlcoolSensor.c,283 :: 		void configura_ap(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;AlcoolSensor.c,284 :: 		UART2_write_text("AT+CWMODE_DEF=3\r\n");
MOVW	R0, #lo_addr(?lstr34_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr34_AlcoolSensor+0)
BL	_UART2_Write_Text+0
;AlcoolSensor.c,285 :: 		Lcd_Out(1,1,"Config   ESP8266");
MOVW	R0, #lo_addr(?lstr35_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr35_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;AlcoolSensor.c,286 :: 		Lcd_Out(2,1,"AT+CWMODE=3     ");
MOVW	R0, #lo_addr(?lstr36_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr36_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,288 :: 		}
L_end_configura_ap:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _configura_ap
_factory_reset:
;AlcoolSensor.c,290 :: 		void factory_reset(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;AlcoolSensor.c,291 :: 		UART2_write_text("AT+RESTORE\r\n");
MOVW	R0, #lo_addr(?lstr37_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr37_AlcoolSensor+0)
BL	_UART2_Write_Text+0
;AlcoolSensor.c,292 :: 		Lcd_Out(1,1,"Factory Reset   ");
MOVW	R0, #lo_addr(?lstr38_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr38_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;AlcoolSensor.c,293 :: 		delay_ms(250);
MOVW	R7, #22611
MOVT	R7, #20
NOP
NOP
L_factory_reset73:
SUBS	R7, R7, #1
BNE	L_factory_reset73
NOP
NOP
NOP
NOP
;AlcoolSensor.c,294 :: 		Lcd_Out(2,1,"AT+RESTORE      ");
MOVW	R0, #lo_addr(?lstr39_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr39_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,295 :: 		delay_ms(250);
MOVW	R7, #22611
MOVT	R7, #20
NOP
NOP
L_factory_reset75:
SUBS	R7, R7, #1
BNE	L_factory_reset75
NOP
NOP
NOP
NOP
;AlcoolSensor.c,296 :: 		Lcd_Cmd(_lcd_clear);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;AlcoolSensor.c,297 :: 		delay_ms(250);
MOVW	R7, #22611
MOVT	R7, #20
NOP
NOP
L_factory_reset77:
SUBS	R7, R7, #1
BNE	L_factory_reset77
NOP
NOP
NOP
NOP
;AlcoolSensor.c,298 :: 		}
L_end_factory_reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _factory_reset
_timer2_interrupt:
;AlcoolSensor.c,300 :: 		void timer2_interrupt() iv ivt_int_tim2 {
;AlcoolSensor.c,302 :: 		tim2_sr.uif = 0;//reset da flag de sinaliza??o
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;AlcoolSensor.c,303 :: 		segundo ++;
MOVW	R1, #lo_addr(_segundo+0)
MOVT	R1, #hi_addr(_segundo+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;AlcoolSensor.c,304 :: 		if(segundo >= 60) segundo = 0;
CMP	R0, #60
IT	CC
BCC	L_timer2_interrupt79
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
L_timer2_interrupt79:
;AlcoolSensor.c,305 :: 		}
L_end_timer2_interrupt:
BX	LR
; end of _timer2_interrupt
_analogico:
;AlcoolSensor.c,307 :: 		void analogico(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;AlcoolSensor.c,308 :: 		valor = adc1_read(4);
MOVS	R0, #4
BL	_ADC1_Read+0
MOVW	R1, #lo_addr(_valor+0)
MOVT	R1, #hi_addr(_valor+0)
STRH	R0, [R1, #0]
;AlcoolSensor.c,309 :: 		media = media + valor;
SXTH	R2, R0
MOVW	R1, #lo_addr(_media+0)
MOVT	R1, #hi_addr(_media+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, R2
STRH	R0, [R1, #0]
;AlcoolSensor.c,310 :: 		contador2 ++;
MOVW	R1, #lo_addr(_contador2+0)
MOVT	R1, #hi_addr(_contador2+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;AlcoolSensor.c,313 :: 		if (contador2 == 15)
CMP	R0, #15
IT	NE
BNE	L_analogico80
;AlcoolSensor.c,315 :: 		tensao = media / contador2;
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
;AlcoolSensor.c,316 :: 		contador2 = 0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [R4, #0]
;AlcoolSensor.c,317 :: 		media = 0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [R1, #0]
;AlcoolSensor.c,318 :: 		tensao = tensao - (tensao * 100 /515); //ajusta volt ;
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
;AlcoolSensor.c,319 :: 		tensao = ((valor * 3.3 / 4096) /0.01);
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
;AlcoolSensor.c,320 :: 		inttostr (tensao, txt3);
MOVW	R1, #lo_addr(_txt3+0)
MOVT	R1, #hi_addr(_txt3+0)
BL	_IntToStr+0
;AlcoolSensor.c,321 :: 		if(tensao < 100 && tensao >= 10)
MOVW	R0, #lo_addr(_tensao+0)
MOVT	R0, #hi_addr(_tensao+0)
LDRSH	R0, [R0, #0]
CMP	R0, #100
IT	GE
BGE	L__analogico89
MOVW	R0, #lo_addr(_tensao+0)
MOVT	R0, #hi_addr(_tensao+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	LT
BLT	L__analogico88
L__analogico87:
;AlcoolSensor.c,323 :: 		Lcd_Out(2,11," ");
MOVW	R0, #lo_addr(?lstr40_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr40_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #11
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,324 :: 		Lcd_Out(2,12,Ltrim(txt3));
MOVW	R0, #lo_addr(_txt3+0)
MOVT	R0, #hi_addr(_txt3+0)
BL	_Ltrim+0
MOV	R2, R0
MOVS	R1, #12
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,325 :: 		}
IT	AL
BAL	L_analogico84
;AlcoolSensor.c,321 :: 		if(tensao < 100 && tensao >= 10)
L__analogico89:
L__analogico88:
;AlcoolSensor.c,326 :: 		else if(tensao < 10)
MOVW	R0, #lo_addr(_tensao+0)
MOVT	R0, #hi_addr(_tensao+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L_analogico85
;AlcoolSensor.c,328 :: 		Lcd_Out(2,12," ");
MOVW	R0, #lo_addr(?lstr41_AlcoolSensor+0)
MOVT	R0, #hi_addr(?lstr41_AlcoolSensor+0)
MOV	R2, R0
MOVS	R1, #12
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,329 :: 		Lcd_Out(2,13,Ltrim(txt3));
MOVW	R0, #lo_addr(_txt3+0)
MOVT	R0, #hi_addr(_txt3+0)
BL	_Ltrim+0
MOV	R2, R0
MOVS	R1, #13
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,330 :: 		}
IT	AL
BAL	L_analogico86
L_analogico85:
;AlcoolSensor.c,333 :: 		Lcd_Out(2,11,Ltrim(txt3));
MOVW	R0, #lo_addr(_txt3+0)
MOVT	R0, #hi_addr(_txt3+0)
BL	_Ltrim+0
MOV	R2, R0
MOVS	R1, #11
MOVS	R0, #2
BL	_Lcd_Out+0
;AlcoolSensor.c,334 :: 		}
L_analogico86:
L_analogico84:
;AlcoolSensor.c,337 :: 		}
L_analogico80:
;AlcoolSensor.c,338 :: 		}
L_end_analogico:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _analogico
