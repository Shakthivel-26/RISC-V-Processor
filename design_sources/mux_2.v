`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 16:07:37
// Design Name: 
// Module Name: mux_2
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


module mux_2 (
 input wire [31:0] mux_2_in0,
 input wire [31:0] mux_2_in1,
 input wire mux_2_sel,
 output wire [31:0] mux_2_out
 );
 assign mux_2_out = mux_2_sel ? mux_2_in1 : mux_2_in0;
endmodule
