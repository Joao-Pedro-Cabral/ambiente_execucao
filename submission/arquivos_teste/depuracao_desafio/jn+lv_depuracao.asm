        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /001C
LOCAL   K   /0006
GLOBAL  K   /0002
DEBUG   K   /0006
                    ; TEXTO
        SC  SUM  
        MM  C
        SB  CONST
DEBUG1  JN  OUT_IF
        LD  CONST
        MM  C
OUT_IF  LD  C
        PD  /100
DEBUG2  HM  /0000
SUM     K   /0000   ; Sub-rotina SUM 
DEBUG3  LV  =8
        MM  A
        AD  B       ; AC = A + B
        RS  SUM     
                    ; LOCAL
A       K   /0000
B       K   /0025
C       K   /0000
                    ; GLOBAL
CONST   K   /0045
                    ; DEBUG
        LD  DEBUG1
        LD  DEBUG2
        LD  DEBUG3