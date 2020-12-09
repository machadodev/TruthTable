{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_TruthTableGenerator (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Haskell\\git\\TruthTable\\.stack-work\\install\\840f5aa7\\bin"
libdir     = "C:\\Haskell\\git\\TruthTable\\.stack-work\\install\\840f5aa7\\lib\\x86_64-windows-ghc-8.8.4\\TruthTableGenerator-0.1.0.0-H2aj5oCaDGv1MzVz2NcUuG"
dynlibdir  = "C:\\Haskell\\git\\TruthTable\\.stack-work\\install\\840f5aa7\\lib\\x86_64-windows-ghc-8.8.4"
datadir    = "C:\\Haskell\\git\\TruthTable\\.stack-work\\install\\840f5aa7\\share\\x86_64-windows-ghc-8.8.4\\TruthTableGenerator-0.1.0.0"
libexecdir = "C:\\Haskell\\git\\TruthTable\\.stack-work\\install\\840f5aa7\\libexec\\x86_64-windows-ghc-8.8.4\\TruthTableGenerator-0.1.0.0"
sysconfdir = "C:\\Haskell\\git\\TruthTable\\.stack-work\\install\\840f5aa7\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "TruthTableGenerator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "TruthTableGenerator_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "TruthTableGenerator_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "TruthTableGenerator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "TruthTableGenerator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "TruthTableGenerator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)