
set top "mkAccumulator"
set vdir "./hdl"
set bdir "./build"
set simdir "./sim"
set formal "./formal"

file mkdir $vdir $bdir $simdir $formal

set files [glob *.bsv]

exec bsc -verilog -bdir $bdir -vdir $vdir -g $top -u $files

set fp [open "$vdir/$top.v" "r"]
set fdata [read $fp]
close $fp

set fp [open $formal/$top\_formal.v "w+"]
set data [split $fdata "\n"]

foreach line $data {
	#if line == endmodule add formal preamble
	if {[string match endmodule* $line]} {
		puts $fp "\n //Formal verification for use with Symbiyosys"
		puts $fp "`ifdef FORMAL"
		puts $fp "reg f_past_valid = 0;"
		puts $fp "always@(posedge i_CLK)"
		puts $fp "begin"
		puts $fp "  f_past_valid <= 1;"
		puts $fp "  assume(\$changed(i_CLK));"
		puts $fp "  if(\$rose(i_CLK) && f_past_valid)"
		puts $fp "  begin"
		puts $fp "    if(\$past(i_ENABLE && i_RESET_N))"
		puts $fp "    begin"
		puts $fp "    end"
		puts $fp "  end"
		puts $fp "end"
		puts $fp "`endif"
		puts $fp $line
	} else {
		puts $fp $line
	}
}
close $fp
exec sed -i "s/module $top/module $top\_formal/g" $formal/$top\_formal.v

