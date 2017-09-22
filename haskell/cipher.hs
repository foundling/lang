import Data.Char

atoi :: Char -> Int
atoi a = ord a - ord 'a';  

itoa :: Int -> Char
itoa i = chr (i + (ord 'a'))

shift :: Char -> Int -> Char
shift c n 
    | isLower c = itoa ((atoi c + n) `mod` 26)
    | otherwise = c

count' :: Char -> [Char] -> Int  
count' x xs = length [ x | y <- xs, x == y  ]  

lowers :: [Char] -> Int
lowers xs = length [ x | x <- xs, elem x ['a'..'z'] ]

percent :: Int -> Int -> Float
percent n m = (fromIntegral n / fromIntegral m) * 100

freqs :: [Char] -> [Float]
freqs xs = [ percent (count' x xs) n | x <- ['a' .. 'z']]
    where 
        n = lowers xs

chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o-e)^2/e) | (o,e) <- zip os es]

rotate :: Int -> [a] -> [a]
rotate n xs = drop n' xs ++ take n' xs  
    where
        n' = n `mod` (length xs)

table :: [Float]
table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0, 
         0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0, 
         6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1] 

positions :: Eq a => a -> [a] -> [Int] 
positions x xs = [i | (x', i) <- zip xs [0..], x == x']

table' :: [Float]
table' = freqs "kdvnhoo lv ixq"

encode n xs = [shift n x | x <- xs]

crack :: [Char] -> [Char]
crack xs = encode (-factor) xs
    where
        factor = head (positions (minimum chitab) chitab) 
        chitab = [chisqr (rotate n table') table | n <- [0..25]]  
        table' = freqs xs

{--
text = "meet me at the pizza."
shifted = encode 1 text 
shifted' = encode (-1) shifted
--}
