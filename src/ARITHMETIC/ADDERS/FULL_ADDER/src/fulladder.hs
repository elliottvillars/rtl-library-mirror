module FullAdder where
import Clash.Prelude

fulladder a b cin = (sum, carryOut)
          where
              sum = a `xor` b `xor` cin
              carryOut =  a && b || a `xor` b && cin

topEntity :: Bool -> Bool -> Bool -> (Bool,Bool)
topEntity = fulladder
