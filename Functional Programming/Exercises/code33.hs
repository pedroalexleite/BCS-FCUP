module Main where
import Data.Char

main :: IO()

main = do {  input <- getContents;
             print(length (lines input)); --lines
             print(length (words input)); --words
             print(length input); --bytes
          }
