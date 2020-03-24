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
#include "cic.h"
//determine integrator stages
//determine comb stages
//determine decimation factor
//select between interpolation an decimation
//adjustable bit width
//
//


//TODO:create an API for this.
//TODO: enable custom directory


int main(int argc, char ** argv)
{
	int integrator_stages = 4;
	int comb_stages = 4;
	int decimation_factor = 64;
	int bit_width = 32;
	int bool_is_decimator = 1;
	FILE * fh;


	//read commandline args here
	for(int i = 0; i < argc; i++)
	{
	}
	

	if(bool_is_decimator == 1)
	{
		if(bool_is_decimator == 1)
		{
			fh = fopen("../../DECIMATOR/cic_decimator.v", "w+");
		}
		else
		{
			fh = fopen("../build/cic_interpolator.v", "w+");
		}
		fprintf(fh,"//THIS IS AN AUTO GENERATED FILE.\n");
		buildCICBase(fh,bit_width,decimation_factor,bool_is_decimator,integrator_stages,comb_stages);
		buildIntegrator(fh,integrator_stages);
		buildDownsampler(fh,decimation_factor);
		buildComb(fh,integrator_stages,comb_stages);

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
