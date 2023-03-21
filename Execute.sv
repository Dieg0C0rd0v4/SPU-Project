
module Execute(PC_plusEight,immediate,ReadDataRB,ReadData2,ReadData3,DestinationRegister_RT,DestinationRegister_RRR,DestinationRegister,ALUControl,ALUSource,ReadData1Sel_EX,ReadData2Sel_EX,
Jump_PC,zero,ALUResult,Register_RT);

//Jump Branch datapath 
parameter PC_bitSize =11;

input [PC_bitSize-1:0] PC_plusEight_EX; 
input [127:0] immediate_EX;
input [127:0] ReadDataRB_EX; 
input [127:0] ReadDataRA_EX;
input [127:0] ReadDataRC_EX;
input [6:0] DestinationRegister_RT_EX;
input [6:0] DestinationRegister_RRR_EX;
input DestinationRegister_EX;
input [3:0]ALUControl_EX;
input ALUSource_EX;
input [1:0] ReadData1Sel_EX,ReadData2Sel_EX;
input [127:0] ALUResult_MEM;
input [127:0] ALUResult_WB;

wire [PC_bitSize-1:0] Jump_add;
wire [127:0] ALU_B; 
wire [127:0] ALU_A;
wire [127:0] ALU_C; 

assign ALU_A = select_A;
assign ALU_C = ReadDataRC_EX;

output [10:0] Jump_PC_EX;
output zero_EX; 
output [127:0] ALUResult_EX;
output [6:0] RegisterRT_EX; 


shift3 s3(immediate[10:0], Jump_add); //Shifter
JumpPCAdder JPCAdder(PC_plusEight_EX,Jump_add,Jump_PC_EX);//JPCAdder

mux3_to_1_128BIT InputB(select_B,ReadDataRB_EX,ALUResult_MEM,ALUResult_WB,ReadData1Sel_EX); //Select input for A
mux3_to_1_128BIT InputA(select_A,ReadDataRA_EX,ALUResult_MEM,ALUResult_WB,ReadData2Sel_EX); //Select input for B

mux2_to_1_128BIT ReadDataRB_or_immediate(ALU_B,select_B,immediate,ALUSource); //Immediate or selectB_input

ALU aluexecute(ALU_A,ALU_B,ALU_C,ALUControl_EX,ALUResult_EX,zero_EX); // ALU Module

mux2_to_1_7BIT Dest_Reg(RegisterRT_EX,DestinationRegister_RT_EX,DestinationRegister_RRR_EX,DestinationRegister_EX); // Register RT selector


endmodule 



