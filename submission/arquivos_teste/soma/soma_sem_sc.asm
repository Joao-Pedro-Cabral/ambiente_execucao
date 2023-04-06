        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /000A
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        LD  A
        AD  B       ; AC = A + B
        MM  C       ; C = A + B
        PD  /100    ; print(C)
        HM  /0000     
                    ; LOCAL
A       K   /5300
B       K   /0045
C       K   /0000