{-
 - Some basic utility function implementations for practice
 - see Nikita Volkov's answer here for better implementation: 
 - https://stackoverflow.com/questions/20093312/how-to-capitalize-the-first-letter-of-a-string-and-lowercase-the-rest-in-haskell
 -}

import Data.Char
import Data.List

upperCaseFirstLetter :: [Char] -> [Char]
upperCaseFirstLetter (x:xs) = toUpper x : xs 

capitalize :: [Char] -> [Char]
capitalize =  intercalate " " . (map upperCaseFirstLetter) . words 
