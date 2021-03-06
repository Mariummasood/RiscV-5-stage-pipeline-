`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 10:25:08 AM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input logic         clk, 
    input logic         reset,   
    input logic         write_en,        //reg_write enable pin  
    input logic  [4:0]  rd_address,  //writeregister
    input logic  [4:0]  rs1_address,      //read reg1
    input logic  [4:0]  rs2_address,   //read reg2
    input logic  [31:0] rd_data,     //writedata
    output logic [31:0] rs1_data,    //read data rs1
    output logic [31:0] rs2_data    //read data rs2
);
    // 32 registers of 32-bit width
    logic [31:0] register [0:31];
   
    // Read ports for rs1 and rs2


    // Register x0 is always 0
    initial register[0] = 32'b0;

    // Write port for rd
    always_ff @(posedge clk) begin
        if (reset==1) begin
            for (int i=0; i<32; i=i+1) begin
                register[i] <= '0;
            end
         end
         else if (write_en == 1) begin
                if (rd_address != 5'b0) register[rd_address] <= rd_data;
         end
    end
    
    assign rs1_data = register[rs1_address];
    assign rs2_data = register[rs2_address];
endmodule
