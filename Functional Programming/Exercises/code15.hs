aprox :: Int -> Double

aprox n = sum[termo i | i <- [0..n]]*4
termo n = fromIntegral((-1)^n)/fromIntegral(2*n +1)

aprox2 :: Int -> Double

aprox2 n = sqrt(sum[termo2 i | i <- [0..n]]*12)
termo2 n = fromIntegral((-1)^n)/fromIntegral((n+1)*(n+1))
