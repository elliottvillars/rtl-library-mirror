
set bdir "build"
set hdl "hdl"
set simdir "sim"
set top "swap"

file mkdir $bdir
file mkdir $hdl
file mkdir $simdir

exec bsc -verilog -sat-yices -simdir $simdir -bdir $bdir -vdir $hdl -g mkSwap -u $top.bsv
exec bsc -verilog -sat-yices -simdir $simdir -bdir $bdir -vdir $hdl -g mkUSwap -u $top.bsv
