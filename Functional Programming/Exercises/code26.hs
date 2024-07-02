metades :: [a] -> ([a],[a])

metades [] = []
metades [a] = [a]
metades xs = let a = length xs
                 b = a`div`2
                 ys = take b xs
                 zs = drop b xs
             in(ys,zs)


merge :: Ord a => [a] -> [a] -> [a]

merge [][] = []
merge xs [] = xs
merge [] ys = ys
merge (x:xs)(y:ys) = if (x<=y) then [x]++merge(xs (y:ys))
                     else [y]++merge((x:xs) ys)

msort :: Ord a => [a] -> [a]

msort [] = []
msort [a] = [a]
msort xs = merge(metades xs)
