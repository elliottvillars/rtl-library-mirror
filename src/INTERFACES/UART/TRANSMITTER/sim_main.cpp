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

void tick(Vuart_transmitter * top) {
	top->i_CLK = 0;
	top->eval();
	top->i_CLK = 1;
	top->eval();
	top->i_CLK = 0;
	top->eval();
}
void tx_state(Vuart_transmitter * top,int cycle)
{
	switch(top->uart_transmitter__DOT__r_CURRENT_STATE) {
		case 0: printf("%d: CURRENT TX STATE: IDLE\n",cycle);
			break;
		case 1: printf("%d: CURRENT TX STATE: START TX\n",cycle);
			break;
		case 2: printf("%d: CURRENT TX STATE: TRANSMIT\n",cycle);
			break;
		case 3: printf("%d: CURRENT TX STATE: STOP TX\n",cycle);
			break;
	}
}

int main(int argc,char ** argv)
{
	Verilated::commandArgs(argc,argv);

	Vuart_transmitter * top = new Vuart_transmitter;
	cout << "Objects created." << '\n';

	top->i_CLK = 0;
	top->i_RESET = 1;
	top->i_CLK_EN = 1;
	top->i_TX_ENABLE = 0;
	top->i_DATA_IN = 0x0;
	tick(top);
	top->i_RESET = 0;
	top->i_TX_ENABLE = 0;
	tick(top);
	unsigned out = 0;
	for(unsigned i = 0; i < 256 ; i = i + 1)
	{
		top->i_TX_ENABLE = 1;
		top->i_DATA_IN = i;
		tx_state(top,i);
		assert(top->o_TX);
		assert(!top->o_TX_BUSY);

		tick(top);
		tx_state(top,i);
		assert(!top->o_TX);
		assert(top->o_TX_BUSY);

		for(unsigned j = 0; j < 8; j = j + 1)
		{
			tick(top);
			out = (out >> 1) | (top->o_TX << 7);
		}
		assert(out == i);
		assert(top->o_TX_BUSY);
		tx_state(top,i);

		tick(top);
		tx_state(top,i);
		assert(top->o_TX);
		assert(top->o_TX_BUSY);

		tick(top);
		tx_state(top,i);
		assert(top->o_TX);
		assert(!top->o_TX_BUSY);
		i++;
		out = 0;
	}
	top->final();
	cout << "Simulation finished." << '\n';
	delete top;
}
