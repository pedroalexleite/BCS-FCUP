pascal :: [[Integer]]
pascal = [1] : map (\xs -> zipWith (+) ([0] ++ xs) (xs ++ [0])) pascal
