{-# LANGUAGE TemplateHaskell #-}
module Tests where

import Lexer
import Parser
import Test.QuickCheck

-- testar se uma cadeia é uma expressão bem formada;
-- aplica o lexer e parser e verifica que se o input foi todo consumido
checkExpr :: String -> Bool
checkExpr str = parseExpr (alexScanTokens str) == []

prop_correct1 =
  checkExpr "1+2+3"
  
prop_correct2 =
  checkExpr "(123+456)*789" 

prop_correct3 =
  checkExpr "((12*(3+4)))" 

prop_correct4 =
  checkExpr "(1+2*5)/(6+7)"

prop_wrong1 =
  expectFailure (checkExpr "1++2+3")

prop_wrong2 =
  expectFailure (checkExpr ")1+3(")

prop_wrong3 =
  expectFailure (checkExpr "((1+2+3)))")

prop_wrong4 =
  expectFailure (checkExpr "123+456 789")

-----

return []
runTests = $(quickCheckAll)
