        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /0010
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0004
                    ; TEXTO
        SC  SUM  
        MM  C
DEBUG1  PD  /100
        HM  /0000
SUM     K   /0000   ; Sub-rotina SUM 
        LD  A
DEBUG2  AD  B       ; AC = A + B
        RS  SUM     
                    ; LOCAL
A       K   /5300
B       K   /0045
C       K   /0000
                    ; DEBUG
        LD  DEBUG1
        LD  DEBUG2