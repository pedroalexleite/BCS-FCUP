maxOccurs :: Integer -> Integer -> (Integer, Integer)

maxOccurs x y | x>y = (x,1)
              | x<y = (y,1)
              | x==y = (x,2)

orderTriple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)

orderTriple x y z | x <= y && y <= z = (x,y,z)
                  | y <= x && x <= z = (y,x,z)
                  | z <= x && x <= y = (z,x,y)
                  | x <= z && z <= y = (x,z,y)
                  | y <= z && z <= x = (y,z,x)
                  | z <= y && y <= x = (z,y,x)
