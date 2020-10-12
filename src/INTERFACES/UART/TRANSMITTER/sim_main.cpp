/*
 * =====================================================================================
 *
 *       Filename:  uart_tx_main.cpp
 *
 *    Description: UART TX Testbench 
 *
 *        Version:  1.0
 *        Created:  10/11/2020 05:39:25 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vuart_transmitter.h"
#include <iostream>

using namespace std;

int main(int argc,char ** argv)
{
	Verilated::commandArgs(argc,argv);
	unsigned int cycles = 0;

	Vuart_transmitter * top = new Vuart_transmitter;
	VerilatedVcdC * trace_ = new VerilatedVcdC;
	Verilated::traceEverOn(true);
	cout << "Objects created." << '\n';

	trace_->open("trace.vcd");
	cout << "File opened." << '\n';
	

	top->trace(trace_,5);

	top->i_CLK = 0;
	top->i_RESET = 0;
	top->i_TX_ENABLE = 1;
	top->i_DATA_IN = 0x8;
	cout << "Initial input loaded." << '\n';
	while(cycles < 16)
	{
		cout << "Start of loop: " << cycles << '\n';
		top->eval();
		top->i_CLK = !top->i_CLK;
		top->eval();
		cout << "Dumping trace #: " << cycles << '\n';
		trace_->dump(10 * cycles + 5);
		cycles++;

	}
	top->final();
	trace_->close();
	cout << "Simulation finished." << '\n';
	delete top;
	delete trace_;
}
