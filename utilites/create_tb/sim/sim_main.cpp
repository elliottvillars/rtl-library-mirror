/*
###################################################
#THIS IS A COMPUTER GENERATED FILE, MODIFICATION UNADVISED.#
#GENERATED: 2020-08-02 15:20:14                   #
###################################################
*/
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vfoo.h"
#include <iostream>

void cycle(Vfoo * dut,VerilatedVcdC * tfp, int tickcount) {
/*
dut->eval();
if(tfp) {
tfp->dump(tickcount * 10 - 2);
}
dut->i_CLK = 1;
dut->eval();
if(tfp) {
tfp->dump(tickcount * 10);
}
dut->i_CLK = 0;
dut->eval();
if(tfp) {
tfp->dump(tickcount * 10 + 5);
tfp-> flush();
}
*/
}

int main(int argc, char ** argv) {
	Verilated::commandArgs(argc,argv);
	Vfoo * dut = new Vfoo;

	//Verilated::traceEverOn(true);
	//VerilatedVcdC * tfp = new VerilatedVcdC;
	//dut->trace(tfp,99);//Trace 99 levels of hierarchy
	//tfp->open("trace.vcd");

	/* RESET SECTION */
	/* END OF RESET  */

	/* TEST SECTION */
	int cycle_count = 1;
	while(1) {
		//cycle(dut,tfp,cycle_count);
	}
	/* END OF TEST  */
	//tfp->close();

	delete dut;
	//delete tfp;
}
