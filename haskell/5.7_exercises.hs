firstHundredSquares :: [Int]
firstHundredSquares = [x^2 | x <- [1..100]]

grid :: Int -> Int -> [(Int,Int)]
grid x y = [(x',y') | x' <- [0 .. x], y' <- [0 .. y]] 

square :: Int -> [(Int,Int)]
square x = [(y,z)| (y,z) <- grid x x, y /= z] 

replicate' :: Int -> a -> [a]
replicate' 0 a = [] 
replicate' n a = a:(replicate (n - 1) a)

pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x,y,z) | 
        x <- [1 .. n], 
        y <- [1 .. n], 
        z <- [1 .. n], 
        x^2 + y^2 == z^2, 
        x <= n, 
        y <= n, 
        z <= n]

factors :: Int -> [Int]
factors n = [ x | x <- [1..n], n `mod` x == 0 ]

-- revise this one
perfects :: Int -> [Int]
perfects n = perfectNumbers
    where
        nums = [1 .. n] 
        factorGroups = [(x,init $ factors x) | x <- nums ]
        perfectNumbers = [ fst (x,y) | (x,y) <- factorGroups, sum y == x ]
