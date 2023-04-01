        <   TEXTO   ; Importar header do código-objeto
        <   LOCAL
        <   GLOBAL
        <   DEBUG
        &   /0000
                    ; Constantes
Cte2    K   /0002  
Cte4    K   /0004
Cte5    K   /0005
Cte6    K   /0006
Cte7    K   /0007
CteA    K   /000A     
CteB    K   /000B 
Cte1000 K   /1000  
READ    K   /8000   
WRITE   K   /9000

        &   /0100
                    ; Variáveis
SP      K   /0FFE   ; Topo da pilha -> Primeiro endereço vazio 
TOPTEXT K   /0008   ; Primeiro endereço da área de instruções
TOPLOC  K   /0000   ; Primeiro endereço da área de variáveis locais
TOPGLO  K   /0000   ; Primeiro endereço da área de variáveis globais
TOPDEB  K   /0000   ; Primeiro endereço da área de linhas de depuração    

        &   /0200
PONTEXT K   /0000   ; Endereço atual do texto
                    ; Programa Principal
MAIN    LD  TOPTEXT
        AD  TEXTO
        MM  TOPLOC  ; TOPLOC = TOPTEXT + TEXTO
        AD  LOCAL   
        MM  TOPGLO  ; TOPGLO = TOPLOC + LOCAL
        AD  GLOBAL   
        MM  TOPDEB  ; TOPDEB = TOPGLO + GLOBAL
        LD  TOPTEXT
        AD  READ    ; PONTEXT = TOPTEXT + READ
LOOPM   MM  PONTEXT 
        SB  TOPLOC
        JZ  FIMAIN  ; PONTEXT = TOPLOC -> Todas as instruções foram executadas
        LD  PONTEXT 
        MM  RD_INST 
RD_INST K   /0000   ; Obter instrução 
        MM  INSTRU
        SC  TRATOP  ; Tratar e executar operação
        MM  ACUMU   ; ACUMU = Valor do acumulador após execução
        LD  PONTEXT
        AD  Cte2    ; PONTEXT = PONTEXT + 2
        JP  LOOPM   ; Loop da rotina principal
FIMAIN  HM  FIMAIN  ; Fim da execução

        &   /0300
INSTRU  K   /0000   ; Instrução a ser tratada
ACUMU   K   /0000   ; Valor do Acumulador usado na execução
OPCODE  K   /0000   ; Opcode da instrução
                    ; Trata operação
TRATOP  K   /0000
        LD  INSTRU
        DV  Cte1000 ; AC = Opcode
        MM  OPCODE
        SB  CteA    
        JZ  TrataA  ; OPCODE = A
        LD  OPCODE
        SB  CteB
        JZ  TrataB  ; OPCODE = B
LD_EXEC LD  INSTRU  ; Carrega a instrução a ser executada
        MM  EXEC
        LD  ACUMU   ; Restaura valor antigo do acumulador
EXEC    K   /0000   ; Executa a instrução
        RS  TRATOP  ; Fim da subrotina
TrataA  SC  EMP     ; A: Empilhar variáveis locais
        JP  LD_EXEC ; Fim do tratamento
TrataB  SC  DMP     ; B: Desempilhar variáveis locais
        JP  LD_EXEC ; Fim do tratamento


        &   /0400
PONTLOC K   /0000   ; Ponteiro do endereço atual da área de variáveis locais
                    ; Empilhar
PONTGLO K   /0000   ; Primeiro endereço da área de variáveis globais
TEMPEMP K   /0000   ; Variável a ser armazenada na pilha
EMP     K   /0000 
        LD  TOPGLO   
        AD  READ
        MM  PONTGLO ; PONTGLO = TOPGLO + READ   
        LD  TOPLOC 
        AD  READ    ; PONTLOC = READ + TOPLOC -> Ponteiro de Leitura
LOOPEMP MM  PONTLOC 
        SB  PONTGLO 
        JZ  FIMEMP  ; PONTGLO = PONTLOC -> Fim da subrotina(todas as variáveis foram empilhadas)
        LD  PONTLOC 
        MM  LEITURA
LEITURA K   /0000   ; Leitura da variável apontada pelo PONTLOC
        MM  TEMPEMP
        LD  SP
        AD  WRITE   
        MM  WRT_TOP ; WRT_TOP = WRITE + SP
        LD  TEMPEMP 
WRT_TOP K   /0000   ; Mem[SP] = TEMPEMP 
        LD  SP      
        SB  Cte2
        MM  SP      ; SP = SP - 2 -> Empilhar
        LD  PONTLOC  
        AD  Cte2    ; PONTLOC = PONTLOC + 2
        JP  LOOPEMP ; Recomeçar o LOOP
FIMEMP  RS  EMP     ; Fim da subrotina

        &   /0500
                    ; Desempilhar
PTOPLOC K   /0000   ; Ponteiro da primeira variável da área de variáveis locais
TEMPDMP K   /0000   ; Variável a ser armazenada na memória local
DMP     K   /0000
        LD  TOPLOC
        AD  WRITE
        MM  PTOPLOC ; PTOPLOC = TOPLOC + WRITE
        LD  TOPGLO  
        SB  Cte2
        AD  WRITE
LOOPDMP MM  PONTLOC ; PONTLOC = TOPGLO - 2 + WRITE
        SB  PTOPLOC 
        JN  FIMDMP  ; PONTLOC < PTOPLOC -> Fim da subrotina
        LD  SP
        AD  Cte2
        MM  SP      ; SP = SP + 2
        AD  READ
        MM  RD_TOP  ; RD_TOP = READ + SP + 2
RD_TOP  K   /0000
        MM  TEMPDMP ; TEMPDMP = Topo da pilha
        LD  PONTLOC 
        MM  ESCRITA 
        LD  TEMPDMP
ESCRITA K   /0000   ; Mem[PONTLOC] = TEMPDMP
        LD  PONTLOC
        SB  Cte2    ; PONTLOC = PONTLOC - 2
        JP  LOOPDMP ; Recomeçar o LOP
FIMDMP  RS  DMP     ; Fim da subrotina
        #   MAIN    ; Executar a função principal