module Parser where

import Table (Tree (..), alignTextCenter)

-- Polish Notation - https://en.wikipedia.org/wiki/Polish_notation
-- N - Negation
-- K - Conjunction
-- A - Disjunction
-- C - Conditional
-- E - Biconditional

str2tree :: Char -> [Tree] -> [Tree]
str2tree 'K' (l : r : s) = BO 'K' l r : s
str2tree 'A' (l : r : s) = BO 'A' l r : s
str2tree 'C' (l : r : s) = BO 'C' l r : s
str2tree 'E' (l : r : s) = BO 'E' l r : s
str2tree 'N' (q : s) = UO 'N' q : s
str2tree c s = Symbol c : s

-- Parse input string to tree
parse :: String -> [Tree]
parse = foldr str2tree []

tree2strHelper :: Tree -> String
tree2strHelper (Symbol c) = [c]
tree2strHelper (BO a l r) = a : tree2strHelper l ++ tree2strHelper r
tree2strHelper (UO a v) = a : tree2strHelper v

-- Extract variables and formulas from first line (aligned to center)
headerTree2str :: [(Tree, Bool)] -> String
headerTree2str [] = ""
headerTree2str (x : xs) = alignTextCenter 10 (tree2strHelper (fst x)) ++ "|" ++ headerTree2str xs

-- Cast from Boolean to String
bool2str :: Bool -> String
bool2str True = "T"
bool2str False = "F"

body2strHelper :: (Tree, Bool) -> String
body2strHelper (Symbol _, b) = bool2str b
body2strHelper (BO {}, b) = bool2str b
body2strHelper (UO {}, b) = bool2str b

-- Parse the truth table values to string (aligned to center)
bodyTree2str :: [(Tree, Bool)] -> String
bodyTree2str [] = ""
bodyTree2str (x : xs) = alignTextCenter 10 (body2strHelper x) ++ "|" ++ bodyTree2str xs
