import Html exposing (text)

-- Considere uma turma de 50 alunos.
-- Cada aluno possui duas notas.
-- O aluno que ficou com média maior ou igual a sete é considerado aprovado.

-- Considere as seguintes definições em Elm para os tipos Aluno e Turma:

type alias Aluno = (String, Float, Float) -- Aluno é um tipo tupla com o nome e as duas notas
type alias Turma = List Aluno             -- Turma é um tipo lista de alunos

-- O nome ou a média de um aluno pode ser obtido através das seguintes funções:

media: Aluno -> Float
media (_,n1,n2) = (n1+n2)/2     -- o nome é ignorado

nome: Aluno -> String
nome (nm,_,_) = nm              -- as notas são ignoradas

ap: Aluno -> Bool
ap (_,n1,n2) = (n1+n2)/2 >= 7

somam: Float -> Float -> Float
somam x y = (x+y)

aluno_gab: Aluno -> Bool
aluno_gab (n,n1,n2) = n1 == 10

aluno_media: Aluno -> (String, Float)
aluno_media (n1,n2,n3) = (n1, (n2+n3)/2)

aluno_media_ap: (String, Float) -> Bool
aluno_media_ap (_,n2) = n2 >= 7

provas: Aluno -> (Float, Float)
provas (_,n1,n2) = (n1,n2)


-- Por fim, considere as assinaturas para as funções map, filter, e fold a seguir:

--List.map: (a->b) -> (List a) -> (List b)
  -- mapeia uma lista de a's para uma lista de b's com uma função de a para b

--List.filter: (a->Bool) -> (List a) -> (List a)
  -- filtra uma lista de a's para uma nova lista de a's com uma função de a para Bool

--List.foldl : (a->b->b) -> b -> List a -> b
  -- reduz uma lista de a's para um valor do tipo b
        -- usa um valor inicial do tipo b
        -- usa uma função de acumulacao que
            -- recebe um elemento da lista de a
            -- recebe o atual valor acumulado
            -- retorna um novo valor acumulado

-- Usando as definições acima, forneça a implementação para os três trechos marcados com <...>:

turma: Turma
turma = [ ("Joao",7,4), ("Maria",10,8), ("Marilene",1,8),("Marlon",6,8), ("Marisol",10,10), ("Marcia",7,10),("Marlene",10,1), ("Mario",10,7)]       -- 50 alunos

--a) LISTA COM AS MÉDIAS DOS ALUNOS DE "turma" ([5.5, 9, ...])
medias: List Float
medias = List.map media turma

-- b) LISTA COM OS NOMES DOS ALUNOS DE "turma" APROVADOS (["Maria", ...])
aprovados: List String
aprovados = List.map nome(List.filter ap turma)

-- c) MÉDIA FINAL DOS ALUNOS DE "turma" (média de todas as médias)
total: Float
total = (List.foldl somam 0 medias) / toFloat(List.length medias)

-- d) LISTA DE ALUNOS QUE GABARITARAM A P1 ([("Maria",10,8), ...])
--turma_dez_p1: Turma
--turma_dez_p1 = List.filter aluno_gab turma

-- e) LISTA COM OS NOMES E MEDIAS DOS ALUNOS APROVADOS ([("Maria",9), ...])
aprovados2: List (String, Float)
aprovados2 = List.filter aluno_media_ap(List.map aluno_media turma)

-- f) LISTA COM TODAS AS NOTAS DE TODAS AS PROVAS ([7,4,10,8,...])
notas: List Float
notas = List.map provas turma

-- É permitido usar funções auxiliares, mas não é necessário.
-- (As soluções são pequenas.)

main = text (toString notas)
