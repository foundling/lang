sqDist :: Double -> Double -> Double
sqDist x y = x^2 + y^2
sqDistFromZero = sqDist 0

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

product' :: [Int] -> Int
product' [] = 1
product' (x:xs) = x * product' xs


foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v [] = v
foldr' f v (x:xs) = f x (foldr' f v xs)

data Tree a = Empty | Node (Tree a) a (Tree a)

sumt :: Tree Int -> Int 
sumt Empty = 0
sumt (Node l x r) = sumt l + x + sumt r

t1 = Node Empty (12 :: Int) Empty
