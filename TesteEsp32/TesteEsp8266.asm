_main:
;TesteEsp8266.c,25 :: 		void main(){
;TesteEsp8266.c,26 :: 		setup_inicial();
BL	_setup_inicial+0
;TesteEsp8266.c,27 :: 		Lcd_Init();                        // Initialize LCD
BL	_Lcd_Init+0
;TesteEsp8266.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
MOVS	R0, #1
BL	_Lcd_Cmd+0
;TesteEsp8266.c,29 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
MOVS	R0, #12
BL	_Lcd_Cmd+0
;TesteEsp8266.c,30 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
MOVS	R0, #128
BL	_Lcd_Cmd+0
;TesteEsp8266.c,31 :: 		while(chave_pa0() == 1) factory_reset();
L_main0:
BL	_chave_pa0+0
CMP	R0, #1
IT	NE
BNE	L_main1
BL	_factory_reset+0
IT	AL
BAL	L_main0
L_main1:
;TesteEsp8266.c,32 :: 		Lcd_Out(1,1," Teste ESP 8266 ");
MOVW	R0, #lo_addr(?lstr1_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr1_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;TesteEsp8266.c,33 :: 		configura_ap();
BL	_configura_ap+0
;TesteEsp8266.c,34 :: 		delay_ms(2000);
MOVW	R7, #20521
MOVT	R7, #254
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
;TesteEsp8266.c,35 :: 		conecta_ap();
BL	_conecta_ap+0
;TesteEsp8266.c,36 :: 		delay_ms(2000);
MOVW	R7, #20521
MOVT	R7, #254
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
;TesteEsp8266.c,37 :: 		while(1){
L_main6:
;TesteEsp8266.c,41 :: 		resultado_conexao = verifica_conexao();
BL	_verifica_conexao+0
MOVW	R1, #lo_addr(_resultado_conexao+0)
MOVT	R1, #hi_addr(_resultado_conexao+0)
STRB	R0, [R1, #0]
;TesteEsp8266.c,42 :: 		if((resultado_conexao == 2) || (resultado_conexao == 4)){
CMP	R0, #2
IT	EQ
BEQ	L__main84
MOVW	R0, #lo_addr(_resultado_conexao+0)
MOVT	R0, #hi_addr(_resultado_conexao+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L__main83
IT	AL
BAL	L_main10
L__main84:
L__main83:
;TesteEsp8266.c,44 :: 		resultado_web = verifica_web();
BL	_verifica_web+0
MOVW	R1, #lo_addr(_resultado_web+0)
MOVT	R1, #hi_addr(_resultado_web+0)
STRB	R0, [R1, #0]
;TesteEsp8266.c,45 :: 		if((resultado_web ==  2)||(resultado_web == 3)){
CMP	R0, #2
IT	EQ
BEQ	L__main86
MOVW	R0, #lo_addr(_resultado_web+0)
MOVT	R0, #hi_addr(_resultado_web+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L__main85
IT	AL
BAL	L_main13
L__main86:
L__main85:
;TesteEsp8266.c,48 :: 		resultado_tamanho = envia_tamanho();
BL	_envia_tamanho+0
MOVW	R1, #lo_addr(_resultado_tamanho+0)
MOVT	R1, #hi_addr(_resultado_tamanho+0)
STRB	R0, [R1, #0]
;TesteEsp8266.c,49 :: 		if(resultado_tamanho == 1){
CMP	R0, #1
IT	NE
BNE	L_main14
;TesteEsp8266.c,51 :: 		resultado_mensagem = envia_dados();
BL	_envia_dados+0
MOVW	R1, #lo_addr(_resultado_mensagem+0)
MOVT	R1, #hi_addr(_resultado_mensagem+0)
STRB	R0, [R1, #0]
;TesteEsp8266.c,52 :: 		if(resultado_mensagem == 1){
CMP	R0, #1
IT	NE
BNE	L_main15
;TesteEsp8266.c,53 :: 		Lcd_Out(1,1,output);
MOVW	R2, #lo_addr(_output+0)
MOVT	R2, #hi_addr(_output+0)
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;TesteEsp8266.c,55 :: 		}
L_main15:
;TesteEsp8266.c,56 :: 		}
L_main14:
;TesteEsp8266.c,57 :: 		}
L_main13:
;TesteEsp8266.c,58 :: 		}else
IT	AL
BAL	L_main16
L_main10:
;TesteEsp8266.c,59 :: 		if(resultado_conexao == 3){//ja esta conectado
MOVW	R0, #lo_addr(_resultado_conexao+0)
MOVT	R0, #hi_addr(_resultado_conexao+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_main17
;TesteEsp8266.c,61 :: 		resultado_tamanho = envia_tamanho();
BL	_envia_tamanho+0
MOVW	R1, #lo_addr(_resultado_tamanho+0)
MOVT	R1, #hi_addr(_resultado_tamanho+0)
STRB	R0, [R1, #0]
;TesteEsp8266.c,62 :: 		if(resultado_tamanho == 1){
CMP	R0, #1
IT	NE
BNE	L_main18
;TesteEsp8266.c,64 :: 		resultado_mensagem = envia_dados();
BL	_envia_dados+0
MOVW	R1, #lo_addr(_resultado_mensagem+0)
MOVT	R1, #hi_addr(_resultado_mensagem+0)
STRB	R0, [R1, #0]
;TesteEsp8266.c,65 :: 		if(resultado_mensagem == 1){
CMP	R0, #1
IT	NE
BNE	L_main19
;TesteEsp8266.c,66 :: 		Lcd_Out(1,1,output);
MOVW	R2, #lo_addr(_output+0)
MOVT	R2, #hi_addr(_output+0)
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;TesteEsp8266.c,68 :: 		}
L_main19:
;TesteEsp8266.c,69 :: 		}
L_main18:
;TesteEsp8266.c,70 :: 		}else lcd_out(1,1," Sem conexao AP ");
IT	AL
BAL	L_main20
L_main17:
MOVW	R0, #lo_addr(?lstr2_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr2_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
L_main20:
L_main16:
;TesteEsp8266.c,72 :: 		}
IT	AL
BAL	L_main6
;TesteEsp8266.c,73 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_verifica_conexao:
;TesteEsp8266.c,75 :: 		char verifica_conexao(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;TesteEsp8266.c,76 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,77 :: 		lcd_out(1,1,"Testa Conexao...");
MOVW	R0, #lo_addr(?lstr3_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr3_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;TesteEsp8266.c,78 :: 		lcd_out(2,1,"AT+CIPSTATUS    ");
MOVW	R0, #lo_addr(?lstr4_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr4_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,79 :: 		output[0] = '\0';//inicia a string com null
MOVS	R1, #0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,80 :: 		indice_output = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
;TesteEsp8266.c,81 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,82 :: 		UART2_Write_Text("AT+CIPSTATUS\r\n");//envia o comando
MOVW	R0, #lo_addr(?lstr5_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr5_TesteEsp8266+0)
BL	_UART2_Write_Text+0
;TesteEsp8266.c,83 :: 		while(segundo < 1){
L_verifica_conexao21:
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	CS
BCS	L_verifica_conexao22
;TesteEsp8266.c,85 :: 		if(UART2_Data_Ready()==1){
BL	_UART2_Data_Ready+0
CMP	R0, #1
IT	NE
BNE	L_verifica_conexao23
;TesteEsp8266.c,86 :: 		output[indice_output] = UART2_Read();
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
;TesteEsp8266.c,87 :: 		indice_output ++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;TesteEsp8266.c,88 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,89 :: 		}
L_verifica_conexao23:
;TesteEsp8266.c,90 :: 		}
IT	AL
BAL	L_verifica_conexao21
L_verifica_conexao22:
;TesteEsp8266.c,91 :: 		if(indice_output >= 510) indice_output = 510;
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
;TesteEsp8266.c,92 :: 		output[indice_output] = '\0';//finaliza string com null
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;TesteEsp8266.c,93 :: 		if(strstr(output,"STATUS:2")){
MOVW	R0, #lo_addr(?lstr6_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr6_TesteEsp8266+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_conexao25
;TesteEsp8266.c,95 :: 		saida = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,96 :: 		}else
IT	AL
BAL	L_verifica_conexao26
L_verifica_conexao25:
;TesteEsp8266.c,97 :: 		if(strstr(output,"STATUS:3")){
MOVW	R0, #lo_addr(?lstr7_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr7_TesteEsp8266+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_conexao27
;TesteEsp8266.c,99 :: 		saida = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,100 :: 		}else
IT	AL
BAL	L_verifica_conexao28
L_verifica_conexao27:
;TesteEsp8266.c,101 :: 		if(strstr(output,"STATUS:4")){
MOVW	R0, #lo_addr(?lstr8_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr8_TesteEsp8266+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_conexao29
;TesteEsp8266.c,103 :: 		saida = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,104 :: 		lcd_out(2,1,"Desconectado  ");
MOVW	R0, #lo_addr(?lstr9_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr9_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,105 :: 		}else
IT	AL
BAL	L_verifica_conexao30
L_verifica_conexao29:
;TesteEsp8266.c,106 :: 		if(strstr(output,"STATUS:5")){
MOVW	R0, #lo_addr(?lstr10_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr10_TesteEsp8266+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_conexao31
;TesteEsp8266.c,108 :: 		saida = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,109 :: 		}else
IT	AL
BAL	L_verifica_conexao32
L_verifica_conexao31:
;TesteEsp8266.c,110 :: 		if(strstr(output,"busy")){
MOVW	R0, #lo_addr(?lstr11_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr11_TesteEsp8266+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_conexao33
;TesteEsp8266.c,112 :: 		saida = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,113 :: 		}
L_verifica_conexao33:
L_verifica_conexao32:
L_verifica_conexao30:
L_verifica_conexao28:
L_verifica_conexao26:
;TesteEsp8266.c,114 :: 		return(saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;TesteEsp8266.c,115 :: 		}
L_end_verifica_conexao:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _verifica_conexao
_verifica_web:
;TesteEsp8266.c,117 :: 		char verifica_web(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;TesteEsp8266.c,118 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,119 :: 		lcd_out(1,1,"Verifica WEB ...");
MOVW	R0, #lo_addr(?lstr12_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr12_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;TesteEsp8266.c,120 :: 		lcd_out(2,1,"AT+CIPSTART=\"TCP");
MOVW	R0, #lo_addr(?lstr13_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr13_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,121 :: 		output[0] = '\0';//inicia a string com null
MOVS	R1, #0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,122 :: 		indice_output = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
;TesteEsp8266.c,123 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,124 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"192.168.43.118\",8080\r\n");
MOVW	R0, #lo_addr(?lstr14_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr14_TesteEsp8266+0)
BL	_UART2_Write_Text+0
;TesteEsp8266.c,126 :: 		while(segundo < 2){
L_verifica_web34:
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	CS
BCS	L_verifica_web35
;TesteEsp8266.c,128 :: 		if(UART2_Data_Ready()){
BL	_UART2_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_web36
;TesteEsp8266.c,129 :: 		output[indice_output] = UART2_Read();
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
;TesteEsp8266.c,130 :: 		indice_output ++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;TesteEsp8266.c,131 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,132 :: 		}
L_verifica_web36:
;TesteEsp8266.c,133 :: 		}
IT	AL
BAL	L_verifica_web34
L_verifica_web35:
;TesteEsp8266.c,134 :: 		if(indice_output >= 510) indice_output = 510;
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
;TesteEsp8266.c,135 :: 		output[indice_output] = '\0';//finaliza string com null
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;TesteEsp8266.c,136 :: 		if(strstr(output,"CONNECT")){
MOVW	R0, #lo_addr(?lstr15_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr15_TesteEsp8266+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_web38
;TesteEsp8266.c,138 :: 		saida = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,139 :: 		lcd_out(2,1,"CONNECT         ");
MOVW	R0, #lo_addr(?lstr16_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr16_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,140 :: 		}else
IT	AL
BAL	L_verifica_web39
L_verifica_web38:
;TesteEsp8266.c,141 :: 		if(strstr(output,"ALREADY")){
MOVW	R0, #lo_addr(?lstr17_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr17_TesteEsp8266+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_web40
;TesteEsp8266.c,143 :: 		saida = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,144 :: 		lcd_out(2,1,"ALREADY         ");
MOVW	R0, #lo_addr(?lstr18_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr18_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,145 :: 		}else
IT	AL
BAL	L_verifica_web41
L_verifica_web40:
;TesteEsp8266.c,146 :: 		if(strstr(output,"CLOSED")){
MOVW	R0, #lo_addr(?lstr19_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr19_TesteEsp8266+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_verifica_web42
;TesteEsp8266.c,148 :: 		saida = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,149 :: 		lcd_out(2,1,"CLOSED          ");
MOVW	R0, #lo_addr(?lstr20_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr20_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,150 :: 		}
L_verifica_web42:
L_verifica_web41:
L_verifica_web39:
;TesteEsp8266.c,151 :: 		return(saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;TesteEsp8266.c,152 :: 		}
L_end_verifica_web:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _verifica_web
_envia_dados:
;TesteEsp8266.c,154 :: 		char envia_dados(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;TesteEsp8266.c,155 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,156 :: 		valor = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_valor+0)
MOVT	R0, #hi_addr(_valor+0)
STRH	R1, [R0, #0]
;TesteEsp8266.c,157 :: 		lcd_out(1,1,"Envia   Dados");
MOVW	R0, #lo_addr(?lstr21_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr21_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;TesteEsp8266.c,158 :: 		lcd_out(2,1,"POST ");
MOVW	R0, #lo_addr(?lstr22_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr22_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,159 :: 		output[0] = '\0';//inicia a string com null
MOVS	R1, #0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,160 :: 		indice_output = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
;TesteEsp8266.c,161 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,162 :: 		UART2_Write_Text("POST /workspace/Projeto/sensor/ HTTP/1.1\r\nHost: 192.168.43.118:8080\r\nContent-Type: application/x-www-form-urlencoded\r\nContent-Length:20\r\n\r\n{""id"":0,""valor"":1}\r\n\r\n");
MOVW	R0, #lo_addr(?lstr23_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr23_TesteEsp8266+0)
BL	_UART2_Write_Text+0
;TesteEsp8266.c,163 :: 		while(segundo < 3){
L_envia_dados43:
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	CS
BCS	L_envia_dados44
;TesteEsp8266.c,164 :: 		if(UART2_Data_Ready()){
BL	_UART2_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_envia_dados45
;TesteEsp8266.c,165 :: 		output[indice_output] = UART2_Read();
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
;TesteEsp8266.c,166 :: 		indice_output ++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;TesteEsp8266.c,167 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,168 :: 		}
L_envia_dados45:
;TesteEsp8266.c,169 :: 		}
IT	AL
BAL	L_envia_dados43
L_envia_dados44:
;TesteEsp8266.c,170 :: 		if(indice_output >= 510) indice_output = 510;
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R0, [R0, #0]
CMP	R0, #510
IT	LT
BLT	L_envia_dados46
MOVW	R1, #510
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
L_envia_dados46:
;TesteEsp8266.c,171 :: 		output[indice_output] = '\0';//finaliza string com null
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;TesteEsp8266.c,172 :: 		if(strstr(output,"SEND OK")){
MOVW	R0, #lo_addr(?lstr24_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr24_TesteEsp8266+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_envia_dados47
;TesteEsp8266.c,173 :: 		saida = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,174 :: 		lcd_out(2,1,"HTTP/1.1 200 OK ");
MOVW	R0, #lo_addr(?lstr25_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr25_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,175 :: 		}
L_envia_dados47:
;TesteEsp8266.c,176 :: 		return(saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;TesteEsp8266.c,177 :: 		}
L_end_envia_dados:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _envia_dados
_envia_tamanho:
;TesteEsp8266.c,179 :: 		char envia_tamanho(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;TesteEsp8266.c,180 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,181 :: 		lcd_out(1,1,"Envia tamanho...");
MOVW	R0, #lo_addr(?lstr26_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr26_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;TesteEsp8266.c,182 :: 		lcd_out(2,1,"AT+CIPSEND=55   ");
MOVW	R0, #lo_addr(?lstr27_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr27_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,183 :: 		output[0] = '\0';//inicia a string com null
MOVS	R1, #0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,184 :: 		UART2_Write_Text("AT+CIPSEND=55\r\n");
MOVW	R0, #lo_addr(?lstr28_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr28_TesteEsp8266+0)
BL	_UART2_Write_Text+0
;TesteEsp8266.c,185 :: 		indice_output = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
;TesteEsp8266.c,186 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,187 :: 		while(segundo < 1){
L_envia_tamanho48:
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	CS
BCS	L_envia_tamanho49
;TesteEsp8266.c,188 :: 		if(UART2_Data_Ready()){
BL	_UART2_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_envia_tamanho50
;TesteEsp8266.c,189 :: 		output[indice_output] = UART2_Read();
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
;TesteEsp8266.c,190 :: 		indice_output ++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;TesteEsp8266.c,191 :: 		segundo = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,192 :: 		}
L_envia_tamanho50:
;TesteEsp8266.c,193 :: 		}
IT	AL
BAL	L_envia_tamanho48
L_envia_tamanho49:
;TesteEsp8266.c,194 :: 		if(indice_output >= 510) indice_output = 510;
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R0, [R0, #0]
CMP	R0, #510
IT	LT
BLT	L_envia_tamanho51
MOVW	R1, #510
SXTH	R1, R1
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
STRH	R1, [R0, #0]
L_envia_tamanho51:
;TesteEsp8266.c,195 :: 		output[indice_output] = '\0';//finaliza string ocm null
MOVW	R0, #lo_addr(_indice_output+0)
MOVT	R0, #hi_addr(_indice_output+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;TesteEsp8266.c,196 :: 		if(strstr(output,"OK\r\n>")){
MOVW	R0, #lo_addr(?lstr29_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr29_TesteEsp8266+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_envia_tamanho52
;TesteEsp8266.c,197 :: 		saida = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,198 :: 		lcd_out(2,1,"OK >            ");
MOVW	R0, #lo_addr(?lstr30_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr30_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,199 :: 		}
L_envia_tamanho52:
;TesteEsp8266.c,200 :: 		return(saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;TesteEsp8266.c,201 :: 		}
L_end_envia_tamanho:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _envia_tamanho
_chave_pa0:
;TesteEsp8266.c,203 :: 		char chave_pa0(){
;TesteEsp8266.c,204 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,205 :: 		if(gpioa_idr.b0 == 1){//verifica se o bit PA0 foi acionado
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_chave_pa053
;TesteEsp8266.c,206 :: 		while(gpioa_idr.b0 == 1) delay_ms(100);
L_chave_pa054:
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_chave_pa055
MOVW	R7, #46899
MOVT	R7, #12
NOP
NOP
L_chave_pa056:
SUBS	R7, R7, #1
BNE	L_chave_pa056
NOP
NOP
NOP
NOP
IT	AL
BAL	L_chave_pa054
L_chave_pa055:
;TesteEsp8266.c,207 :: 		saida = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,208 :: 		}
L_chave_pa053:
;TesteEsp8266.c,209 :: 		return (saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;TesteEsp8266.c,210 :: 		}
L_end_chave_pa0:
BX	LR
; end of _chave_pa0
_chave_pe3:
;TesteEsp8266.c,212 :: 		char chave_pe3(){
;TesteEsp8266.c,213 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,214 :: 		if(gpioe_idr.b3 == 0){//Verifica se o bit PE3 foi acionado
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_chave_pe358
;TesteEsp8266.c,215 :: 		while(gpioe_idr.b3 == 0) delay_ms(100);
L_chave_pe359:
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_chave_pe360
MOVW	R7, #46899
MOVT	R7, #12
NOP
NOP
L_chave_pe361:
SUBS	R7, R7, #1
BNE	L_chave_pe361
NOP
NOP
NOP
NOP
IT	AL
BAL	L_chave_pe359
L_chave_pe360:
;TesteEsp8266.c,216 :: 		saida = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,217 :: 		}
L_chave_pe358:
;TesteEsp8266.c,218 :: 		return (saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;TesteEsp8266.c,219 :: 		}
L_end_chave_pe3:
BX	LR
; end of _chave_pe3
_chave_pe4:
;TesteEsp8266.c,221 :: 		char chave_pe4(){
;TesteEsp8266.c,222 :: 		saida = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,223 :: 		if(gpioe_idr.b4 == 0){//Verifica se o bit PE4 foi acionado
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_chave_pe463
;TesteEsp8266.c,224 :: 		while(gpioe_idr.b4 == 0)delay_ms(100);
L_chave_pe464:
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_chave_pe465
MOVW	R7, #46899
MOVT	R7, #12
NOP
NOP
L_chave_pe466:
SUBS	R7, R7, #1
BNE	L_chave_pe466
NOP
NOP
NOP
NOP
IT	AL
BAL	L_chave_pe464
L_chave_pe465:
;TesteEsp8266.c,225 :: 		saida = 1;//saida_pe4 = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
STRB	R1, [R0, #0]
;TesteEsp8266.c,226 :: 		}
L_chave_pe463:
;TesteEsp8266.c,227 :: 		return(saida);
MOVW	R0, #lo_addr(_saida+0)
MOVT	R0, #hi_addr(_saida+0)
LDRB	R0, [R0, #0]
;TesteEsp8266.c,228 :: 		}
L_end_chave_pe4:
BX	LR
; end of _chave_pe4
_setup_inicial:
;TesteEsp8266.c,230 :: 		void setup_inicial(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TesteEsp8266.c,233 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_up);
MOVS	R2, #130
;TesteEsp8266.c,232 :: 		_gpio_pinmask_3 | _gpio_pinmask_4,/*bits 3 e 4*/
MOVS	R1, #24
;TesteEsp8266.c,231 :: 		gpio_config(&gpioe_base,/*Configura??o do Porte*/
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
;TesteEsp8266.c,233 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_up);
BL	_GPIO_Config+0
;TesteEsp8266.c,237 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_down);
MOVW	R2, #258
;TesteEsp8266.c,236 :: 		_gpio_pinmask_0,/*bit 0*/
MOVW	R1, #1
;TesteEsp8266.c,235 :: 		gpio_config(&gpioa_base,/*Configura??o do Porta*/
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;TesteEsp8266.c,237 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_down);
BL	_GPIO_Config+0
;TesteEsp8266.c,240 :: 		GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Analog_Input+0
;TesteEsp8266.c,242 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_4);
MOVW	R0, #16
BL	_ADC_Set_Input_Channel+0
;TesteEsp8266.c,243 :: 		ADC1_Init();
BL	_ADC1_Init+0
;TesteEsp8266.c,244 :: 		uart2_init(115200);
MOV	R0, #115200
BL	_UART2_Init+0
;TesteEsp8266.c,247 :: 		rcc_apb1enr.tim2en = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;TesteEsp8266.c,248 :: 		tim2_cr1.cen = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;TesteEsp8266.c,249 :: 		tim2_psc = 25000;
MOVW	R1, #25000
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;TesteEsp8266.c,250 :: 		tim2_arr = 500;
MOVW	R1, #500
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;TesteEsp8266.c,251 :: 		nvic_intenable(ivt_int_tim2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;TesteEsp8266.c,252 :: 		tim2_dier.uie = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;TesteEsp8266.c,253 :: 		tim2_cr1.cen = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;TesteEsp8266.c,254 :: 		factory_reset();
BL	_factory_reset+0
;TesteEsp8266.c,255 :: 		delay_ms(2000);
MOVW	R7, #20521
MOVT	R7, #254
NOP
NOP
L_setup_inicial68:
SUBS	R7, R7, #1
BNE	L_setup_inicial68
NOP
NOP
;TesteEsp8266.c,257 :: 		for(i=0;i<=20;i++)          //média da leitura
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_setup_inicial70:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #20
IT	GT
BGT	L_setup_inicial71
;TesteEsp8266.c,259 :: 		valor = adc1_read(4);
MOVS	R0, #4
BL	_ADC1_Read+0
MOVW	R1, #lo_addr(_valor+0)
MOVT	R1, #hi_addr(_valor+0)
STRH	R0, [R1, #0]
;TesteEsp8266.c,260 :: 		media = media + valor;
SXTH	R2, R0
MOVW	R1, #lo_addr(_media+0)
MOVT	R1, #hi_addr(_media+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, R2
STRH	R0, [R1, #0]
;TesteEsp8266.c,261 :: 		contador2 ++;
MOVW	R1, #lo_addr(_contador2+0)
MOVT	R1, #hi_addr(_contador2+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;TesteEsp8266.c,262 :: 		if (contador2 == 15)
CMP	R0, #15
IT	NE
BNE	L_setup_inicial73
;TesteEsp8266.c,264 :: 		tensao = media / contador2;
MOVW	R4, #lo_addr(_contador2+0)
MOVT	R4, #hi_addr(_contador2+0)
LDRSH	R2, [R4, #0]
MOVW	R1, #lo_addr(_media+0)
MOVT	R1, #hi_addr(_media+0)
LDRSH	R0, [R1, #0]
SDIV	R2, R0, R2
SXTH	R2, R2
MOVW	R3, #lo_addr(_tensao+0)
MOVT	R3, #hi_addr(_tensao+0)
STRH	R2, [R3, #0]
;TesteEsp8266.c,265 :: 		contador2 = 0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [R4, #0]
;TesteEsp8266.c,266 :: 		media = 0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [R1, #0]
;TesteEsp8266.c,267 :: 		tensao = tensao - (tensao * 100 /515); //ajusta volt ;
MOVS	R0, #100
SXTH	R0, R0
MUL	R1, R2, R0
SXTH	R1, R1
MOVW	R0, #515
SXTH	R0, R0
SDIV	R0, R1, R0
SXTH	R0, R0
SUB	R0, R2, R0
STRH	R0, [R3, #0]
;TesteEsp8266.c,268 :: 		tensao = ((valor * 3.3 / 4096) /0.01);
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
VMOV	R2, S0
SXTH	R2, R2
STRH	R2, [R3, #0]
;TesteEsp8266.c,269 :: 		inttostr (tensao, txt3);
MOVW	R0, #lo_addr(_txt3+0)
MOVT	R0, #hi_addr(_txt3+0)
LDRB	R1, [R0, #0]
SXTH	R0, R2
BL	_IntToStr+0
;TesteEsp8266.c,270 :: 		}
L_setup_inicial73:
;TesteEsp8266.c,257 :: 		for(i=0;i<=20;i++)          //média da leitura
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;TesteEsp8266.c,271 :: 		}
IT	AL
BAL	L_setup_inicial70
L_setup_inicial71:
;TesteEsp8266.c,272 :: 		}
L_end_setup_inicial:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_inicial
_conecta_ap:
;TesteEsp8266.c,274 :: 		void conecta_ap(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TesteEsp8266.c,275 :: 		UART2_write_text("AT+CWJAP_DEF=\"ASUS\",\"teste12345\"\r\n");
MOVW	R0, #lo_addr(?lstr31_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr31_TesteEsp8266+0)
BL	_UART2_Write_Text+0
;TesteEsp8266.c,276 :: 		Lcd_Out(1,1,"Conecta ao AP    ");
MOVW	R0, #lo_addr(?lstr32_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr32_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;TesteEsp8266.c,277 :: 		Lcd_Out(2,1,"AT+CWJAP_DEF     ");
MOVW	R0, #lo_addr(?lstr33_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr33_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,278 :: 		}
L_end_conecta_ap:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _conecta_ap
_configura_ap:
;TesteEsp8266.c,280 :: 		void configura_ap(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TesteEsp8266.c,281 :: 		UART2_write_text("AT+CWMODE_DEF=3\r\n");
MOVW	R0, #lo_addr(?lstr34_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr34_TesteEsp8266+0)
BL	_UART2_Write_Text+0
;TesteEsp8266.c,282 :: 		Lcd_Out(1,1,"Config   ESP8266");
MOVW	R0, #lo_addr(?lstr35_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr35_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;TesteEsp8266.c,283 :: 		Lcd_Out(2,1,"AT+CWMODE=3     ");
MOVW	R0, #lo_addr(?lstr36_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr36_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,285 :: 		}
L_end_configura_ap:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _configura_ap
_factory_reset:
;TesteEsp8266.c,287 :: 		void factory_reset(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TesteEsp8266.c,288 :: 		UART2_write_text("AT+RESTORE\r\n");
MOVW	R0, #lo_addr(?lstr37_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr37_TesteEsp8266+0)
BL	_UART2_Write_Text+0
;TesteEsp8266.c,289 :: 		Lcd_Out(1,1,"Factory Reset   ");
MOVW	R0, #lo_addr(?lstr38_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr38_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;TesteEsp8266.c,290 :: 		delay_ms(250);
MOVW	R7, #51715
MOVT	R7, #31
NOP
NOP
L_factory_reset74:
SUBS	R7, R7, #1
BNE	L_factory_reset74
NOP
NOP
NOP
NOP
;TesteEsp8266.c,291 :: 		Lcd_Out(2,1,"AT+RESTORE      ");
MOVW	R0, #lo_addr(?lstr39_TesteEsp8266+0)
MOVT	R0, #hi_addr(?lstr39_TesteEsp8266+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;TesteEsp8266.c,292 :: 		delay_ms(250);
MOVW	R7, #51715
MOVT	R7, #31
NOP
NOP
L_factory_reset76:
SUBS	R7, R7, #1
BNE	L_factory_reset76
NOP
NOP
NOP
NOP
;TesteEsp8266.c,293 :: 		Lcd_Cmd(_lcd_clear);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;TesteEsp8266.c,294 :: 		delay_ms(250);
MOVW	R7, #51715
MOVT	R7, #31
NOP
NOP
L_factory_reset78:
SUBS	R7, R7, #1
BNE	L_factory_reset78
NOP
NOP
NOP
NOP
;TesteEsp8266.c,295 :: 		}
L_end_factory_reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _factory_reset
_timer2_interrupt:
;TesteEsp8266.c,297 :: 		void timer2_interrupt() iv ivt_int_tim2 {
;TesteEsp8266.c,299 :: 		tim2_sr.uif = 0;//reset da flag de sinaliza??o
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;TesteEsp8266.c,300 :: 		segundo ++;
MOVW	R1, #lo_addr(_segundo+0)
MOVT	R1, #hi_addr(_segundo+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;TesteEsp8266.c,301 :: 		if(segundo >= 60) segundo = 0;
CMP	R0, #60
IT	CC
BCC	L_timer2_interrupt80
MOVS	R1, #0
MOVW	R0, #lo_addr(_segundo+0)
MOVT	R0, #hi_addr(_segundo+0)
STRB	R1, [R0, #0]
L_timer2_interrupt80:
;TesteEsp8266.c,302 :: 		}
L_end_timer2_interrupt:
BX	LR
; end of _timer2_interrupt
