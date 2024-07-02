metades :: [a] -> ([a],[a])

metades [] = ([],[])
metades xs = let a = length xs
                 b = a`div`2
                 ys = take b xs
                 zs = drop b xs
             in (ys, zs)
