`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 10:30:23 AM
// Design Name: 
// Module Name: pc
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


module pc(
input logic          clk,reset, 
input logic [1:0]    nextpc_sel,
input logic          branch,
input logic [31:0]   operand_a,
input logic [31:0]   imm_i,
output logic [31:0]  pc_out
);
logic [31:0] pc;
initial pc =0;
always@(posedge clk) begin
    if(reset == 1) begin
        pc <= '0;
    end else begin
    // BRANCH
    if (nextpc_sel== 2'b01 && branch == 1'b1)   
        pc <= imm_i + pc;
    // JAL
    else if (nextpc_sel == 2'b10) 
        pc <= imm_i+ pc ;
    // JALR
    else if (nextpc_sel == 2'b11) 
        pc <= imm_i+operand_a + pc;
    else 
        pc <= pc+32'h4;
    end
end

assign pc_out=pc;

endmodule

