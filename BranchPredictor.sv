module static_branch_prediction(unitID_ID, branchOutcome, flushEven, flushOdd);

input logic [2:0] unitID_ID;  // Input indicating the branch opcode
input logic branchOutcome;  // Input indicating the actual outcome of the branch come from the execute stage

output logic flushOdd, flushEven; 

always_comb begin
        // Check if the prediction was correct
	if (unitID_ID == 7) begin
	        if (branchOutcome == 1) begin
	 		flushOdd = 1;
		end
		else begin
			flushOdd = 1;	
		end
	end
end

endmodule
