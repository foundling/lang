import Data.Char

testIP = "192.168.2.8"

notDot :: Char -> Bool
notDot = (/=) '.'

charsToDigit :: [Char] -> [Int]
charsToDigit = map digitToInt 

digitsToDecimal :: [Int] -> Int
digitsToDecimal digits = sum $ map productOfPair $ zip reversedDigits powersOfTen
    where 
        productOfPair = (\ x -> (fst x) * (snd x)) 
        reversedDigits = reverse digits
        powersOfTen = iterate (*10) 1

octets :: String -> [Int]
octets [] = []
octets xs = octetInt : octets (drop (nCollected + 1) xs)
    where
        octetString = takeWhile notDot xs
        nCollected = length octetString
        octetInt = digitsToDecimal $ charsToDigit $ octetString

decToBin :: Int -> [Int]
decToBin 0 = []
decToBin x = (decToBin dividend) ++ [remainder]
    where
        (dividend, remainder) = divMod x 2 

makeByte :: [Int] -> [Int] 
makeByte bits = take 8 $ (replicate n 0) ++ bits 
    where
        n = 8 - (length bits)
