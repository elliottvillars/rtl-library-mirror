package require Bluetcl
package require Bluesim

if {$argc < 1} {
	puts "ERROR: No arguments supplied. Exiting"
	exit 1
} elseif {$argc > 2} {
	puts "ERROR: Too many arguments supplied."
	exit 1
} else {
	foreach arg $argv {
		switch $arg {
			"sim" {
				puts "Generation simulation harness"
				set simflag 1
			}
			"gen" {
				puts "Generating files"
			}
			default {
				puts "ERROR: arguement unrecognized - $arg"
			}
		}
	}
}
set top  "halfadder"
set flist [glob *.bsv]
set bflag "./build/"
set simdir  "./sim/bluesim/"
set altsim "./sim/verilator/"
set fdir "./formal/"
set vdir "./hdl/"
### Make the necessary directories

#if {simflag == 1} {
#file mkdir $simdir
#file mkdir $altdir
#}
set bscArgs "-verilog -sat-yices -g $top -u $flist"

file mkdir $bflag
file mkdir $fdir
file mkdir $vdir

exec bsc -verilog -vdir $vdir -O -bdir $bflag -sat-yices -g $top -u $flist
#Read the output file and add formal stuff

set fp [open "./hdl/$top.v" r]
set file_data [read $fp]
close $fp

set fp [open "./formal/$top\_formal.v" w+]
set data [split $file_data "\n"]

foreach line $data {
	if {[string match "module $top*" $line]} {
		puts $fp "module $top\_formal(CLK,"
		continue
	} 
	if {[string match endmodule* $line]} {
		puts $fp "\n //Formal verification for use with Symbiyosys"
		puts $fp " `ifdef FORMAL"
		puts $fp " `endif"
		puts $fp $line
	} else {
		puts $fp $line
	}
}
close $fp

set fp [open "./formal/config.sby" w+]
puts $fp "\[tasks\]"
puts $fp "prove prove"
puts $fp "cover cover"
puts $fp "\[engines\]"
puts $fp "smtbmc yices"
puts $fp "\[options\]"
puts $fp "prove: mode prove"
puts $fp "prove: depth 64"
puts $fp "cover: mode cover"
puts $fp "cover: depth 64"
puts $fp "\[files\]"
puts $fp "$top\_formal.v"
puts $fp "\[script\]"
puts $fp "read -formal *.v"
puts $fp "prep -top $top\_formal"
close $fp



