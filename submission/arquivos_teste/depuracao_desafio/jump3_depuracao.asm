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
DEBUG   K   /0008
                    ; TEXTO
DEBUG1  LV  =3   
        MM  D       ; D = 3
        SC  SUM  
        MM  C       ; C = A + B
        AD  D
        SB  PP      ; Desvio se a condição
DEBUG2  JZ  FIRSTIF ; do if for satisfeita
        LD  OO
        MM  C       ;   C = OO
DEBUG3  JP  END 
FIRSTIF LD  PP      ; if(D - PP == 0)
        MM  C       ;   C = PP
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
PP      K   /5050
OO      K   /4F4F
                    ; DEBUG
        LD  DEBUG1
        LD  DEBUG2
        LD  DEBUG3
        LD  END
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000