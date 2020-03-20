***THIS IS AN AUTO GENERATED TESTBENCH***
#include "verilated.h"
#include "Vfoo.h"
#include <iostream>

int main(char ** argv, int argc)
{
Verilated::commandArgs(argc, argv);
Vfoo * dut = new Vfoo;
//***RESET GOES HERE***
//****END OF RESET*****

//***TEST SECTION GOES HERE***
while(1)
{

//***APPLY TEST VECTORS HERE***
	dut->i_CLK = 0;
	dut->eval();
	dut->i_CLK = 1;
	dut->eval();

}
//*****END OF TEST SECTION****
}
