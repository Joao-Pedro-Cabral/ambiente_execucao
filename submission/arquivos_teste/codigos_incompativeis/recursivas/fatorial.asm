        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /001A
LOCAL   K   /0004
GLOBAL  K   /0002
DEBUG   K   /0000
                    ; TEXTO
        SC  FAT 
        HM  /0
FAT     K   /0000   ; Subrotina do fatorial
        LD  N       
        MM  M       ; Armazena N em uma temporária
        JZ  N_ZERO  ; Desvio - if(N == 0) 
        SB  UM
        MM  N       ; N = N - 1
        SC  FAT     ; fat(N - 1)
        ML  M       
        RS  FAT     ; return N*fat(N - 1)
N_ZERO  LD  UM      ; if(N == 0) return 1
        RS  FAT
                    ; LOCAL
N       K   /0002   
M       K   /0000
                    ; GLOBAL
UM      K   /0001
