        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        >   ARG_PT1
        >   ARG_PT2
        >   ARG_PT3
        >   ARG_SN
        &   /0000
TEXTO   K   /0018
LOCAL   K   /0006
GLOBAL  K   /0002
DEBUG   K   /0006
                    ; TEXTO
        SC  SUM  
        MM  C       ; C = A + B
SUB     SB  CONST
        JN  OUT_IF  ; if(C - CONST >= 0)
        LD  CONST   ;   C = CONST
CTE     MM  C
OUT_IF  LD  C
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
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000