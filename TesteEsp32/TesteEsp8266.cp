#line 1 "C:/Users/saldanhaz/Desktop/Embarcados/TesteMikroC/TesteEsp/TesteEsp8266.c"

sbit LCD_RS at GPIOD_ODR.B2;
sbit LCD_EN at GPIOD_ODR.B3;
sbit LCD_D4 at GPIOD_ODR.B4;
sbit LCD_D5 at GPIOD_ODR.B5;
sbit LCD_D6 at GPIOD_ODR.B6;
sbit LCD_D7 at GPIOD_ODR.B7;


int indice_output, valor, media, tensao, contador2, i;
char segundo, output[512], resultado_conexao, resultado_web, resultado_tamanho, resultado_mensagem, saida, txt1, txt2, txt3;

char chave_pa0();
char chave_pe3();
char chave_pe4();
char verifica_conexao();
char verifica_web();
char envia_tamanho();
char envia_dados();
void setup_inicial();
void configura_ap();
void conecta_ap();
void factory_reset();

void main(){
 setup_inicial();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_FIRST_ROW);
 while(chave_pa0() == 1) factory_reset();
 Lcd_Out(1,1," Teste ESP 8266 ");
 configura_ap();
 delay_ms(2000);
 conecta_ap();
 delay_ms(2000);
 while(1){



 resultado_conexao = verifica_conexao();
 if((resultado_conexao == 2) || (resultado_conexao == 4)){

 resultado_web = verifica_web();
 if((resultado_web == 2)||(resultado_web == 3)){


 resultado_tamanho = envia_tamanho();
 if(resultado_tamanho == 1){

 resultado_mensagem = envia_dados();
 if(resultado_mensagem == 1){
 Lcd_Out(1,1,output);

 }
 }
 }
 }else
 if(resultado_conexao == 3){

 resultado_tamanho = envia_tamanho();
 if(resultado_tamanho == 1){

 resultado_mensagem = envia_dados();
 if(resultado_mensagem == 1){
 Lcd_Out(1,1,output);

 }
 }
 }else lcd_out(1,1," Sem conexao AP ");

 }
}

char verifica_conexao(){
 saida = 0;
 lcd_out(1,1,"Testa Conexao...");
 lcd_out(2,1,"AT+CIPSTATUS    ");
 output[0] = '\0';
 indice_output = 0;
 segundo = 0;
 UART2_Write_Text("AT+CIPSTATUS\r\n");
 while(segundo < 1){

 if(UART2_Data_Ready()==1){
 output[indice_output] = UART2_Read();
 indice_output ++;
 segundo = 0;
 }
 }
 if(indice_output >= 510) indice_output = 510;
 output[indice_output] = '\0';
 if(strstr(output,"STATUS:2")){

 saida = 2;
 }else
 if(strstr(output,"STATUS:3")){

 saida = 3;
 }else
 if(strstr(output,"STATUS:4")){

 saida = 4;
 lcd_out(2,1,"Desconectado  ");
 }else
 if(strstr(output,"STATUS:5")){

 saida = 5;
 }else
 if(strstr(output,"busy")){

 saida = 6;
 }
 return(saida);
}

char verifica_web(){
 saida = 0;
 lcd_out(1,1,"Verifica WEB ...");
 lcd_out(2,1,"AT+CIPSTART=\"TCP");
 output[0] = '\0';
 indice_output = 0;
 segundo = 0;
 UART2_Write_Text("AT+CIPSTART=\"TCP\",\"192.168.43.118\",8080\r\n");

 while(segundo < 2){

 if(UART2_Data_Ready()){
 output[indice_output] = UART2_Read();
 indice_output ++;
 segundo = 0;
 }
 }
 if(indice_output >= 510) indice_output = 510;
 output[indice_output] = '\0';
 if(strstr(output,"CONNECT")){

 saida = 2;
 lcd_out(2,1,"CONNECT         ");
 }else
 if(strstr(output,"ALREADY")){

 saida = 3;
 lcd_out(2,1,"ALREADY         ");
 }else
 if(strstr(output,"CLOSED")){

 saida = 4;
 lcd_out(2,1,"CLOSED          ");
 }
 return(saida);
}

char envia_dados(){
 saida = 0;
 valor = 0;
 lcd_out(1,1,"Envia   Dados");
 lcd_out(2,1,"POST ");
 output[0] = '\0';
 indice_output = 0;
 segundo = 0;
 UART2_Write_Text("POST /workspace/Projeto/sensor/ HTTP/1.1\r\nHost: 192.168.43.118:8080\r\nContent-Type: application/x-www-form-urlencoded\r\nContent-Length:20\r\n\r\n{""id"":0,""valor"":1}\r\n\r\n");
 while(segundo < 3){
 if(UART2_Data_Ready()){
 output[indice_output] = UART2_Read();
 indice_output ++;
 segundo = 0;
 }
 }
 if(indice_output >= 510) indice_output = 510;
 output[indice_output] = '\0';
 if(strstr(output,"SEND OK")){
 saida = 1;
 lcd_out(2,1,"HTTP/1.1 200 OK ");
 }
 return(saida);
}

char envia_tamanho(){
 saida = 0;
 lcd_out(1,1,"Envia tamanho...");
 lcd_out(2,1,"AT+CIPSEND=55   ");
 output[0] = '\0';
 UART2_Write_Text("AT+CIPSEND=55\r\n");
 indice_output = 0;
 segundo = 0;
 while(segundo < 1){
 if(UART2_Data_Ready()){
 output[indice_output] = UART2_Read();
 indice_output ++;
 segundo = 0;
 }
 }
 if(indice_output >= 510) indice_output = 510;
 output[indice_output] = '\0';
 if(strstr(output,"OK\r\n>")){
 saida = 1;
 lcd_out(2,1,"OK >            ");
 }
 return(saida);
}

char chave_pa0(){
 saida = 0;
 if(gpioa_idr.b0 == 1){
 while(gpioa_idr.b0 == 1) delay_ms(100);
 saida = 1;
 }
 return (saida);
}

char chave_pe3(){
 saida = 0;
 if(gpioe_idr.b3 == 0){
 while(gpioe_idr.b3 == 0) delay_ms(100);
 saida = 1;
 }
 return (saida);
}

char chave_pe4(){
 saida = 0;
 if(gpioe_idr.b4 == 0){
 while(gpioe_idr.b4 == 0)delay_ms(100);
 saida = 1;
 }
 return(saida);
}

void setup_inicial(){
 gpio_config(&gpioe_base,
 _gpio_pinmask_3 | _gpio_pinmask_4,
 _gpio_cfg_mode_input | _gpio_cfg_pull_up);

 gpio_config(&gpioa_base,
 _gpio_pinmask_0,
 _gpio_cfg_mode_input | _gpio_cfg_pull_down);


 GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_4);

 ADC_Set_Input_Channel(_ADC_CHANNEL_4);
 ADC1_Init();
 uart2_init(115200);


 rcc_apb1enr.tim2en = 1;
 tim2_cr1.cen = 0;
 tim2_psc = 25000;
 tim2_arr = 500;
 nvic_intenable(ivt_int_tim2);
 tim2_dier.uie = 1;
 tim2_cr1.cen = 1;
 factory_reset();
 delay_ms(2000);

 for(i=0;i<=20;i++)
 {
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
 inttostr (tensao, txt3);
 }
 }
}

void conecta_ap(){
 UART2_write_text("AT+CWJAP_DEF=\"ASUS\",\"teste12345\"\r\n");
 Lcd_Out(1,1,"Conecta ao AP    ");
 Lcd_Out(2,1,"AT+CWJAP_DEF     ");
}

void configura_ap(){
 UART2_write_text("AT+CWMODE_DEF=3\r\n");
 Lcd_Out(1,1,"Config   ESP8266");
 Lcd_Out(2,1,"AT+CWMODE=3     ");

}

void factory_reset(){
 UART2_write_text("AT+RESTORE\r\n");
 Lcd_Out(1,1,"Factory Reset   ");
 delay_ms(250);
 Lcd_Out(2,1,"AT+RESTORE      ");
 delay_ms(250);
 Lcd_Cmd(_lcd_clear);
 delay_ms(250);
}

void timer2_interrupt() iv ivt_int_tim2 {

 tim2_sr.uif = 0;
 segundo ++;
 if(segundo >= 60) segundo = 0;
}
