`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 10:27:29 AM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
input logic clk , reset , store, read_en,
input logic [11:0] addr, [31:0] data_in,
output logic [31:0] data_out
);

localparam MEM_SIZE = 1 << 10;

logic [31:0] mem [0:MEM_SIZE-1];

always_ff @(posedge clk) begin
if (store == 1'b1)
    mem[addr] <= data_in;
end

  assign data_out = (read_en == 1'b1) ? mem[addr] : 32'b0;

endmodule
