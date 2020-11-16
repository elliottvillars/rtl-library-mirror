module Cic where

main :: IO ()
main = do
  mapM_ putStrLn $ genHeader 1 2
  mapM_ putStrLn $ genIntRegs 4 12
  mapM_ putStrLn $ genCombRegs 4 12
  mapM_ putStrLn $ genDiffRegs 4 12
  mapM_ putStrLn $ genIntComb 4 12 4

--stages = ceil (target_res / log4(dr))
getStage :: Int -> Int -> Int
getStage res dr = ceiling xstg
  where
    enob = (logBase 4 . fromIntegral) dr
    cast = fromIntegral res
    xstg = cast / enob

guard :: Int -> Maybe Int
guard x
  | x < 0 = Nothing
  | x >= 0 = Just x

bitGrowth :: Int -> Int -> Int -> Int -> Int
bitGrowth stg dr dd bin = res
  where
    mul = dr * dd
    log = (logBase 2 . fromIntegral) mul
    caststg = fromIntegral stg
    grow = ceiling $ caststg * log
    res = grow + bin

genHeader :: Int -> Int -> [String]
genHeader iw ow = head ++ body ++ tail
  where
    head = ["module CIC_Decimator ("]
    body = map (\x -> "\t" ++ x) ports
    --sw = (1) ? ["Decimator ("] : ["Interpolator ("]
    ports = ["input wire i_CLK,", "input wire signed [" ++ (show iw) ++ ":0] i_DIN,", "output reg signed [" ++ (show ow) ++ ":0] o_DOUT"]
    tail = [");"]

genIntRegs :: Int -> Int -> [String]
genIntRegs stg bw = map (\x -> x ++ ";") $ zipWith (++) base idx
  where
    base = replicate stg $ "reg [" ++ (show bw) ++ ":0] r_INT_S"
    idx = map show $ enumFromTo 0 $ stg - 1

genCombRegs :: Int -> Int -> [String]
genCombRegs stg bw = map (\x -> x ++ ";") $ zipWith (++) base idx
  where
    base = replicate stg $ "reg [" ++ (show bw) ++ ":0] r_COMB_S"
    idx = map show $ enumFromTo 0 $ stg - 1

genDiffRegs :: Int -> Int -> [String]
genDiffRegs stg bw = map (\x -> x ++ ";") $ zipWith (++) base idx
  where
    base = replicate stg $ "reg [" ++ (show bw) ++ ":0] r_DDELAY_S"
    idx = map show $ enumFromTo 0 $ stg - 1

genIntComb :: Int -> Int -> Int -> [String]
genIntComb stg bw iw = head ++ body ++ tail
  where
    head = ["always@(posedge i_CLK)", "begin"]
    body = spc ++ exp
    spc = ["r_INT_S0 <= {{" ++ (show $ bw - iw) ++ "{i_DATA_IN[" ++ (show $ iw -1) ++ "]}},i_DATA_IN}; //SIGN EXTENSION\n"]
    p1 = zipWith (++) (replicate stg $ "r_INT_S") $ map show cnt
    p2 = zipWith (++) (replicate stg $ "r_INT_S") $ map show $ map (subtract 1) cnt
    p3 = map (\x -> x ++ " <= ") p1
    p4 = map (\x -> " + " ++ x) p2
    exp = map (\x -> x ++ ";") $ zipWith (++) (zipWith (++) p3 p1) $ p4
    cnt = enumFromTo 1 $ stg
    tail = ["end"]

genDownSample :: Int -> [String]
genDownSample dr = head ++ body ++ tail
  where
    head = ["always@(posedge i_CLK)", "begin"]
    val = show $ dr - 2
    cmp = ["\tif(r_COUNTER == " ++ val ++ ")", "\t\tbegin", "\t\t\tr_COUNTER <= 0;", "\t\t\tr_COMB_EN <= 1;", "\t\tend"]
    els = ["\telse", "\t\tbegin", "\t\t\tr_COUNTER <= r_COUNTER + 1'b1;", "\t\t\tr_COMB_EN <= 0;", "\t\tend"]
    body = cmp ++ els
    tail = ["end"]
