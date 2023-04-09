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
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        SC  SUB  
        MM  C       ; C = A - B
        HM  /0000
SUB     K   /0000   ; Sub-rotina SUB 
        LD  A
        SB  B       ; AC = A - B
        RS  SUB     
                    ; LOCAL
A       K   /7300
B       K   /8FBB
C       K   /0000
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000