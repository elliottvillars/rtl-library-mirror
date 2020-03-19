/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description: Verilator main 
 *
 *        Version:  1.0
 *        Created:  03/18/2020 10:59:29 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Elliott Villars (), elliottvillars@gmail.com
 *   Organization:  
 *
 * =====================================================================================
 */

#include <verilated.h>
#include <iostream>
#include "Vaccumulator.h"

int main (int argc, char** argv)
{
	Verilated::commandArgs(argc, argv);

	Vaccumulator * dut = new Vaccumulator;
	dut->i_RST = 1;
	dut->i_CLK = 0;
	dut->eval();
	dut->i_CLK = 1;
	dut->eval();
	dut->i_RST = 0;
	dut->eval();

	int sim_sum = 0;
	for(int i = 0; i < 10; i = i + 1)
	{
		printf("Current iteration: %d\n",i);
		sim_sum += i;
		dut->i_SUMMAND = i;
		dut->i_CLK_EN = 1;
		dut->i_CLK = 0;
		dut->eval();
		dut->i_CLK = 1;
		dut->eval();
		if(dut->o_ACCUMULATION != sim_sum)
		{
			printf("SIMULATION FAILED AT %d\n",i);
			printf("EXPECTED VALUE: %d\n",sim_sum);
			printf("ACTUAL VALUE: %d\n",dut->o_ACCUMULATION);
			break;
		}
	}

	delete dut;
}
