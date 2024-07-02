myand :: [Bool] -> Bool

myand [] = True
myand (x:xs) = x &&myand xs

myor :: [Bool] -> Bool

myor [] = False
myor (x:xs) = x ||myor xs
