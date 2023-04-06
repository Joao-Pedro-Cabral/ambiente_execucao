        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /0024
LOCAL   K   /0008
GLOBAL  K   /0004
DEBUG   K   /0008
                    ; TEXTO
DEBUG1  GD  /000    
        MM  D       ; scan(D)
        SC  SUM  
        MM  C       ; C = A + B
        LD  D
        SB  PP      ; Desvio se a condição
DEBUG2  JZ  FIRSTIF ; do if for satisfeita
        LD  OO
        MM  C       ;   C = OO
DEBUG3  JP  PRINTC  
FIRSTIF LD  PP      ; if(D - PP == 0)
        MM  C       ;   C = PP
PRINTC  PD  /100    ; print(C)
DEBUG4  HM  /0000
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
        LD  DEBUG4
