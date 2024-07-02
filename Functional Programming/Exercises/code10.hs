xor :: Bool -> Bool -> Bool
xor a b|  a == True && b == False = True
       |  a == False && b == True = True
       |  a == True && b == True = False
       |  a == False && b == False = False
