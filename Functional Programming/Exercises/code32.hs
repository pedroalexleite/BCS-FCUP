elefantes :: Int -> IO()

elefantes n = let i = 2 in
            if n>i then do
              putStrLn("Se " ++ i ++ "incomadam muita gente,")
              putStrLn(i+1 ++ "elefantes incomodam muito mais!")
              elefantes(n-1)
            else
              return()
