/*
 * =====================================================================================
 *
 *       Filename:  sim_main.cpp
 *
 *    Description: int to float 32 testbench
 *
 *        Version:  1.0
 *        Created:  10/28/2020 04:13:14 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <verilated.h>
#include <assert.h>
#include <limits.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <filesystem>
#include "Vint32_to_float_sp.h"

typedef struct TestVector {
	int input;
	float expected_output;
}TestVector;

void tick(Vint32_to_float_sp * top) {
	top->i_CLK = 0;
	top->eval();
	top->i_CLK = 1;
	top->eval();
	top->i_CLK = 0;
	top->eval();
}
int to754(int input) {
	int exp = 127 + 31;
	int mant = abs(input);
	int sign = input & 0x1;

	unsigned zcount = 0;
	for(int i = 0; i < 32; ++i)
	{
		if(input < 0) {
			break;
		}
		else
		{
			mant <<= 1;
			zcount++;
		}
	}
	exp -= zcount;
	int result = (sign << 31) | (exp << 23) | (mant >> 9);
	return result;
}
void genTestVect(std::vector<TestVector>& v) {
	for(auto i = 0; i < 512; ++i) {
		TestVector entry;
		entry.input = i;
		entry.expected_output = to754(i);
		v.push_back(entry);
		printf("Pushed element: %x\n",v[i].expected_output);
	}
}
int main(int argc, char ** argv) {
	Verilated::commandArgs(argc,argv);

	Vint32_to_float_sp * top = new Vint32_to_float_sp();

	std::vector<TestVector> tv;
	tv.reserve(512);
	genTestVect(tv);
	for(int i = 0; i < 3; i = i + 1)
	{
		top->i_FIXED_WORD = tv[i].input;
		tick(top);
		tick(top);
		assert(tv[i].expected_output == top->o_FLOAT_WORD);
		//std::cerr << "Current progress: " << (i / UINT_MAX) * 100;	
	}
}

