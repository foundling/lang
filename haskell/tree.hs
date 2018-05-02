data Tree a = Empty | Leaf a | Node (Tree a) a (Tree a)
    deriving Show

inorder :: Tree n -> [n]
inorder Empty = []
inorder (Leaf n) = [n] 
inorder (Node l v r) = inorder l ++ [v] ++ inorder r 

preorder :: Tree n -> [n]
preorder Empty = []
preorder (Leaf n) = [n] 
preorder (Node l v r) = postorder l ++ postorder r ++ [v]

postorder :: Tree n -> [n]
postorder Empty = []
postorder (Leaf n) = [n] 
postorder (Node l v r) = [v] ++ postorder l ++ postorder r

tmin :: Tree n -> Maybe n
tmin Empty = Nothing
tmin (Node Empty v r) = Just v 
tmin (Node l v r) = tmin l 

tmax :: Tree n -> Maybe n
tmax Empty = Nothing
tmax (Node l v Empty) = Just v
tmax (Node l v r) = tmax r

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
t = Node (Node Empty 2 (Leaf 3)) 5 
         (Node (Leaf 7) 8 (Leaf 9))
