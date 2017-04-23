(Não é necessário seguir a estrutura a seguir...)

# Introdução

# Origens e Influências

# Classificação
 * Haskell é uma linguagem puramente funcional. Um programa desenvolvido nesta linguagem é um conjunto de definições de funções, que são aplicados a valores como acontece em funções matemáticas por exemplo.
 * Uma linguagem funcional evita estados ou dados mutáveis, o que a diferencia de uma linguagem imperativa onde seus programas são interpretados como uma série de ações que o computador realiza como se estivesse recebendo ordens e seus estados e dados podem ser mutáveis.
 * Haskell também não possui a existência de variáveis e é classificada como uma linguagem estática, ou seja,  as variaveis são tipadas, se uma váriavel recebe um numero inteiro ela só aceitara números inteiros, como haskell só há a existência de constantes, o mesmo conceito é aplicado

* Vantagens:
  * Os programas ficam mais concisos, ou seja os programas são mais simples de serem escritos o que nos dá a maior escritabilidade.
  * Concorrência/paralelismo, a ordem de execução não afeta os resultados

* Desvantagens:
   * Maior distância do hardware
   * Compiladores e interpretadores mais complexos
   * Dificuldade em prever os custos tempo/espaço

# Avaliação Comparativa
* Comparando Haskell com C

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
Uma observação importante é que embora as duas necessitem de poucas linhas para escrever o código a função escrita em **_C_** passa a apresentar problema ao calcular fatoriais acima de **16** enquanto em Haskell não temos este tipo de problema, para que este programa rode com eficiência em **_C_** há uma necessidade de mexer na estrutura de seu programa, o que não há a necessidade se o programa for escrito em **_Haskell_**

# Conclusão
