/*
 * =====================================================================================
 *
 *       Filename:  sim_main.cpp
 *
 *    Description: Testbench for lfsr 
 *
 *        Version:  1.0
 *        Created:  10/19/2020 11:33:27 AM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#include <verilated.h>
#include "Vlfsr.h"

void tick(Vlfsr * top) {
	top->i_CLK = !top->i_CLK;
	top->eval();
	top->i_CLK = !top->i_CLK;
	top->eval();
}
int main(int argc, char ** argv) {
	Verilated::commandArgs(argc,argv);

	Vlfsr * top = new Vlfsr;

	top->i_CLK = 0;
	top->i_RESET = 1;
	top->i_DATA_IN = 0;
	tick(top);
	tick(top);
	tick(top);
	tick(top);
	top->i_RESET = 0;

	for (int i = 0; i < 256; i++) {
		printf("Byte %d: %x\n",i,top->o_DATA_OUT);
		printf("LFSR State: %x\n\n",top->o_STATE_OUT);
		tick(top);
	}
	delete top;
}
