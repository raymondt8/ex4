project(ex4)
enable_language(C)
cmake_minimum_required(VERSION 2.6)

find_package(OpenMP REQUIRED)
if (OPENMP_FOUND)
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
endif()

find_package(MPI REQUIRED)
if(MPI_FOUND)
	include_directories(${MPI_C_INCLUDE_PATH})
endif()

add_definitions(-Wextra -Wall -msse4.1 -pedantic -g -O3 -std=c99 -L/path/to/libs -lm )

add_executable(ex4 main.c functions.c functions.h )

target_link_libraries(ex4 ${MPI_C_LIBRARIES})

if(MPI_COMPILE_FLAGS)
  set_target_properties(ex4 PROPERTIES
    COMPILE_FLAGS "${MPI_COMPILE_FLAGS}")
endif()

if(MPI_LINK_FLAGS)
  set_target_properties(ex4 PROPERTIES
    LINK_FLAGS "${MPI_LINK_FLAGS}")
endif()
