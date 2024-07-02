divprop :: Int -> [Int]

divprop n = [x | x <- [1..n`div`2], n`mod`x==0]

perfeitos :: Int -> [Int]

perfeitos n = [x | x <- [1..n], sum(divprop x) == x]
