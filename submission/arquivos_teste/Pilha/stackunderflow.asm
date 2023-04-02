        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /0010
LOCAL   K   /000A
GLOBAL  K   /0008
DEBUG   K   /0000
                    ; TEXTO
      LV =45   ;
      PD /100  ;
      RS SOMA  ;              
      HM /0    ;
SOMA     JP /000    ; Subrotina Soma
         LD VALOR0  ;
         AD VALOR1  ;
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