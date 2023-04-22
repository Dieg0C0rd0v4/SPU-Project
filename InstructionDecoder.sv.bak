

module Registers128_128Bits(clk,reset,pcpluseight_in,instruction,registerRT,writeData,regWriteEnable,immediate_select,
                          pcpluseight_out,DestinationRegister_RT,DestinationRegister_RRR,readDataRB,readDataRA,readDataRC, immediate,readRegister_RB_ID,readRegister_RA_ID,branch_address,memory_data_address,branch_control,branch_result);
parameter PC_bitSize =11; 

input clk,reset ;
input [10:0] pcpluseight_in;
input [31:0] instruction; 
input [6:0] registerRT; 
input [127:0] writeData;
input regWriteEnable;
input [1:0] immediate_select;	
input [127:0] memory_data_address; //data from the memory stage. from ALU_result	
input branch_control;  //branch control signal

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
logic [1:0] branch_fowarding_select;

output [10:0] pcpluseight_out;
output [6:0] DestinationRegister_RT;
output [6:0] DestinationRegister_RRR; 
output [127:0] readDataRB;
output [127:0] readDataRA;
output [127:0] readDataRC;
output [127:0] immediate; 
output [6:0] readRegister_RB_ID,readRegister_RA_ID;	 

output [PC_bitSize-1:0] branch_address;
output branch_result; 

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


logic [PC_bitSize-1:0] Jump_add; 
logic [127:0] output_branch_registerA;//output of the  branch forwarding muxes
logic [127:0] output_branch_registerB;
logic compare_flag; 

RegisterFileMemory RFM(readRegisterRB, readRegisterRA, readRegisterRT, readRegisterRC, writeData, regWriteEnable, clk,reset, readDataRB, readDataRA, readDataRC);
sign_ext se(clk,reset,in_7bits,in_10bits,in_16bits,in_18bits,out,immediate_select);
shift3 shift_three(out[10:0], Jump_add); //shifts immediate by 3 to get Jump Add result  
JumpPCAdder branch_address_result(pcpluseight_in, Jump_add,branch_address); //calcs branch address using the PC counter from the output of the IF/ID flip flop and shifted address
mux2_to_1_128BIT branch_fowardC(output_branch_registerA,readDataRA,memory_data_address,branch_fowarding_select);//chooses to foward previous result or current result based on branch issues  
mux2_to_1_128BIT branch_fowardD(output_branch_registerB,memory_data_address,readDataRB,branch_fowarding_select); 
compare_equal check_branch_condition(output_branch_registerA,output_branch_registerB, compare_flag); //if equal branch 
BranchGate start_branch(branch_control,	compare_flag, branch_result);

endmodule 
