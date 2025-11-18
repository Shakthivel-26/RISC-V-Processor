`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 15:57:20
// Design Name: 
// Module Name: instruction_counter
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


module instruction_counter(ic_out, ic_clk, ic_rst, ic_dir, ic_cnt, ic_in, ic_wr_en);
 input wire ic_clk, ic_rst, ic_dir, ic_cnt, ic_wr_en;
 input wire [31:0] ic_in; // 32-bit input (from ALU)
 output reg [31:0] ic_out; // 32-bit output (to Instruction Memory)
 reg [31:0] instruction_count; // 32-bit internal register
 
 always @(posedge ic_clk) begin
  if(ic_rst) instruction_count <= 32'b0; // FIX: Reset to 32-bit zero
  else begin
  if(ic_wr_en) instruction_count <= ic_in;
  if(ic_cnt & !ic_wr_en)
  // FIX: PC must increment/decrement by 4 bytes
  if (ic_dir) instruction_count <= instruction_count - 32'd4;
  else instruction_count <= instruction_count + 32'd4;
  end
 end
 
 always @(*) begin
  ic_out = instruction_count;
 end
endmodule
