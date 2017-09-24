len :: [a] -> Int
len [] = 0
len (x:xs) = 1 + len xs

rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]

insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys)
    | x <= y = x:y:ys
    | otherwise = y:insert x ys 
