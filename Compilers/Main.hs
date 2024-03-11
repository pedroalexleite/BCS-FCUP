module Main where
import Lexer
-- import Parser

main :: IO ()
main = do
  txt <- getContents
  print (alexScanTokens txt)

{--
alex Lexer.x -> Lexer.hs ghci Lexer.hs
happy -i Parser.y
ghc Main.hs
./Main 1+2
--}
