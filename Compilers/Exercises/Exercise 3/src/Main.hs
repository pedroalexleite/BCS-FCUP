
module Main where

import Tests
import System.Exit

main :: IO ()
main = do
  passed <- runTests
  if passed then exitSuccess else exitFailure

