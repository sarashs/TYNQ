`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ivanov Lab
// Engineer: Uncle Arash
// 
// Create Date: 03/20/2021 12:23:28 AM
// Design Name: 
// Module Name: frequency_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: clk default is 100 MHz, we do 1 ms or 100000 cycles of counting per measurement
// 
//////////////////////////////////////////////////////////////////////////////////


module frequency_counter(
    input in_signal,
    input clk,
    input rst,
    output [31:0] freq
    );

reg [31:0] freq_count;
reg [31:0] clk_count;
reg old_sig;
reg [31:0] freq_out;

assign freq = freq_out;

always @(posedge clk) begin
	clk_count <= clk_count + 1;
	if (in_signal != old_sig) begin
		freq_count = freq_count +1;
	end
	
	if ((clk_count == 100000) | (rst == 1'b1)) begin
		freq_out = freq_count >> 1;
		clk_count <= 0;
		freq_count = 0;
	end
	
	old_sig = in_signal;
end
	

endmodule
