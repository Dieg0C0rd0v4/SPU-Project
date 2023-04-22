
module IF_ID_STAGE (instruction1_IF, instruction2_IF,
              instruction1_ID, instruction2_ID,
	      clk, reset, stallEven, stallOdd, flushEven, flushOdd);



input clk,reset;
input stallEven, stallOdd, flushEven, flushOdd;
input [31:0] instruction1_IF,instruction2_IF;

output logic [31:0] instruction1_ID, instruction2_ID; 

always_ff @(posedge clk) begin 
	if (reset == 1) begin
		
		instruction1_ID <= 0;
		instruction2_ID <= 0;
		
	end
	else begin
		if (!stallEven) begin
			instruction1_ID <= instruction1_IF;
		end
		if (!stallOdd) begin
			instruction2_ID <= instruction2_IF; 
		end	
		if (flushEven) begin
			instruction1_ID <= 0; 
		end
		if (flushOdd) begin
			instruction2_ID <= 0; 
		end
	end 
	
end

endmodule
