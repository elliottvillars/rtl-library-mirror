
cmake_minimum_required(VERSION 3.17)
project(cmake_example)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})
add_executable(Vaccumulator sim_main.cpp)
verilate(Vaccumulator TOP_MODULE accumulator TRACE SOURCES
accumulator.v)