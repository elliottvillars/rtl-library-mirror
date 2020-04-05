cmake_minimum_required(VERSION 3.13)

project(CICcompiler VERSION 0.9 DESCRIPTION "A CIC filter compiler" LANGUAGES C)

file(MAKE_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/bin")

add_executable(CICcompiler src/main.c)

set_target_properties(CICcompiler
	PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/bin"
	)
target_sources(CICcompiler 
	PRIVATE 
	src/cic.c
	src/util.c
	)
target_include_directories(CICcompiler PUBLIC include)
target_link_libraries(CICcompiler PUBLIC m)
set(CMAKE_BUILD_TYPE Release)
install(TARGETS CICcompiler)
