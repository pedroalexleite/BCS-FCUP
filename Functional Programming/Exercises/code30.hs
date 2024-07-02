factorials :: [Integer]
factorials = 1 : zipWith (*) factorials [1..]

fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
