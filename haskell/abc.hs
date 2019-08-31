length' :: [a] -> Int
length' = foldr (\_ n -> n + 1) 0  
