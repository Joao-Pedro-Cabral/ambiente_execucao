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
        SC  DIV  
        MM  C       ; C = A / B
        HM  /0000
DIV     K   /0000   ; Sub-rotina DIV 
        LD  A
        DV  B       ; AC = A / B
        RS  DIV     
                    ; LOCAL
A       K   /5300
B       K   /0000
C       K   /0000
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000