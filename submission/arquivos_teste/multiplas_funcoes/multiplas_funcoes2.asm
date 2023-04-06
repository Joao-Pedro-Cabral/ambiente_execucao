        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /0024
LOCAL   K   /000C
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        SC  SUM  
        MM  E       ; E = (A + C) + (B + D)
        PD  /100    ; print(E)
        HM  /0000
SUM     K   /0000   ; Sub-rotina SUM 
        SC  SUM1    ; AC = (A + C)
        MM  TEMP    ; TEMP = (A + C)
        SC  SUM2    ; AC = (B + D)
        AD  TEMP    ; AC = (A + C) + (B + D)
        RS  SUM
SUM1    K   /0000   ; Sub-rotina SUM1 
        LD  A       
        AD  C       ; AC = A + C
        RS  SUM1
SUM2    K   /0000   ; Sub-rotina SUM2 
        LD  B       
        AD  D       ; AC = B + D
        RS  SUM2
                    ; LOCAL
A       K   /5101
B       K   /0013
C       K   /0222
D       K   /0110
E       K   /0000
TEMP    K   /0000