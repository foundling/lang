fizzbuzz n 
    | n `mod` 15 == 0 = "fizzbuzz"
    | n `mod` 5 == 0 = "buzz"
    | n `mod` 3 == 0 = "fizz"
    | otherwise = show n

results = [ fizzbuzz x | x <- [1..100] ] 

