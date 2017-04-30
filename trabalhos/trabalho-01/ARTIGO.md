(Não é necessário seguir a estrutura a seguir...)

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
      ```haskell
         fatorial 0 = 1
         fatorial 1 = 1
         fatorial n = fatorial(n-1)*n
      ```
  
  
* Desvantagens:
   * Maior distância do hardware
   * Compiladores e interpretadores mais complexos
   * Dificuldade em prever os custos tempo/espaço
   * Não possui comandos de repetições como **while** e **for**

# Avaliação Comparativa
* Comparando a Espressividade de Haskell em relação a C

  Para começar Haskell se diferencia da Linguagem C pelo simples fato de que Haskell é uma linguagem funcional e C é uma linguagem imperativa. Algumas funções, principalmente as funções matemáticas são mais fáceis de serem escrita em Haskell. A função que calcula o Fatorial de um número em Haskell ficaria assim:
  
```haskell
   fatorial 0 = 1
   fatorial 1 = 1
   fatorial n = fatorial(n-1)*n
```
Já a mesma função escrita em C:

```C
 int fatorial(int n){
	if (n == 1 || n == 0){
		return 1;
	}
	return fatorial(n-1)*n;
}
```
Uma observação importante é que embora as duas necessitem de poucas linhas para escrever o código a função escrita em **_C_** passa a apresentar problema ao calcular fatoriais acima de **16** enquanto em Haskell não temos este tipo de problema, para que este programa rode com eficiência em **_C_** há uma necessidade de mexer na estrutura de seu programa, o que não há a necessidade se o programa for escrito em **_Haskell_**. Isto porque a linguagem Haskell possui a tipagem de dados __integer__, que possui a mesma caracteristica do tipo __int__ só que não possui limite de precisão, este tipo de valor é utilizado para expressar valores inteiros muito grandes.


# Conclusão
* Neste artigo vimos de um modo geral, algumas características e comparações da utilização da linguagem Haskell. Também vimos as vantagens e desvantagem na utilização dessa linguagem. Também foi falado sobre a ausência de variáveis nesta linguagem, já que esta linguagem só há a presença de constantes e funções. Outra coisa que podemos perceber é não há comandos de repetições como __while__ e __for__, suas repetições são desenvolvidas de forma recursivas

# Bibliografia
* http://www.inf.ufes.br/~vitorsouza/wp-content/uploads/teaching-lp-20132-seminario-haskell.pdf

* https://pt.wikipedia.org/wiki/Haskell_(linguagem_de_programa%C3%A7%C3%A3o)

* https://pt.stackoverflow.com/questions/13359/pr%C3%B3s-e-contras-do-paradigma-funcional-e-do-haskell/14338

* https://www.youtube.com/watch?v=QvZG_brQSaA
