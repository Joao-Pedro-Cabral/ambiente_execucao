        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /0010
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        SC  DIV  
        MM  C
        PD  /100
        HM  /0000
DIV     K   /0000   ; Sub-rotina SUM 
        LD  A
        DV  B       ; AC = A / B
        RS  DIV     
                    ; LOCAL
A       K   /5300
B       K   /0000
C       K   /0000