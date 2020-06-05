module Grid where

data Grid = Rectangle {height, width :: Int} deriving (Show)

data Cell = Cell {north, south, east, west :: Bool, row, column :: Int}

newCell :: Int -> Int -> Cell
newCell = Cell False False False False
