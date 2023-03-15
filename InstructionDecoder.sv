

module InstructionDecoder(instruction,pcpluseight_in,pcpluseight_out,registerRT,writeData,regWriteEnable,DestinationRegister_RT,DestinationRegister_RRR,immediate_select,immediate,readDataRB,readDataRA,readDataRC);
//Instruction DataInput (Important)
input [31:0] instruction; 

//add Module for control soon// 
logic [10:0] opcode = instruction[31:21];
///////////////////////////////

// PC DATAPATH
input [31:0] pcpluseight_in;
output [31:0] pcpluseight_out;

assign pcpluseight_in = pcpluseight_out;

//Register Datapath

input [6:0] registerRT; 
input [127:0] writeData;
input regWriteEnable;

output [6:0] DestinationRegister_RT; // If any other format
output [6:0] DestinationRegister_RRR; // if format RRR is going to be selected in multiplexer;
output [127:0] readDataRB;
output [127:0] readDataRA;
output [127:0] readDataRC;

logic [6:0] readRegisterRB = instruction[20:14];

logic [6:0] readRegisterRA = instruction[13:7];

logic [6:0] readRegisterRC =  instruction[6:0]; 

logic [6:0] readRegisterRT = registerRT;

assign DestinationRegister_RT = instruction[6:0];
assign DestinationRegister_RRR =  instruction [27:21];

RegisterFileMemory RFM (readRegisterRB, readRegisterRA, readRegisterRT, readRegisterRC, writeData, regWriteEnable, clk,reset, readDataRB, readDataRA, readDataRC);

//Immediate Datapath
logic [6:0] in_7bits = instruction[20:14];
logic [9:0] in_10bits = instruction[23:14];
logic [15:0]in_16bits = instruction[22:7];
logic [17:0]in_18bits=instruction[24:7];

logic [127:0] out; 
output [127:0] immediate; 

assign immediate = out; 

input [1:0] immediate_select;

sign_ext se(clk,reset,in_7bits,in_10bits,in_16bits,in_18bits,out,immediate_select);


endmodule 
