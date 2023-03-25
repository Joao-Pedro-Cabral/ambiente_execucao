# Ambiente de Execução

## Introdução

Este projeto é uma introdução a Compiladores. Para entender corretamente
o que deve ser feito deve-se entender a ambiente de execução real, tudo
isso será aprofundado na disciplina "Linguagens e Compiladores".
Sugerimos que vocês leiam a proposta do
[Compilador de C--](https://github.com/PCS3616/projeto-compilador)
antes dessa.

## Base de Compiladores

O ambiente de execução é uma funcionalidade normalmente integrada ao
compilador que fornece métodos e recursos para executar o código-objeto
gerado pelo compilador. Ele deve gerenciar memória e instruções para
executar o código gerado. A estrutura padrão, da memória de execução
(diferente da memória da máquina) é:

  | Código        |  Aqui deve estar o código-objeto compilado, alocado estaticamente |
  |---------------|-------------------------------------------------------------------|
  | Estático      | Variáveis e parâmetros gerados pelo compilador, alocado estaticamente                                                                                       |
  | Monte         | Variáveis de longa duração na execução (mais que um procedimento), alocado dinamicamente, cresce em direção aos endereços maiores                           |
  | Memória livre | Pode ser ocupado pelo monte ou pela pilha                                                                                                                   |
  | Pilha         | Valores do monte quando os procedimentos são trocados e serão restaurados posteriormente, alocado dinamicamente, cresce em direção aos endereços menores    |

O ambiente de execução executa o código compilado linha a linha e salva
as variáveis utilizadas em tabelas de valores. Quando há uma chamada de
sub-rotina, há a criação de um novo procedimento, todos as variáveis do
estado devem ser empilhados na pilha (_stack_) na forma de um registro de
ativação. Sequências de chamada e de retorno são funções responsáveis
por inserir e retirar registros de ativação da pilha. O monte (_heap_)
armazena valores que devem persistir entre diversos procedimentos.

Um registro de ativação deve conter valores essenciais para a futura
retomada da execução, tais como variáveis e seus valores, ponto de
retorno e outras informações úteis, estruturados de forma clara e
padronizada. As sequências de chamada e de retorno manipulam os valores
de forma adequada a empilhar ou desempilhar esses registros e alterar o
código de forma conveniente.

Além dessas funções organizacionais o ambiente de execução também
garante que todas as funções utilizadas pelo compilador para gerar
o código sejam devidamente implementadas, como operações
algébricas com tipos de tamanho maior que a unidade básica do sistema,
e escrita e leitura de forma adequada.

## O trabalho

O trabalho consiste em desenvolver um ambiente de execução para o
[compilador de C--](https://github.com/PCS3616/projeto-compilador).
O seu ambiente de execução deve ser estruturado como explicado na
seção anterior. O código compilado será colocado num arquivo
`code.asm` e deve ser executado corretamente pelo seu
ambiente de execução depois de ser compilado.

O trabalho pode ser feito em duplas ou individualmente. Definir escopo
de uso do comunicador, mensagens de erro coerentes, eventuais limitações
e funcionalidades não comentadas acima fazem parte do trabalho.

### Desafio

Uma ferramenta muito útil para programadores (e explorada
superficialmente no primeiro laboratório) é o _debugger_. Um _debugger_ tem
diversas funcionalidades, entre elas a inserção de _break points_, que
permitem ao programador parar a execução do código em determinado ponto
e visualizar as variáveis naquele instante. Seu desafio é encontrar um
modo de permitir ao usuário do seu ambiente de execução inserir um _break point_
em algum rótulo do código e, toda vez que a execução passar por
aquele rótulo, o programa deve parar e esperar um comando do usuário
para retomar a execução.

## Perguntas

Seguem algumas perguntas a serem respondidas depois da codificação:

1.  A utilização de memória pode ser mais eficiente? Como? Se sim, por
    que a forma menos eficiente foi escolhida?

2.  Os códigos escritos podem ser mais eficientes? Como? Se sim, por que
    a forma menos eficiente foi escolhida?

3.  Qual foi a maior dificuldade em implementar o ambiente de execução?

4.  Quais são os limites recomendados para o código em C-- de forma a
    não gerar problemas na hora de execução?

## Entrega

Dois ou mais arquivos devem ser entregues:

1.  **Ambiente:** um arquivo em MVN `ambiente.asm` contendo o código do seu
    ambiente de execução;

2.  **Relatório:** um arquivo chamado `relatorio_<NUSP1>_<NUSP2>.pdf` para
    trabalhos realizados em dupla, ou `relatorio_<NUSP>.pdf` para individuais
    contendo uma descrição resumida do problema e dos conceitos e uma descrição
    detalhada das etapas de resolução, da estratégia utilizada em cada módulo
    e outras informações que julgarem úteis. O relatório pode conter imagens
    das execuções de teste;

3.  Outros arquivos que julgar necessário.
