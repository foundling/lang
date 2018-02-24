{-
 -
 - 185.201.44.30/22
 -
 -
 -octet ('.':xs) = [""] : octet xs
 -}

octet :: String -> [String] 
octet "" = []
octet ('.':xs) = octet xs -- add to array,: 
octet (x:xs) = [x] : (octet xs) -- append to string, ++
