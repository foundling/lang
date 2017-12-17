map' :: (x -> x) -> x -> x
map' f x = f x 

rmap :: (a -> b) -> [a] -> [b]
rmap f [] = []
rmap f (x:xs) = f x : rmap f xs
