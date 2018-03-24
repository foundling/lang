data Tree a = Leaf a | Node (Tree a) a (Tree a)
    deriving Show

inorder :: Tree n -> [n]
inorder (Leaf n) = [n] 
inorder (Node l v r) = inorder l ++ [v] ++ inorder r 

tmin :: Tree n -> n
tmin (Leaf n) = n
tmin (Node l v r) = tmin l 

tmax :: Tree n -> n
tmax (Leaf n) = n
tmax (Node l v r) = tmax r 

tcount :: Tree n -> Int
tcount (Leaf n) = 1
tcount (Node l v r) = 1 + tcount l + tcount r

occurs :: (Eq n, Ord n) => n -> (Tree n) -> Bool 
occurs x (Leaf y) = x == y  
occurs x (Node l v r) = if x < v then occurs x l else occurs x r

t :: Tree Int
t = Node (Node (Leaf 1) 2 (Leaf 3)) 5 
         (Node (Leaf 7) 8 (Leaf 9))
