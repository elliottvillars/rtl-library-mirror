
set sim "./sim"
set build "./build"
set hdl "./hdl"
set top "mkTB"

file mkdir $sim $build $hdl

set files [glob *.bsv]
exec bsc -v -sim -simdir $sim -bdir $build -vdir $hdl -g $top -u $files
exec bsc -v -sim -simdir $sim -bdir $build -vdir $hdl -e $top

exec mv a.out $sim
exec mv a.out.so $sim
