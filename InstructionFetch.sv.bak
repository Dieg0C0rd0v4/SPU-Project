
module InstructionFetch(reset,clk,PC_source,PC_enable,PC_jump,instruction1,instruction2,PC_adderOut);

parameter bitsize = 11;

input clk,reset;
input PC_enable,PC_source;
input [bitsize-1:0] PC_jump;
logic [bitsize-1:0] PC_out; 
logic [bitsize-1:0] PC_next; 

output [31:0] instruction1, instruction2;
output [bitsize-1:0] PC_adderOut;



ProgramCounter pc(PC_next,PC_out,reset,clk,PCenable);
PCAdder pcadder(PC_out,PC_adderOut);
mux2_to_1_11BIT Jump_or_Pc4(PC_next,PC_adderOut,PC_jump,PC_source);
instruction_memory insMem(PC_out,instruction1,instruction2);

endmodule

