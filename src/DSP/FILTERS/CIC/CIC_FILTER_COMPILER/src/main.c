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


//TODO: automatically generate parameters based on desired resolution. (i.e ENOB)
//TODO: set input
char * comm_list[] = {"--help","--bit_width","--integrator_stages","--comb_stages","--decimation_factor","--interpolator","--differential_delay","--DIR","--auto"};
char * help_str = "--help: Prints this menu.\n\n--bit_width: Set the bit width of the CIC filter.\n\n--integrator_stages: Set the number of integrator stages.\n\n--comb_stages: Set the number of comb stages.\n\n--decimation_factor: Set the decimation factor.\n\n--differential_delay: Set the differential delay, either 1 or 2.\n\n--interpolator: Create a CIC interpolator. Default is decimator.\n\n";
int main(int argc, char ** argv)
{
	int bit_width = 32;
	int integrator_stages = 4;
	int comb_stages = 4;
	int decimation_factor = 64;
	int bool_is_decimator = 1;
	int differential_delay = 1; //
	char target_directory[64] = "./";
	int bool_is_auto = 0;
	FILE * fh;


	//read commandline args here
	for(int i = 1; i < argc; i++)
	{
		if(!strcmp(argv[i],comm_list[0]))
		{
			printf(help_str);
			exit(0);
		}
		else if(!strcmp(argv[i],comm_list[1])) //set bit width
		{
			bit_width = atoi(argv[i+1]);
			i++;
		}
		else if(!strcmp(argv[i],comm_list[2])) //set integrator stages
		{
			integrator_stages = atoi(argv[i+1]);
			i++;
		}
		else if(!strcmp(argv[i],comm_list[3])) //set comb stages
		{
			comb_stages = atoi(argv[i+1]);
			i++;
		}
		else if(!strcmp(argv[i],comm_list[4])) //set decimation factor
		{
			decimation_factor = atoi(argv[i+1]);
			i++;
		}
		else if(!strcmp(argv[i],comm_list[5]))//decimator or interpolator
		{
			bool_is_decimator = 0;
		}
		else if(!strcmp(argv[i],comm_list[6]))//differential_delay
		{
			differential_delay = atoi(argv[i+1]);
			i++;
		}
		else if(!strcmp(argv[i],comm_list[7])) //target directory
		{
			strcpy(target_directory,argv[i+1]);
			i++;
		}
		else if(!strcmp(argv[i],comm_list[8]))
		{
			bool_is_auto = 1;
		}
		else
		{
			printf("%s is not a recognized argument. Exiting\n",argv[i]); 
			exit(-1);
		}
	}
	if((bool_is_auto & bool_is_decimator) == 1)
	{
		/*char * input_freq;*/
		/*char * output_freq;*/
	}
	printf("Current settings:\n");
	(bool_is_decimator == 1) ? printf("DECIMATOR\n") : printf("INTERPOLATOR\n");
	printf("BIT WIDTH: %d\n",bit_width);
	printf("INTEGRATOR STAGES: %d\n",integrator_stages);
	printf("COMB STAGES: %d\n",comb_stages);
	printf("DECIMATION FACTOR: %d\n",decimation_factor);
	printf("DIFFERENTIAL DELAY: %d\n",differential_delay);
	printf("TARGET DIRECTORY: %s\n",target_directory);


	if(bool_is_decimator == 1)
	{
		if(bool_is_decimator == 1)
		{
			char * fname = "/cic_decimator.v";
			char * path = strcat(target_directory,fname);
			fh = fopen(path, "w+");
		}
		else
		{
			char * fname = "/cic_interpolator.v";
			char * path = strcat(target_directory,fname);
			fh = fopen(path, "w+");
		}
		fprintf(fh,"//THIS IS AN AUTO GENERATED FILE.\n");
		if(bool_is_auto == 1)
		{
			//request input freq
			//request output freq
			//request resolution
			//F = fin/fout
			//output bit_width = ceil(log2(F))
			//ENOB = log4(F)
			//stages = ceil(resolution/ENOB)
		}
		buildCICBase(fh,bit_width,decimation_factor,bool_is_decimator,integrator_stages,comb_stages,differential_delay);
		buildIntegrator(fh,integrator_stages);
		buildDownsampler(fh,decimation_factor);
		buildComb(fh,integrator_stages,comb_stages,differential_delay);

	}
	else
	{
		printf("UNIMPLEMENTED!\n");
		exit(-1);
		buildComb(fh,integrator_stages,comb_stages,differential_delay);
		//write upsampler
		buildIntegrator(fh,integrator_stages);
	}
	fprintf(fh,"endmodule\n");
	fclose(fh);
}
