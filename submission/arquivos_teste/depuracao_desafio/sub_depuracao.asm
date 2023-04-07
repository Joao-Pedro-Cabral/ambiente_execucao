        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /000E
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0004
                    ; TEXTO
        LV  =2     
        MM  B       ; B = 2
DEBUG1  LD  A
        DV  B
        MM  C       ; C = A / B
DEBUG2  PD  /100    ; print(C)
        HM  /0000 
                    ; LOCAL
A       K   /000A
B       K   /0000
C       K   /0000
                    ; DEBUG
        LD  DEBUG1
        LD  DEBUG2