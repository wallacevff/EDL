import Html exposing (text)

type alias Avaliar = (String -> Int)  -- Será utilizada para avaliar o programa (ambiente)
zero : Avaliar -- Avaliar programa -> Será utilizada mais adiante
zero = \val -> 0 -- Retorna 0 para avaliar expressões que retornam numeros


type Exp = Add Exp Exp  -- Tipo expressão criado que possui os nomes das operações
         | Sub Exp Exp  -- que serao realizadas
         | Mult Exp Exp
         | Div Exp Exp
         | Num Int
         | Var String

type Programa = Atribui String Exp   -- Programa de atribuição de variável
              | Se Exp Programa Programa
              | Enquanto Exp Programa
              | Seq Programa Programa         


avaliar_expressao: Exp -> Avaliar -> Int
avaliar_expressao exp aval =
    case exp of   -- Para testar as expressões utilizar a função 0     
        Add expressao_01 expressao_02 -> (avaliar_expressao expressao_01 aval ) + (avaliar_expressao expressao_02 aval)
        Sub expressao_01 expressao_02 -> (avaliar_expressao expressao_01 aval ) - (avaliar_expressao expressao_02 aval)
        Mult expressao_01 expressao_02 -> (avaliar_expressao expressao_01 aval ) * (avaliar_expressao expressao_02 aval)
        Div expressao_01 expressao_02 -> (avaliar_expressao expressao_01 aval ) // (avaliar_expressao expressao_02 aval)
        Num num -> num
        Var var -> (aval var) -- Só funciona se for avaliada dentro de um programa
        
avaliar_programa: Programa -> Avaliar -> Avaliar
avaliar_programa programa aval =
         case programa of
             Atribui variavel expressao ->
                 let 
                   valor = avaliar_expressao expressao aval --atribui o 
                 in
                   \val -> if val == variavel then valor else (aval val) --
             Se cond progTrue progFalse -> 
                 if (avaliar_expressao cond aval) /= 0
                 then (avaliar_programa progTrue aval)
                 else (avaliar_programa progFalse aval)
             Enquanto cond prog ->
                 if (avaliar_expressao cond aval) /= 0
                 then
                    (avaliar_programa (Enquanto cond prog) (avaliar_programa prog aval))
                 else aval
             Seq s1 s2 ->
                    (avaliar_programa s2 (avaliar_programa s1 aval))





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

progSeq : Programa -- Teste de Seq e Sub
progSeq =  (Seq
            (Atribui "x"   (Num 12))
            (Atribui "y" (Add (Var "x") (Num 11)))
        )

progSe : Programa
progSe =   (Seq
            (Atribui "x" (Num 1))
            (Se (Var "x")
                (Atribui "minha_variavel" (Mult (Num 3) (Num 7)))
                (Atribui "minha_variavel" (Div (Num 20) (Num 5))))
        )

progEnquanto: Programa -- Teste de While
progEnquanto =    (Seq
                (Seq
                    (Atribui "i" (Num 89))
                    (Enquanto (Var "i")
                        (Seq
                            (Atribui "i" (Sub (Var "i") (Num 1)))
                            (Atribui "x" (Add (Var "x") (Num 1)))
                        )
                    )
                )
                (Atribui "minha_variavel" (Var "x"))
            )

main = text (toString (comando (mult)))
