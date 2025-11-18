`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 15:59:23
// Design Name: 
// Module Name: branch_comparator
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


module branch_comparator(
 input wire [31:0] bc_in_1,
 input wire [31:0] bc_in_2,
 input wire bc_en,
 input wire [2:0] bc_opcode,
 output reg bc_out
 );
 
 always @(*) begin
  if (bc_en) begin
  case (bc_opcode)
  3'b000: bc_out = (bc_in_1 == bc_in_2); // BEQ - Branch if Equal
  3'b001: bc_out = (bc_in_1 != bc_in_2); // BNE - Branch if Not Equal
  3'b100: bc_out = ($signed(bc_in_1) < $signed(bc_in_2)); // BLT - Branch if Less Than
  3'b101: bc_out = ($signed(bc_in_1) >= $signed(bc_in_2)); // BGE - Branch if Greater Than or Equal
  3'b110: bc_out = (bc_in_1 < bc_in_2); // BLTU - Branch if Less Than Unsigned
  3'b111: bc_out = (bc_in_1 >= bc_in_2); // BGEU - Branch if Greater Than or Equal Unsigned
  default: bc_out = 1'b0;
  endcase
  end else begin
  bc_out = 1'b0;
  end
 end
 
endmodule
