        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /001A
LOCAL   K   /0006
GLOBAL  K   /0002
DEBUG   K   /0006
                    ; TEXTO
        SC  SUM  
        MM  C
SUB     SB  CONST
        JN  OUT_IF
        LD  CONST
CTE     MM  C
OUT_IF  LD  C
        PD  /100
        HM  /0000
SUM     K   /0000   ; Sub-rotina SUM 
        LD  A
        AD  B       ; AC = A + B
        RS  SUM     
                    ; LOCAL
A       K   /5300
B       K   /0045
C       K   /0000
                    ; GLOBAL
CONST   K   /0040
                    ; DEBUG
        LD  OUT_IF
        LD  SUB
        LD  CTE