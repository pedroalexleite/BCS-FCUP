module AST where

data Program
      = LetP [Decl] [Expr]
      deriving Show

data Expr
    = Num Int
      | Lvalue Var
      | Fun Var [Expr]
      | OpExpr Operator Expr Expr
      | Scani
      deriving Show

data Stm
      = Assign Var Expr
      | If Expr Stm
      | IfE Expr Stm Stm
      | While Expr Stm
      | Let [Var_decl] [Stm]
      | Printi Expr
      deriving Show

data Operator
      = Less | LessEqual | Equal | NotEqual | Add  | Minus | Times | Div  | Mod
      deriving (Eq, Show)

data Var
      = Var_Simple String
      deriving (Eq, Ord, Show)

data Decl
      = VAR_DECL Var_decl
      | PROC_DECL Var [Type_field] Expr
      | FUN_DECL Var [Type_field] Type_id Expr
      deriving Show

data Var_decl
      = VarDecl Var Expr
      deriving Show

data Type_id
      = TYPE_INT
      deriving Show

type Type_field
      = (Var, Type_id)

-- ghci
-- :l CodeGen.hs
-- let tabl = Map.fromList [( (Var_Simple "y"),"t0")]
-- runState(transExpr tabl example (Var_Simple "x")) (0,0)
-- example = OpExpr Add (Num 2)(Num 1)
-- example = If (OpExpr Less (Num 2) (Num 1)) (Assign (Var_Simple "x")
example = IfE (OpExpr Less (Num 5) (Num 2)) (Assign (Var_Simple "x") (Lvalue (Var_Simple "y"))) (Assign (Var_Simple "w") (Num 9))
