        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        >   ARG_PT1
        >   ARG_PT2
        >   ARG_PT3
        >   ARG_SN
        <   SCAN
        &   /0000
TEXTO   K   /0008
LOCAL   K   /0004
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        LV  A
        MM  ARG_SN
        SC  SCAN    ; scan(B)
        HM  /0000
                    ; LOCAL
A       K   /0000
ARG_SN  K   /0000
                    ; ARGS print
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000