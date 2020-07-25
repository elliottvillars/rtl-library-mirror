
cmake_minimum_required(VERSION 3.17)
project(cmake_example)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})
add_executable(Vhalf_adder sim_main.cpp)
verilate(Vhalf_adder TOP_MODULE half_adder SOURCES
half_adder.v)