vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_protocol_checker_v2_0_0
vlib modelsim_lib/msim/axi_vip_v1_1_0
vlib modelsim_lib/msim/processing_system7_vip_v1_0_2
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_12
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/fifo_generator_v13_2_0
vlib modelsim_lib/msim/axi_data_fifo_v2_1_13
vlib modelsim_lib/msim/axi_register_slice_v2_1_14
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_14

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_0 modelsim_lib/msim/axi_protocol_checker_v2_0_0
vmap axi_vip_v1_1_0 modelsim_lib/msim/axi_vip_v1_1_0
vmap processing_system7_vip_v1_0_2 modelsim_lib/msim/processing_system7_vip_v1_0_2
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 modelsim_lib/msim/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_0 modelsim_lib/msim/fifo_generator_v13_2_0
vmap axi_data_fifo_v2_1_13 modelsim_lib/msim/axi_data_fifo_v2_1_13
vmap axi_register_slice_v2_1_14 modelsim_lib/msim/axi_register_slice_v2_1_14
vmap axi_protocol_converter_v2_1_14 modelsim_lib/msim/axi_protocol_converter_v2_1_14

vlog -work xil_defaultlib -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_0 -L axi_vip_v1_1_0 -L processing_system7_vip_v1_0_2 -L xilinx_vip "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_0 -L axi_vip_v1_1_0 -L processing_system7_vip_v1_0_2 -L xilinx_vip "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_0 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_0 -L axi_vip_v1_1_0 -L processing_system7_vip_v1_0_2 -L xilinx_vip "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5c1/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_0 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_0 -L axi_vip_v1_1_0 -L processing_system7_vip_v1_0_2 -L xilinx_vip "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/8b42/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_2 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_0 -L axi_vip_v1_1_0 -L processing_system7_vip_v1_0_2 -L xilinx_vip "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \
"../../../bd/system/ipshared/77ca/hdl/myled_v1_0_S_AXI.v" \
"../../../bd/system/ipshared/77ca/hdl/myled_v1_0.v" \
"../../../bd/system/ip/system_myled_0_0/sim/system_myled_0_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -64 -93 \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/system/ip/system_rst_ps7_0_100M_0/sim/system_rst_ps7_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_0 -64 -incr "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/0798/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_0 -64 -93 \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/0798/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_0 -64 -incr "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/0798/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_13 -64 -incr "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/74ae/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_14 -64 -incr "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/a259/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_14 -64 -incr "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/33cc/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/d5d3/hdl/verilog" "+incdir+../../../../LED_Controller.srcs/sources_1/bd/system/ipshared/e0a2/hdl" "+incdir+/opt/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \
"../../../bd/system/sim/system.v" \

vlog -work xil_defaultlib \
"glbl.v"
