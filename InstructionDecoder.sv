

module InstructionDecoder(clk,reset,pcpluseight_in,instruction,registerRT,writeData,regWriteEnable,immediate_select,
                          pcpluseight_out,DestinationRegister_RT,DestinationRegister_RRR,readDataRB,readDataRA,readDataRC, immediate,readRegister_RB_ID,readRegister_RA_ID);

input clk,reset ;
input [10:0] pcpluseight_in;
input [31:0] instruction; 
input [6:0] registerRT; 
input [127:0] writeData;
input regWriteEnable;
input [1:0] immediate_select;

logic [10:0] opcode;
logic [6:0] readRegisterRB ;
logic [6:0] readRegisterRA; 
logic [6:0] readRegisterRC; 
logic [6:0] readRegisterRT;
logic [6:0] in_7bits ;
logic [9:0] in_10bits ;
logic [15:0]in_16bits ;
logic [17:0]in_18bits;
logic [127:0] out; 


output [10:0] pcpluseight_out;
output [6:0] DestinationRegister_RT;
output [6:0] DestinationRegister_RRR; 
output [127:0] readDataRB;
output [127:0] readDataRA;
output [127:0] readDataRC;

output [127:0] immediate; 
output [6:0] readRegister_RB_ID,readRegister_RA_ID;



assign opcode = instruction[31:21];
assign readRegisterRB = instruction[20:14];
assign readRegisterRA = instruction[13:7];
assign readRegisterRC =  instruction[6:0]; 
assign readRegister_RB_ID = readRegisterRB;
assign readRegister_RA_ID=readRegisterRA;
assign readRegisterRT = registerRT;
assign in_7bits = instruction[20:14];
assign in_10bits = instruction[23:14];
assign in_16bits = instruction[22:7];
assign in_18bits=instruction[24:7];

assign pcpluseight_in = pcpluseight_out;
assign DestinationRegister_RT = instruction[6:0];
assign DestinationRegister_RRR =  instruction [27:21];
assign immediate = out; 

RegisterFileMemory RFM(readRegisterRB, readRegisterRA, readRegisterRT, readRegisterRC, writeData, regWriteEnable, clk,reset, readDataRB, readDataRA, readDataRC);
sign_ext se(clk,reset,in_7bits,in_10bits,in_16bits,in_18bits,out,immediate_select);




endmodule 
