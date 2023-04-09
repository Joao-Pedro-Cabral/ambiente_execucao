        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        >   ARG_PT1
        >   ARG_PT2
        >   ARG_PT3
        >   ARG_SN
        &   /0000
TEXTO   K   /0046
LOCAL   K   /0002
GLOBAL  K   /0008
DEBUG   K   /0000
                    ; TEXTO
      LV =3   ;
      MM VALOR; Escreve em VALOR
      SC EMPI ; Chama Empilha
      SC DEMP ; Chama Desempilha
      LD VALOR; Carrega VALOR
      HM /0   ;
EMPI     JP /000    ; Subrotina Empilha
INIE     LD VALOR   ; Lê a variável global VALOR
         MM OS_ARGE ; Escreve VALOR para ser o argumento
         LD TRES    ; Carrega a constante 3 
         JP OS_CALLE;
OS_ARGE  $  =1      ; Apenas um argumento
OS_CALLE OS /157    ; Empilha VALOR
         LD ZERO    ;
OS_GETP  OS /057    ; Salva em AC o valor do SP
         SB DOIS    ; Subtrai 2
         MM OS_ARGSP; Escreve endereço para ser o argumento
         LD UM      ;
         JP OS_SETP ;
OS_ARGSP $  =1      ; Apenas um argumento
OS_SETP  OS /157    ; Set pointer 
         RS EMPI    ;
DEMP     JP /000    ; Subrotina Desempilha
INID     LD ZERO    ;
OS_GETPD OS /057    ; Get pointer
         AD DOIS    ; Soma 2
         MM OS_ARGD ; Escreve endereço para ser o argumento
         LD UM      ;
         JP OS_CALLD;
OS_ARGD  $  =1      ; Apenas um argumento
OS_CALLD OS /157    ; Set pointer 
         LD DOIS    ;
OS_GETST OS /057    ; Desempilha o valor
         MM VALOR   ; Salva o valor desempilhado em VALOR
         RS DEMP    ;
                    ; LOCAL
VALOR    K   /0000
                    ; GLOBAL
ZERO     K /0000;
UM       K /0001;
DOIS     K /0002;
TRES     K /0003; 
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000