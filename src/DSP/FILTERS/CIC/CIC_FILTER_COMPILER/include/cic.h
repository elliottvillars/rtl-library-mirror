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
void buildCICBase(FILE * fh, unsigned int input_width,unsigned int conversion_factor,unsigned int bool_is_decimator,unsigned int stages, unsigned int differential_delay,unsigned int bit_width);
void buildIntegrator(FILE * fh,unsigned int stages,unsigned int bool_is_decimator,unsigned int input_width,unsigned int bit_width);
void buildDownsampler(FILE * fh,unsigned int conversion_factor);
void buildUpsampler(FILE * fh, unsigned int conversion_factor,unsigned int stages);
void buildComb(FILE * fh, unsigned int stages, unsigned int differential_delay,unsigned int bool_is_decimator,unsigned int input_width,unsigned int bit_width);
