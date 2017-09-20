import Data.Char

atoi a = ord a - ord 'a';  
itoa i = chr (i + (ord 'a'))

shift c n 
    | isLower c = itoa ((atoi c + n) `mod` 26)
    | otherwise = c
            
caesar cipher n = [ shift c n | c <- cipher ]  

shifted = caesar "meet me at the pizza." 1 
shifted' = caesar shifted (-1)
