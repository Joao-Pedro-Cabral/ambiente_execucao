> STRLEN
> STRCMP
> STRCMP_A
> STRCMP_B
;
; Variáveis e constantes
; 
     & /010
ADDR    K  /0000; Armazena o endereço atual
LEN     K  /0000; Armazena o tamanho atual
LOAD    LD /000 ; Instrução de LOAD
CHARS   K  /0000; Armazena os dois caracteres atuais
CONST   K  /0100; Constante 100(hex)
DOIS    K  /0002; Constante  2
UM      K  /0001; Constante  1
ZERO    K  /0000; Constante  0 
MINUSUM K  /FFFF; Constante -1
;
;
; STRLEN
;
     & /100
STRLEN JP /000  ; Início da função STRLEN
       MM ADDR  ; Escreve o endereço inicial
       LD ZERO  ; Carrega a constante zero
       MM LEN   ; Zera a variável tamanho
INILEN LD ADDR  ; Carrega o endereço atual
       AD LOAD  ; Prepara a instrução de captura de caracteres
       MM NEXT  ; Escreve na próxima instrução
NEXT   LD /000  ; Recebe a instrução de LOAD
       MM CHARS ; Armazena os dois caracteres buscados
       DV CONST ; Se for 00__ obtém-se zero
       JZ ZERO1 ; Desvio se for igual a zero
       LD CHARS ; Recupera os dois caracteres
       ML CONST ; Se for __00 obtém-se zero
       JZ ZERO2 ; Desvio se for igual a zero
       LD LEN   ; Carrega o tamanho atual
       AD DOIS  ; Soma dois
       MM LEN   ; Escreve o tamanho atual
       LD ADDR  ; Carrega o endereço atual
       AD DOIS  ; Soma dois
       MM ADDR  ; Escreve o endereço atual
       JP INILEN; Volta para o início do loop
ZERO1  LD LEN   ; Carrega o tamanho atual
       JP ENDLEN; Desvio para o final
ZERO2  LD LEN   ; Carrega o tamanho atual
       AD UM    ; Soma um
ENDLEN RS STRLEN; Retorno
;
; STRCMP - parâmetros
;
STRCMP_A K /310 ; 
STRCMP_B K /320 ;
LEN_A    K /0000;
;
;  STRCMP
;
      & /200
STRCMP JP /000    ; Função STRCMP
       LD STRCMP_A; Carrega o endereço inicial da string A
       SC STRLEN  ; Obtém o tamanho da string A 
       MM LEN_A   ; Armazena o tamanho
       LD STRCMP_B; Carrega o endereço inicial da string B
       SC STRLEN  ; Obtém o tamanho da string B
       SB LEN_A   ; LEN_B - LEN_A
       JZ IFZERO  ; LEN_B = LEN_A
       JN IFLTZ   ; LEN_B < LEN_A
       LD MINUSUM ; LEN_B > LEN_A
       JP ENDCMP  ; Desvio para o final
IFZERO LD ZERO    ; Carrega zero
       JP ENDCMP  ; Desvio para o final
IFLTZ  LD UM      ; Carrega um
ENDCMP RS STRCMP  ; Retorno
;  
; Programa teste
;       
      & /300
PROG SC STRCMP; Chamada da função
     PD /300   ; Escreve no arquivo
     HM /0     ; Encerra o programa
;
; String
;
       @ /310
        K /4552;  E R
        K /524F;  R O
        K /0032; /0 2
;
       @ /320
        K /4545;  E E
        K /5252;  R R
        K /5252;  R R
        K /4F4F;  O O
        K /4F00;  O /0

