module CodeGen where

import           AST
import           IR
import           Data.Map (Map)
import qualified Data.Map as Map
import           Control.Monad.State

type Table = Map Var String

transExpr :: Table -> Expr -> Var -> State Count [Instr]
transExpr tabl (Lvalue x) (Var_Simple dest)
  = case Map.lookup x tabl of
      Just temp -> return [MOVE dest temp]
      Nothing -> error "invalid variable"

transExpr tabl (Num n) (Var_Simple dest)
  = return [MOVEI dest n]

transExpr tabl (OpExpr op e1 e2) (Var_Simple dest)
  | op == Add || op == Minus || op == Times || op == Div || op == Mod
  = do temp1 <- newTemp
       temp2 <- newTemp
       code1 <- transExpr tabl e1 (Var_Simple temp1)
       code2 <- transExpr tabl e2 (Var_Simple temp2)
       popTemp 2
       return (code1 ++ code2 ++ [OP op dest temp1 temp2])

transExpr tabl (Fun (Var_Simple id) args) (Var_Simple dest)
  = do (code, temps) <- transArgs tabl args
       popTemp (length args)
       return (code ++ [CALL dest id temps])

transArgs tabl args  = worker args
  where
    worker []  = return ([], [])
    worker (exp:exps)
      = do temp <- newTemp
           code <- transExpr tabl exp (Var_Simple temp)
           (code', temps') <- worker exps
           return (code++code', temp:temps')

transStm :: Table -> Stm -> State Count [Instr]
transStm tabl (Assign var expr)
  = case Map.lookup var tabl of
      Nothing -> error "undefined variable"
      Just dest -> do temp <- newTemp
                      code <- transExpr tabl expr (Var_Simple temp)
                      return (code ++ [MOVE dest temp])

transStm tabl (If cond stm1)
  = do ltrue  <- newLabel
       cont <- newLabel
       code0  <- transCond tabl cond ltrue cont
       code1  <- transStm tabl stm1
       return (code0 ++ [LABEL ltrue] ++
               code1 ++ [LABEL cont])

transStm tabl (IfE cond stm1 stm2)
  = do ltrue <- newLabel
       lfalse <- newLabel
       lend <- newLabel
       code0 <- transCond tabl cond ltrue lfalse
       code1 <- transStm tabl stm1
       code2 <- transStm tabl stm2
       return (code0 ++ [LABEL ltrue] ++ code1 ++
               [JUMP lend, LABEL lfalse] ++ code2 ++ [LABEL lend])

transStm tabl (While cond stm) =
  do lbody <- newLabel
     lend <- newLabel
     lcond <- newLabel
     code1 <- transStm tabl stm
     code2 <- transCond tabl cond lbody lend
     return ([JUMP lcond, LABEL lbody] ++ code1 ++ [LABEL lcond]
             ++ code2 ++ [LABEL lend])

transCond :: Table -> Expr -> Label -> Label -> State Count [Instr]
transCond tabl (OpExpr rel e1 e2) ltrue lfalse
  | rel == Less || rel == LessEqual || rel == Equal || rel == NotEqual =
      do temp1 <- newTemp
         temp2 <- newTemp
         code1 <- transExpr tabl e1 (Var_Simple temp1)
         code2 <- transExpr tabl e2 (Var_Simple temp2)
         popTemp 2
         return ( code1 ++ code2 ++
                  [COND temp1 rel temp2 ltrue lfalse] )

----------------------------------------------------------------------------------
type Count = (Int,Int)

newTemp :: State Count Temp
newTemp = do (t,l)<-get; put (t+1,l); return ("t"++show t)

popTemp :: Int -> State Count ()
popTemp k =  modify (\(t,l) -> (t-k,l))

newLabel :: State Count Label
newLabel = do (t,l)<-get; put (t,l+1); return ("L"++show l)
---------------------------------------------------------------------------
