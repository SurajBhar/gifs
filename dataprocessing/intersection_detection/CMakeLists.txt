cmake_minimum_required(VERSION 3.10)

#enable_language(CXX)

# Find CGAL
find_package(CGAL REQUIRED HINTS /work/ws-tmp/g051176-New_GIFS/gifs/CGAL-5.1.3)
#include(${CGAL_USE_FILE})

# set the project name
project(IntersectionDetection)

# add the executable
add_executable(intersection intersection.cpp)
target_link_libraries(intersection CGAL)
# target_link_libraries(intersection CGAL -static)
