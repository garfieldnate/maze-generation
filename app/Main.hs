module Main where

import           System.Environment

import           Lib

main :: IO ()
main = do
    args <- getArgs
    let specFile = case args of
            []        -> error "Missing argument: maze spec file"
            (arg : _) -> arg
    readMazeSpec specFile
