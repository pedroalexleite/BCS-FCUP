dotprod :: [Float] -> [Float] -> Float
dotprod a b = sum[a*b| (a,b) <- zip a b]
