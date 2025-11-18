`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 16:06:48
// Design Name: 
// Module Name: mux_1
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


module mux_1 (
 input wire [31:0] mux_1_in0,
 input wire [4:0] mux_1_in1,
 input wire mux_1_sel,
 output wire [31:0] mux_1_out
 );
 assign mux_1_out = mux_1_sel ? {27'b0, mux_1_in1} : mux_1_in0;
endmodule
