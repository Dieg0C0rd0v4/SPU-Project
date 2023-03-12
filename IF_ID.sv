
module IF_ID (PC_adderOut,instruction1,instruction2,PC_plusEight,instruction1,instruction2);

parameter PCbitsize=32;

input clk;

input [PCbitsize-1:0] PC_adderOut;

input [31:0] instruction1,instruction2;

output [PCbitsize-1:0] PC_plusEight;

output [31:0]  first_instruction, second_instruction; 

always_ff @(posedge clk) begin 

	PC_plusEight <= PC_adderOut;
	first_instruction <= instruction1;
	second_instruction <= instruction2; 
	
end

endmodule
