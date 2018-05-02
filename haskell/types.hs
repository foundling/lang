type Pos = (Int,Int)
type Transform = Pos -> Pos
type Line = (Pos,Pos)

up :: Transform
up p = (fst p + 1, snd p + 1)

lineUp :: Line -> Line
lineUp positions = positions
