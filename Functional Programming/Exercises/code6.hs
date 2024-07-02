binom :: Integer -> Integer -> Integer

binom n k = product[1..n]`div`(product[1..k]*product[1..(n-k)])

binom' :: Integer -> Integer -> Integer

binom' n k = let a = product [1..n]
                xs = [1..k]++[1..(n-k)]
                 b = product xs
             in a`div`b
