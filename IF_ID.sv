
module IF_ID (instruction1_IF, instruction2_IF,
              instruction1_ID, instruction2_ID,
	      clk, reset, flush);



input clk,reset,flush;
input [31:0] instruction1_IF,instruction2_IF;

output logic [31:0] instruction1_ID, instruction2_ID; 

always_ff @(posedge clk) begin 
	if (reset == 1 | flush == 1) begin
		
		instruction1_ID <= 0;
		instruction2_ID <= 0; 
	end

	else begin
		instruction1_ID <= instruction1_IF;
		instruction2_ID <= instruction2_IF; 
	end 
	
end

endmodule
