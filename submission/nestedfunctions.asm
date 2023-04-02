        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /0024
LOCAL   K   /000C
GLOBAL  K   /0000
DEBUG   K   /0008
                    ; TEXTO
DEBUG1  SC  SUM  
        MM  E
        PD  /100
        HM  /0000
SUM     K   /0000   ; Sub-rotina SUM 
        SC  MUL     ; AC = (A*C)
        MM  TEMP    ; TEMP = (A*C)
        SC  DIV     ; AC = (B/D)
        AD  TEMP    ; AC = (A*C) + (B/D)
DEBUG2  RS  SUM
MUL     K   /0000   ; Sub-rotina MUL 
        LD  A       
DEBUG3  ML  C       ; AC = A * C
        RS  MUL
DIV     K   /0000   ; Sub-rotina DIV 
        LD  B       
DEBUG4  DV  D       ; AC = B / D
        RS  DIV
                    ; LOCAL
A       K   /0053
B       K   /0450
C       K   /0100
D       K   /0010
E       K   /0000
TEMP    K   /0000
                    ; DEBUG
        LD  DEBUG1
        LD  DEBUG2
        LD  DEBUG3
        LD  DEBUG4