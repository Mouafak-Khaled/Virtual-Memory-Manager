cmake_minimum_required(VERSION 3.19)
project(Virtual_Memory_Manager C)

set(CMAKE_C_STANDARD 11)

add_executable(Virtual_Memory_Manager
        project3/virtmem.c project3/part2.c)
