        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /001C
LOCAL   K   /0004
GLOBAL  K   /0002
DEBUG   K   /0000
                    ; TEXTO
        SC  FAT 
        PD  /100
        HM  /0
FAT     K   /0000
        LD  N 
        MM  M
        JZ  N_ZERO
        SB  UM
        MM  N
        SC  FAT
        ML  M
        RS  FAT
N_ZERO  LD  UM
        RS  FAT
                    ; LOCAL
N       K   /0002   
M       K   /0000
                    ; GLOBAL
UM      K   /0001
