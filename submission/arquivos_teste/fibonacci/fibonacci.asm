        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /002E
LOCAL   K   /0006
GLOBAL  K   /0006
DEBUG   K   /0000
                    ; TEXTO    
        SC  FIB
        MM  B
        PD  /100
        HM  /0
FIB     K   /0000   ; Subrotina FIB
        LD  A
        JZ  N_ZERO  ; if(n == 0)
        LD  A
        SB  UM
        JZ  N_UM    ; if(n == 1)
        LD  A
        SB  UM      ; n - 1
        SC  FIB     ; fib(n - 1)
        MM  TEMP    ; armazena fib(n - 1)
        LD  A
        SB  DOIS    ; n - 2
        SC  FIB     ; fib(n - 2)
        AD  TEMP    ; fib(n - 1) + fib(n - 2)
        RS  FIB    
N_ZERO  LD  ZERO
        RS  FIB
N_UM    LD  UM 
        RS  FIB
                    ; LOCAL
A       K   /000A
B       K   /0000  
TEMP    K   /0000
                    ; GLOBAL
ZERO    K   /0000
UM      K   /0001
DOIS    K   /0002 