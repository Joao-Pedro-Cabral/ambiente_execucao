        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /000C
LOCAL   K   /0002
GLOBAL  K   /0004
DEBUG   K   /0000
                    ; TEXTO    
         LD ZERO    
OS_GETP  OS /057    ; Salva em AC o valor do SP
         MM POINTER
         SB CINCO
         PD /100 
         HM /0       
                    ; LOCAL
POINTER    K /0000
                    ; GLOBAL
CINCO     K /0FA8
ZERO     K /0000