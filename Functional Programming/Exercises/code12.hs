curta :: [a] -> Bool

curta a | length a == 0 = True
        | length a == 1 = True
        | length a == 2 = True
        | otherwise = False

curta2 :: [a] -> Bool

curta2 [] = True
curta2 [a] = True
curta2 [a,b] = True
curta2 xs = False
