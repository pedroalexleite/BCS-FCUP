import Prelude hiding ((++))

(++) :: [a] -> [a] -> [a]
xs ++ ys = foldr (f z lista)
    where f     = (:)
          z     = ys
          lista = xs
