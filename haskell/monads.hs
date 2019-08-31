f, g :: Float -> Float
f n = 2*n;
g n = 3*n;

f', g' :: Float -> (Float, String)
f' x = (f x, " called by f.")
g' x = (g x, " called by g.")

bind :: (Float -> (Float, String)) -> ((Float, String) -> (Float, String))
bind f' (gx, gs) = let (fx, fs) = f' gx in (fx, fs ++ gs) 

unit :: a -> (a, String)
unit x = (x, "")

lift f = unit . f


