        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        >   ARG_PT1
        >   ARG_PT2
        >   ARG_PT3
        >   ARG_SN
        &   /0000
TEXTO   K   /000C
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0004
                    ; TEXTO
        LV  =2     
        MM  B       ; B = 2
DEBUG1  LD  A
        DV  B
        MM  C       ; C = A / B
DEBUG2  HM  /0000 
                    ; LOCAL
A       K   /000A
B       K   /0000
C       K   /0000
                    ; DEBUG
        LD  DEBUG1
        LD  DEBUG2
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000