
module Specops where

-- implimentation with pipes
pipes o i a b
	| o == 3 = a ** logBase i b
	| o == -3 = i ** logBase b a
	| otherwise = error ("operation order " ++ (show o) ++ " not implimented here")

-- partially applicable higher order difference
diff o x i y
	| o == 1 = y + x - i
	| o == 2 = y * x / i
	| o == 3 = y ** logBase i x



-- itterative ratio function with arbitrary identity (currently only for evenly divisible)
rat a b i = rat' a b i 0
	where rat' a b i c
		| a <= 0 = c
		| otherwise = rat' (a - b) b i (c + i)

--rat 0 b c i = c
--rat a b c i = rat (a-b) b (c+i)




-- defaults
--(**) = op 3 2
--(//) = op (-3) 2




