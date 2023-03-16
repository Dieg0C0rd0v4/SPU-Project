
module EX_MEM(reset,clk,JumpPC_in,JumpPC_out,zero_in,zero_out,ALUResult_in,ALUResult_out,ReadData2_in,ReadData2_out,RegisterRT_in,RegisterRT_out);

input reset, clk; 
input[31:0] JumpPC_in;
output logic[31:0] JumpPC_out; 

input zero_in;
output logic zero_out;

input[127:0]ALUResult_in;
output logic[127:0]ALUResult_out;

input [127:0] ReadData2_in;
output logic[127:0] ReadData2_out;

input [6:0] RegisterRT_in;
output logic[6:0] RegisterRT_out;

always_ff @(posedge clk) begin 

	if (reset == 1) begin
		zero_out <= 0;
		ALUResult_out <=0;
		ReadData2_out<=0;
		RegisterRT_out<=0;
	end
	
	else begin
		zero_out <= zero_in;
		ALUResult_out <=ALUResult_in;
		ReadData2_out<=ReadData2_in;
		RegisterRT_out<=RegisterRT_in;

	end
end
endmodule 