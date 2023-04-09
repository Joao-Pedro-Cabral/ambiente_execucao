        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        >   ARG_PT1
        >   ARG_PT2
        >   ARG_PT3
        >   ARG_SN
        &   /0000
TEXTO   K   /000A
LOCAL   K   /0002
GLOBAL  K   /0004
DEBUG   K   /0000
                    ; TEXTO    
         LD ZERO    
OS_GETP  OS /057    ; Salva em AC o valor do SP
         MM POINTER
         SB CINCO 
         HM /0       
                    ; LOCAL
POINTER    K /0000
                    ; GLOBAL
CINCO     K /0FA8
ZERO     K /0000
                    ; ARGS print & scan
ARG_PT1 K   /0000
ARG_PT2 K   /0000
ARG_PT3 K   /0000
ARG_SN  K   /0000