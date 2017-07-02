import Html exposing (text)

type alias Avaliar = (String -> Int)  -- Será utilizada para avaliar o programa
zero : Avaliar -- Avaliar programa -> Será utilizada mais adiante
zero = \val -> 0 -- Retorna 0 para avaliar expressões que retornam numeros


type Exp = Add Exp Exp  -- Tipo expressão criado que possui os nomes das operações
         | Sub Exp Exp  -- que serao realizadas
         | Mult Exp Exp
         | Div Exp Exp
         | Num Int

type Programa = Atribui String Exp   -- Programa de atribuição de variável            


avaliar_expressao: Exp -> Avaliar -> Int
avaliar_expressao exp aval =
    case exp of    
        Add expressao_01 expressao_02 -> (avaliar_expressao expressao_01 aval ) + (avaliar_expressao expressao_02 aval)
        Sub expressao_01 expressao_02 -> (avaliar_expressao expressao_01 aval ) - (avaliar_expressao expressao_02 aval)
        Mult expressao_01 expressao_02 -> (avaliar_expressao expressao_01 aval ) * (avaliar_expressao expressao_02 aval)
        Div expressao_01 expressao_02 -> (avaliar_expressao expressao_01 aval ) // (avaliar_expressao expressao_02 aval)
        Num num -> num
        
        
avaliar_programa: Programa -> Avaliar -> Avaliar
avaliar_programa programa aval =
         case programa of
             Atribui variavel expressao ->
                 let 
                   valor = avaliar_expressao expressao aval --atribui o 
                 in
                   \val -> if val == variavel then valor else (aval val) --



comando : Programa -> Int
comando com = ((avaliar_programa com zero) "minha_variavel")

soma: Programa -- 
soma = (Atribui "minha_variavel" (Add (Num 7) (Num 4))) -- Testa o programa de atribuição de variável
                                                     -- Com a expressão soma
                                 
sub: Programa -- 
sub = (Atribui "minha_variavel" (Sub (Num 8) (Num 2))) -- Testa o programa de atribuição de variável
                                                     -- Com a expressão subtração
mult: Programa -- 
mult = (Atribui "minha_variavel" (Mult (Num 2) (Num 4))) -- Testa o programa de atribuição de variável
                                                     -- Com a expressão multiplicacao
div: Programa -- 
div = (Atribui "minha_variavel" (Div (Num 10) (Num 5))) -- Testa o programa de atribuição de variável
                                                     -- Com a expressão divisao



declara_var: Programa
declara_var = (Atribui "minha_variavel" (Num 3))


main = text (toString (comando (declara_var)))
