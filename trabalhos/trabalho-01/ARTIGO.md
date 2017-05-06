# Introdução
* Neste artigo temos como objetivo discutir um pouco sobre a linguagem Haskell, falar sobre sua origem, expor as suas características e citar exemplos de uso da linguagem em questão. Haskell é conhecida principalmente pela sua semelhança com funções matemáticas. 
# Origens e Influências
- 1930:  Alonzo  Church  desenvolveu  o  cálculo  de Lambda,  um  simples  e poderoso teorema de funções.
- 1950: John McCarthy desenvolveu Lisp, a primeira linguagem funcional, que tinha influência da teoria de lambda
 mas aceitando atribuições de variáveis.
-  1970:  Robin  Milner  e  outros  desenvolveram  a ML,  a  primeira  linguagem funcional moderna, com introdução de inferência de tipos e tipos polimórficos.
- Em  1987,    ocorreu  a  conferência  “Functional  Programming  Languages  and  Computer Architecture”, consolidação de linguagens existentes e criação de um padrão aberto.
- Em 1990, lançou-se a primeira versão, criada por Simon Peyton-Jones, Paul Hudak e Philip Walder e nomeada em homenagem ao lógico Haskell Curry.
- Surgiram novas versões até que em 1999 foi publicada o Haskell 98, que especifica uma versão mínima, estável e portável da linguagem.
- Constante evolução: Implementação Hugs e GHC.


# Classificação
 * Haskell é uma linguagem puramente funcional. Um programa desenvolvido nesta linguagem é um conjunto de definições de funções, que são aplicados a valores como acontece em funções matemáticas por exemplo.
 * Uma linguagem funcional evita estados ou dados mutáveis, o que a diferencia de uma linguagem imperativa onde seus programas são interpretados como uma série de ações que o computador realiza como se estivesse recebendo ordens e seus estados e dados podem ser mutáveis.
 * Haskell também não possui a existência de variáveis e é classificada como uma linguagem estática, ou seja,  as variaveis são tipadas, se uma váriavel recebe um numero inteiro ela só aceitara números inteiros, como haskell só há a existência de constantes, o mesmo conceito é aplicado
* Possui Tuplas heterogêneas, ou seja, podemos criar uma tupla com diversos tipos de dados, como por exemplo uma com a presença de inteiros e strings.
* Vantagens em utilizar Haskell:
  * Os programas ficam mais concisos, ou seja os programas são mais simples de serem escritos o que nos dá a maior escritabilidade.
  * Concorrência/paralelismo, a ordem de execução não afeta os resultados
  * O sistema de tipos é completamente estático. Muitas erros que são detectados em tempo de execução em outras linguagens são detectados em tempo de compilação em Haskel
  * Polimorfismo paramétrico / generics. Permite expressar tipos precisos, sem ter que fazer upcasting e downcasting com um supertipo Object.
  
  Ex:
  * Tamanho de uma lista de inteiros
  
    ```haskell
    tamanho_lista :: [Int] -> Int
    tamanho_lista [] = 0
    tamanho_lista [x:xs] = x+xs
    ```
  * Tamanho de uma lista qualquer (Polimorfismo)

    ```haskell
    tamanho_lista :: [a] -> Int
    tamanho_lista [] = 0
    tamanho_lista [x:xs] = x+xs
    ```  
  
  
* Desvantagens:
   * Maior distância do hardware
   * Compiladores e interpretadores mais complexos
   * Dificuldade em prever os custos tempo/espaço
   * Não possui comandos de repetições como **while** e **for**

# Avaliação Comparativa
* Comparando a Espressividade de Haskell em relação a C
   * Lambdas são basicamente funções anônimas que utilizamos quando precisamos de alguma função uma única vez. Normalmente, criamos um lambda com o propósito único de passá-lo para uma função de ordem superior.
```haskell
   f_exp x = let
               c = x*2;
	     in \n -> c^n;
```
   * A função acima calcula o exponencial do dobro de um número qualquer, a função lambda **(\n)** se encarrega de realizar o exponencial do valor já calculado **c** cujo cálculo foi realizado na função **f_exp**. A função anônima **\n -> c^n ** encarrega-se por sua vez de realizar o exponencial e retornar para a função de ordem superior que é **f_exp**.
   * Ex:
     * f_exp(2 2) = > c = 2*2 => \2 -> 4^2 => 16

* Writibility
  * Os códigos em Haskell costumam ser fáceis de escrever, pois não precisamos ser "detalhistas" nos procedimentos que queremos que o computador execute. Um exemplo é o próprio calculo do fatorial acima. O fato das funções definidas em Haskell serem semelhantes a matemática ajuda muito a intuição na hora de escrever os códigos, já que o raciocínio é semelhante ao que utilizamos em Matemática.
 
 * Readbility
   * Existem casos em que a legibilidade requer um pouco mais de conhecimento da linguagem Haskell do que em C, pois C é mais detalhista em seu código do que Haskell. Segue um exemplo abaixo:
  
  Função que retorna o tamalho de um vetor de inteiros em Haskell:
  
  ```haskell
    tamanho_vetor :: [Int] -> Int
    tamanho_vetor= 0
    tamanho_vetor :: [x:s] = x+xs
  ```
  Função que retorna o tamanho de um vetor de inteiros em C:
  
  ```C
     int tamanho(int a[]){
       int tam;
       tam = 0;
       while(a[tam]){
          tam++;
       }	
       return tam;
}
  ```
  
  
  
# Conclusão
* Neste artigo vimos de um modo geral, algumas características e comparações da utilização da linguagem Haskell. Também vimos as vantagens e desvantagem na utilização dessa linguagem. Também foi falado sobre a ausência de variáveis nesta linguagem, já que esta linguagem só há a presença de constantes e funções. Outra coisa que podemos perceber é não há comandos de repetições como __while__ e __for__, suas repetições são desenvolvidas de forma recursivas

# Bibliografia
* http://www.inf.ufes.br/~vitorsouza/wp-content/uploads/teaching-lp-20132-seminario-haskell.pdf

* https://pt.wikipedia.org/wiki/Haskell_(linguagem_de_programa%C3%A7%C3%A3o)

* https://pt.stackoverflow.com/questions/13359/pr%C3%B3s-e-contras-do-paradigma-funcional-e-do-haskell/14338

* https://www.youtube.com/watch?v=QvZG_brQSaA
