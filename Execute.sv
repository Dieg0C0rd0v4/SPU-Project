
module Execute(PC_plusEight,immediate,ReadDataRB,ReadDataRA,ReadDataRC,DestinationRegister_RT,DestinationRegister_RRR,DestinationRegister,ALUControl,ALUSource,ReadData1Sel,ReadData2Sel,
Jump_PC,zero,ALUResult);

//Jump Branch datapath 
parameter PC_bitSize =11;

input [PC_bitSize-1:0] PC_plusEight; 
input [127:0] immediate;
input [127:0] ReadDataRB; 
input [127:0] ReadDataRA;
input [127:0] ReadDataRC;
input [6:0] DestinationRegister_RT;
input [6:0] DestinationRegister_RRR;
input DestinationRegister;
input [3:0]ALUControl;
input ALUSource;
input [1:0] ReadData1Sel,ReadData2Sel;

wire [PC_bitSize-1:0] Jump_add;
wire [127:0] ALU_B; 
wire [127:0] ALU_A;
wire [127:0] ALU_C;
wire [127:0] select_B;
wire [127:0] select_A;

assign ALU_A = select_A;
assign ALU_C = ReadDataRC;

output [10:0] Jump_PC;
output zero; 
output [127:0] ALUResult;


shift3 s3(immediate[10:0], Jump_add); //Shifter
JumpPCAdder JPCAdder(PC_plusEight,Jump_add,Jump_PC);//JPCAdder

mux3_to_1_128BIT InputB(select_B,ReadDataRB,ALUResulT,ALUResult,ReadData1Sel); //Select input for A
mux3_to_1_128BIT InputA(select_A,ReadDataRA,ALUResult,ALUResult,ReadData2Sel); //Select input for B

mux2_to_1_128BIT ReadDataRB_or_immediate(ALU_B,select_B,immediate,ALUSource); //Immediate or selectB_input

ALU aluexecute(ALU_A,ALU_B,ALU_C,ALUControl,ALUResult,zero); // ALU Module

mux2_to_1_7BIT Dest_Reg(RegisterRT,DestinationRegister_RT,DestinationRegister_RRR,DestinationRegister); // Register RT selector


endmodule 



