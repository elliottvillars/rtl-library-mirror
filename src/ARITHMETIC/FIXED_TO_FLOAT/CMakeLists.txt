cmake_minimum_required(VERSION 3.17)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})
project(i2f)
add_executable(Vint_to_float_sp sim_main.cpp)
verilate(Vint_to_float_sp SOURCES ./int32_to_float_sp.v ./count_leading_zeros.v ./boundary_nibble_encoder.v ./nibble_local_count.v ./sll.v) 
