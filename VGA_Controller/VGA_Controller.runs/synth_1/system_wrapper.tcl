# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.cache/wt [current_project]
set_property parent.project_path /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths /home/jfonda/Documents/EE324/ip_repo/myVGA_1.0 [current_project]
set_property ip_output_repo /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/hdl/system_wrapper.v
add_files /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/system.bd
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_processing_system7_0_1/system_processing_system7_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_proc_sys_reset_0_1/system_proc_sys_reset_0_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_proc_sys_reset_0_1/system_proc_sys_reset_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_proc_sys_reset_0_1/system_proc_sys_reset_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_proc_sys_reset_1_1/system_proc_sys_reset_1_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_proc_sys_reset_1_1/system_proc_sys_reset_1_1.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_proc_sys_reset_1_1/system_proc_sys_reset_1_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_clk_wiz_0_1/system_clk_wiz_0_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_clk_wiz_0_1/system_clk_wiz_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_clk_wiz_0_1/system_clk_wiz_0_1_late.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_clk_wiz_0_1/system_clk_wiz_0_1_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_auto_cc_0/system_auto_cc_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_auto_cc_0/system_auto_cc_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_auto_cc_0/system_auto_cc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/ip/system_auto_pc_1/system_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/jfonda/Documents/EE324/VGA_Controller/VGA_Controller.srcs/sources_1/bd/system/system_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/jfonda/Documents/EE324/Resources/ZYBO_master.xdc
set_property used_in_implementation false [get_files /home/jfonda/Documents/EE324/Resources/ZYBO_master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top system_wrapper -part xc7z010clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef system_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file system_wrapper_utilization_synth.rpt -pb system_wrapper_utilization_synth.pb"