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

isort [] = []
isort (x:xs) = insert x (isort xs)

zip' :: [a] -> [a] -> [(a,a)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' n (_:xs) = drop' (n-1) xs 

fib :: Int -> Int
fib n 
    | n <= 2 = n 
    | otherwise = fib (n - 1) + fib (n - 2)

fibs :: Int -> [Int]
fibs n = map fib [1..n]


quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = smaller ++ [x] ++ larger
    where
        smaller = quicksort [x' | x' <- xs, x >= x' ]
        larger = quicksort [x' | x' <- xs, x < x' ]
