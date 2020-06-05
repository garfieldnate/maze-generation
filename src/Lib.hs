
module Lib
    ( readMazeSpec
    )
where

import           System.IO                      ( openFile
                                                , IOMode(ReadMode)
                                                , hClose
                                                , hGetContents
                                                )
import           Text.Read                      ( readMaybe )

data MazeType = Windy | Twisty | Corny | Undefined deriving (Show, Read)

-- TODO: would be better to take some kind of stream input instead
readMazeSpec :: FilePath -> IO ()
readMazeSpec path = do
    handle   <- openFile path ReadMode
    contents <- hGetContents handle
    let linesOfFile = lines contents
    -- TODO: should provide diagnostic info to user about malformed file
    let mazeType = case linesOfFile of
            []    -> Nothing
            l : _ -> readMaybe l :: Maybe MazeType
    print mazeType
    hClose handle
