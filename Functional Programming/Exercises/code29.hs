zipWith1 :: (a->b->c) -> [a] -> [b] -> [c]

zipWith1 f _ [] = []
zipWith1 f [] _ = []
zipWith1 f (x:xs)(y:ys) = f x y : (zipWith1 f xs ys)
