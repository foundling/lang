notDot :: Char -> Bool
notDot = (/=) '.'

octets :: String -> [String]
octets [] = []
octets xs = octet : octets (drop (nCollected + 1) xs)
    where
        octet = takeWhile notDot xs
        nCollected = length octet


