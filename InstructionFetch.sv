
module InstructionFetch(reset,clk,PC_source,PC_enable,PC_jump,fetch_output1,fetch_output2,PC_adderOut,IF_flush);

parameter bitsize = 11;

input clk,reset,IF_flush;
input PC_enable,PC_source;
input [bitsize-1:0] PC_jump;
logic [bitsize-1:0] PC_out; 
logic [bitsize-1:0] PC_next; 

logic  [31:0] instruction1, instruction2;
output [bitsize-1:0] PC_adderOut;
output [31:0] fetch_output1,fetch_output2; //will flush insturction or keep 


ProgramCounter pc(PC_next,PC_out,reset,clk,PCenable);
PCAdder pcadder(PC_out,PC_adderOut);
mux2_to_1_11BIT Jump_or_Pc4(PC_next,PC_adderOut,PC_jump,PC_source);
instruction_memory insMem(PC_out,instruction1,instruction2);
//adds two modules
mux2_to_1_32BIT instruction_flush_one(fetch_output1,instruction1,0,IF_flush); 	 
mux2_to_1_32BIT instruction_flush_two(fetch_output2,instruction2,0,IF_flush); 	


endmodule

