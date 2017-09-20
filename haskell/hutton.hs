import Data.Char

xs = [1 .. 10]

abs' :: (Ord a, Num a) => a -> a
abs' a 
    | a >= 0 = a
    | otherwise = (-a)

concat' :: [[n]] -> [n] 
concat' xss = [ x | xs <- xss, x <- xs] 

lAnd' :: Bool -> Bool -> Bool
lAnd' True True = True 
lAnd' _ _ = False

odds' :: Int -> [Int]
odds' n = filter (\x -> x `mod` 2 == 1) [1 .. n]

odds'' :: Int -> [Int]
odds'' n = map (\x -> x*2 - 1) [1..n]

halve' xs = [take firstHalf xs, drop firstHalf xs]  
    where 
        firstHalf = length xs `div` 2

takeThree' xs = (head xs:(head (tail xs)):(head (tail (tail xs))):[])

takeThree'' xs = xs !! 0 : xs !! 1: xs !! 2 :[]

takeThree''' (a:b:c:_) = [a,b,c]  

third xs = (head (tail (tail xs)))
third' xs = xs !! 2

third'' (_:_:target:_) = target

safeTail xs = if null xs then [] else tail xs
safeTail' xs | null xs == True = []
             | otherwise = tail xs

safeTail'' [] = [] 
safeTail'' xs = tail xs


or' :: Bool -> Bool -> Bool 
or' False False = False
or' _ _ = True 

luhnDouble :: Int -> Int
luhnDouble x = if x*2 > 9 then x*2 - 9 else x*2

--luhn :: Int -> Int -> Int -> Int -> Bool

--map' fn [] = [] 
map' :: (x -> x) -> [x] -> [x]  
map' fn (x:xs) = (fn x): (map' fn xs) 

filter' :: (x -> Bool) -> [x] -> [x]
filter' p [] = []
filter' p (x:xs)
    | p x = x:filter p xs
    | otherwise = filter p xs

firsts' :: [(a,b)] -> [a]
firsts' ps = [x | (x,_) <- ps ]

factor' :: Int -> [Int]
factor' n = [x | x <- [1..n], n `mod` x == 0]

isPrime' :: Int -> Bool
isPrime' n = factor' n == [1,n]

pairs' :: [Int] -> [(Int,Int)]
pairs' xs = zip xs (tail xs)

sorted' :: [Int] -> Bool 
sorted' xs = and [ x <= y | (x,y) <- pairs' xs ] 

reverse' :: [x] -> [x]
reverse' [] = []
reverse' (x:xs) = reverse xs ++ [x] 

factorial n
    | n == 1 = 1
    | otherwise = n * factorial (n - 1)

factorial' n = product [1 .. n]

factors n = [ x | x <- [1..n], n `mod` x == 0 ]  

primes n = [x | x <- [2 .. n], not $ x `elem` nonprimes ]
    where
        nonprimes = [x | y <- [2 .. n], x <- [2*y, 2*y + y .. n]]  

lower' xs
    | (length xs) == 0 = 0
    | elem (head xs) ['a' .. 'z'] = 1 + lower' (tail xs)
    | otherwise = lower' (tail xs)


lower'' :: [Char] -> Int
lower'' xs = length [x | x <- xs, elem x ['a' .. 'z']]

count' s xs = length [ x | x <- xs , x == s ] 

let2int :: Char -> Int
let2int x = ord x - ord 'a' 

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

isLower' :: Char -> Bool 
isLower' x = elem x ['a'..'z']   

-- shift :: Int -> Char -> Char
