`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Arash
// 
// Create Date: 07/03/2021 10:43:48 AM
// Design Name: 
// Module Name: new_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module new_mux(
 (*DONT_TOUCH= "true"*)    input sel,
 (*DONT_TOUCH= "true"*)    input stress,
 (*DONT_TOUCH= "true"*)    input input1,
 (*DONT_TOUCH= "true"*)   output output1,
 (*DONT_TOUCH= "true"*)   output output2
    );
// LUT6_2: 6-input, 2 output Look-Up Table
// 7 Series
// Xilinx HDL Libraries Guide, version 14.7
(* LOCK_PINS="I0:A1, I1:A2, I2:A3, I3:A6, I4:A4, I5:A5" *)
LUT6_2 #(
.INIT(64'hACACACACACACACAC) // Specify LUT Contents
) LUT6_2_inst (
.O6(output1), // 1-bit LUT6 output
.O5(output2), // 1-bit lower LUT5 output
.I0(input1), // 1-bit LUT input
.I1(stress), // 1-bit LUT input
.I2(sel), // 1-bit LUT input
.I3(1'b0), // 1-bit LUT input
.I4(1'b0), // 1-bit LUT input
.I5(1'b0) // 1-bit LUT input (fast MUX select only available to O6 output)
);
// End of LUT6_2_inst instantiation
endmodule
