f :: [Int] -> Int

f (y:z) = f z - y
