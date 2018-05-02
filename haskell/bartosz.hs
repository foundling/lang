module Main where

main = print . sqDist $ (3,4)

sqDist :: (Int, Int) -> Int
sqDist (x,y) = x^2 + y^2
