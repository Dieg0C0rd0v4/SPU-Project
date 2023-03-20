
module Execute(PC_plusEight,immediate,ReadData1,ReadData2,ReadData3,DestinationRegister_RT,DestinationRegister_RRR,DestinationRegister,ALUControl,ALUSource,ReadData1Sel_EX,ReadData2Sel_EX,
Jump_PC,zero,ALUResult,Register_RT);

//Jump Branch datapath 
parameter PC_bitSize =11;

input [PC_bitSize-1:0] PC_plusEight; 
input [127:0] immediate;
input [127:0] ReadData1; 
input [127:0] ReadData2;
input [127:0] ReadData3;
input [6:0] DestinationRegister_RT;
input [6:0] DestinationRegister_RRR;
input DestinationRegister;
input [3:0]ALUControl;
input ALUSource;
input [1:0] ReadData1Sel_EX,ReadData2Sel_EX;

logic [PC_bitSize-1:0] Jump_add;
logic [127:0] input_ALU_B;


output [10:0] Jump_PC;
output zero; 
output [127:0] ALUResult;
output [6:0] Register_RT; 

shift3 s3(immediate[10:0], Jump_add);

JumpPCAdder JPCAdder(PC_plusEight,Jump_add,Jump_PC);

mux2_to_1_128BIT ReadDataRB_or_immediate(input_ALU_A,ReadData2,immediate,ALUSource);

mux2_to_1_128BIT Forward(out,selection0,selection1,selection2,sel); // sign

mux2_to_1_128BIT(out,selection0,selection1,selection2,sel); // sign

ALU aluexecute(input_ALU_A,ReadData1,ReadData3,ALUControl, ALUResult,zero);

mux2_to_1_7BIT Dest_Reg(Register_RT,DestinationRegister_RT,DestinationRegister_RRR,DestinationRegister);


endmodule 



