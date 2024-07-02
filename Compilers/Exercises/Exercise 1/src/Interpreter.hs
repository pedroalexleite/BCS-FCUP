{-
  Exercícios para a Aula Laboratorial 1

  Escrever um interpretador em Haskell da sintaxe abstrata de
  programas sequenciais.

  Pedro Vasconcelos, 2020.

  Baseado num exercício do livro "Modern Compiler Implementation in
  ML", A. Appel.
-}

module Interpreter where

--
-- sintaxe abstrata de programas sequenciais
--
type Ident = String  -- identificadores (nomes de variaveis)

data BinOp = Plus | Minus | Times | Div -- operações binárias
           deriving (Eq, Show)

data Stm = AssignStm Ident Exp   -- ident = exp
         | IncrStm Ident         -- ident++
         | CompoundStm Stm Stm   -- stm1; stm2
         deriving (Eq, Show)

data Exp = IdExp Ident           -- x, y, z ..
         | NumExp Int            -- 123
         | OpExp Exp BinOp Exp   -- e1+e2, e1*e2, ...
         deriving (Eq, Show)


{- Exercício 1.

Escrever duas funções recursivas para listar todos os identificadores
em comandos e expressões.

NOTA: escreva uma equação para cada construtor da sintaxe abstrata
acima. A função idsStm deve chamar idsExpr os comandos contêm sub-expressões.
-}

idsStm :: Stm -> [Ident]
idsStm [ ] = [ ]
idsStm (AssignStm x exp) = [x] ++ idsExp exp -- variável = expressão
idsStm (IncrStm x) = [x] -- retorna uma variável
idsStm (CompoundStm st1 st2) = idsStm st1 ++ idsStm st2 -- concatenar as 2 partes do statment que neste caso é o idStm (tudo q ue a função engloba)

idsExp :: Exp -> [Ident]
idsExp [ ] = [ ]
idsExp (IdExp x) = [x] -- se tivermos só uma váriavel retornamos essa variável
idsExp (NumExp _ ) = [ ] -- se tivermos algo + um número, não retornamos nada, já que só queremos retornar variáveis
idsExp (OpExp exp1 op exp2) = idsExp exp1 ++ idsExp exp2 -- soma de expressões
-- NB: o que acontece se um identificador ocorrer mais do que uma vez?


{- Exercício 2: um interpretador funcional

Escreva duas funções mutuamente recursivas para interpretar comandos
e expressões.

Represente tabelas associações de valores (inteiros) aos
identificadores como listas de pares.
Por exemplo, a lista [("x", 2), ("y", 0)] associa x -> 2, y -> 0.

Sugestões: use a função do prelúdio

lookup :: Eq a => a -> [(a,b)] -> Maybe b

para procurar o valor (se existir) associado a um identificador.
-}

type Table = [(Ident, Int)]


interpStm :: Stm -> Table -> Table
interpStm _ _
  = error "completar esta definição"


interpExp :: Exp -> Table -> Int
interpExp _ _
  = error "completar esta definição"



{- Exercício 3 (extra):

Modifique a definição do tipo Table and das funções do interpretador
de forma usar to uma estrutura de dados para associações mais eficiente;
por exemplo, Data.Map.

Para evitar conflitos de nomes, deve importar o módulo Data.Map
com nomes qualificados:

import qualified Data.Map as Map

Depois use nomes como as Map.Map para o tipo e Map.empty, Map.lookup,
Map.insert, etc. para as operações.

Documentação:

http://hackage.haskell.org/package/containers
-}
