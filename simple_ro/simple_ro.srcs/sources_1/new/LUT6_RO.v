`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 04:31:00 PM
// Design Name: 
// Module Name: LUT6_RO
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


module LUT6_RO(
    output outclk
    );
(*DONT_TOUCH= "true"*) parameter SIZE = 5; // This is the length of your ROs(* KEEP = "TRUE" *)
(*DONT_TOUCH= "true"*) wire [SIZE-1 : 0] w;
generate
genvar i;
for (i=0; i<SIZE-1; i=i+1) 
begin : notGates
    (*DONT_TOUCH= "true"*) LUT6_NOT Inverter(.in_sig(w[i]), .out_sig(w[i+1]));
end
endgenerate
(*DONT_TOUCH= "true"*) LUT6_NOT Inverter(.in_sig(w[SIZE-1]), .out_sig(w[0]) ); //nand Control(w[0], w[SIZE-1], rst);
assign outclk = w[0];
endmodule
