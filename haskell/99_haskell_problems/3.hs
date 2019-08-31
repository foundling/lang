-- k'th element in list

kth :: [x] -> Int -> x
kth [] _ = error "Index out of range"
kth [x] 1 = x
kth (_:xs) k 
    | k < 1 = error "Index out of range"
    | otherwise = kth xs (k - 1) 
