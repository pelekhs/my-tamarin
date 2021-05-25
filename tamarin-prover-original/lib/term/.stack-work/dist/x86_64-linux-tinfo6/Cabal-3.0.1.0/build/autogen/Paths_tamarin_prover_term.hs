{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_tamarin_prover_term (
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
version = Version [1,6,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/sotiris/opt/tamarin-prover/.stack-work/install/x86_64-linux-tinfo6/e752afee19fc919be13aac50ade5e59f952949e57be423c4fd133eec02eeea3c/8.8.4/bin"
libdir     = "/home/sotiris/opt/tamarin-prover/.stack-work/install/x86_64-linux-tinfo6/e752afee19fc919be13aac50ade5e59f952949e57be423c4fd133eec02eeea3c/8.8.4/lib/x86_64-linux-ghc-8.8.4/tamarin-prover-term-1.6.0-57mNCOJh6KKH9qAJlev5pz"
dynlibdir  = "/home/sotiris/opt/tamarin-prover/.stack-work/install/x86_64-linux-tinfo6/e752afee19fc919be13aac50ade5e59f952949e57be423c4fd133eec02eeea3c/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/sotiris/opt/tamarin-prover/.stack-work/install/x86_64-linux-tinfo6/e752afee19fc919be13aac50ade5e59f952949e57be423c4fd133eec02eeea3c/8.8.4/share/x86_64-linux-ghc-8.8.4/tamarin-prover-term-1.6.0"
libexecdir = "/home/sotiris/opt/tamarin-prover/.stack-work/install/x86_64-linux-tinfo6/e752afee19fc919be13aac50ade5e59f952949e57be423c4fd133eec02eeea3c/8.8.4/libexec/x86_64-linux-ghc-8.8.4/tamarin-prover-term-1.6.0"
sysconfdir = "/home/sotiris/opt/tamarin-prover/.stack-work/install/x86_64-linux-tinfo6/e752afee19fc919be13aac50ade5e59f952949e57be423c4fd133eec02eeea3c/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "tamarin_prover_term_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tamarin_prover_term_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "tamarin_prover_term_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "tamarin_prover_term_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tamarin_prover_term_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tamarin_prover_term_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
