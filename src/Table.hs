module Table where

-- data type created to model our problem
data Tree
  = Symbol Char
  | UO Char Tree -- Negation Unary Operator
  | BO Char Tree Tree -- Binary Operator
  deriving (Show, Eq)

truth :: Tree -> [(Tree, Bool)]
truth s = [(s, b) | b <- [True, False]]

table :: [Tree] -> [[(Tree, Bool)]]
table [] = [[]]
table (s : ss) = [t : ts | t <- truth s, ts <- table ss]

-- add white space in string
addWhiteSpace :: Int -> String
addWhiteSpace cnt
  | cnt > 0 = " " ++ addWhiteSpace (cnt - 1)
  | otherwise = ""

-- Align text to center
alignTextCenter :: Int -> String -> String
alignTextCenter size str
  | null str = ""
  | length str >= size - 1 = str
  | otherwise = do
    let len = (size - length str) `div` 2
    addWhiteSpace len ++ str ++ addWhiteSpace (size - len - length str)