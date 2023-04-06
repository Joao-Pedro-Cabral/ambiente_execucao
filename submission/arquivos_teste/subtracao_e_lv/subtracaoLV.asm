        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /0010
LOCAL   K   /0004
GLOBAL  K   /0000
DEBUG   K   /0000
                    ; TEXTO
        SC  SUB  
        MM  B       ; B = 800 - A
        PD  /100    ; print(B)
        HM  /0000
SUB     K   /0000   ; Sub-rotina SUB 
        LV  =800
        SB  A       ; AC = 800 - A
        RS  SUB     
                    ; LOCAL
A       K   /0034
B       K   /0000