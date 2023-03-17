
module Execute(PC_plusEight,immediate,ReadData1,ReadData2,ReadData3,DestinationRegister_RT,DestinationRegister_RRR,DestinationRegister,ALUControl,ALUSource,
Jump_PC,zero,ALUResult,ReadData2_out,Register_RT);

//Jump Branch datapath 
parameter PC_bitSize =11;

input [PC_bitSize-1:0] PC_plusEight; 
input [128:0] immediate;
input [128:0] ReadData1; 
input [128:0] ReadData2;
input [128:0] ReadData3;
input [6:0] DestinationRegister_RT;
input [6:0] DestinationRegister_RRR;
input DestinationRegister;
input ALUControl;
input ALUSource;

logic [PC_bitSize-1:0] Jump_add;
logic [127:0] input_ALU_A;


output [11:0] Jump_PC;
output zero; 
output [127:0] ALUResult;
output [127:0] ReadData2_out;
output [6:0] Register_RT; 

shift3 s3(immediate[10:0], Jump_add);
JumpPCAdder JPCAdder(PCplusEight,Jump_add,Jump_PC);
mux2_to_1_128BIT readdata2(input_ALU_A,ReadData2,immediate,ALUSource);
ALU aluexecute(input_ALU_A,ReadData1,ReadData3,ALUctr, ALUResult,zero);
mux2_to_1_7BIT Dest_Reg(Register_RT,DestinationRegister_RT,DestinationRegister_RRR,DestinationRegister);


endmodule 



