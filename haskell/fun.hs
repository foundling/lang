type Name = [Char]
type Initial = Char

data Person = Person Name Initial Name
  deriving (Show)

p1 = Person "Alexander" 'H' "Ramsdell"
p2 = Person "Maya" 'L' "Rosen"

getLastName (Person (f:fs) m l) = l 

data PersonRecord = PersonRecord {
   firstName :: Name
 , middleInitial :: Initial
 , lastName :: Name
} deriving (Show)

p3 = PersonRecord {
     firstName = "Alex"
   , middleInitial = 'H'
   , lastName = "Ramsdell"
   }
