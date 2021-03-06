`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 10:26:13 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
input  logic [31:0]  ins,
input logic  [31:0]   pc,
output logic         illegal,
output logic         memtoreg, 
output logic         regwrite, 
output logic         memread, 
output logic         memwrite, 
output logic         branch,
output logic [1:0]   nextpc_sel, //nextpc_sel
output logic [5:0]   aluop, //alu control bits
output logic [4:0]   rs1,
output logic [4:0]   rs2,
output logic [4:0]   rd,
output logic [31:0]  immval,
output logic op_b_sel,
output logic [1:0] op_a_sel,
output logic [1:0] extend_sel
);

logic [19:0] imm20;
logic [11:0] imm12;
logic  [31:0] imm;

/*assign operand_a= rs1;
assign operand_a= rs1; */
assign immval = imm ? {{12{imm20[19]}},imm20}: {{20{imm12[11]}},imm12};

always_comb begin
illegal =1'b1;
case (ins) inside

32'b0000000_?????_?????_000_?????_0110011: begin// ADD
    illegal =1'b0;
    memtoreg = 1'b0;
    regwrite = 1'b1;
    memread = 1'b0;
    memwrite = 1'b0;
    branch = 1'b0;
    nextpc_sel = 2'b00;
    aluop = 0;
    rs1 = ins[19:15];
    rs2 = ins[24:20];
    rd = ins[11:7];
    op_b_sel = 1'b1;
    op_a_sel = 2'b00;
    end
    
32'b0100000_?????_?????_000_?????_0110011:  begin //SUB
   illegal =1'b0;
   memtoreg = 1'b0;
   regwrite = 1'b1;
   memread = 1'b0;
   memwrite = 1'b0;
   branch = 1'b0;
   nextpc_sel = 2'b00;
   aluop = 1;
   rs1 = ins[19:15];
   rs2 = ins[24:20];
   rd = ins[11:7];
   op_b_sel = 1'b1;
   op_a_sel = 2'b00;
   end
   
32'b0000000_?????_?????_001_?????_0110011:  begin// SLL
      illegal =1'b0;
      memtoreg = 1'b0;
      regwrite = 1'b1;
      memread = 1'b0;
      memwrite = 1'b0;
      branch = 1'b0;
      nextpc_sel = 2'b00;
      aluop = 2;
      rs1 = ins[19:15];
      rs2 = ins[24:20];
      rd = ins[11:7];
      op_b_sel = 1'b1;
      op_a_sel = 2'b00;
 end
      
32'b0000000_?????_?????_010_?????_0110011:  begin// SLT
         illegal =1'b0;
         memtoreg = 1'b0;
         regwrite = 1'b1;
         memread = 1'b0;
         memwrite = 1'b0;
         branch = 1'b0;
         nextpc_sel = 2'b00;
         aluop = 3;
         rs1 = ins[19:15];
         rs2 = ins[24:20];
         rd = ins[11:7];
         op_b_sel = 1'b1;
         op_a_sel = 2'b00;
 end
         
32'b0000000_?????_?????_011_?????_0110011:  begin// SLTU
            illegal =1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            nextpc_sel = 2'b00;
            aluop = 4;
            rs1 = ins[19:15];
            rs2 = ins[24:20];
            rd = ins[11:7];
            op_b_sel = 1'b1;
            op_a_sel = 2'b00;
            end
            
32'b0000000_?????_?????_100_?????_0110011: begin// XOR
            illegal =1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            nextpc_sel = 2'b00;
            aluop = 5;
            rs1 = ins[19:15];
            rs2 = ins[24:20];
            rd = ins[11:7];
            op_b_sel = 1'b1;
            op_a_sel = 2'b00;
            end
               
32'b0000000_?????_?????_101_?????_0110011: begin// SRL
            illegal =1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            nextpc_sel = 2'b00;
            aluop = 6;
            rs1 = ins[19:15];
            rs2 = ins[24:20];
            rd = ins[11:7];
            op_b_sel = 1'b1;
            op_a_sel = 2'b00;
            end
                  
32'b0100000_?????_?????_101_?????_0110011:  begin// SRA
            illegal =1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            nextpc_sel = 2'b00;
            aluop = 7;
            rs1 = ins[19:15];
            rs2 = ins[24:20];
            rd = ins[11:7];
            op_b_sel = 1'b1;
            op_a_sel = 2'b00;
            end
                     
32'b0000000_?????_?????_110_?????_0110011:  begin// OR
            illegal =1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            nextpc_sel = 2'b00;
            aluop = 8;
            rs1 = ins[19:15];
            rs2 = ins[24:20];
            rd = ins[11:7];
            op_b_sel = 1'b1;
            op_a_sel = 2'b00;
            end
                        
32'b0000000_?????_?????_111_?????_0110011:  begin// AND
            illegal =1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b1;
            memread = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            nextpc_sel = 2'b00;
            rs1 = ins[19:15];
            rs2 = ins[24:20];
            rd = ins[11:7];
            op_b_sel = 1'b1;
            op_a_sel = 2'b00;
            end
                           
32'b????????????_?????_000_?????_0010011:  begin// ADDI
                illegal =1'b0;
                memtoreg = 1'b0;
                regwrite = 1'b1;
                memread = 1'b0;
                memwrite = 1'b0;
                branch = 1'b0;
                nextpc_sel = 2'b00;
                aluop = 0;
                rs1 = ins[19:15];
                rs2 = ins[24:20];
                imm12 = ins[31:20];
                rd = ins[11:7];
                op_b_sel = 1'b0;
                imm = 1'b0;
                extend_sel = 2'b00;
                op_a_sel = 2'b00;
                end 
32'b????????????_?????_010_?????_0010011: begin// SLTI
                illegal =1'b0;
                memtoreg = 1'b0;
                regwrite = 1'b1;
                memread = 1'b0;
                memwrite = 1'b0;
                branch = 1'b0;
                nextpc_sel = 2'b00;
                aluop = 3;
                rs1 = ins[19:15];
                rs2 = ins[24:20];
                imm12 = ins[31:20];
                rd = ins[11:7];
                op_b_sel = 1'b0;
                imm = 1'b0;
                extend_sel = 2'b00;
                op_a_sel = 2'b00;
                end
32'b????????????_?????_011_?????_0010011: begin// SLTIU
                    illegal =1'b0;
                    memtoreg = 1'b0;
                    regwrite = 1'b1;
                    memread = 1'b0;
                    memwrite = 1'b0;
                    branch = 1'b0;
                    nextpc_sel = 2'b00;
                    aluop = 4;
                    rs1 = ins[19:15];
                    rs2 = ins[24:20];
                    imm12 = ins[31:20];
                    rd = ins[11:7];
                    op_b_sel = 1'b0;
                    imm = 1'b0;
                    extend_sel = 2'b00;
                    op_a_sel = 2'b00;
                    end
 32'b????????????_?????_100_?????_0010011: begin// XORI
                        illegal =1'b0;
                        memtoreg = 1'b0;
                        regwrite = 1'b1;
                        memread = 1'b0;
                        memwrite = 1'b0;
                        branch = 1'b0;
                        nextpc_sel = 2'b00;
                        aluop = 5;
                        rs1 = ins[19:15];
                        rs2 = ins[24:20];
                        imm12 = ins[31:20];
                        rd = ins[11:7];
                        op_b_sel = 1'b0;
                        imm = 1'b0;
                        extend_sel = 2'b00;
                        op_a_sel = 2'b00;
                        end
32'b????????????_?????_110_?????_0010011: begin// ORI
                            illegal =1'b0;
                            memtoreg = 1'b0;
                            regwrite = 1'b1;
                            memread = 1'b0;
                            memwrite = 1'b0;
                            branch = 1'b0;
                            nextpc_sel = 2'b00;
                            aluop = 8;
                            rs1 = ins[19:15];
                            rs2 = ins[24:20];
                            imm12 = ins[31:20];
                            rd = ins[11:7];
                            op_b_sel = 1'b0;
                            imm = 1'b0;
                            extend_sel = 2'b00;
                            op_a_sel = 2'b00;
                            end
32'b????????????_?????_111_?????_0010011: begin// ANDI
                                illegal =1'b0;
                                memtoreg = 1'b0;
                                regwrite = 1'b1;
                                memread = 1'b0;
                                memwrite = 1'b0;
                                branch = 1'b0;
                                nextpc_sel = 2'b00;
                                aluop = 9;
                                rs1 = ins[19:15];
                                rs2 = ins[24:20];
                                imm12 = ins[31:20];
                                rd = ins[11:7];
                                op_b_sel = 1'b0;
                                imm = 1'b0;
                                extend_sel = 2'b00;
                                op_a_sel = 2'b00;
                                end
32'b0000000_?????_?????_101_?????_0010011: begin// SRLI
                                    illegal =1'b0;
                                    memtoreg = 1'b0;
                                    regwrite = 1'b1;
                                    memread = 1'b0;
                                    memwrite = 1'b0;
                                    branch = 1'b0;
                                    nextpc_sel = 2'b00;
                                    aluop = 6;
                                    rs1 = ins[19:15];
                                    rs2 = ins[24:20];
                                    imm12 = {ins[24:20], ins[31:25]};
                                    rd = ins[11:7];
                                    op_b_sel = 1'b0;
                                    imm = 1'b0;
                                    extend_sel = 2'b00;
                                    op_a_sel = 2'b00;
                                    end
32'b0000000_?????_?????_001_?????_0010011: begin// SLLI
                                    illegal =1'b0;
                                    memtoreg = 1'b0;
                                    regwrite = 1'b1;
                                     memread = 1'b0;
                                     memwrite = 1'b0;
                                    branch = 2'b00;
                                    nextpc_sel = 1'b0;
                                     aluop = 2;
                                      rs1 = ins[19:15];
                                      rs2 = ins[24:20];
                                     imm12 = {ins[24:20], ins[31:25]};
                                     rd = ins[11:7];
                                     op_b_sel = 1'b0;
                                     imm = 1'b0;
                                     extend_sel = 2'b00;
                                     op_a_sel = 2'b00;
                                     end   
32'b0100000_?????_?????_001_?????_0010011: begin// SRAI
                         illegal =1'b0;
                         memtoreg = 1'b0;
                          regwrite = 1'b1;
                         memread = 1'b0;
                           memwrite = 1'b0;
                          branch = 1'b0;
                           nextpc_sel = 2'b00;
                              aluop = 7;
                                rs1 = ins[19:15];
                                rs2 = ins[24:20];
                                imm12 = {ins[24:20], ins[31:25]};
                                 rd = ins[11:7];
                                 op_b_sel = 1'b0;
                                 imm = 1'b0;
                               extend_sel = 2'b00;
                               op_a_sel = 2'b00;
                               end                                     
                                     
32'b????????????_?????_000_0000_?_1100011:  begin // BEQ
                        illegal =1'b0;
                        memtoreg = 1'b0;
                        regwrite = 1'b1;
                          memread = 1'b0;
                        memwrite = 1'b1;
                        branch = 1'b1;
                        nextpc_sel = 2'b01;
                        aluop = 10;
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       imm20 = {ins[11:8], ins[30:25], ins[31], 1'b0};
                       op_b_sel = 1'b1;
                       imm = 1'b1;
                       op_a_sel = 2'b00;
                       end
32'b????????????_?????_001_?????_1100011: begin // BNE
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b1;
                       memread = 1'b0;
                       memwrite = 1'b0;
                       branch = 1'b1;
                       nextpc_sel = 2'b01;
                       aluop = 15;
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       op_b_sel = 1'b0;
                       imm = 1'b1;
                       op_a_sel = 2'b00;
                       end
32'b????????????_?????_100_?????_1100011:  begin // BLT
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b1;
                       memread = 1'b0;
                       memwrite = 1'b0;
                       branch = 2'b01;
                       nextpc_sel = 1'b1;
                       aluop = 12;
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       imm20 = {ins[11:8], ins[30:25], ins[31], 1'b0};
                       op_b_sel = 1'b0;
                       imm = 1'b1;
                       op_a_sel = 2'b00;
                       end
32'b????????????_?????_101_?????_1100011: begin // BGE
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b1;
                       memread = 1'b0;
                       memwrite = 1'b0;
                       branch = 2'b01;
                       nextpc_sel = 1'b1;
                       aluop = 11;
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       imm20 = {ins[11:8], ins[30:25], ins[31], 1'b0};
                       op_b_sel = 1'b0;
                       imm = 1'b1;
                       op_a_sel = 2'b00;
                       end// s-type
32'b????????????_?????_110_?????_1100011: begin // BLTU
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b1;
                       memread = 1'b0;
                       memwrite = 1'b0;
                       branch = 1'b1;
                       nextpc_sel = 2'b01;
                       aluop = 13;
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       imm20 = {ins[11:8], ins[30:25], ins[31], 1'b0};
                       op_b_sel = 1'b0;
                       imm = 1'b1;
                       op_a_sel = 2'b00;
                       end
32'b????????????_?????_111_?????_1100011: begin //  BGEG
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b1;
                       memread = 1'b0;
                       memwrite = 1'b0;
                       branch = 1'b1;
                       nextpc_sel = 2'b01;
                       aluop = 14;
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       imm20 = {ins[11:8], ins[30:25], ins[31], 1'b0};
                       op_b_sel = 1'b0;
                       imm = 1'b1;
                       op_a_sel = 2'b00;
                       end                       
                       
32'b????????????_?????_000_?????_0000011:  begin// LB
                                   illegal =1'b0;
                                   memtoreg = 1'b1;
                                   regwrite = 1'b1;
                                   memread = 1'b1;
                                   memwrite = 1'b0;
                                   branch = 1'b1;
                                   nextpc_sel = 2'b00;
                                   aluop = 0;
                                   imm12 = ins[31:20];
                                   rs1 = ins[19:15];
                                   rs2 = ins[24:20];
                                   rd = ins[11:7];
                                   op_b_sel = 1'b1;
                                   imm = 1'b0;
                                   op_a_sel = 2'b00;
                                   end
                           
32'b????????????_?????_001_?????_0000011:  begin// LH
                              illegal =1'b0;
                              memtoreg = 1'b1;
                              regwrite = 1'b1;
                              memread = 1'b1;
                              memwrite = 1'b0;
                              branch = 1'b0;
                              nextpc_sel = 2'b00;
                              aluop = 0;
                              imm12 = ins[31:20];
                              rs1 = ins[19:15];
                              rs2 = ins[24:20];
                              op_b_sel = 1'b1;
                              imm = 1'b0;
                              op_a_sel = 2'b00;
                              end
32'b????????????_?????_010_?????_0000011:  begin// LW
                                 illegal =1'b0;
                                 memtoreg = 1'b1;
                                 regwrite = 1'b1;
                                 memread = 1'b1;
                                 memwrite = 1'b0;
                                 branch = 1'b0;
                                 nextpc_sel = 2'b00;
                                 aluop = 0;
                                 imm12 = ins[31:20];
                                 rs1 = ins[19:15];
                                 rs2 = ins[24:20];
                                 rd = ins[11:7];
                                 op_b_sel = 1'b1;
                                 imm = 1'b0;
                                 op_a_sel = 2'b00;
                                 end
32'b????????????_?????_100_?????_0000011:  begin// LBU
                                    illegal =1'b0;
                                    memtoreg = 1'b0;
                                    regwrite = 1'b1;
                                    memread = 1'b1;
                                    memwrite = 1'b1;
                                    branch = 1'b0;
                                    nextpc_sel = 2'b00;
                                    aluop = 0;
                                    imm12 = ins[31:20];
                                    rs1 = ins[19:15];
                                    rs2 = ins[24:20];
                                    rd = ins[11:7];
                                    op_b_sel = 1'b1;
                                    imm = 1'b0;
                                    op_a_sel = 2'b00;
                                    end
32'b????????????_?????_101_?????_0000011:  begin// LHU
                                       illegal =1'b0;
                                       memtoreg = 1'b1;
                                       regwrite = 1'b1;
                                       memread = 1'b1;
                                       memwrite = 1'b0;
                                       branch = 1'b0;
                                       nextpc_sel = 2'b00;
                                       aluop = 0;
                                       imm12 = ins[31:20];
                                       rs1 = ins[19:15];
                                       rs2 = ins[24:20];
                                       rd = ins[11:7];
                                       op_b_sel = 1'b1;
                                       imm = 1'b0;
                                       op_a_sel = 2'b00;
                                       end
32'b????????????_?????_000_?????_0100011: begin // SB
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b0;
                       memread = 1'b0;
                       memwrite = 1'b1;
                       branch = 1'b0;
                       nextpc_sel = 2'b00;
                       aluop = 0;
                       imm12 = {ins[31:25], ins[11:7]};
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       op_b_sel = 1'b1;
                       imm = 1'b0;
                       extend_sel = 2'b01;
                       op_a_sel = 2'b00;
                       end // sb-type
32'b????????????_?????_001_?????_1100011: begin // SH
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b0;
                       memread = 1'b0;
                       memwrite = 1'b1;
                       branch = 1'b0;
                       nextpc_sel = 2'b00;
                       aluop = 0;
                       imm12 = {ins[31:25], ins[11:7]};
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       op_b_sel = 1'b1;
                       imm = 1'b0;
                       op_a_sel = 2'b00;
                       end // sb-type
32'b????????????_?????_010_?????_1100011: begin // SW
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b0;
                       memread = 1'b0;
                       memwrite = 1'b1;
                       branch = 1'b0;
                       nextpc_sel = 2'b00;
                       aluop = 0;
                       imm12 = {ins[31:25], ins[11:7]};
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       op_b_sel = 1'b1;
                       imm = 1'b0;
                       op_a_sel = 2'b00;
                       end

32'b????????????_?????_100_?????_1100011: begin //  SBU
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b0;
                       memread = 1'b0;
                       memwrite = 1'b1;
                       branch = 1'b0;
                       nextpc_sel = 2'b00;
                       aluop = 0;
                       imm12 = {ins[31:25], ins[11:7]};
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       op_b_sel = 1'b1;
                       imm = 1'b0;
                       op_a_sel = 2'b00;
                       end
32'b????????????_?????_101_?????_1100011: begin // SHU
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b1;
                       memread = 1'b0;
                       memwrite = 1'b0;
                       branch = 1'b0;
                       nextpc_sel = 2'b00;
                       aluop = 0;
                       imm12 = {ins[31:25], ins[11:7]};
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       op_b_sel = 1'b1;
                       imm = 1'b0;
                       op_a_sel = 2'b00;
                       end
                       
32'b?_??????????_?_?????_???_?????_1101111: begin // jal-type
                       illegal =1'b0;
                       memtoreg = 1'b0;
                       regwrite = 1'b1;
                       memread = 1'b0;
                       memwrite = 1'b0;
                       branch = 1'b0;
                       nextpc_sel = 2'b10;
                       aluop = 16;
                       rd = ins[11:7];
                       rs2 = ins[24:20];
                       rs1 = ins[19:15];
                       imm20 = {ins[19:12], ins[20], ins[30:21], 1'b0};
                       op_b_sel = 1'b0;
                       imm = 1'b1;
                       op_a_sel = 2'b01;
                       end
32'b????????????_?????_000_?????_1100111: begin // jalr-type
                       illegal =1'b0;
                       memtoreg = 1'b1;
                       regwrite = 1'b0;
                       memread = 1'b0;
                       memwrite = 1'b0;
                       branch = 1'b0;
                       nextpc_sel = 2'b11;
                       aluop = 0;
                       rd = ins[11:7];
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       imm12 = ins[31:20];
                       op_b_sel = 1'b1;
                       op_a_sel = 2'b01;
                       imm = 1'b0;
                       end
32'b????????????_?????_???_?????_0110111: begin //lui
                       illegal =1'b0;
                       memtoreg = 1'b1;
                       regwrite = 1'b0;
                       memread = 1'b0;
                       memwrite = 1'b0;
                       branch = 1'b0;
                       nextpc_sel = 2'b00;
                       aluop = 0;
                       rd = ins[11:7];
                       rs1 = ins[19:15];
                       rs2 = ins[24:20];
                       imm20 = {ins[31:12]<<12};
                       op_b_sel = 1'b0;
                       imm = 1'b1;
                       op_a_sel = 2'b00;
                       end
32'b????????????_?????_???_?????_0010111: begin //AUIPC
                        illegal =1'b0;
                        memtoreg = 1'b1;
                        regwrite = 1'b0;
                        memread = 1'b0;
                        memwrite = 1'b0;
                        branch = 1'b0;
                        nextpc_sel = 2'b00;
                        aluop = 0;
                        rd = ins[11:7];
                        rs1 = ins[19:15];
                        rs2 = ins[24:20];
                        imm20 = {ins[31:12]<<12 + pc};
                        op_b_sel = 1'b0;
                        imm = 1'b1;
                        extend_sel = 2'b10;
                        op_a_sel = 2'b10;
                        end
default : ;
endcase;
end
endmodule
