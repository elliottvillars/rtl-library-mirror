/*
 * =====================================================================================
 *
 *       Filename:  cic.c
 *
 *    Description: CIC API 
 *
 *        Version:  1.0
 *        Created:  03/23/2020 07:38:15 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Elliott Villars (), elliottvillars@gmail.com
 *   Organization:  
 *
 * =====================================================================================
 */
#include "cic.h"
void buildCICBase(FILE * fh, int bit_width,int decimation_factor,int bool_is_decimator,int integrator_stages,int comb_stages,int differential_delay)
{
	if(bool_is_decimator != 0)
	{
		fprintf(fh,"module cic_decimator (\n");
	}
	else
	{
		fprintf(fh,"module cic_interpolator (\n");
	}
	fprintf(fh,"\tinput wire i_CLK,\n");
	fprintf(fh,"\tinput signed [%d:0] i_DATA_IN,\n",(bit_width-1));
	fprintf(fh,"\toutput reg signed [%d:0] o_DATA_OUT\n",(bit_width-1));
	fprintf(fh,");\n\n");
	fprintf(fh,"//UP/DOWNSAMPLE COUNTER\n");
	fprintf(fh,"reg [%d:0] r_COUNTER;\n", (int)ceil(Log(decimation_factor,2)));
	fprintf(fh,"reg r_COMB_ENABLE;\n");
	fprintf(fh,"\n");
	fprintf(fh,"//INTEGRATOR REGISTERS");
	fprintf(fh,"\n");
	for(int i = 0; i <= integrator_stages; i++)
	{
		fprintf(fh,"reg signed [%d:0] r_INT_S%d;\n",(bit_width-1),i);

	}
	fprintf(fh,"\n");
	fprintf(fh,"//COMB REGISTERS");
	fprintf(fh,"\n");
	for(int i = 0; i <= comb_stages; i++)
	{
		fprintf(fh,"reg signed [%d:0] r_COMB_S%d;\n",(bit_width-1),i);

	}
	fprintf(fh,"\n");
	fprintf(fh,"//COMB DELAY REGISTERS");
	fprintf(fh,"\n");
	for(int i = 0; i < comb_stages; i++)
	{
		if(differential_delay == 1)
		{
			fprintf(fh,"reg signed [%d:0] r_C_DELAY_S%d;\n",(bit_width-1),i);
		}
		else
		{
			fprintf(fh,"reg signed [%d:0] r_C_DELAY_S%d_1;\n",(bit_width-1),i);
			fprintf(fh,"reg signed [%d:0] r_C_DELAY_S%d_2;\n",(bit_width-1),i);
		}

	}
	fprintf(fh,"\n");
}
void buildIntegrator(FILE * fh, int integrator_stages)
{
	fprintf(fh,"//INTEGRATOR\n");
	fprintf(fh,"always@(posedge i_CLK)\n");
	fprintf(fh,"begin\n");
	fprintf(fh,"\tr_INT_S0 <= i_DATA_IN;\n");
	fprintf(fh,"\tr_INT_S1 <= r_INT_S0 + r_INT_S1;\n");
	if(integrator_stages > 1) 
	{
		for(int i = 1; i < integrator_stages; i++)
		{
			fprintf(fh,"\tr_INT_S%d <= r_INT_S%d + r_INT_S%d;\n",i+1,i,i+1);
		}
	}
	fprintf(fh,"end\n");
	fprintf(fh,"\n");
}
void buildDownsampler(FILE * fh, int decimation_factor)
{
	fprintf(fh,"//DOWNSAMPLER\n");
	fprintf(fh,"always@(posedge i_CLK)\n");
	fprintf(fh,"begin\n");
	fprintf(fh,"\tif(r_COUNTER == %d)\n",(decimation_factor-2)); //minus 2 to account for 1 clock cycle delay.
	fprintf(fh,"\tbegin\n");
	fprintf(fh,"\t\tr_COUNTER <= 0;\n");
	fprintf(fh,"\t\tr_COMB_ENABLE <= 1;\n");
	fprintf(fh,"\tend\n");
	fprintf(fh,"\telse\n");
	fprintf(fh,"\tbegin\n");
	fprintf(fh,"\t\tr_COUNTER <= r_COUNTER + 1'b1;\n");
	fprintf(fh,"\t\tr_COMB_ENABLE <= 0;\n");
	fprintf(fh,"\tend\n");
	fprintf(fh,"end\n");
	fprintf(fh,"\n");
}
void buildComb(FILE * fh, int integrator_stages,int comb_stages,int differential_delay)
{
	fprintf(fh,"//COMB\n");
	fprintf(fh,"always@(posedge i_CLK)\n");
	fprintf(fh,"begin\n");
	fprintf(fh,"\tif(r_COMB_ENABLE == 1)\n");
	fprintf(fh,"\tbegin\n");
	fprintf(fh,"\t\tr_COMB_S0 <= r_INT_S%d;\n",integrator_stages);
	if(differential_delay == 1)
	{
		fprintf(fh,"\t\tr_C_DELAY_S0 <= r_COMB_S0;\n");
		for(int i = 1; i <= comb_stages; i++)
		{
			fprintf(fh,"\t\tr_COMB_S%d <= r_COMB_S%d - r_C_DELAY_S%d;\n",i,i-1,i-1);
			if(i == comb_stages)
				break;
			fprintf(fh,"\t\tr_C_DELAY_S%d <= r_COMB_S%d;\n",i,i);
		}
	}
	else
	{
		fprintf(fh,"\t\tr_C_DELAY_S0_1 <= r_COMB_S0;\n");
		fprintf(fh,"\t\tr_C_DELAY_S0_2 <= r_C_DELAY_S0_1;\n");
		for(int i = 1; i <= comb_stages; i++)
		{
			fprintf(fh,"\t\tr_COMB_S%d <= r_COMB_S%d - r_C_DELAY_S%d_2;\n",i,i-1,i-1);
			if(i == comb_stages)
				break;
			fprintf(fh,"\t\tr_C_DELAY_S%d_1 <= r_COMB_S%d;\n",i,i);
			fprintf(fh,"\t\tr_C_DELAY_S%d_2 <= r_C_DELAY_S%d_1;\n",i,i);
		}
	}
	fprintf(fh,"\t\to_DATA_OUT <= r_COMB_S%d;\n",comb_stages);
	fprintf(fh,"\tend\n");
	fprintf(fh,"end\n");
}
