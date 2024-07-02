max3 :: Integer -> Integer -> Integer -> Integer

max3 x y z | x >= y && x >= z = x
           | y >= x && y >= z = y
           | z >= x && z >= y = z

min3 :: Integer -> Integer -> Integer -> Integer

min3 x y z | x <= y && x <= z = x
           | y <= x && y <= z = y
           | z <= x && z <= y = z
