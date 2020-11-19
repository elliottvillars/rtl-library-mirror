module CIC where

import System.Environment
import System.Exit

newtype Positive = Positive Int deriving (Eq, Ord, Show)

newtype TargetResolution = TargetResolution Int

newtype ConversionRatio = ConversionRatio Int

newtype InputWidth = InputWidth Int

newtype DifferentialDelay = DifferentialDelay Int

newtype StageCount = StageCount Int

newtype OutputWidth = OutputWidth Int

newtype Interp = Interp Bool

checkPositive :: Int -> IO Positive
checkPositive x = if (x > 0) then pure $ (Positive x) else fail "Must be a non-negative number."

fromPositive :: Positive -> Int
fromPositive (Positive x) = x

parseInterp :: [String] -> Interp
parseInterp [] = Interp False
parseInterp ("-i" : _) = Interp True
parseInterp (_ : xs) = parseInterp xs

parseTargetResolution :: [String] -> IO TargetResolution
parseTargetResolution [] = pure $ TargetResolution 16
parseTargetResolution ("-t" : targ : _) = do
  x <- (checkPositive . read) targ
  pure $ TargetResolution $ fromPositive x
parseTargetResolution (_ : xs) = parseTargetResolution xs

parseConversionRatio :: [String] -> IO ConversionRatio
parseConversionRatio [] = pure $ ConversionRatio 1
parseConversionRatio ("-d" : dr : _) = do
  x <- (checkPositive . read) dr
  pure $ ConversionRatio $ fromPositive x
parseConversionRatio (_ : xs) = parseConversionRatio xs

parseInputWidth :: [String] -> IO InputWidth
parseInputWidth [] = pure $ InputWidth 2
parseInputWidth ("-n" : iw : _) = do
  x <- (checkPositive . read) iw
  pure $ InputWidth $ fromPositive x
parseInputWidth (_ : xs) = parseInputWidth xs

parseDifferentialDelay :: [String] -> IO DifferentialDelay
parseDifferentialDelay [] = pure $ DifferentialDelay 1
parseDifferentialDelay ("-f" : dd : _) = do
  x <- (checkPositive . read) dd
  pure $ DifferentialDelay $ fromPositive x
parseDifferentialDelay (_ : xs) = parseDifferentialDelay xs

helpMes :: [String]
helpMes = usage ++ help ++ targ ++ decr ++ intr ++ iwid ++ ddel
  where
    usage = ["Usage: cicgen [ -h | -t <arg> | -d <arg> | -i | -n <arg> | -f <arg> ]"]
    help = ["-h: Prints this menu."]
    targ = ["-t: Sets target resolution in bits. Default is 16-bit resolution."]
    decr = ["-d: Sets the decimation/interpolation ratio. Default is 1x."]
    intr = ["-i: generate an CIC interpolator instead of a decimator."]
    iwid = ["-n: Set input size in bits. Default is 2-bit wide input."]
    ddel = ["-f: Sets diffential delay. Default is 1."]

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> do
      mapM_ putStrLn helpMes
      exitSuccess
    ["-h"] -> do
      mapM_ putStrLn helpMes
      exitSuccess
    _ -> main' args

main' :: [String] -> IO ()
main' arg =
  do
    target_res <- parseTargetResolution arg
    deci_ratio <- parseConversionRatio arg
    dif_del <- parseDifferentialDelay arg
    inwidth <- parseInputWidth arg
    let ip = parseInterp arg
    let stages = getStage target_res deci_ratio
    let owidth = bitGrowth stages deci_ratio dif_del inwidth
    let head = genHeader inwidth owidth ip
    let regs = genRegs stages owidth
    let ic = genIntDecim stages inwidth owidth
    let downsample = genDownSample deci_ratio
    let res = head ++ regs ++ ic ++ downsample

    mapM_ putStrLn res

--stages = ceil (target_res / log4(dr))
getStage :: TargetResolution -> ConversionRatio -> StageCount
getStage (TargetResolution res) (ConversionRatio dr) = StageCount $ ceiling xstg
  where
    enob = (logBase 4 . fromIntegral) dr
    cast = fromIntegral res
    xstg = cast / enob

bitGrowth :: StageCount -> ConversionRatio -> DifferentialDelay -> InputWidth -> OutputWidth
bitGrowth (StageCount stg) (ConversionRatio dr) (DifferentialDelay dd) (InputWidth bin) = OutputWidth res
  where
    mul = dr * dd
    log = (logBase 2 . fromIntegral) mul
    caststg = fromIntegral stg
    grow = ceiling $ caststg * log
    res = grow + bin

genHeader :: InputWidth -> OutputWidth -> Interp -> [String]
genHeader (InputWidth iw) (OutputWidth ow) (Interp sw) = head ++ body ++ tail
  where
    head = if sw == True then ["module CIC_Decimator ("] else ["module CIC_Interpolator ("]
    body = map (\x -> "  " ++ x) ports
    ports = ["input wire i_CLK,", "input wire signed [" ++ (show iw) ++ ":0] i_DIN,", "output reg signed [" ++ (show ow) ++ ":0] o_DOUT"]
    tail = [");"]
--
-- merge
--
genRegs :: StageCount -> OutputWidth -> [String]
genRegs stg ow = (genIntRegs stg ow) ++ (genCombRegs stg ow) ++ (genDiffRegs stg ow)

genIntRegs :: StageCount -> OutputWidth -> [String]
genIntRegs (StageCount stg) (OutputWidth ow) = map (\x -> x ++ ";") $ zipWith (++) base idx
  where
    base = replicate stg $ "reg [" ++ (show ow) ++ ":0] r_INT_S"
    idx = map show $ enumFromTo 0 $ stg - 1

genCombRegs :: StageCount -> OutputWidth -> [String]
genCombRegs (StageCount stg) (OutputWidth ow) = map (\x -> x ++ ";") $ zipWith (++) base idx
  where
    base = replicate stg $ "reg [" ++ (show ow) ++ ":0] r_COMB_S"
    idx = map show $ enumFromTo 0 $ stg - 1

genDiffRegs :: StageCount -> OutputWidth -> [String]
genDiffRegs (StageCount stg) (OutputWidth ow) = map (\x -> x ++ ";") $ zipWith (++) base idx
  where
    base = replicate stg $ "reg [" ++ (show ow) ++ ":0] r_DDELAY_S"
    idx = map show $ enumFromTo 0 $ stg - 1

-- 
--
genIntDecim :: StageCount -> InputWidth -> OutputWidth -> [String]
genIntDecim (StageCount stg) (InputWidth iw) (OutputWidth ow) = head ++ body ++ tail
  where
    head = ["always@(posedge i_CLK)", "begin"]
    body = map (\x -> "\t" ++ x) $ spc ++ exp
    spc = ["r_INT_S0 <= {{" ++ (show $ ow - iw) ++ "{i_DATA_IN[" ++ (show $ iw -1) ++ "]}},i_DATA_IN}; //SIGN EXTENSION"]
    p1 = zipWith (++) (replicate stg $ "r_INT_S") $ map show cnt
    p2 = zipWith (++) (replicate stg $ "r_INT_S") $ map show $ map (subtract 1) cnt
    p3 = map (\x -> x ++ " <= ") p1
    p4 = map (\x -> " + " ++ x) p2
    exp = map (\x -> x ++ ";") $ zipWith (++) (zipWith (++) p3 p1) $ p4
    cnt = enumFromTo 1 $ stg
    tail = ["end"]

genDownSample :: ConversionRatio -> [String]
genDownSample (ConversionRatio dr) = head ++ body ++ tail
  where
    head = ["always@(posedge i_CLK)", "begin"]
    val = show $ dr - 2
    cmp = ["if(r_COUNTER == " ++ val ++ ")", "begin", "r_COUNTER <= 0;", "r_COMB_EN <= 1;", "end"]
    els = ["else", "begin", "r_COUNTER <= r_COUNTER + 1'b1;", "r_COMB_EN <= 0;", "end"]
    body = cmp ++ els
    tail = ["end"]

--TODO: Finish
genCombDecim :: StageCount -> InputWidth -> OutputWidth -> DifferentialDelay -> Interp -> [String]
genCombDecim (StageCount stg) (InputWidth iw) (OutputWidth ow) (DifferentialDelay dd) (Interp ip) = head ++ body ++ tail
  where
    head = ["always@(posedge i_CLK)","begin"]
    body = map (\x -> "\t" ++ x) $ spc ++ exp
    spc = ["r_COMB_S0 <= r_INT_S" ++ show stg]
    p1 = zipWith (++) (replicate stg $ "r_COMB_S") $ map show cnt
    p2 = zipWith (++) (replicate stg $ "r_COMB_S") $ map show $ map (subtract 1) cnt
    p3 = map (\x -> x ++ " <= ") p1
    p4 = map (\x -> " + " ++ x) p2
    exp = map (\x -> x ++ ";") $ zipWith (++) (zipWith (++) p3 p1) $ p4
    cnt = enumFromTo 1 $ stg
    tail = ["end"]
