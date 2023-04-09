        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        >   ARG_PT1
        >   ARG_PT2
        >   ARG_PT3
        >   ARG_SN
        &   /0000
TEXTO   K   /0008
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        LD  A  
        AD  B       ; AC = A + B
        PD  /100
        HM  /0000
                    ; LOCAL
A       K   /5300
B       K   /0045
C       K   /0000   
;
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000 
