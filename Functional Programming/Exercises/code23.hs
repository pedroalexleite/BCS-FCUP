insert :: Ord a => a -> [a] -> [a]

insert a [] = [a]
insert a (x:xs) = if(a <= x) then [a] ++ (x:xs) else [x] ++ insert a xs

isort :: Ord a => [a] -> [a] --comparar elemento com os seus anteriores

isort [] = []
isort (x:xs) = insert x (isort xs)
