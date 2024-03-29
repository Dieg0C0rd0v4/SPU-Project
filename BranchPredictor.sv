module static_branch_prediction(unitID_ID, branchOutcome, flush, reset);

input logic [2:0] unitID_ID;  // Input indicating the branch opcode
input logic branchOutcome;  // Input indicating the actual outcome of the branch come from the execute stage
input reset; 
output logic flush; 

always_comb begin
        // Check if the prediction was correct
	if (reset) begin
		flush = 0 ;
	end
	
	else if (unitID_ID == 7) begin
	        if (branchOutcome == 1) begin
	 		flush = 1;
		end
		else begin
			flush= 0;	
		end
	end
end

endmodule
