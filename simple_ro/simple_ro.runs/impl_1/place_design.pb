
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?Combinatorial Loop Allowed: 4 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. This loop has been identified in the constraints as being known and understood by use of the ALLOW_COMBINATORIAL_LOOPS property on a net in the loop. The cells in the loop are: %s.%s*DRC2?
 "~
3design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT6	3design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT62default:default"?
8design_1_i/HCI0/inst/RO[0].notGate[0].Inverter/LUT6_inst	8design_1_i/HCI0/inst/RO[0].notGate[0].Inverter/LUT6_inst2default:default"?
8design_1_i/HCI0/inst/RO[0].notGate[1].Inverter/LUT6_inst	8design_1_i/HCI0/inst/RO[0].notGate[1].Inverter/LUT6_inst2default:default"?
8design_1_i/HCI0/inst/RO[0].notGate[2].Inverter/LUT6_inst	8design_1_i/HCI0/inst/RO[0].notGate[2].Inverter/LUT6_inst2default:default2default:default2C
 +DRC|Netlist|Design Level|Combinatorial Loop2default:default8ZLUTLP-2h px? 
?
?Combinatorial Loop Allowed: 4 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. This loop has been identified in the constraints as being known and understood by use of the ALLOW_COMBINATORIAL_LOOPS property on a net in the loop. The cells in the loop are: %s.%s*DRC2?
 "~
3design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT6	3design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT62default:default"?
8design_1_i/HCI0/inst/RO[1].notGate[0].Inverter/LUT6_inst	8design_1_i/HCI0/inst/RO[1].notGate[0].Inverter/LUT6_inst2default:default"?
8design_1_i/HCI0/inst/RO[1].notGate[1].Inverter/LUT6_inst	8design_1_i/HCI0/inst/RO[1].notGate[1].Inverter/LUT6_inst2default:default"?
8design_1_i/HCI0/inst/RO[1].notGate[2].Inverter/LUT6_inst	8design_1_i/HCI0/inst/RO[1].notGate[2].Inverter/LUT6_inst2default:default2default:default2C
 +DRC|Netlist|Design Level|Combinatorial Loop2default:default8ZLUTLP-2h px? 
?
?Combinatorial Loop Allowed: 4 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. This loop has been identified in the constraints as being known and understood by use of the ALLOW_COMBINATORIAL_LOOPS property on a net in the loop. The cells in the loop are: %s.%s*DRC2?
 "~
3design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT6	3design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT62default:default"?
8design_1_i/HCI0/inst/RO[2].notGate[0].Inverter/LUT6_inst	8design_1_i/HCI0/inst/RO[2].notGate[0].Inverter/LUT6_inst2default:default"?
8design_1_i/HCI0/inst/RO[2].notGate[1].Inverter/LUT6_inst	8design_1_i/HCI0/inst/RO[2].notGate[1].Inverter/LUT6_inst2default:default"?
8design_1_i/HCI0/inst/RO[2].notGate[2].Inverter/LUT6_inst	8design_1_i/HCI0/inst/RO[2].notGate[2].Inverter/LUT6_inst2default:default2default:default2C
 +DRC|Netlist|Design Level|Combinatorial Loop2default:default8ZLUTLP-2h px? 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 3 Warnings2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
22default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1806.8202default:default2
0.0002default:defaultZ17-268h px? 
[
FPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 17d42e6a6
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.016 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1806.8202default:default2
0.0002default:defaultZ17-268h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
?
?A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place2G
3design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT62default:default2
322default:default2?
?	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[0] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[10] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[11] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[12] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[13] {FDRE}
2default:defaultZ30-568h px? 
?
?A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place2G
3design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT52default:default2
322default:default2?
?	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[0] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[10] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[11] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[12] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[13] {FDRE}
2default:defaultZ30-568h px? 
?
?A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place2G
3design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT52default:default2
322default:default2?
?	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[34] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[35] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[36] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[38] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[39] {FDRE}
2default:defaultZ30-568h px? 
?
?A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place2G
3design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT62default:default2
322default:default2?
?	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[34] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[35] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[36] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[38] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[39] {FDRE}
2default:defaultZ30-568h px? 
?
?A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place2G
3design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT62default:default2
322default:default2?
?	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[70] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[76] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[69] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[77] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[80] {FDRE}
2default:defaultZ30-568h px? 
?
?A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place2G
3design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT52default:default2
322default:default2?
?	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[70] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[76] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[69] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[77] {FDRE}
	design_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[80] {FDRE}
2default:defaultZ30-568h px? 
h
SPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 13a6a334d
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px? 
P
;Phase 1.3 Build Placer Netlist Model | Checksum: 1d0145f9a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:05 ; elapsed = 00:00:04 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px? 
M
8Phase 1.4 Constrain Clocks/Macros | Checksum: 1d0145f9a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:05 ; elapsed = 00:00:04 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
I
4Phase 1 Placer Initialization | Checksum: 1d0145f9a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:05 ; elapsed = 00:00:04 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
2.1 2default:default2!
Floorplanning2default:defaultZ18-101h px? 
C
.Phase 2.1 Floorplanning | Checksum: 1d0c9a441
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:05 ; elapsed = 00:00:04 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
x

Phase %s%s
101*constraints2
2.2 2default:default2)
Global Placement Core2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
2.2.1 2default:default20
Physical Synthesis In Placer2default:defaultZ18-101h px? 
?
FFound %s LUTNM shape to break, %s LUT instances to create LUTNM shape
553*physynth2
02default:default2
8602default:defaultZ32-1035h px? 
?
YBreak lutnm for timing: one critical %s, two critical %s, total %s, new lutff created %s
561*physynth2
02default:default2
02default:default2
02default:default2
02default:defaultZ32-1044h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
4262default:default2!
nets or cells2default:default2
02default:default2
cell2default:default2
4262default:default2
cells2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
K
)No high fanout nets found in the design.
65*physynthZ32-65h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
0No setup violation found.  %s was not performed.344*physynth2-
DSP Register Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2;
'Shift Register to Pipeline Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2/
Shift Register Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2.
BRAM Register Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2.
URAM Register Optimization2default:defaultZ32-670h px? 
R
.No candidate nets found for HD net replication521*physynthZ32-949h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0052default:default2
1806.8202default:default2
0.0002default:defaultZ17-268h px? 
B
-
Summary of Physical Synthesis Optimizations
*commonh px? 
B
-============================================
*commonh px? 


*commonh px? 


*commonh px? 
?
?-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Optimization                                     |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  LUT Combining                                    |            0  |            426  |                   426  |           0  |           1  |  00:00:02  |
|  Very High Fanout                                 |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  DSP Register                                     |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Shift Register to Pipeline                       |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Shift Register                                   |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  BRAM Register                                    |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  URAM Register                                    |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Dynamic/Static Region Interface Net Replication  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total                                            |            0  |            426  |                   426  |           0  |           3  |  00:00:02  |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 


*commonh px? 


*commonh px? 
T
?Phase 2.2.1 Physical Synthesis In Placer | Checksum: 20728f87c
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:19 ; elapsed = 00:00:12 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
K
6Phase 2.2 Global Placement Core | Checksum: 2228bb0c4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:19 ; elapsed = 00:00:13 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
D
/Phase 2 Global Placement | Checksum: 2228bb0c4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:19 ; elapsed = 00:00:13 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px? 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px? 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 1d283a7cc
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:20 ; elapsed = 00:00:13 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px? 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 220038864
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:14 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px? 
L
7Phase 3.3 Area Swap Optimization | Checksum: 1a8333c76
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:14 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 1e04bdacc
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:14 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 


Phase %s%s
101*constraints2
3.5 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px? 
R
=Phase 3.5 Small Shape Detail Placement | Checksum: 1142ae75b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:24 ; elapsed = 00:00:17 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
u

Phase %s%s
101*constraints2
3.6 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px? 
H
3Phase 3.6 Re-assign LUT pins | Checksum: 16768bcf2
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:25 ; elapsed = 00:00:17 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
3.7 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.7 Pipeline Register Optimization | Checksum: 15f4e59bc
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:25 ; elapsed = 00:00:17 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
D
/Phase 3 Detail Placement | Checksum: 15f4e59bc
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:25 ; elapsed = 00:00:17 . Memory (MB): peak = 1806.820 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px? 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px? 
V
APost Placement Optimization Initialization | Checksum: 1cfa492e9
*commonh px? 
u

Phase %s%s
101*constraints2
4.1.1.1 2default:default2"
BUFG Insertion2default:defaultZ18-101h px? 
a

Starting %s Task
103*constraints2&
Physical Synthesis2default:defaultZ18-103h px? 
?

Phase %s%s
101*constraints2
1 2default:default25
!Physical Synthesis Initialization2default:defaultZ18-101h px? 
?
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
22default:defaultZ32-721h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
2.7202default:default2
0.0002default:defaultZ32-619h px? 
U
@Phase 1 Physical Synthesis Initialization | Checksum: 1b7f3e770
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.250 . Memory (MB): peak = 1831.723 ; gain = 0.0002default:defaulth px? 
?
?BUFG insertion identified %s candidate nets. Inserted BUFG: %s, Replicated BUFG Driver: %s, Skipped due to Placement/Routing Conflicts: %s, Skipped due to Timing Degradation: %s, Skipped due to Illegal Netlist: %s.43*	placeflow2
02default:default2
02default:default2
02default:default2
02default:default2
02default:default2
02default:defaultZ46-56h px? 
J
5Ending Physical Synthesis Task | Checksum: 189cb0970
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.271 . Memory (MB): peak = 1831.723 ; gain = 0.0002default:defaulth px? 
H
3Phase 4.1.1.1 BUFG Insertion | Checksum: 1cfa492e9
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:27 ; elapsed = 00:00:19 . Memory (MB): peak = 1831.723 ; gain = 24.9022default:defaulth px? 
?
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
2.7202default:defaultZ30-746h px? 
S
>Phase 4.1.1 Post Placement Optimization | Checksum: 225c7bbb3
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:27 ; elapsed = 00:00:19 . Memory (MB): peak = 1831.723 ; gain = 24.9022default:defaulth px? 
N
9Phase 4.1 Post Commit Optimization | Checksum: 225c7bbb3
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:27 ; elapsed = 00:00:19 . Memory (MB): peak = 1831.723 ; gain = 24.9022default:defaulth px? 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px? 
L
7Phase 4.2 Post Placement Cleanup | Checksum: 225c7bbb3
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:27 ; elapsed = 00:00:19 . Memory (MB): peak = 1831.723 ; gain = 24.9022default:defaulth px? 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px? 
F
1Phase 4.3 Placer Reporting | Checksum: 225c7bbb3
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:28 ; elapsed = 00:00:19 . Memory (MB): peak = 1831.723 ; gain = 24.9022default:defaulth px? 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0032default:default2
1831.7232default:default2
0.0002default:defaultZ17-268h px? 
M
8Phase 4.4 Final Placement Cleanup | Checksum: 220c85fbe
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:28 ; elapsed = 00:00:19 . Memory (MB): peak = 1831.723 ; gain = 24.9022default:defaulth px? 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 220c85fbe
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:28 ; elapsed = 00:00:19 . Memory (MB): peak = 1831.723 ; gain = 24.9022default:defaulth px? 
>
)Ending Placer Task | Checksum: 12e2d2d1f
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:28 ; elapsed = 00:00:19 . Memory (MB): peak = 1831.723 ; gain = 24.9022default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
692default:default2
2092default:default2
1002default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
place_design: 2default:default2
00:00:362default:default2
00:00:232default:default2
1831.7232default:default2
24.9062default:defaultZ17-268h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:032default:default2 
00:00:00.7862default:default2
1831.7582default:default2
0.0352default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2r
^C:/Users/User/ring_oscillator_zynq/simple_ro/simple_ro.runs/impl_1/design_1_wrapper_placed.dcp2default:defaultZ17-1381h px? 
k
%s4*runtcl2O
;Executing : report_io -file design_1_wrapper_io_placed.rpt
2default:defaulth px? 
?
kreport_io: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.153 . Memory (MB): peak = 1831.758 ; gain = 0.000
*commonh px? 
?
%s4*runtcl2?
xExecuting : report_utilization -file design_1_wrapper_utilization_placed.rpt -pb design_1_wrapper_utilization_placed.pb
2default:defaulth px? 
?
%s4*runtcl2l
XExecuting : report_control_sets -verbose -file design_1_wrapper_control_sets_placed.rpt
2default:defaulth px? 
?
ureport_control_sets: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.020 . Memory (MB): peak = 1831.758 ; gain = 0.000
*commonh px? 


End Record