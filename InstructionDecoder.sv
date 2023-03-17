

module InstructionDecoder(clk,reset,pcpluseight_in,instruction,registerRT,writeData,regWriteEnable,immediate_select,pcpluseight_out,DestinationRegister_RT,DestinationRegister_RRR,readDataRB,readDataRA,readDataRC,immediate);

input clk,reset ;
input [31:0] pcpluseight_in;
input [31:0] instruction; 
input [6:0] registerRT; 
input [127:0] writeData;
input regWriteEnable;
input [1:0] immediate_select;

logic [10:0] opcode = instruction[31:21];
logic [6:0] readRegisterRB = instruction[20:14];
logic [6:0] readRegisterRA = instruction[13:7];
logic [6:0] readRegisterRC =  instruction[6:0]; 
logic [6:0] readRegisterRT = registerRT;
logic [6:0] in_7bits = instruction[20:14];
logic [9:0] in_10bits = instruction[23:14];
logic [15:0]in_16bits = instruction[22:7];
logic [17:0]in_18bits=instruction[24:7];
logic [127:0] out; 


output [31:0] pcpluseight_out;
output [6:0] DestinationRegister_RT;
output [6:0] DestinationRegister_RRR; 
output [127:0] readDataRB;
output [127:0] readDataRA;
output [127:0] readDataRC;
output [127:0] immediate; 


assign pcpluseight_in = pcpluseight_out;
assign DestinationRegister_RT = instruction[6:0];
assign DestinationRegister_RRR =  instruction [27:21];
assign immediate = out; 

RegisterFileMemory RFM(readRegisterRB, readRegisterRA, readRegisterRT, readRegisterRC, writeData, regWriteEnable, clk,reset, readDataRB, readDataRA, readDataRC);
sign_ext se(clk,reset,in_7bits,in_10bits,in_16bits,in_18bits,out,immediate_select);




endmodule 
