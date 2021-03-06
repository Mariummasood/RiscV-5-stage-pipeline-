`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 10:28:37 AM
// Design Name: 
// Module Name: ins_mem
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


module ins_mem(
input logic clk , reset , write_en, read_en,
input logic [11:0] addr_i, [31:0] data_in,
output logic [31:0] data_o 
);

localparam MEM_SIZE = 1 << 10;

logic [31:0] mem [0:MEM_SIZE-1];

initial 
$readmemh("F:/Vivado/RTL/fib_mem.mem",mem);
always_ff @(posedge clk) begin
if (write_en == 1'b1)
    mem[addr_i] <= data_in;
end

  assign data_o = (read_en == 1'b1) ? mem[addr_i] : 32'b0;

endmodule