
set sim "./sim"
set build "./build"
set hdl "./hdl"
set formal "./formal"
set top "ssd_driver"

file mkdir $sim $build $hdl $formal

set files [glob *.bsv]
exec bsc -v -verilog -simdir $sim -bdir $build -vdir $hdl -g $top -u $files

set fp [open "$hdl/$top.v" "r"]
set fdata [read $fp]
close $fp

set data [split $fdata "\n"]

set fp [open "$formal/$top\_formal.v" "w+"]

foreach line $data {
	puts $fp $line
}
close $fp
exec sed -i "s/module $top/module $top\_formal/g" "$formal/$top\_formal.v"
exec sed -i "s/endmodule/\\n\\/\\/Symbiyosys formal verification\\n`ifdef FORMAL\\n`endif\\n endmodule/g" "$formal/$top\_formal.v"
