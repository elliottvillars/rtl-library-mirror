
cmake_minimum_required(VERSION 3.17)
project(cmake_example)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})
add_executable(Vfoo sim_main.cpp)
verilate(Vfoo TOP_MODULE foo TRACE SOURCES
foo.v)