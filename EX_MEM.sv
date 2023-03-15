
module EX_MEM(reset,clk,JumpPC_in,zero_in,ALUResult_in,ReadData2_in,RegisterRT_in,JumpPC_out,zero_out,ALUResult_out,ReadData2_out,RegisterRT_out);

input reset, clk; 

input[31:0] JumpPC_in;
input zero_in;
input[127:0]ALUResult_in;
input [127:0] ReadData2_in;
input [6:0] RegisterRT_in;



output logic[31:0] JumpPC_out; 
output logic zero_out;
output logic[127:0]ALUResult_out;
output logic[127:0] ReadData2_out;
output logic[6:0] RegisterRT_out;



always_ff @(posedge clk) begin 

	if (reset == 1) begin
		JumpPC_out <=0;
		zero_out <= 0;
		ALUResult_out <=0;
		ReadData2_out<=0;
		RegisterRT_out<=0;
	end
	
	else begin
		JumpPC_out <= JumpPC_in;
		zero_out <= zero_in;
		ALUResult_out <=ALUResult_in;
		ReadData2_out<=ReadData2_in;
		RegisterRT_out<=RegisterRT_in;
	end
end
endmodule 