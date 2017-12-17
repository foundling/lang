prod :: [Int] -> Int 
prod [] = 1
prod (x:xs) = x * product xs


merge :: [Int] -> [Int] -> [Int]
merge (x:xs) (y:ys) |
    x > y = [x] ++ merge (xs) (y:ys)
    otherwise = [y] ++ merge (x:xs) (ys)
