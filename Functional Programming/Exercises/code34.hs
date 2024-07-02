data Shape = Circle Float | Rectangle Float Float

perimetroCirculo :: Shape -> Float

perimetroCirculo (Circle n) = pi*n*2

perimetroRetangulo :: Shape -> Float

perimetroRetangulo (Rectangle n x) = n*2+x*2
