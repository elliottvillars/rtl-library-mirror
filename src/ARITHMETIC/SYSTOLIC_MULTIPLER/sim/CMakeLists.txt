
cmake_minimum_required(VERSION 3.17)
project(cmake_example)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})
add_executable(Vsystolic_multiplier sim_main.cpp)
verilate(Vsystolic_multiplier TOP_MODULE systolic_multiplier TRACE SOURCES ./systolic_multiplier.v ./systolic_mult_cell.v)
