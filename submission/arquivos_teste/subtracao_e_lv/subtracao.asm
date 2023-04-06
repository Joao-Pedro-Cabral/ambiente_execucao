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
        SC  SUB  
        MM  C       ; C = A - B
        PD  /100    ; print(C)
        HM  /0000
SUB     K   /0000   ; Sub-rotina SUB 
        LD  A
        SB  B       ; AC = A - B
        RS  SUB     
                    ; LOCAL
A       K   /5345
B       K   /0045
C       K   /0000