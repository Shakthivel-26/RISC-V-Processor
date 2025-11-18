`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 16:31:28
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory (
    // Outputs
    output reg [31:0] instr_mem_out,
    
    // Inputs
    input wire [31:0] instr_mem_addr, // FIXED: Now 32 bits wide
    input wire instr_mem_clk
);

    // Instruction Memory Array: Stores 32 instructions (0 to 31)
    reg [31:0] instruction_mem_array [0:31]; 

    // Initial block to load instructions
    initial begin
        // The array index is (Address / 4)

        // PC 0: Instruction 1
        instruction_mem_array[0] <= 32'b00000000_00000001_10100000_00000011; 
        
        // PC 4: Instruction 2
        instruction_mem_array[1] <= 32'b00000000_00010001_10100000_10000011; 
        
        // PC 8: Instruction 3 (ADD x3, x1, x2 - The instruction for 4+2=6)
        instruction_mem_array[2] <= 32'b00000000_00000000_10000001_00110011; 
        
        // PC 12: Instruction 4
        instruction_mem_array[3] <= 32'b00000000_00100001_10100001_00100011; 
        
        // PC 16: Instruction 5
        instruction_mem_array[4] <= 32'b00000000_10010001_10000010_00010011; 
        
        // PC 20: Instruction 6
        instruction_mem_array[5] <= 32'b01000000_01000000_11010010_10110011; 
        
        // PC 24: Instruction 7 (Branch)
        instruction_mem_array[6] <= 32'b00000000_00000000_10010100_01100011; 
        
        // Branch Target (PC 56)
        instruction_mem_array[14] <= 32'b00000000_10110001_10000010_00010011; 
    end

    // Asynchronous read with address scaling
    always @(*) begin
        // Read instruction at index (PC / 4)
        if (instr_mem_addr[1:0] == 2'b00) begin // Check if address is word-aligned (PC=0, 4, 8, ...)
            instr_mem_out = instruction_mem_array[instr_mem_addr / 4];
        end else begin
            // Non-word aligned address is an error in this simple design
            instr_mem_out = 32'hFFFFFFFF; 
        end
    end

endmodule
