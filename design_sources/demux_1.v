`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 16:03:10
// Design Name: 
// Module Name: demux_1
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


module demux_1 (
 input wire [31:0] demux_in,
 input wire demux_sel,
 output wire [31:0] demux_out0,
 output wire [31:0] demux_out1
 );
 assign demux_out0 = demux_sel? 32'b0: demux_in;
 assign demux_out1 = demux_sel? demux_in: 32'b0;
endmodule
