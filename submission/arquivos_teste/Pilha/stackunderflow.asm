        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        >   ARG_PT1
        >   ARG_PT2
        >   ARG_PT3
        >   ARG_SN
        &   /0000
TEXTO   K   /000E
LOCAL   K   /000A
GLOBAL  K   /0008
DEBUG   K   /0000
                    ; TEXTO
      LV =45   ;
      RS SOMA  ;  Retorno indevido de subrotina            
      HM /0    ;
SOMA     JP /000    ; Subrotina Soma
         LD VALOR0  ;
         AD VALOR1  ; AC = VALOR0 + VALOR1
         RS SOMA    ;     
                    ; LOCAL
VALOR0 K /0000;
VALOR1 K /0000;
VALOR2 K /0000;
VALOR3 K /0000;
VALOR4 K /0000;
                    ; GLOBAL
VALOR5 K /0000;
VALOR6 K /0000;
VALOR7 K /0000;
VALOR8 K /0000;
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000