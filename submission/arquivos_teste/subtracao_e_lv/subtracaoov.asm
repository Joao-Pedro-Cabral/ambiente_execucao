        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /000E
LOCAL   K   /0006
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        SC  SUB  
        MM  C       ; C = A - B
        HM  /0000
SUB     K   /0000   ; Sub-rotina SUB 
        LD  A
        SB  B       ; AC = A - B
        RS  SUB     
                    ; LOCAL
A       K   /7300
B       K   /8FBB
C       K   /0000