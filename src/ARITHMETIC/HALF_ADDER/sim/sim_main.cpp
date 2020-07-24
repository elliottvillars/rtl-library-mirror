/*
###################################################
#THIS IS A COMPUTER GENERATED FILE, DO NOT MODIFY.#
#GENERATED: 2020-07-23 19:08:34                   #
###################################################
*/
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vhalf_adder.h"
#include <iostream>

void cycle(Vhalf_adder * dut) {
//	dut->i_CLK = 0;
//	dut->eval();
//	dut->i_CLK = 1;
//	dut->eval();
}

int main(int argc, char ** argv) {
	Verilated::commandArgs(argc,argv);
	Vhalf_adder * dut = new Vhalf_adder;

	//Verilated::traceEverOn(true);
	//VerilatedVcdC * tfp = new VerilatedVcdC;
	//topp->trace(tfp,99);//Trace 99 levels of hierarchy
	//tfp->open("/path/to/output/file");

	/* RESET SECTION */
	/* END OF RESET  */

	/* TEST SECTION */
	while(1) {
		cycle(dut);
		//main_time += time_step; 
		//tfp->dump(main_time);
	}
	/* END OF TEST  */
	//tfp->close();

	delete dut;
}
