module SVG where

-- Types

type Pos = (Int,Int)
type Length = Int

data Color = Red | Green | Blue
             deriving (Eq, Show)

data Type = Point | Line
             deriving (Eq, Show)

data Shape = Circle Pos Length
           | Rect Pos Pos Pos Pos
           | Polyline [Pos]
           | Polygon [Pos]

data SVGElement = E Shape Color

data SVG = SVG [SVGElement] 

-- Predicates

type SVGPred = SVGElement -> Bool

onSVG :: ([SVGElement] -> [SVGElement]) -> SVG -> SVG
onSVG f (SVG es) = SVG (f es)

mapSVG :: (SVGElement -> SVGElement) -> SVG -> SVG
mapSVG f = onSVG (map f)

hasColor :: Color -> SVGPred
hasColor c (E _ c') = c==c'

hasType :: Type -> SVGPred
hasType Point (E (Polyline [_]) _) = True
hasType Line  (E (Polyline _) _) = True

(/\) :: SVGPred -> SVGPred -> SVGPred
p /\ q = \e -> p e && q e

(\/) :: SVGPred -> SVGPred -> SVGPred
p \/ q = \e -> p e || q e

addPositions :: Pos -> Pos -> Pos
addPositions a b = ((fst a + fst b),(snd a + snd b))

-- Filtering
--
select :: SVGPred -> SVG -> SVG
select p (SVG es) = SVG (filter p es)

-- Transformations
--
setColorTo :: Color -> SVGElement -> SVGElement
setColorTo c (E s _) = E s c

translate :: Pos -> SVGElement -> SVGElement 
translate (x',y') (E (Circle (x,y) r) c) = E (Circle (x + x', y + y') r) c  
translate (x',y') (E (Rect (x1,y1) (x2,y2) (x3,y3) (x4,y4)) c) = E (Rect (x1 + x', y1 + y') (x2 + x', y2 + y') (x3 + x', y3 + y') (x4 + x', y4 + y')) c
translate pos' (E (Polyline ps) c) = E (Polyline (map (addPositions pos') ps)) c 

-- Examples
--
mkRedLinesBlue :: SVG -> SVG
mkRedLinesBlue = mapSVG (setColorTo Blue) . select (hasColor Red /\ hasType Line)


-- tests
--

isBlue :: SVGElement -> Bool 
isBlue (E _ c) = c == Blue 

getColor :: SVGElement -> Color
getColor (E _ c) = c 

getColors :: SVG -> [Color]
getColors (SVG xs) = map getColor xs

getRadius :: SVGElement -> Int 
getRadius (E (Circle (x,y) r) c) = r  

getRadii :: SVG -> [Int]
getRadii (SVG xs) = map getRadius xs

--svg = SVG [E (Circle (0,1) 3) Blue, E (Circle (4,2) 10) Red, E (Circle (4,2) 10) Green]
