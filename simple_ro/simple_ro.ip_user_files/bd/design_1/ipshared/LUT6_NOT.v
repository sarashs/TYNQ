`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 06:47:33 PM
// Design Name: 
// Module Name: LUT6_NOT
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

module LUT6_NOTv2(
    input in_sig,
    output out_sig
    );
// LUT6: 6-input Look-Up Table with general output
// 7 Series
// Xilinx HDL Language Template, version 2018.3
(* LOCK_PINS="I0:A6, I1:A2, I2:A1, I3:A3, I4:A4, I5:A5" *) // Arash: this is important to make the inverters consistent
LUT6 #(
 .INIT(64'h5555555555555555) // Arash: This should make an inverter
) LUT6_inst (
 .O(out_sig), // LUT general output
 .I0(in_sig), // LUT input
 .I1(1'b0), // LUT input
 .I2(1'b0), // LUT input
 .I3(1'b0), // LUT input
 .I4(1'b0), // LUT input
 .I5(1'b0) // LUT input
);
// End of LUT6_inst instantiation
endmodule