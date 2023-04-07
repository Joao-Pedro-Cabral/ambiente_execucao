        <   TEXTO   ; Importar header do código-objeto
        <   LOCAL
        <   GLOBAL
        <   DEBUG
        &   /0000
                    ; Constantes
                    ; Determinar o OPCODE
Cte1    K   /0001
Cte2    K   /0002  
Cte4    K   /0004
Cte5    K   /0005
Cte6    K   /0006
Cte7    K   /0007
Cte8    K   /0008
Cte9    K   /0009
CteA    K   /000A     
CteB    K   /000B 
CteD    K   /000D
CteE    K   /000E
CteF    K   /000F
                    ; Auxiliares para operações aritméticas
Cte800  K   /0800
Cte1000 K   /1000  
READ    K   /8000   
WRITE   K   /9000
Cte_1   K   /FFFF
                    ; Mensagens de Erro    
AO      K   /414F
DZ      K   /445A
NA      K   /4E41
SF      K   /5346
SO      K   /534F
SU      K   /5355

        &   /0100
                    ; Variáveis
SP      K   /0FFE   ; Topo da pilha -> Primeiro endereço vazio 
TOPTEXT K   /0000   ; Primeiro endereço da área de instruções
TOPLOC  K   /0000   ; Primeiro endereço da área de variáveis locais
TOPGLO  K   /0000   ; Primeiro endereço da área de variáveis globais
TOPDEB  K   /0000   ; Primeiro endereço da área de linhas de depuração 
TOPLIV  K   /0000   ; Primeiro endereço da área livre   

        &   /0200
PONTEXT K   /0000   ; Endereço atual do texto
PONTLIV K   /0000   ; 1º endereço livre somado com READ
                    ; Programa Principal
MAIN    LV  TEXTO
        AD  Cte8   
        MM  TOPTEXT ; TOPTEXT = 8 + & TEXTO
        AD  TEXTO
        MM  TOPLOC  ; TOPLOC = TOPTEXT + TEXTO
        AD  LOCAL   
        MM  TOPGLO  ; TOPGLO = TOPLOC + LOCAL
        AD  GLOBAL   
        MM  TOPDEB  ; TOPDEB = TOPGLO + GLOBAL
        AD  DEBUG 
        MM  TOPLIV  ; TOPLIV = TOPDEB + DEBUG
        AD  READ
        MM  PONTLIV
        LD  TOPTEXT
        AD  READ    ; PONTEXT = TOPTEXT + READ
LOOPM   MM  PONTEXT 
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
VAR     K   /0000   ; Variável da instrução
ADDR    K   /0000   ; Endereço da variável da instrução
OPCODE  K   /0000   ; Opcode da instrução
                    ; Trata operação
TRATOP  K   /0000
        LD  INSTRU
        JN  FIXINST ; Corrigir instruções negativas
        DV  Cte1000 ; AC = Opcode
FIXED   MM  OPCODE
        JZ  Trata0  ; OPCODE = 0
        SB  Cte1
        JZ  Trata1  ; OPCODE = 1
        LD  OPCODE
        SB  Cte2
        JZ  Trata2  ; OPCODE = 2
        LD  OPCODE
        SB  Cte4
        JZ  Trata4  ; OPCODE = 4
        LD  OPCODE  
        SB  Cte5
        JZ  Trata5  ; OPCODE = 5
        LD  OPCODE  
        SB  Cte6
        JZ  Trata6  ; OPCODE = 6    
        LD  OPCODE  
        SB  Cte7
        JZ  Trata7  ; OPCODE = 7   
        LD  OPCODE  
        SB  Cte8
        JZ  Trata89 ; OPCODE = 8   
        LD  OPCODE  
        SB  Cte9
        JZ  Trata89 ; OPCODE = 9   
        LD  OPCODE 
        SB  CteA    
        JZ  TrataA  ; OPCODE = A
        LD  OPCODE
        SB  CteB
        JZ  TrataB  ; OPCODE = B
        LD  OPCODE
        SB  CteF
        JZ  TrataF  ; OPCODE = F
LD_EXEC SC  DEPURA  ; Depuração
        LD  INSTRU  ; Carrega a instrução a ser executada(OPCODE = 4 a 9 ou C ou D)
        MM  EXEC
        LD  ACUMU   ; Restaura valor antigo do acumulador
EXEC    K   /0000   ; Executa a instrução
        RS  TRATOP  ; Fim da subrotina
FIXINST DV  Cte2
        AD  READ              
        DV  Cte800            
        JP  FIXED

Trata0  SC  TratADR  ; Determina se há erro de segmentação
        SC  DEPURA  ; Depuração
        LD  ADDR    
        AD  READ    ; PONTEXT = ADDR + READ
        JP  LOOPM   ; Pulo para a próxima iteração do loop(sem terminar TRATOP) -> JP não altera AC

Trata1  SC  TratADR  ; Determina se há erro de segmentação
        SC  DEPURA  ; Depuração
        LD  ACUMU   
        JZ  PONT1   
        RS  TRATOP  ; JZ falhou -> Executar próxima instrução em sequência
PONT1   LD  ADDR    
        AD  READ    ; PONTEXT = ADDR + READ (sucesso no JZ)
        JP  LOOPM   ; Pulo para a próxima iteração do loop(sem terminar TRATOP) -> JZ não altera AC  

Trata2  SC  TratADR  ; Determina se há erro de segmentação
        SC  DEPURA  ; Depuração
        LD  ACUMU   
        JN  PONT2   
        RS  TRATOP  ; JN falhou -> Executar próxima instrução em sequência
PONT2   LD  ADDR    
        AD  READ    ; PONTEXT = ADDR + READ (sucesso no JN)
        JP  LOOPM   ; Pulo para a próxima iteração do loop(sem terminar TRATOP) -> JN não altera AC

Trata4  SC  TratADR
        SC  GETVAR  ; Obter a variável
        JN  NEG4    ; Variável negativa
        LD  ACUMU   
        JN  LD_EXEC ; ACUMU < 0 e VAR > 0 -> Sem overflow
        AD  VAR    
        JN  ERRORAO  ; VAR + ACUMU < 0, VAR > 0 e ACUMU > 0 -> Overflow
        JP  LD_EXEC ; VAR + ACUMU > 0, VAR > 0, ACUMU > 0 -> Sem Overflow
NEG4    LD  ACUMU
        JN  NEG4_2
        JP  LD_EXEC ; ACUMU > 0 e VAR < 0 -> Sem overflow
NEG4_2  AD  VAR
        JN  LD_EXEC ; VAR + ACUMU < 0, VAR < 0 e ACUMU < 0 -> Sem Overflow
        JP  ERRORAO
        
Trata5  SC  TratADR
        SC  GETVAR  ; Obter a variável
        JN  NEG5    ; Variável negativa
        LD  ACUMU   
        JN  NEG5_2 
        JP  LD_EXEC ; ACUMU > 0 e VAR > 0 -> Sem overflow
NEG5_2  SB  VAR    
        JN  LD_EXEC ; VAR + ACUMU < 0, VAR > 0 e ACUMU < 0 -> Sem overflow
        JP  ERRORAO  ; Overflow 
NEG5    LD  ACUMU
        JN  LD_EXEC ; VAR < 0 e ACUMU < 0 -> Sem overflow
        SB  VAR
        JN  ERRORAO  ; VAR + ACUMU < 0, VAR < 0 e ACUMU > 0 -> Overflow
        JP  LD_EXEC ; Sem overflow

VAR2     K  /0000   ; Temporário do Trata6

Trata6  SC  TratADR
        SC  GETVAR  ; Obter variável
        ; JN  MVAR_1  VAR < 0 -> Inverter sinal
CHECKAC MM  VAR     ; VAR = -VAR
        LD  ACUMU
        ; JN  MAC_1
MULTI   MM  VAR2
        JZ  LD_EXEC
        ML  VAR
        DV  VAR2    ; AC = |VAR| * |ACUMU| / |ACUMU|
        SB  VAR     ; AC = AC - VAR   
        JZ  LD_EXEC
ERRORAO LD  AO      ; AO, arithmetic overflow
        PD  /100
        HM  FIMAIN

MVAR_1  ML  Cte_1   ; VAR > 0
        JP  CHECKAC
MAC_1   ML  Cte_1   ; ACUMU > 0
        JP  MULTI


Trata7  SC  TratADR
        SC  GETVAR  ; Obter variável
        JZ  ERROR7  ; Divisão por 0
        JP  LD_EXEC ; Fim da tratativa
ERROR7  LD  DZ      ; Error de divisão
        PD  /100    
        HM  FIMAIN  ; Fim da execução

Trata89 SC  TratADR  ; Confere se há erro de segmentação (Mesmo código para 8 e 9)
        JP  LD_EXEC ; Fim do tratamento

TrataA  SC  TratADR  ; Checa erros de segmentação
        SC  DEPURA  ; Depuração
        SC  EMP     ; A: Empilhar variáveis locais
        LD  ADDR        
        AD  WRITE
        MM  WRTA
        LD  PONTEXT
        AD  Cte2
        SB  READ
WRTA    K   /0000   ; Endereço de retorno da subrotina: PONTEXT + 2
        LD  ADDR
        AD  READ
        MM  PONTEXT ; PONTEXT = ADDR + READ
        LD  ACUMU
        RS  TRATOP  ; Fim do tratamento

TrataB  SC  TratADR  ; Checa erros de segmentação
        SC  DEPURA  ; Depuração
        SC  DMP     ; B: Desempilhar variáveis locais
        LD  ADDR
        AD  READ
        MM  READB
READB   K   /0000
        AD  READ
        MM  PONTEXT ; PONTEXT = Endereço de retorno da subrotina
        JP  LOOPM   ; Pulo para a próxima iteração do loop(sem terminar TRATOP)

TrataF  LD  NA      ; OS: Não suportado por C-- -> Proibido!
        PD  /100    ; Imprimir NA
        HM  FIMAIN  ; Fim da subrotina

                    ; Sub-rotina TratADR(RESS)
TratADR K   /0000
        SC  GETADDR ; Obter o endereço do OI
        SB  TOPTEXT 
        JN  ERRORSF ; ADDR < TOPTEXT -> Segmentation Fault
        LD  ADDR
        SB  TOPDEB
        JN  NEXT    ; Seguir para a próxima parte do tratamento
ERRORSF LD  SF      ; Erro de segmentação
        PD  /100
        HM  FIMAIN
NEXT    RS  TratADR  ; Retorno da subrotina


                    ; GETVAR
GETVAR  K   /0000
        LD  ADDR
        AD  READ
        MM  RADDR   ; RADDR = ADDR + 8000
RADDR   K   /0000   ; Obtêm a variável da subtracao
        MM  VAR  
        RS  GETVAR

                    ; GETADDR
GETADDR K   /0000
        LD  OPCODE
        ML  Cte1000
        SB  INSTRU
        ML  Cte_1
        MM  ADDR    ; ADDR = (OPCODE*1000 - INSTRU)*(-1)
        RS  GETADDR

        &   /0500
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
        SB  TOPLIV  
        JN  ERROEMP ; SP > TOPLIV -> Stack Overflow!
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
ERROEMP LD  SO      ; SP > TOPLIV -> Stack Overflow!
        PD  /100
        HM  FIMAIN

        &   /0600
                    ; Desempilhar
PTOPLOC K   /0000   ; Ponteiro da primeira variável da área de variáveis locais
TEMPDMP K   /0000   ; Variável a ser armazenada na memória local
DMP     K   /0000
        LD  TOPLOC
        AD  WRITE
        MM  PTOPLOC ; PTOPLOC = TOPLOC + WRITE
        LD  TOPGLO  
        SB  Cte2
        AD  WRITE   ; PONTLOC = TOPGLO - 2 + WRITE
LOOPDMP MM  PONTLOC 
        SB  PTOPLOC 
        JN  FIMDMP  ; PONTLOC < PTOPLOC -> Fim da subrotina
        LD  SP
        AD  Cte2
        SB  Cte1000
        JZ  ERRODMP
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
        JP  LOOPDMP ; Recomeçar o LOOP
FIMDMP  RS  DMP     ; Fim da subrotina
ERRODMP LD  SU      ; SP = 1000 -> Erro!
        PD  /100
        HM  FIMAIN

        &   /0700
PONTDEB K   /0000
                    ; DEPURA
DEPURA  K   /0000
        LD  TOPDEB
        AD  READ
LOOPDB  MM  PONTDEB ; Conferir se PONTEXT está na lista de depuração
        SB  PONTLIV 
        JZ  FIMDEPU ; PONTLIV = PONTDEB -> Fim da lista de Break-Point's
        LD  PONTDEB
        MM  BREAKP  ; BREAKP = PONTDEB
BREAKP  K   /0000   ; BREAK-POINT
        SB  PONTEXT 
        JZ  BREAK   ; PONTEXT = *PONTDEB -> Break-Point 
        LD  PONTDEB
        AD  Cte2    ; PONTDEB = PONTDEB + 2
        JP  LOOPDB  ; Recomeçar loop
BREAK   GD  /000    ; BREAK-POINT
FIMDEPU RS  DEPURA  ; Fim da depuração
        #   MAIN    ; Executar a função principal