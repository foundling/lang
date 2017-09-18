main :: IO ()
main = putStrLn ( greet "World" )

greet who = "Hello, " ++ who 

add :: Int -> Int -> Int
add a b = a + b

add1 = add 1

myLength :: a -> Int
myLength x = 3

