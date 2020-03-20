
FILE="$1"
if [ -z "$1" ]; then
	echo "No argument supplied. Exiting."
	exit -1
else
	if [ ${1: -2} != ".v" ]; then
		echo "Supplied file does not appear to be a Verilog file. Exiting."
		exit -2
	fi
fi
if [ ! -d "./sim/" ]; then
	mkdir sim
fi

FILE="${1%%.*}"
SIM_MAIN="./sim/tb_main.cpp"
touch $SIM_MAIN
printf "***THIS IS AN AUTO GENERATED TESTBENCH***\n" > $SIM_MAIN
printf "#include \"verilated.h\"\n" >> $SIM_MAIN
printf "#include \"V$FILE.h\"\n" >> $SIM_MAIN
printf "#include <iostream>\n" >> $SIM_MAIN
printf "\n" >> $SIM_MAIN
printf "int main(char ** argv, int argc)\n{\n" >> $SIM_MAIN
printf "Verilated::commandArgs(argc, argv);\n" >> $SIM_MAIN
printf "V$FILE * dut = new V$FILE;\n" >> $SIM_MAIN
printf "//***RESET GOES HERE***\n" >> $SIM_MAIN
printf "//****END OF RESET*****\n" >> $SIM_MAIN
printf "\n" >> $SIM_MAIN
printf "//***TEST SECTION GOES HERE***\n" >> $SIM_MAIN
printf "while(1)\n" >> $SIM_MAIN
printf "{\n" >> $SIM_MAIN
printf "\n" >> $SIM_MAIN
printf "//***APPLY TEST VECTORS HERE***\n" >> $SIM_MAIN
printf "\tdut->i_CLK = 0;\n" >> $SIM_MAIN
printf "\tdut->eval();\n" >> $SIM_MAIN
printf "\tdut->i_CLK = 1;\n" >> $SIM_MAIN
printf "\tdut->eval();\n" >> $SIM_MAIN
printf "\n" >> $SIM_MAIN
printf "}\n" >> $SIM_MAIN
printf "//*****END OF TEST SECTION****\n" >> $SIM_MAIN
printf "delete V$FILE;" >> $SIM_MAIN
printf "}\n" >> $SIM_MAIN
