
set bdir "build"
set hdl "hdl"
set simdir "sim"
set top "swap"


file mkdir $bdir
file mkdir $hdl
file mkdir $simdir

exec bsc -verilog -sat-yices -simdir $simdir -bdir $bdir -vdir $hdl -g $top -u $top.bsv
