myDelete :: Eq a => a -> [a] -> [a]

myDelete a [] = []
myDelete a (x:xs) | x == a = xs
                  | otherwise [x] ++ myDelete(a xs)

permutations :: [a] -> [[a]]

permutations [] = [[]]
permutations p = [x:xs | x <- p, xs <- permutations (myDelete x p)]
