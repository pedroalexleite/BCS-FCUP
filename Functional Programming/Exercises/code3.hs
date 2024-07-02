area :: (Floating Integer) => Integer -> Integer -> Integer -> Integer

area a b c = sqrt(((a+b+c)`div`2)*(((a+b+c)`div`2)-a)*(((a+b+c)`div`2)-b)*(((a+b+c)`div`2)-c))
