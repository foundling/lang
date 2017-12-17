fact' :: Int -> Int
fact' n
    | n <= 0 = 1
    | otherwise = n * fact' (n-1)

mult :: Int -> Int -> Int
m `mult` 0 = 0
m `mult` n = m + (m `mult` (n - 1))

prod :: Num a => [a] -> a
prod [] = 1
prod (x:xs) = x * prod xs  

rev' :: [a] -> [a]
rev' [] = [] 
rev' (x:xs) = rev' xs ++ [x]

insert :: Ord a => a -> [a] -> [a] 
insert x [] = [x]
insert x (y:ys)
    | x <= y = x:y:ys
    | otherwise = y:insert x ys

isort :: Ord a => [a] -> [a]
isort [] = []
isort (y:ys) = insert y (isort ys)

zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = [] 
zip' [] _ = [] 
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys 

drop' :: Int -> [b] -> [b]
drop' _ [] = []
drop' 0 xs = xs
drop' n (_:xs) = drop (n - 1) xs

fib :: Int -> Int
fib 1 = 1
fib 2 = 2
fib n = fib (n - 1) + fib (n - 2) 

pow :: (Eq a, Num a) => a -> a -> a 
pow a 0 = 1 
pow a b = a * pow a (b - 1) 
