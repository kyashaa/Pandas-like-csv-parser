cmake_minimum_required(VERSION 3.14)
project(sample)

#set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS -O2)

find_package(KDataFrame REQUIRED)
#target_link_libraries(test.out PUBLIC KBA::KDataFrame)

set_source_files_properties(test.c PROPERTIES LANGUAGE CXX)
add_executable(test.out test.c)

target_link_libraries(test.out PRIVATE KBA::KDataFrame)
