-- https://gist.github.com/pchiusano/bf06bd751395e1a6d09794b38f093787

-- 1. sum up a [Int] using explicit recursion
-- easy

sumL :: [Int] -> Int
sumL [] = 0
sumL (x:xs) = x + sumL xs

-- 2. Write a function to reverse a list, including its signature. If possible, use one of the fold combinators, rather than explicit recursion.
-- hard

reverseL :: [a] -> [a] 
reverseL [] = []
reverseL xs = foldl (\ xs' y -> [y] ++ xs') [] xs


-- 3. Implement filter for lists. 
-- medium
filterL :: ( a -> Bool) -> [ a ] -> [ a ]
filterL p [] = []
filterL p (x:xs)
    | p x == True = x : (filterL p xs)
    | otherwise = filterL p xs


-- 4. Implement filter and takeWhile using foldr.

--filter' :: (a -> Bool) -> [a] -> [a]
--filter' p xs = foldr 
