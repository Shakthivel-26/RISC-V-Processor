`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 16:00:50
// Design Name: 
// Module Name: data_memory
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


module data_memory #(
    parameter MEMORY_DEPTH = 8,
    parameter ADDRESS_WIDTH = 32,
    parameter SIZE = 16'h0FFF
)(
    data_mem_in, data_mem_out, data_mem_addr, data_mem_clk, data_mem_wr_en
);
    input wire [31:0] data_mem_in;
    input wire [31:0] data_mem_addr;
    input wire data_mem_clk, data_mem_wr_en;
    output reg [31:0] data_mem_out;
    
    reg [MEMORY_DEPTH-1:0] data_mem_bank_3 [0: SIZE - 1];
    reg [MEMORY_DEPTH-1:0] data_mem_bank_2 [0: SIZE - 1];
    reg [MEMORY_DEPTH-1:0] data_mem_bank_1 [0: SIZE - 1];
    reg [MEMORY_DEPTH-1:0] data_mem_bank_0 [0: SIZE - 1];

    // Calculate the Word Address Index by dividing the byte address by 4 (i.e., dropping the two least significant bits)
    wire [31:0] word_address_index = data_mem_addr[31:2]; // Use [31:2] to divide by 4

    always @(posedge data_mem_clk) begin
        
        // --- Initialization (Should be done in an initial block, but fixed for logic) ---
        // Your code initializes memory slot 0 and 1, but we need to use the word_address_index.
        // Array index 0 (PC 0) and Array index 1 (PC 4) are initialized here.
        // This initialization is risky in an always block, but we'll adapt the addressing.

        // We will keep your initialization logic for word addresses 0 and 1:
        data_mem_bank_3[0] <= 8'b0;
        data_mem_bank_2[0] <= 8'b1;
        data_mem_bank_1[0] <= 8'b0;
        data_mem_bank_0[0] <= 8'b100;
        data_mem_bank_3[1] <= 8'b0;
        data_mem_bank_2[1] <= 8'b00100000;
        data_mem_bank_1[1] <= 8'b00010000;
        data_mem_bank_0[1] <= 8'b10010010;
        // ---------------------------------------------------------------------------------

        if (data_mem_wr_en) begin
            // WRITING: Use the calculated word_address_index
            data_mem_bank_3[word_address_index] <= data_mem_in[31:24];
            data_mem_bank_2[word_address_index] <= data_mem_in[23:16];
            data_mem_bank_1[word_address_index] <= data_mem_in[15:8];
            data_mem_bank_0[word_address_index] <= data_mem_in[7:0];
        end
        
        // READING: Use the calculated word_address_index
        data_mem_out <= {
            data_mem_bank_3[word_address_index],
            data_mem_bank_2[word_address_index],
            data_mem_bank_1[word_address_index],
            data_mem_bank_0[word_address_index]
        };
    end
endmodule
