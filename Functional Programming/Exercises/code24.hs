myMinimum :: Ord a => [a] -> a

myMinimum [a] = a
myMinimum (x:y:xs) | x<= y = myMinimum(x:xs)
                   | otherwise myMinimum(y:xs)

myDelete :: Eq a => a -> [a] -> [a]

myDelete a [] = []
myDelete a (x:xs) | x == a = xs
                  | otherwise [x] ++ myDelete(a xs)
