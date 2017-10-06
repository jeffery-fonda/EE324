proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config  -ruleid {1}  -id {DRC LUTLP-1}  -string {{ERROR: [DRC LUTLP-1] Combinatorial Loop Alert: 29 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Controller/temp1_reg[0]_i_2, Controller/temp1_reg[0]_i_3, Controller/temp1_reg[0]_i_4, Controller/temp2_reg[0]_i_8, Controller/temp2_reg[0]_i_9, Controller/temp2_reg[0]_i_10, Controller/temp3_reg[0]_i_10, Controller/temp3_reg[0]_i_11, Controller/temp3_reg[0]_i_12, Controller/temp3_reg[2]_i_39, Controller/temp3_reg[2]_i_40, Controller/temp3_reg[2]_i_41, Controller/temp3_reg[2]_i_63, Controller/temp3_reg[2]_i_64, Controller/temp3_reg[2]_i_65... and (the first 15 of 29 listed).}}  -suppress 

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7a35tcpg236-1
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/EE_Classes/EE324_Projects/Reaction_Timer/reaction.cache/wt [current_project]
  set_property parent.project_path C:/EE_Classes/EE324_Projects/Reaction_Timer/reaction.xpr [current_project]
  set_property ip_output_repo C:/EE_Classes/EE324_Projects/Reaction_Timer/reaction.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet C:/EE_Classes/EE324_Projects/Reaction_Timer/reaction.runs/synth_1/reaction.dcp
  read_xdc C:/EE_Classes/EE324_Projects/Reaction_Timer/reaction.srcs/constrs_1/new/basys.xdc
  link_design -top reaction -part xc7a35tcpg236-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force reaction_opt.dcp
  catch { report_drc -file reaction_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force reaction_placed.dcp
  catch { report_io -file reaction_io_placed.rpt }
  catch { report_utilization -file reaction_utilization_placed.rpt -pb reaction_utilization_placed.pb }
  catch { report_control_sets -verbose -file reaction_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force reaction_routed.dcp
  catch { report_drc -file reaction_drc_routed.rpt -pb reaction_drc_routed.pb -rpx reaction_drc_routed.rpx }
  catch { report_methodology -file reaction_methodology_drc_routed.rpt -rpx reaction_methodology_drc_routed.rpx }
  catch { report_power -file reaction_power_routed.rpt -pb reaction_power_summary_routed.pb -rpx reaction_power_routed.rpx }
  catch { report_route_status -file reaction_route_status.rpt -pb reaction_route_status.pb }
  catch { report_clock_utilization -file reaction_clock_utilization_routed.rpt }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file reaction_timing_summary_routed.rpt -rpx reaction_timing_summary_routed.rpx }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force reaction_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force reaction.mmi }
  write_bitstream -force reaction.bit 
  catch {write_debug_probes -no_partial_ltxfile -quiet -force debug_nets}
  catch {file copy -force debug_nets.ltx reaction.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

