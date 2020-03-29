/*
 * =====================================================================================
 *
 *       Filename:  cic.h
 *
 *    Description: Header file for a Cascaded Integrator Comb filter. 
 *
 *        Version:  1.0
 *        Created:  03/23/2020 07:29:41 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Elliott Villars (), elliottvillars@gmail.com
 *   Organization:  
 *
 * =====================================================================================
 */

#include "util.h"
void buildCICBase(FILE * fh, int input_width,int conversion_factor,int bool_is_decimator,int stages, int differential_delay);
void buildIntegrator(FILE * fh,int integrator_stages);
void buildDownsampler(FILE * fh,int decimation_factor);
void buildComb(FILE * fh, int stages, int differential_delay);
