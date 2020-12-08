module Operations where

import Data.List (find, nub)
import Data.Maybe (fromJust)
import Table (Tree (..))

-- K - Conjunction
-- A - Disjunction
-- C - Conditional
-- E - Biconditional
-- N - Negation

-- Evaluate formulas
eval :: [(Tree, Bool)] -> Tree -> Bool
eval k y = case y of
  BO 'K' l r -> eval k l && eval k r
  BO 'A' l r -> eval k l || eval k r
  BO 'C' l r -> not (eval k l) || eval k r
  BO 'E' l r -> eval k l && eval k r || not (eval k l) && not (eval k r)
  UO 'N' l -> not (eval k l)
  Symbol _ -> snd $ fromJust $ find ((== y) . fst) k

joinHelper :: [(Tree, Bool)] -> [Tree] -> [(Tree, Bool)]
joinHelper _ [] = []
joinHelper x (y : ys) = [(y, z) | z <- [eval x y]] ++ joinHelper x ys

-- Join symbols to operators
join :: [[(Tree, Bool)]] -> [Tree] -> [[(Tree, Bool)]]
join [] _ = []
join (x : xs) y = (x ++ joinHelper x y) : join xs y

-- Retrieve all symbols
symbols :: Tree -> [Tree]
symbols tree = case tree of
  Symbol _ -> [tree]
  UO _ n -> symbols n
  BO _ l r -> symbols l ++ symbols r

-- Retrieve all operators
operations :: Tree -> [Tree]
operations tree = case tree of
  Symbol _ -> []
  UO _ n -> operations n ++ [tree]
  BO _ l r -> operations l ++ operations r ++ [tree]

-- Retrieve the last column of a matrix
lastElements :: [[a]] -> [a]
lastElements = map last

satisfabilityHelper :: [(Tree, Bool)] -> String
satisfabilityHelper a
  | length a == 2 = "Formula satisfativel"
  | otherwise =
    if snd $ head a
      then "Tautologia"
      else "Contradicao"

satisfability :: [[(Tree, Bool)]] -> String
satisfability tb = satisfabilityHelper $ nub $ lastElements tb