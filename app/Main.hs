module Main where

import Data.List (nub)
import Operations (join, operations, satisfability, symbols)
import Parser (bodyTree2str, headerTree2str, parse)
import Table (table)

-- K - Conjunction
-- A - Disjunction
-- C - Conditional
-- E - Biconditional
-- N - Negation

-- Entry Point
main :: IO ()
main = do
  -- Input
  let formula = "CKabAaNc"
  putStrLn ("Formula: " ++ formula)

  -- Parse string formula to tree
  let tree = parse formula
  -- Retrieve all occurrences of non repeated symbols
  let sbs = nub $ symbols (head tree)
  -- Retrieve all occurrences of non repeated operators
  let ops = nub $ operations (head tree)
  -- Join symbols to operators evaluating
  let tb = join (table sbs) ops
  -- Beautify output
  -- Extract header of tree
  let header = headerTree2str (head tb)
  -- Extract truth table values
  let body = map bodyTree2str tb
  -- Check if table is tautology, satisfiable or contradiction
  let sat = satisfability tb

  -- Print
  putStrLn header
  mapM_ putStrLn body
  putStrLn sat
