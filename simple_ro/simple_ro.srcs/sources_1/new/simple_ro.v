`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ivanov Lab
// Engineer: Uncle Arash
// 
// Create Date: 03/19/2021 01:54:09 AM
// Design Name: 
// Module Name: simple_ro
// Project Name: 
// Target Devices: ZYNQ 7000 (or anything else for that matter)
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


module simple_ro(
    //input rst,
    output outclk
    );
(*DONT_TOUCH= "true"*) parameter SIZE = 5; // This is the length of your ROs(* KEEP = "TRUE" *)
(*DONT_TOUCH= "true"*) wire [SIZE-1 : 0] w;
generate
genvar i;
for (i=0; i<SIZE-1; i=i+1) 
begin : notGates
    (*DONT_TOUCH= "true"*) not Inverter(w[i+1], w[i]);
end
endgenerate
(*DONT_TOUCH= "true"*) not Inverter(w[0], w[SIZE-1]); //nand Control(w[0], w[SIZE-1], rst);
assign outclk = w[0];
endmodule
