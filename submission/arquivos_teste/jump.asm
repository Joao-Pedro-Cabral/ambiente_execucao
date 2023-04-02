        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /0016
LOCAL   K   /0006
GLOBAL  K   /0002
DEBUG   K   /0000
                    ; TEXTO
        SC  SUM  
        MM  C
        SB  CONST
        JN  END_CD
        LD  C
        PD  /100
END_CD  HM  /0000
SUM     K   /0000   ; Sub-rotina SUM 
        LD  A
        AD  B       ; AC = A + B
        RS  SUM     
                    ; LOCAL
A       K   /5300
B       K   /0045
C       K   /0000
                    ; GLOBAL
CONST   K   /0020
