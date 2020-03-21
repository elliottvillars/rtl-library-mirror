#!/usr/bin/env bash

read -p "Filename: " FILE
read -p "Input signal count: " IC
read -p "Output signal count: " OC
read -p "State count: " SC
NAME="$FILE.v"
printf "module $FILE (\n" > $NAME
printf "\tinput wire i_CLK,\n" >> $NAME
printf "\tinput wire i_CLK_EN,\n" >> $NAME
printf "\tinput wire i_RESET,\n" >> $NAME
for ((i = 0; i < IC; i = i + 1))
do
	printf "\tinput wire i_INPUT_SIGNAL_$i,\n" >> $NAME
done
for ((i = 0; i < OC; i = i + 1))
do
	if ((i != OC - 1)); then
		printf "\toutput reg i_OUTPUT_SIGNAL_$i,\n" >> $NAME
	else
		printf "\toutput reg i_OUTPUT_SIGNAL_$i\n" >> $NAME

	fi
done
printf ");\n" >> $NAME

printf "\n" >> $NAME
printf "reg r_CURRENT_STATE;\n" >> $NAME
printf "reg r_NEXT_STATE;\n" >> $NAME
printf "\n" >> $NAME
for ((i = 0; i < SC; i = i + 1))
do
	printf "localparam s_STATE_$i = $i;\n" >> $NAME
done

printf "\n" >> $NAME
printf "always@(*) begin: NEXT_STATE_LOGIC\n" >> $NAME
printf "\tcase(r_CURRENT_STATE)\n" >> $NAME
for ((i = 0; i < SC; i = i + 1))
do
	printf "\t\t10'd$i:\n\t\tbegin\n\t\tend\n" >> $NAME
done
printf "\tendcase\n" >> $NAME
printf "end\n" >> $NAME
printf "\n" >> $NAME
printf "always@(posedge i_CLK) begin: STATE_REGISTERS\n" >> $NAME
printf "end\n" >> $NAME

printf "endmodule\n" >> $NAME
