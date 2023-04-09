        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        >   ARG_PT1
        >   ARG_PT2
        >   ARG_PT3
        >   ARG_SN
        <   PRINT
        &   /0000
TEXTO   K   /0004
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        SC  PRINT   ; print(A + B)
        HM  /0000
                    ; LOCAL
ARG_PT1 K   /06A9
ARG_PT2 K   /002B
ARG_PT3 K   /3F18
                    ; ARGS scan
ARG_SN  K   /0000