---
title: My Haskell wishlist
author: Carlos López
date: 
lang: en
tags: haskell,wishlist
---

in ghci:

  > import Data.Text

  > let xs = [pack $ "user",pack "app"]
Prelude Data.Text> splitAt 1 xs

<interactive>:19:1:
    Ambiguous occurrence `splitAt'
    It could refer to either `Data.Text.splitAt',
                             imported from `Data.Text'
                          or `Prelude.splitAt',
                             imported from `Prelude' (and originally defined in `GHC.List')

  > 
  
  Fix: call `Data.Text.splitAt`
  Wish: `Text.splitAt` should work too.c


* haskell-mode

 - Support region auto-indentation. To fix, look for the error message "Auto-reindentation of a region is not supported"


## Higher precedence for `>>`!

Suppose I've got a function `debugM :: String -> IO ()` that debugs, and a function `compute :: IO ()`. Then I can't write

`debugM $ "going computing" >> compute`

because `$` has so much precedence.

# Text.Read.Lex.Number should read 10^2 too

