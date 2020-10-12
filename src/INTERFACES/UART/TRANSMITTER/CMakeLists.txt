
cmake_minimum_required(VERSION 3.17)
project(cmake_example)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})
add_executable(Vuart_transmitter sim_main.cpp)
verilate(Vuart_transmitter TOP_MODULE uart_transmitter TRACE SOURCES
uart_transmitter.v)
