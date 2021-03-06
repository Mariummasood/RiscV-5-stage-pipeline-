`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 10:23:01 AM
// Design Name: 
// Module Name: alu
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


module alu(
    input        [ 5:0] aluop,
    input  logic [31:0] operand_a,
    input  logic [31:0] operand_b,
    input  logic [ 4:0] shbits,
    output logic [31:0] alu_out,
    output logic        branch
);
    
   logic [31:0] branchtaken;
   logic [31:0] branchnottaken;
   assign branchtaken= 31'd1;
   assign branchnottaken= 31'd0;
   assign shbits = operand_b[4:0];
   
  
    always_comb begin
  
        case (aluop)
         0:  alu_out =  operand_a + operand_b;                                  //lui //auipc   //ADD, ADDI, LW, LB, LH, LBU, LHU
         1:  alu_out =  operand_a - operand_b;                                  //SUB
         2:  alu_out = operand_a << shbits;                                     //SLL, SLLI => 0's shifted in from right //
         3:  alu_out = operand_a < operand_b;                                   //SLT,BLT,SLTI
         4:  alu_out = $unsigned(operand_a) < $unsigned(operand_b);            //SLTU, SLTIU
         5:  alu_out =  operand_a ^ operand_b;                                  //XOR, XORI
         6:  alu_out = operand_a >> shbits;                                      //SRL, SRLI
         7:  alu_out =  operand_a >>> shbits;                                    //SRA, SRAI
         8:  alu_out = operand_a | operand_b;                                    //OR, ORI
         9:  alu_out = operand_a & operand_b;                                    //AND, ANDI
        10:  alu_out = (operand_a == operand_b) ? branchtaken : branchnottaken;   //BEQ
        11:  alu_out = (operand_a >= operand_b) ? branchtaken : branchnottaken;  //BGE
        12:  alu_out = (operand_a < operand_b) ? branchtaken : branchnottaken;  //BLT
        13:  alu_out = ($unsigned(operand_a) < $unsigned(operand_b)) ? branchtaken : branchnottaken;  //BLTU
        14:  alu_out = ($unsigned(operand_a) >= $unsigned(operand_b)) ? branchtaken : branchnottaken;  //BGEU
        15:  alu_out = (operand_a != operand_b) ? branchtaken: branchnottaken;  //BNE
        16:  alu_out = operand_a ; //jal and jalr => pc+4
                                
         default : ;          
 endcase
 end
 always_comb begin
  case (aluop)
  10,
  11,
  12,
  13,
  14: branch = (alu_out[0] == 1'b1) ? 1'b1 : 1'b0;
  default: branch = 1'b0; 
  endcase
 end
 endmodule 