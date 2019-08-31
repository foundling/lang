{-
 - const :: a -> b -> a
 - id :: a -> a
 - const id :: (c -> c) -> b -> (c -> c)
 - with a list like [1,2,3,4]:
 - const id 2 7 = 7
 - const id 1 7 = 7
 -}
last' = foldr1 (const id)
