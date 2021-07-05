`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ivanov Lab
// Engineer: Arash
// 
// Create Date: 07/01/2021 06:42:08 PM
// Design Name: 
// Module Name: PWM_100MHz
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


module PWM_100MHz #
    (
    parameter integer num_signals = 4
    )
	(
    input [31:0] counter_max,
    input [31:0] counter_high_max,
    input clk,
    output [num_signals - 1:0] out_clk_bus 
    );
    reg [31:0] counter_reg = 0;
    reg [num_signals - 1:0] out_clk_reg = ~0;
    always @(posedge clk) begin
        if (counter_reg < counter_high_max - 1) begin
            out_clk_reg <= ~0;
            counter_reg = counter_reg + 1;
        end else if (counter_reg < counter_max - 1) begin
            out_clk_reg <= 0;
            counter_reg = counter_reg + 1;
        end else begin
            out_clk_reg <= ~0;
            counter_reg <= 0;
        end
    end
    assign out_clk_bus = out_clk_reg;
endmodule
