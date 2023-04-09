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
DEBUG   K   /0004
                    ; TEXTO
        SC  SUM  
        MM  C       ; C = A + B
DEBUG1  HM  /0000
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
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000