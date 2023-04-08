        >   TEXTO   ; Exportar HEADER
        >   LOCAL   ;
        >   GLOBAL  ;
        >   DEBUG   ;
        &   /0000
TEXTO   K   /08BC   ; Aloca espaço excessivo para
LOCAL   K   /000A   ; o texto, não deixando nenhuma
GLOBAL  K   /0008   ; posição na memória para a pilha
DEBUG   K   /0000
                    ; TEXTO
      GD /000  ; Lê entrada do teclado
      MM VALOR0; Escreve em VALOR0
      GD /000  ; Lê entrada do teclado
      MM VALOR1; Escreve em VALOR1
      GD /000  ; Lê entrada do teclado
      MM VALOR2; Escreve em VALOR2
      GD /000  ; Lê entrada do teclado
      MM VALOR3; Escreve em VALOR3
      GD /000  ; Lê entrada do teclado
      MM VALOR4; Escreve em VALOR4
      SC SOMA  ; Chama Soma
      SC SUB   ; Chama Sub
      LD VALOR0; Carrega VALOR
      PD /100  ; Escreve na tela
      HM /0    ;
SOMA     JP /000    ; Subrotina Soma
         LD VALOR0  ;
         AD VALOR1  ; AC = VALOR0 + VALOR 1
         RS SOMA    ;
SUB      JP /000    ; Subrotina Sub
         LD VALOR2  ;
         SB VALOR3  ;
         SB VALOR4  ; AC = VALOR2 - VALOR3 - VALOR4
         RS SUB     ;        
                    ; LOCAL
VALOR0 K /0000;
VALOR1 K /0000;
VALOR2 K /0000;
VALOR3 K /0000;
VALOR4 K /0000;
                    ; GLOBAL
VALOR5 K /0000;
VALOR6 K /0000;
VALOR7 K /0000;
VALOR8 K /0000;