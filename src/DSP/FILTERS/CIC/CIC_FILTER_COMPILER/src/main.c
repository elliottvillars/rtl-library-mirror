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
//TODO: Add input sign extension
//TODO: fix comb sections final stage

char * help_str = "\t\t   --help: Prints this menu.\n\n \
		   --input_width: Set the input bit width of the CIC filter. Default is 2.\n\n \
		   --stages: Set the number of Comb/Integrator pairs. Default is 1\n\n \
		   --conversion_factor: Set the conversion factor.\n\n \
		   --differential_delay: Set the differential delay, either 1 or 2. Default is 1.\n\n \
		   --interpolator: Create a CIC interpolator. Default is decimator.\n\n";
int main(int argc, char ** argv)
{
	unsigned int input_width = 2;
	unsigned int bit_width = 0;
	unsigned int cic_stages = 1;
	unsigned int conversion_factor = 1;
	unsigned int bool_is_decimator = 1;
	unsigned int differential_delay = 1; //
	FILE * fh;


	if(argc == 1)
	{
		printf("%s",help_str);
		exit(0);
	}
	else
	{
		for(int i = 1; i < argc; ++i)
		{
			if(!strcmp(argv[i],"--help") || !strcmp(argv[i],"-h"))
			{
				printf("%s",help_str);
				exit(0);
			}
			else if(!strcmp(argv[i],"--stages"))
			{
				cic_stages = atoi(argv[i+1]);
				++i;
			}
			else if(!strcmp(argv[i],"--input_width"))
			{
				input_width = atoi(argv[i+1]);
				++i;
			}
			else if(!strcmp(argv[i],"--differential_delay"))
			{
				differential_delay = atoi(argv[i+1]);
				++i;
			}
			else if(!strcmp(argv[i],"--conversion_factor"))
			{
				conversion_factor = atoi(argv[i+1]);
				++i;
			}
			else if(!strcmp(argv[i], "--interpolator"))
			{
				bool_is_decimator = 0;
			}
			else
			{
				printf("%s is not a recognized argument. Exiting.\n",argv[i]);
				exit(-1);
			}
		}
	}
	bit_width = input_width + (cic_stages * Log(conversion_factor*cic_stages,2));

	if(bool_is_decimator == 1)
	{
		char * fname = "./cic_decimator.v";
		fh = fopen(fname, "w+");
		fprintf(fh,"//THIS IS AN AUTO GENERATED FILE.\n");
		buildCICBase(fh,input_width,conversion_factor,bool_is_decimator,cic_stages,differential_delay,bit_width);
		buildIntegrator(fh,cic_stages,bool_is_decimator,input_width,bit_width);
		buildDownsampler(fh,conversion_factor);
		buildComb(fh,cic_stages,differential_delay,bool_is_decimator,input_width,bit_width);

	}
	else
	{
		char * fname = "./cic_interpolator.v";
		fh = fopen(fname, "w+");
		fprintf(fh,"//THIS IS AN AUTO GENERATED FILE.\n");
		buildCICBase(fh,input_width,conversion_factor,bool_is_decimator,cic_stages,differential_delay,bit_width);
		buildComb(fh,cic_stages,differential_delay,bool_is_decimator,input_width,bit_width);
		buildUpsampler(fh,conversion_factor,cic_stages);
		buildIntegrator(fh,cic_stages,bool_is_decimator,input_width,bit_width);
	}
	fprintf(fh,"endmodule\n");
	fclose(fh);
}
