        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        >   ARG_PT1
        >   ARG_PT2
        >   ARG_PT3
        >   ARG_SN
        &   /0000
TEXTO   K   /0022
LOCAL   K   /0008
GLOBAL  K   /0004
DEBUG   K   /0000
                    ; TEXTO
        LV  =3
        MM  D       ; D = 3
        SC  SUM  
        MM  C       ; C = A + B
        AD  D
        SB  P      ; Desvio se a condição 
        JZ  FIRSTIF ; do if for satisfeita
        LD  O
        MM  C       ; C = O
        JP  END
FIRSTIF LD  P      ; if(D - P == 0)
        MM  C       ;  C = P
END     HM  /0000
SUM     K   /0000   ; Sub-rotina SUM 
        LD  A
        AD  B       ; AC = A + B
        RS  SUM     
                    ; LOCAL
A       K   /5300
B       K   /0045
C       K   /0000
D       K   /0000
                    ; GLOBAL
P      K   /5050
O      K   /4F4F
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000