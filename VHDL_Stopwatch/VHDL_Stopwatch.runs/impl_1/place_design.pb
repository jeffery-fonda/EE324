
�
�No debug cores found in the current design.
Before running the implement_debug_core command, either use the Set Up Debug wizard (GUI mode)
or use the create_debug_core and connect_debug_core Tcl commands to insert debug cores into the design.
154*	chipscopeZ16-241h px� 
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
42default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1972.5352default:default2
0.0002default:default2
42102default:default2
95052default:defaultZ17-722h px� 
Z
EPhase 1.1 Placer Initialization Netlist Sorting | Checksum: e8fa7d54
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00.02 . Memory (MB): peak = 1972.535 ; gain = 0.000 ; free physical = 4210 ; free virtual = 95052default:defaulth px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1972.5352default:default2
0.0002default:default2
42102default:default2
95052default:defaultZ17-722h px� 
�

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
h
SPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 1b249df48
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.68 . Memory (MB): peak = 1972.535 ; gain = 0.000 ; free physical = 4206 ; free virtual = 95042default:defaulth px� 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px� 
P
;Phase 1.3 Build Placer Netlist Model | Checksum: 2626c0034
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.74 . Memory (MB): peak = 1972.535 ; gain = 0.000 ; free physical = 4205 ; free virtual = 95042default:defaulth px� 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px� 
M
8Phase 1.4 Constrain Clocks/Macros | Checksum: 2626c0034
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.75 . Memory (MB): peak = 1972.535 ; gain = 0.000 ; free physical = 4205 ; free virtual = 95042default:defaulth px� 
I
4Phase 1 Placer Initialization | Checksum: 2626c0034
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.75 . Memory (MB): peak = 1972.535 ; gain = 0.000 ; free physical = 4205 ; free virtual = 95042default:defaulth px� 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px� 
D
/Phase 2 Global Placement | Checksum: 1d1feabe8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4194 ; free virtual = 94932default:defaulth px� 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px� 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px� 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 1d1feabe8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4194 ; free virtual = 94932default:defaulth px� 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px� 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 263df3748
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4193 ; free virtual = 94932default:defaulth px� 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px� 
L
7Phase 3.3 Area Swap Optimization | Checksum: 208e63dd8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4193 ; free virtual = 94932default:defaulth px� 
�

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 208e63dd8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4193 ; free virtual = 94932default:defaulth px� 


Phase %s%s
101*constraints2
3.5 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px� 
R
=Phase 3.5 Small Shape Detail Placement | Checksum: 1f766e913
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4191 ; free virtual = 94912default:defaulth px� 
u

Phase %s%s
101*constraints2
3.6 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px� 
H
3Phase 3.6 Re-assign LUT pins | Checksum: 1f766e913
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4191 ; free virtual = 94912default:defaulth px� 
�

Phase %s%s
101*constraints2
3.7 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
T
?Phase 3.7 Pipeline Register Optimization | Checksum: 1f766e913
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4191 ; free virtual = 94912default:defaulth px� 
D
/Phase 3 Detail Placement | Checksum: 1f766e913
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4191 ; free virtual = 94912default:defaulth px� 
�

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px� 
N
9Phase 4.1 Post Commit Optimization | Checksum: 1f766e913
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4191 ; free virtual = 94912default:defaulth px� 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px� 
L
7Phase 4.2 Post Placement Cleanup | Checksum: 1f766e913
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4191 ; free virtual = 94922default:defaulth px� 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px� 
F
1Phase 4.3 Placer Reporting | Checksum: 1f766e913
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4191 ; free virtual = 94922default:defaulth px� 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px� 
M
8Phase 4.4 Final Placement Cleanup | Checksum: 13d05f29a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4191 ; free virtual = 94922default:defaulth px� 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 13d05f29a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4191 ; free virtual = 94922default:defaulth px� 
=
(Ending Placer Task | Checksum: 5b68a520
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1996.547 ; gain = 24.012 ; free physical = 4198 ; free virtual = 94982default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
392default:default2
92default:default2
82default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.122default:default2
00:00:00.052default:default2
1996.5472default:default2
0.0002default:default2
41972default:default2
94992default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2o
[/home/jfonda/Documents/EE324/VHDL_Stopwatch/VHDL_Stopwatch.runs/impl_1/stopwatch_placed.dcp2default:defaultZ17-1381h px� 
d
%s4*runtcl2H
4Executing : report_io -file stopwatch_io_placed.rpt
2default:defaulth px� 
�
�report_io: Time (s): cpu = 00:00:00.10 ; elapsed = 00:00:00.16 . Memory (MB): peak = 1996.547 ; gain = 0.000 ; free physical = 4190 ; free virtual = 9491
*commonh px� 
�
%s4*runtcl2~
jExecuting : report_utilization -file stopwatch_utilization_placed.rpt -pb stopwatch_utilization_placed.pb
2default:defaulth px� 
�
�report_utilization: Time (s): cpu = 00:00:00.06 ; elapsed = 00:00:00.09 . Memory (MB): peak = 1996.547 ; gain = 0.000 ; free physical = 4191 ; free virtual = 9491
*commonh px� 
x
%s4*runtcl2\
HExecuting : report_control_sets -file stopwatch_control_sets_placed.rpt
2default:defaulth px� 
�
�report_control_sets: Time (s): cpu = 00:00:00.04 ; elapsed = 00:00:00.07 . Memory (MB): peak = 1996.547 ; gain = 0.000 ; free physical = 4191 ; free virtual = 9492
*commonh px� 


End Record