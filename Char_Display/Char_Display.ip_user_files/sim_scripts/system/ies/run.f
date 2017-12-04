-makelib ies_lib/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/opt/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/system/sim/system.v" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/d5d3/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_protocol_checker_v2_0_0 -sv \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/d5c1/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_vip_v1_1_0 -sv \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/8b42/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_2 -sv \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/e0a2/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/system/ip/system_processing_system7_0_1/sim/system_processing_system7_0_1.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_12 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/system/ip/system_proc_sys_reset_0_1/sim/system_proc_sys_reset_0_1.vhd" \
  "../../../bd/system/ip/system_proc_sys_reset_1_1/sim/system_proc_sys_reset_1_1.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/system/ipshared/9c19/src/add_gen.v" \
  "../../../bd/system/ipshared/9c19/src/color_select.v" \
  "../../../bd/system/ipshared/9c19/src/counter.v" \
  "../../../bd/system/ipshared/9c19/src/select.v" \
  "../../../bd/system/ipshared/9c19/src/shifter.v" \
  "../../../bd/system/ipshared/9c19/src/char_rom.v" \
  "../../../bd/system/ipshared/9c19/src/myVGA_v1_0_S_AXI.v" \
  "../../../bd/system/ipshared/9c19/hdl/myVGA_v1_0.v" \
  "../../../bd/system/ip/system_myVGA_0_1/sim/system_myVGA_0_1.v" \
  "../../../bd/system/ip/system_clk_wiz_0_1/system_clk_wiz_0_1_clk_wiz.v" \
  "../../../bd/system/ip/system_clk_wiz_0_1/system_clk_wiz_0_1.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_0 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/0798/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_0 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/0798/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_0 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/0798/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_clock_converter_v2_1_13 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/7d05/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/system/ip/system_auto_cc_0/sim/system_auto_cc_0.v" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_13 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/74ae/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_14 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/a259/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_14 \
  "../../../../Char_Display.srcs/sources_1/bd/system/ipshared/33cc/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

