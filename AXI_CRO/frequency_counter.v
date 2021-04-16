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
// Revision 0.02 - some upgrades
// Additional Comments: clk default is 100 MHz, we do 1 ms or 100000 cycles of counting per measurement
// 
//////////////////////////////////////////////////////////////////////////////////


module frequency_counter #
    (
    parameter num_counters = 4
    )
	(
    input wire [num_counters-1:0] in_signal,
    input clk,
    output [num_counters*32 - 1:0] freq 
    );

reg [num_counters*32 - 1 :0] freq_count;
reg [31:0] clk_count;
reg clk_done;
reg [num_counters*32 - 1:0] freq_out;


assign freq = freq_out;
	
generate
genvar i;  
for (i = 0; i < num_counters-1; i = i+1) begin

always @(posedge in_signal[i]) begin
    freq_count[(i+1)*32 - 1:i*32] = freq_count[(i+1)*32 - 1:i*32] + 1;
    if (clk_done == 1) begin
        freq_count[(i+1)*32 - 1:i*32] = 0; 
    end
end

end
endgenerate

always @(posedge clk) begin
	clk_count <= clk_count + 1;
    clk_done = 1'b0;
	if ((clk_count > 99998) & (clk_count < 100010)) begin //we stop the count for a full milisecon
	    clk_done = 1'b1;
	end
	else if (clk_count == 100010) begin
		clk_count <= 0;
		clk_done = 1'b0;
	end
end


always @(posedge clk_done) begin
   freq_out = freq_count;
end	

endmodule