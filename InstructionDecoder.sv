

module InstructionDecoder(instruction,pcpluseight_in,pcpluseight_out,registerRT,ALUResult,DestinationRegister_RT,DestinationRegister_RRR);

input [31:0] instruction; 
input [31:0] pcpluseight_in;
output [31:0] pcpluseight_out;
input [6:0] registerRT; 
input [127:0] ALUResult;

output [6:0] DestinationRegister_RT; // If any other format
output [6:0] DestinationRegister_RRR; // if format RRR is going to be selected in multiplexer;


assign pcpluseight_in = pcpluseight_out;

//add Module for control soon// 

///////////////////////////////

logic [10:0] opcode = instruction[31:21];

logic [6:0] readRegisterRB = instruction[20:14];

logic [6:0] readRegisterRA = instruction[13:7];

logic [6:0] readRegisterRC =  instruction[6:0]; 

logic [6:0] readRegisterRT = registerRT;

logic [127:0] writeData = ALUResult;

assign DestinationRegister_RT = instruction[6:0];

assign DestinationRegister_RRR =  instruction [27:21];





//RegisterFileMemory RFM (readRegisterRB, readRegisterRA, readRegisterRT, readRegisterRC, writeData, regWriteEnable, clk,reset, readDataRB, readDataRA, readDataRC);




endmodule 
