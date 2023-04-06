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
        MM  E       ; E = (A*C) + (B/D)
        PD  /100    ; print(E)
        HM  /0000
SUM     K   /0000   ; Sub-rotina SUM 
        SC  MUL     ; AC = (A*C)
        MM  TEMP    ; TEMP = (A*C)
        SC  DIV     ; AC = (B/D)
        AD  TEMP    ; AC = (A*C) + (B/D)
        RS  SUM
MUL     K   /0000   ; Sub-rotina MUL 
        LD  A       
        ML  C       ; AC = A * C
        RS  MUL
DIV     K   /0000   ; Sub-rotina DIV 
        LD  B       
        DV  D       ; AC = B / D
        RS  DIV
                    ; LOCAL
A       K   /0053
B       K   /0450
C       K   /0100
D       K   /0010
E       K   /0000
TEMP    K   /0000