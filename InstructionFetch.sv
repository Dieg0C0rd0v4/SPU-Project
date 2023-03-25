
/*
module InstructionFetch(reset,clk,PC_source,PC_enable,PC_branch,IF_flush,
			fetch_output1,fetch_output2,PC_adderOut);

parameter bitsize = 11;

input clk,reset,IF_flush;
input PC_enable,PC_source;
input [bitsize-1:0] PC_branch;
logic [bitsize-1:0] PC_out; 
logic [bitsize-1:0] PC_next; 

logic  [31:0] instruction1, instruction2;
output [bitsize-1:0] PC_adderOut;
output [31:0] fetch_output1,fetch_output2; //will flush insturction or keep 


ProgramCounter pc(PC_next,PC_out,reset,clk,PCenable);
PCAdder pcadder(PC_out,PC_adderOut);
mux2_to_1_11BIT Branch_or_Pc4(PC_next,PC_adderOut,PC_branch,PC_source);
instruction_memory insMem(PC_out,instruction1,instruction2);
//adds two modules
mux2_to_1_32BIT instruction_flush_one(fetch_output1,instruction1,0,IF_flush); 	 
mux2_to_1_32BIT instruction_flush_two(fetch_output2,instruction2,0,IF_flush); 	


endmodule
*/

module InstructionFetch(reset,clk,PC_source,PC_enable,PC_branch,IF_flush,
			fetch_output1,fetch_output2,PC_adderOut);

parameter bitsize = 11;

input clk,reset,IF_flush;
input PC_enable,PC_source;

input [bitsize-1:0] PC_branch;
logic [bitsize-1:0] PC_out; 
logic [bitsize-1:0] PC_next; 

logic  [31:0] instruction1, instruction2;
output logic [bitsize-1:0] PC_adderOut;
output [31:0] fetch_output1,fetch_output2; //will flush insturction or keep 

reg [7:0][7:0] mem[0:249]; 
logic [bitsize-1:0] address; 
assign address=PC_out; 
initial begin
 $readmemh("code.txt",mem);
end 
always_comb begin
	
        if(PC_enable==1) begin 
	  	PC_adderOut = PC_adderOut+8; 
        end 
 
if(IF_flush==0) begin //instruction_memory 
	instruction1 = mem[address>>3][7:4];
	instruction2 = mem[address>>3][3:0]; 
end 
end 



endmodule
