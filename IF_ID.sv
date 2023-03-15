
module IF_ID (clk,reset, PC_adderOut,instruction1,instruction2,PC_plusEight,first_instruction,second_instruction);

parameter PCbitsize=11;

input clk,reset;

input [PCbitsize-1:0] PC_adderOut;
input [31:0] instruction1,instruction2;

output logic[PCbitsize-1:0] PC_plusEight;
output logic [31:0] first_instruction, second_instruction; 



always_ff @(posedge clk) begin 
	if (reset==0) begin
		PC_plusEight <= 0;
		first_instruction <= 0;
		second_instruction <= 0; 
	end

	else begin
		PC_plusEight <= PC_adderOut;
		first_instruction <= instruction1;
		second_instruction <= instruction2; 
	end 
	
end

endmodule
