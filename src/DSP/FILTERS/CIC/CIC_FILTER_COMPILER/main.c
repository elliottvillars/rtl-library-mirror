/*
 * =====================================================================================
 *
 *       Filename:  main.c
 *
 *    Description: A CIC filter compiler 
 *
 *        Version:  1.0
 *        Created:  03/22/2020 10:57:18 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Elliott Villars (), elliottvillars@gmail.com
 *   Organization:  
 *
 * =====================================================================================
 */
#include <stdio.h>
#include <math.h>
//determine integrator stages
//determine comb stages
//determine decimation factor
//select between interpolation an decimation
//adjustable bit width
//
//

int main(int argc, char ** argv)
{
	int integrator_stages = 1;
	int comb_stages = 1;
	int decimation_factor = 64;
	int bit_width = 32;
	int bool_is_decimator = 1;
	FILE * fh;


	//read commandline args here
	

	if(bool_is_decimator == 1)
	{
		//initital file write here
		fh = fopen("cic_decimator.v", "w+");
		fprintf(fh,"module cic_decimator (\n");
		fprintf(fh,"\tinput wire i_CLK,\n");
		fprintf(fh,"\tinput [%d:0] i_DATA_IN,\n",(bit_width-1));
		fprintf(fh,"\toutput reg [%d:0] o_DATA_OUT\n",(bit_width-1));
		fprintf(fh,");\n\n");
		fprintf(fh,"//UP/DOWNSAMPLE COUNTER\n");
		fprintf(fh,"reg [%d:0] r_COUNTER;", log2(decimation_factor));
		fprintf(fh,"reg r_COMB_ENABLE;");
		fprintf(fh,"\n");
		fprintf(fh,"//INTEGRATOR REGISTERS");
		fprintf(fh,"\n");
		for(int i = 0; i < integrator_stages; i++)
		{
			fprintf(fh,"reg [%d:0] r_INT_S%d;\n",(bit_width-1),i);

		}
		fprintf(fh,"\n");
		fprintf(fh,"//COMB REGISTERS");
		fprintf(fh,"\n");
		for(int i = 0; i < comb_stages; i++)
		{
			fprintf(fh,"reg [%d:0] r_COMB_S%d;\n",(bit_width-1),i);

		}
		fprintf(fh,"\n");
		fprintf(fh,"//COMB DELAY REGISTERS");
		fprintf(fh,"\n");
		for(int i = 0; i < comb_stages; i++)
		{
			fprintf(fh,"reg [%d:0] r_C_DELAY_S%d;\n",(bit_width-1),i);

		}
		fprintf(fh,"\n");


		//TODO:Write always blocks
		//write integrator
		//write downsampler
		//write comb
	}
	else
	{
		printf("UNIMPLEMENTED!\n");
		//write comb
		//write upsampler
		//write integrator
	}
	fprintf(fh,"endmodule\n");
	fclose(fh);
}
