module IR (Instr(..), Operator(..), Temp, Label) where

import AST (Operator(..))

type Temp  = String
type Label = String

data Instr = MOVE Temp Temp
           | MOVEI Temp Int
           | OP Operator Temp Temp Temp
           | OPI Operator Temp Temp Int
           | LABEL Label
           | JUMP Label
           | COND Temp Operator Temp Label Label
           | CALL Temp Label [Temp]
           | RETURN Temp
           deriving (Eq, Show)
