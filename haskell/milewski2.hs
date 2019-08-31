sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

product' :: [Int] -> Int
product' [] = 1
product' (x:xs) = x * product' xs 

fold' :: (a -> b -> b) -> b -> [a] -> b
fold' f v [] = v 
fold' f v (x:xs) = f x (fold' f v xs)

data Tree a = Empty | Node (Tree a) a (Tree a)
    deriving (Show, Eq)


rmDups :: [x] -> [x]
rmDups [] = []
rmDups (x:xs) = x : rmDups (filter (\== x)) xs
