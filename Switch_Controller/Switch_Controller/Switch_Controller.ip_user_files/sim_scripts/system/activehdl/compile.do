vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/smartconnect_v1_0
vlib activehdl/axi_protocol_checker_v2_0_0
vlib activehdl/axi_vip_v1_1_0
vlib activehdl/processing_system7_vip_v1_0_2
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_12
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_register_slice_v2_1_14
vlib activehdl/fifo_generator_v13_2_0
vlib activehdl/axi_data_fifo_v2_1_13
vlib activehdl/axi_crossbar_v2_1_15
vlib activehdl/axi_protocol_converter_v2_1_14

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_0 activehdl/axi_protocol_checker_v2_0_0
vmap axi_vip_v1_1_0 activehdl/axi_vip_v1_1_0
vmap processing_system7_vip_v1_0_2 activehdl/processing_system7_vip_v1_0_2
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 activehdl/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_14 activehdl/axi_register_slice_v2_1_14
vmap fifo_generator_v13_2_0 activehdl/fifo_generator_v13_2_0
vmap axi_data_fifo_v2_1_13 activehdl/axi_data_fifo_v2_1_13
vmap axi_crossbar_v2_1_15 activehdl/axi_crossbar_v2_1_15
vmap axi_protocol_converter_v2_1_14 activehdl/axi_protocol_converter_v2_1_14

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_0  -sv2k12 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5c1/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_0  -sv2k12 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/8b42/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_2  -sv2k12 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \
"../../../bd/system/ipshared/77ca/hdl/myled_v1_0_S_AXI.v" \
"../../../bd/system/ipshared/77ca/hdl/myled_v1_0.v" \
"../../../bd/system/ip/system_myled_0_0/sim/system_myled_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_rst_ps7_0_100M_0/sim/system_rst_ps7_0_100M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/system/sim/system.v" \
"../../../bd/system/ipshared/c8cf/hdl/myswitch_v1_0_S_AXI.v" \
"../../../bd/system/ipshared/c8cf/hdl/myswitch_v1_0.v" \
"../../../bd/system/ip/system_myswitch_0_2/sim/system_myswitch_0_2.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_14  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/a259/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_0  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/0798/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_0 -93 \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/0798/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_0  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/0798/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_13  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/74ae/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_15  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/a1b8/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xbar_0/sim/system_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_14  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/33cc/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../Switch_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

