type Assoc k v = [(k,v)]
type Subst = Assoc Char Bool

data Prop = Const Bool 
          | Var Char
          | Not Prop
          | And Prop Prop
          | Implies Prop Prop
            deriving (Show)

p1 = Var 'A'
p2 = Var 'B' 
p3 = And p1 p2
p4 = Implies (And p1 p2) p1


eval :: Subst -> Prop -> Bool
eval _ (Const b) = b 
eval s (Var x) = lookup x s
