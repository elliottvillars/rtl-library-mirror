#! /usr/bin/env python3

import glob
import sys
import stat
import os
import shutil
from datetime import datetime
# datetime object containing current date and time
NOW = datetime.now()
DT_STRING = NOW.strftime("%Y-%m-%d %H:%M:%S")
PATH = os.getcwd() + '/'
F_PATH = PATH + "formal"
S_PATH = PATH + "sim"
FILES = glob.glob(PATH + "/*.v")
HELP_STR = """
--help: Print this menu
"""


def main():
    header_str = """###################################################
#THIS IS A COMPUTER GENERATED FILE, DO NOT MODIFY.#
#GENERATED: %s                   #
###################################################
""" % (DT_STRING)
    tb_str = """
[tasks]
prove
cover
[options]
prove: mode prove
prove: depth {depth}
cover: mode cover
cover: depth {depth}
[engines]
smtbmc boolector
"""
    files_str = "[files]\n"
    script_str = "[script]\n"
    cmake_str = """
cmake_minimum_required(VERSION 3.17)
project(cmake_example)
find_package(verilator HINTS $ENV{{VERILATOR_ROOT}})
add_executable(V{top} sim_main.cpp)
verilate(V{top} TOP_MODULE {top} SOURCES
"""
    sim_str = """
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
    tokens = []
    top = "FIXME"
    if len(sys.argv) == 1:
        print(HELP_STR)
        sys.exit()
    else:
        for arg in sys.argv:
            tokens.append(arg)
        for idx in enumerate(tokens):
            top = tokens[idx+1]
            if not top.endswith(".v"):
                print("The supplied file does not appear to be a Verilog file, exiting.")
                sys.exit()
            else:
                top = (top.rsplit(".", 1)[0])

    dir_check()
    generate_formal_harness(header_str, tb_str, cmake_str, files_str, script_str, top)
    create_verilator_tb(top, sim_str, header_str)
    create_cmake_harness(top, cmake_str)
    create_final_script()

def generate_formal_harness(header_str, tb_str, cmake_str, files_str, script_str, top):
    print("Generating formal verification harness.")
    fm_file = open(PATH + "formal/config.sby", mode="w")
    tb_str = tb_str.format(depth=64)
    for file_ in FILES:
        basename = os.path.basename(file_)
        cmake_str += basename
        shutil.copyfile(file_, F_PATH + '/' + basename)
        shutil.copyfile(file_, S_PATH + '/' + basename)
        print("File copied to %s" % F_PATH + '/' + basename)
        print("File copied to %s" % S_PATH + '/' + basename)
        files_str += os.path.basename(basename + '\n')
        script_str += "read -formal " + os.path.basename(basename + '\n')
    cmake_str += ")"
    script_str += "prep -top {top}"
    script_str = script_str.format(top=top)
    fm_file.write(header_str + tb_str + files_str + script_str)
    fm_file.close()
    print("Formal verification harness successfully generated.")

def dir_check():
    if not os.path.exists(F_PATH):
        os.mkdir(F_PATH)
    if not os.path.exists(S_PATH):
        os.mkdir(S_PATH)

def create_verilator_tb(top, sim_str, header_str):
    print("Generating verilator simulation harness.")
    path_to_ofile = S_PATH + '/' + "sim_main.cpp"
    sim_file = open(path_to_ofile, mode="w")
    os.chmod(path_to_ofile, stat.S_IRUSR | stat.S_IWUSR)
    sim_str = sim_str.format(top=top)
    sim_file.write("/*\n" + header_str + "*/" + sim_str)
    sim_file.close()
    print("Verilator simulation harness successfully generated.")

def create_cmake_harness(top, cmake_str):
    print("Generating CMake file.")
    cmake_file = open(S_PATH + '/' + "CMakeLists.txt", mode="w")
    cmake_str = cmake_str.format(top=top)
    cmake_file.write(cmake_str)
    cmake_file.close()
    print("CMake file successfully generated.")

def create_final_script():
    print("Generating final build script.")
    final_script = open(S_PATH + '/' + "build.sh", mode="w")
    final_script.write("""
    #!/bin/sh
    mkdir build
    cd build
    cmake -GNinja ..
    ninja """)
    final_script.close()
    print("Build script successfully generated.")


main()
