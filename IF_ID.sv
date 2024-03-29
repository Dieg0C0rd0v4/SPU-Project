
module IF_ID_STAGE (instruction1_IF, instruction2_IF,
                    instruction1_ID, instruction2_ID,
	            clk, stall, flush);



input clk;
input stall, flush;
input [31:0] instruction1_IF,instruction2_IF;
output logic [31:0] instruction1_ID, instruction2_ID; 

always_ff @(posedge clk) begin 

	if (flush) begin
		instruction1_ID <= 0; 
		instruction2_ID <= 0; 
	end

	else if (!stall) begin
		instruction1_ID <= instruction1_IF;
		instruction2_ID <= instruction2_IF; 
	end	

end

endmodule
