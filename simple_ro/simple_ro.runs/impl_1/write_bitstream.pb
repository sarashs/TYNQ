
p
Command: %s
53*	vivadotcl2?
+write_bitstream -force design_1_wrapper.bit2default:defaultZ4-113h px? 
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
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
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
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2?
 "z
1design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/O51design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/O52default:default2default:default2?
 "?
5design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT5/O5design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT5/O2default:default2default:default2?
 "~
3design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT5	3design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT52default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2?
 "z
1design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/O51design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/O52default:default2default:default2?
 "?
5design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT5/O5design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT5/O2default:default2default:default2?
 "~
3design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT5	3design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT52default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2?
 "z
1design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/O51design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/O52default:default2default:default2?
 "?
5design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT5/O5design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT5/O2default:default2default:default2?
 "~
3design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT5	3design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT52default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 32 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2?
 "~
3design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT5	3design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT52default:default2default:default2?
 "?
Ldesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[0]	Ldesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[0]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[10]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[10]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[11]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[11]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[12]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[12]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[13]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[13]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[14]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[14]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[15]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[15]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[16]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[16]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[17]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[17]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[18]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[18]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[19]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[19]2default:default"?
Ldesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[1]	Ldesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[1]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[20]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[20]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[21]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[21]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[22]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[22]2default:..."/
(the first 15 of 32 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 32 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2?
 "~
3design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT6	3design_1_i/HCI0/inst/RO[0].new_mux/LUT6_2_inst/LUT62default:default2default:default2?
 "?
Ldesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[0]	Ldesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[0]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[10]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[10]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[11]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[11]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[12]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[12]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[13]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[13]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[14]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[14]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[15]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[15]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[16]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[16]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[17]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[17]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[18]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[18]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[19]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[19]2default:default"?
Ldesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[1]	Ldesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[1]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[20]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[20]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[21]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[21]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[22]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[0].freq_count_reg[22]2default:..."/
(the first 15 of 32 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 32 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2?
 "~
3design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT5	3design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT52default:default2default:default2?
 "?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[32]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[32]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[33]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[33]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[34]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[34]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[35]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[35]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[36]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[36]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[37]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[37]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[38]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[38]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[39]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[39]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[40]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[40]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[41]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[41]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[42]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[42]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[43]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[43]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[44]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[44]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[45]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[45]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[46]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[46]2default:..."/
(the first 15 of 32 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 32 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2?
 "~
3design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT6	3design_1_i/HCI0/inst/RO[1].new_mux/LUT6_2_inst/LUT62default:default2default:default2?
 "?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[32]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[32]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[33]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[33]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[34]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[34]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[35]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[35]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[36]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[36]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[37]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[37]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[38]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[38]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[39]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[39]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[40]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[40]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[41]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[41]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[42]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[42]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[43]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[43]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[44]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[44]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[45]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[45]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[46]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[1].freq_count_reg[46]2default:..."/
(the first 15 of 32 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 32 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2?
 "~
3design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT5	3design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT52default:default2default:default2?
 "?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[64]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[64]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[65]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[65]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[66]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[66]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[67]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[67]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[68]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[68]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[69]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[69]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[70]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[70]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[71]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[71]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[72]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[72]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[73]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[73]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[74]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[74]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[75]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[75]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[76]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[76]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[77]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[77]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[78]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[78]2default:..."/
(the first 15 of 32 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 32 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2?
 "~
3design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT6	3design_1_i/HCI0/inst/RO[2].new_mux/LUT6_2_inst/LUT62default:default2default:default2?
 "?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[64]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[64]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[65]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[65]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[66]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[66]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[67]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[67]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[68]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[68]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[69]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[69]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[70]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[70]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[71]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[71]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[72]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[72]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[73]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[73]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[74]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[74]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[75]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[75]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[76]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[76]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[77]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[77]2default:default"?
Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[78]	Mdesign_1_i/HCI0/inst/frequency_counter_instance/genblk1[2].freq_count_reg[78]2default:..."/
(the first 15 of 32 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 12 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
g
Writing bitstream %s...
11*	bitstream2*
./design_1_wrapper.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1232default:default2
2242default:default2
1002default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:542default:default2
00:00:472default:default2
2470.3092default:default2
440.1522default:defaultZ17-268h px? 


End Record