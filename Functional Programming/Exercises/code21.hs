potencia :: Int -> Int

potencia 0 = 1
potencia x = 2 * potencia(x-1)
