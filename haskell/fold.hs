prod :: Num a => [a] -> a
prod = foldr (*) 1

--fldr :: (a -> b -> b) -> b -> [a] -> b
--fldr f v [] = v
--fldr f v (x:xs) = f x (fldr f v xs)    
fldr :: (a -> a -> a) -> a -> [a] -> a
fldr f v [] = v
fldr f v (x:xs) = f x (fldr f v xs)    

r = fldr (+) 0 [1,2,3]

add' :: Num a => a -> a -> a
add' a b = a + b
