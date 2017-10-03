module Paths_lab04 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\nicky\\Documents\\cs3016\\CS3016-1617\\Lab04\\.stack-work\\install\\a64c1a55\\bin"
libdir     = "C:\\Users\\nicky\\Documents\\cs3016\\CS3016-1617\\Lab04\\.stack-work\\install\\a64c1a55\\lib\\x86_64-windows-ghc-7.10.3\\lab04-0.1.0.0-7A4YzfvFuZ77esh83Zdc1y"
datadir    = "C:\\Users\\nicky\\Documents\\cs3016\\CS3016-1617\\Lab04\\.stack-work\\install\\a64c1a55\\share\\x86_64-windows-ghc-7.10.3\\lab04-0.1.0.0"
libexecdir = "C:\\Users\\nicky\\Documents\\cs3016\\CS3016-1617\\Lab04\\.stack-work\\install\\a64c1a55\\libexec"
sysconfdir = "C:\\Users\\nicky\\Documents\\cs3016\\CS3016-1617\\Lab04\\.stack-work\\install\\a64c1a55\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "lab04_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "lab04_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "lab04_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lab04_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lab04_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
