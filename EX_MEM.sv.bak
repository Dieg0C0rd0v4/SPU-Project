
module EX_MEM(reset, clk, mem_to_reg_in, regWrite_enable_in, branch_in, memRead_in, memWrite_in
,JumpPC_in,zero_in,ALUResult_in,ReadData2_in,RegisterRT_in,
mem_to_reg_out, regWrite_enable_out, branch_out, memRead_out, memWrite_out,
JumpPC_out,zero_out,ALUResult_out,ReadData2_out,RegisterRT_out);

input reset, clk; 

input mem_to_reg_in;  // Control Signal
input regWrite_enable_in; // Control Signal
input branch_in; // Control Signal
input memRead_in; // Control Signal
input memWrite_in; // Control Signal
input[10:0] JumpPC_in;
input zero_in;
input[127:0]ALUResult_in;
input [127:0] ReadData2_in;
input [6:0] RegisterRT_in;


output logic mem_to_reg_out; // Control Signal
output logic regWrite_enable_out; // Control Signal
output logic branch_out; // Control Signal
output logic memRead_out; // Control Signal
output logic memWrite_out; // Control Signal

output logic[31:0] JumpPC_out; 
output logic zero_out;
output logic[127:0]ALUResult_out;
output logic[127:0] ReadData2_out;
output logic[6:0] RegisterRT_out;



always_ff @(posedge clk) begin 

	if (reset == 1) begin
		mem_to_reg_out <=0;
		regWrite_enable_out<=0;
		branch_out<=0;
		memRead_out<=0;
		memWrite_out<=0;
		JumpPC_out <=0;
		zero_out <= 0;
		ALUResult_out <=0;
		ReadData2_out<=0;
		RegisterRT_out<=0;
	end
	
	else begin
		mem_to_reg_out <=mem_to_reg_in;
		regWrite_enable_out<=regWrite_enable_in;
		branch_out<=branch_in;
		memRead_out<=ReadData2_in;
		memWrite_out<=memWrite_in;
		JumpPC_out <= JumpPC_in;
		zero_out <= zero_in;
		ALUResult_out <=ALUResult_in;
		ReadData2_out<=ReadData2_in;
		RegisterRT_out<=RegisterRT_in;
	end
end
endmodule 