{-# LANGUAGE NoMonomorphismRestriction #-}

-- find the last element of a list

last' [] = error "No elements in list!"
last' [x] = x 
last' (_:xs) = last xs

last'' [] = error "No elements in list!"
last'' xs = head $ reverse xs

last''' = head . reverse

last'''' = foldl1 (flip const)
last''''' = foldr1 (const id)
