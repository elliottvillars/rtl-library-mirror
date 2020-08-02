/*
###################################################
#THIS IS A COMPUTER GENERATED FILE, DO NOT MODIFY.#
#GENERATED: 2020-08-01 15:41:25                   #
###################################################
*/
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vsystolic_multiplier.h"
#include <iostream>

void cycle(Vsystolic_multiplier * dut,VerilatedVcdC * tfp, int tickcount) {
	dut->eval();
	if(tfp)
		tfp->dump(tickcount * 10 - 2);
	dut->i_CLK = 1;
	dut->eval();
	if(tfp)
		tfp->dump(tickcount * 10);
	dut->i_CLK = 0;
	dut->eval();
	if(tfp) {
		tfp->dump(tickcount * 10 + 5);
		tfp-> flush();
	}
}

int main(int argc, char ** argv) {
	Verilated::commandArgs(argc,argv);
	Vsystolic_multiplier * dut = new Vsystolic_multiplier;

	Verilated::traceEverOn(true);
	VerilatedVcdC * tfp = new VerilatedVcdC;
	dut->trace(tfp,99);//Trace 99 levels of hierarchy
	tfp->open("./trace.vcd");

	/* RESET SECTION */
	/* END OF RESET  */

	dut->i_MULTIPLIER = 2;
	dut->i_MULTIPLICAND = 0;
	
	/* TEST SECTION */
	int cycle_count = 1;
	while(1) {
		cycle(dut,tfp,cycle_count);
		dut->i_MULTIPLICAND = 0;
		if(cycle_count == 8)
			break;
		cycle_count++;
	}
	/* END OF TEST  */
	tfp->close();

	delete dut;
	delete tfp;
}
