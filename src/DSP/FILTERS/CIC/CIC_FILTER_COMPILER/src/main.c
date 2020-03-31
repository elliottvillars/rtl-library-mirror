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
//TODO: Print summary

char * help_str = "--help: Prints this menu.\n\n \
		   --input_width: Set the input bit width of the CIC filter.\n\n \
		   --stages: Set the number of Comb/Integrator pairs. Default is 1\n\n \
		   --conversion_factor: Set the conversion factor.\n\n \
		   --differential_delay: Set the differential delay, either 1 or 2. Default is 1.\n\n \
		   --interpolator: Create a CIC interpolator. Default is decimator.\n\n";
int main(int argc, char ** argv)
{
	int bit_width = 32;
	int input_width = 2;
	int cic_stages = 1;
	int conversion_factor = 1;
	int bool_is_decimator = 1;
	int differential_delay = 1; //
	FILE * fh;


	//read commandline args here
	for(int i = 1; i < argc; ++i)
	{
		if(!strcmp(argv[i],"--help"))
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
	printf("Current settings:\n");//TODO: move this
	(bool_is_decimator == 1) ? printf("DECIMATOR\n") : printf("INTERPOLATOR\n");
	printf("INPUT BIT  WIDTH: %d\n",bit_width);
	printf("STAGES: %d\n",cic_stages);
	printf("CONVERSION FACTOR: %d\n",conversion_factor);
	printf("DIFFERENTIAL DELAY: %d\n",differential_delay);


	if(bool_is_decimator == 1)
	{
		char * fname = "./cic_decimator.v";
		fh = fopen(fname, "w+");
	}
	else
	{
		char * fname = "./cic_interpolator.v";
		fh = fopen(fname, "w+");
	}
	if(bool_is_decimator == 1)
	{
		fprintf(fh,"//THIS IS AN AUTO GENERATED FILE.\n");
		buildCICBase(fh,input_width,conversion_factor,bool_is_decimator,cic_stages,differential_delay);
		buildIntegrator(fh,cic_stages,bool_is_decimator);
		buildDownsampler(fh,conversion_factor);
		buildComb(fh,cic_stages,differential_delay,bool_is_decimator);

	}
	else
	{
		fprintf(fh,"//THIS IS AN AUTO GENERATED FILE.\n");
		buildCICBase(fh,input_width,conversion_factor,bool_is_decimator,cic_stages,differential_delay);
		buildComb(fh,cic_stages,differential_delay,bool_is_decimator);
		buildUpsampler(fh,conversion_factor,cic_stages);
		buildIntegrator(fh,cic_stages,bool_is_decimator);
	}
	fprintf(fh,"endmodule\n");
	fclose(fh);
}
