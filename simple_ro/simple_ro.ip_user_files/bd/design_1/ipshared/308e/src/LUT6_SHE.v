`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Uncle Arash
// 
// Create Date: 03/30/2021 09:29:29 PM
// Design Name: 
// Module Name: LUT6_SHE
// Project Name: 
// Target Devices: ZYNQ 7000
// Tool Versions: Vivado 2020.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LUT6_SHE(
    input control,
    input in_clk,
    output feedback
    );
// LUT6: 6-input Look-Up Table with general output
// 7 Series
// Xilinx HDL Language Template, version 2018.3
(* LOCK_PINS="I0:A6, I1:A1, I2:A2, I3:A3, I4:A4, I5:A5" *) // Arash: this is important to make the inverters consistent
LUT6 #(
 .INIT(64'h0000000000000002) // Arash: This should make an inverter anded with the contril signal
) LUT6_inst (
 .O(feedback), // LUT general output
 .I0(control), // LUT input
 .I1(in_clk), // LUT input
 .I2(in_clk), // LUT input
 .I3(in_clk), // LUT input
 .I4(in_clk), // LUT input
 .I5(in_clk) // LUT input
);
// End of LUT6_inst instantiation
endmodule
