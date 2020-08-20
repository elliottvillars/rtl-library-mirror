{-# OPTIONS_HADDOCK prune #-}

-- |
-- -- Module      : HalfAdder
-- -- Description : Short description
-- -- Copyright   : (c) Elliott Villars
-- -- License     : GPL-3
-- -- Maintainer  : elliottvillars@gmail.com
-- -- Stability   : stable
-- -- Portability : POSIX
-- -- Verified?   : No
module HalfAdder where

import Clash.Prelude

{-# ANN
  topEntity
  ( Synthesize
      { t_name = "halfAdder",
        t_inputs =
          [ PortName "i_INPUT_A",
            PortName "i_INPUT_B"
          ],
        t_output =
          PortProduct
            "o"
            [ PortName "SUM",
              PortName "COUT"
            ]
      }
  )
  #-}

-- |
-- A formally verified half adder logic primative.
-- Limited usefulness. Not registered.
-- Ports are as follows: i_INPUT_A,i_INPUT_B,o_SUM,o_COUT
halfAdder ::
  -- | 1-bit wide input for the first operand
  Bool ->
  -- | 1-bit wide input for the second operand
  Bool ->
  -- | 1-bit wide outputs for the result of A xor B and possible carry generation
  (Bool, Bool)
halfAdder a b = (sum, carryOut)
  where
    sum = a `xor` b
    carryOut = a && b

topEntity :: Bool -> Bool -> (Bool, Bool)
topEntity = halfAdder
