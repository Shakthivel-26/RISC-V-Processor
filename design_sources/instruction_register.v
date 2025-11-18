`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 15:58:20
// Design Name: 
// Module Name: instruction_register
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


module instruction_register(ir_in, ir_out, ir_wr_en, ir_rst, ir_clk);
 input wire [31:0] ir_in;
 input wire ir_wr_en, ir_clk, ir_rst;
 output reg [31:0] ir_out;
 
 always @(posedge ir_clk) begin
  if(ir_rst) ir_out <= 32'b0;
  else begin
  if(ir_wr_en) ir_out <= ir_in;
  end
 end
endmodule
