divprop :: Int -> [Int]

divprop n = [x | x<-[1..n`div`2], n`mod`x==0]

primo :: Int -> Bool

primo n | divprop n == [1] = True
        | otherwise = False
