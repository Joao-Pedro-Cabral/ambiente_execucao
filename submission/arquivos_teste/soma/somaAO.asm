        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /000E
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        SC  SUM  
        MM  C       ; C = A + B
        HM  /0000
SUM     K   /0000   ; Sub-rotina SUM 
        LD  A
        AD  B       ; AC = A + B
        RS  SUM     
                    ; LOCAL
A       K   /7300
B       K   /7045
C       K   /0000