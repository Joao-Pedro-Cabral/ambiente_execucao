        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /0012
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        SC  MUL  
        MM  TEXTO
        LD  C
        PD  /100
        HM  /0000
MUL     K   /0000   ; Sub-rotina SUM 
        LD  A
        ML  B       ; AC = A * B
        RS  MUL     
                    ; LOCAL
A       K   /0300
B       K   /0010
C       K   /0000