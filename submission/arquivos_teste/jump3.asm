        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /0022
LOCAL   K   /0008
GLOBAL  K   /0002
DEBUG   K   /0000
                    ; TEXTO
        GD  /000
        MM  D
        SC  SUM  
        MM  C
        LD  D
        SB  CONST
        JN  ELSE
        LD  C
        PD  /100
        JP  END_CD
ELSE    LD  CONST
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
D       K   /0000
                    ; GLOBAL
CONST   K   /5050
