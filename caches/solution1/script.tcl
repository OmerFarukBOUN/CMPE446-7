############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project caches
set_top cache_access
add_files cache.cpp
add_files cache.hpp
add_files fetch_block.cpp
add_files writeback.cpp
add_files -tb cache_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xczu7ev-ffvf1517-3-e}
create_clock -period 10 -name default
config_cosim -tool xsim -trace_level port
source "./caches/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level port
export_design -format ip_catalog
