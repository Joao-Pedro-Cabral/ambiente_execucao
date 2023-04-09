        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        >   ARG_PT1
        >   ARG_PT2
        >   ARG_PT3
        >   ARG_SN
        &   /0000
TEXTO   K   /0034
LOCAL   K   /000E
GLOBAL  K   /0006
DEBUG   K   /0000
                    ; TEXTO    
        SC  FIB
        MM  B       ; B = fib(A)
        HM  /0
FIB     K   /0000   ; Subrotina FIB
        LD  A
        JZ  N_ZERO  ; if(n == 0)
        LD  A
        SB  UM
        JZ  N_UM    ; if(n == 1)
        LD  A
        SB  UM      ; n - 1
        MM  A
        SC  FIB     ; fib(n - 1)
        MM  TEMP    ; armazena fib(n - 1)
        LD  A
        SB  UM      ; n - 2
        MM  A
        SC  FIB     ; fib(n - 2)
        AD  TEMP    ; fib(n - 1) + fib(n - 2)
        RS  FIB    
N_ZERO  LD  ZERO    ; if(n == 0) return 0
        RS  FIB
N_UM    LD  UM      ; if(n == 1) return 1
        RS  FIB
                    ; LOCAL
A       K   /0002
B       K   /0000  
TEMP    K   /0000
                    ; GLOBAL
ZERO    K   /0000
UM      K   /0001
DOIS    K   /0002 
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000