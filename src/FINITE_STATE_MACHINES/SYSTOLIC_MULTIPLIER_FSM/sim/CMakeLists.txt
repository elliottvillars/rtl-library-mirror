
cmake_minimum_required(VERSION 3.17)
project(cmake_example)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})
add_executable(Vsystolic_multiplier_fsm sim_main.cpp)
verilate(Vsystolic_multiplier_fsm TOP_MODULE systolic_multiplier_fsm TRACE SOURCES
systolic_multiplier_fsm.v )