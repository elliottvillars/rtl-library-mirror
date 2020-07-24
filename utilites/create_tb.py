import glob
import sys
import os
import shutil
from os import path
from shutil import copy
from datetime import datetime
# datetime object containing current date and time
#TODO: change file permissions
now = datetime.now()
dt_string = now.strftime("%Y-%m-%d %H:%M:%S")
path = os.getcwd() + '/'
f_path = path + "formal"
s_path = path + "sim"
files = glob.glob(path + "/*.v")
help_str = """
--help: Print this menu
--engine: Chose an SMT solver. Possible options are yices,z3,boolector. Default is yices.
--top: Name of top module. REQUIRED.
"""
def main():
    header_str = """###################################################
#THIS IS A COMPUTER GENERATED FILE, DO NOT MODIFY.#
#GENERATED: %s                   #
###################################################
""" % (dt_string)
    sim_string = """
#include \"verilated.h\"
#include \"verilated_vcd_c.h\"
#include \"V{top}.h\"
#include <iostream>

void cycle(V{top} * dut) {{
//\tdut->i_CLK = 0;
//\tdut->eval();
//\tdut->i_CLK = 1;
//\tdut->eval();
}}

int main(int argc, char ** argv) {{
\tVerilated::commandArgs(argc,argv);
\tV{top} * dut = new V{top};

\t//Verilated::traceEverOn(true);
\t//VerilatedVcdC * tfp = new VerilatedVcdC;
\t//topp->trace(tfp,99);//Trace 99 levels of hierarchy
\t//tfp->open("/path/to/output/file");

\t/* RESET SECTION */
\t/* END OF RESET  */

\t/* TEST SECTION */
\twhile(1) {{
\t\tcycle(dut);
\t\t//main_time += time_step; 
\t\t//tfp->dump(main_time);
\t}}
\t/* END OF TEST  */
\t//tfp->close();

\tdelete dut;
}}
"""
    tb_string = """ 
[tasks]
prove
cover
[options]
prove: mode prove
prove: depth {depth}
cover: mode cover
cover: depth {depth}
"""
    cmake_string = """
cmake_minimum_required(VERSION 3.17)
project(cmake_example)
find_package(verilator HINTS $ENV{{VERILATOR_ROOT}})
add_executable(V{top} sim_main.cpp)
verilate(V{top} TOP_MODULE {top} SOURCES
"""
    files_string   = "[files]\n"
    script_string  = "[script]\n"
    engine_string = "[engines]\n"
    tokens = []
    engine_arg_supplied = False
    top_arg_supplied = False
    top = "FIXME"
    if(len(sys.argv) == 1):
        print(help_str)
        sys.exit()
    else:
        for arg in sys.argv:
            tokens.append(arg)
        for idx,tok in enumerate(tokens):
            if(tok == "--engine" and engine_arg_supplied == False):
                engine = tokens[idx + 1]
                if(engine == "z3" or engine == "yices" or engine == "boolector"):
                    #TODO dont hardcode engines 
                    engine_string += engine
                    engine_arg_supplied = True
            elif(tok == "--top" and top_arg_supplied == False):
                top = tokens[idx+1]
                if(not top.endswith(".v")):
                    print("The supplied file does not appear to be a Verilog file, exiting.")
                    sys.exit()
                else:
                    top = (top.rsplit(".",1)[0])
                    top_arg_supplied = True
    if(top_arg_supplied == False):
        print("--top is a required argument. Exiting")
        sys.exit()

    if(not os.path.exists(f_path)):
        os.mkdir(f_path)
    if(not os.path.exists(s_path)):
        os.mkdir(s_path)

    print("Generating formal verification harness.")
    fm_file = open(path + "formal/config.sby",mode = "w")
    tb_string = tb_string.format(depth = 64)
    for file_ in files:
        basename = os.path.basename(file_)
        cmake_string += basename
        shutil.copyfile(file_,f_path + '/' + basename)
        shutil.copyfile(file_,s_path + '/' + basename)
        print("File copied to %s" % f_path + '/' + basename)
        print("File copied to %s" % s_path + '/' + basename)
        files_string += os.path.basename(basename + '\n')
        script_string += "read -formal " + os.path.basename(basename + '\n')
    cmake_string += ")"
    fin = "prep -top {top}"
    fin = fin.format(top = top)
    script_string += fin
    if(engine_arg_supplied == False):
        print("No engine argument supplied. Defaulting to yices.")
        engine_string += "smtbmc yices\n"
    fm_file.write(header_str + tb_string + engine_string + files_string + script_string)
    fm_file.close()
    print("Formal verification harness successfully generated.")
    print("Generating verilator simulation harness.")
    sim_file = open(s_path + '/' + "sim_main.cpp", mode = "w")
    sim_string = sim_string.format(top = top) #FIXME
    sim_file.write("/*\n" + header_str + "*/" + sim_string)
    sim_file.close()
    print("Verilator simulation harness successfully generated.")
    print("Generating CMake file.")
    cmake_file = open(s_path + '/' + "CMakeLists.txt", mode = "w")
    cmake_string = cmake_string.format(top = top)
    cmake_file.write(cmake_string)
    cmake_file.close()
    print("Generating final build script.")
    final_script = open(s_path + '/' + "build.sh", mode = "w")
    final_script.write("""
    #!/bin/sh
    mkdir build 
    cd build 
    cmake -GNinja .. 
    ninja """)
    final_script.close()
    print("Build script successfully generated.")

main()
