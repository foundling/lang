data MyMaybe x = MyJust x | MyNothing
  deriving (Show)

instance Functor MyMaybe where
  fmap g (MyJust x) = MyJust (g x)
  fmap _ MyNothing =  MyNothing
