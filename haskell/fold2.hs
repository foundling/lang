foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v [] = v 
foldr' f v (x:xs) = f x (foldr' f v xs) 

product' :: Num a => [a] -> a 
product' xs = foldr' (*) 1 xs

sum' :: Num a => [a] -> a
sum' xs = foldr' (+) 0 xs

and' :: Bool -> Bool
and' x = foldr' (&&) True x
