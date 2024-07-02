my_last1 :: [a] -> a
my_last1 xs = let a = length xs - 1
                  ys = drop a xs
              in head ys
my_last2 :: [a] -> a
my_last2 xs = let ys = reverse xs
              in head ys

my_init1 :: [a] -> [a]
my_init1 xs = let a = length xs - 1
              in take a xs

my_init2 :: [a] -> [a]
my_init2 xs = let ys = reverse xs
                  zs = tail ys
              in reverse zs
