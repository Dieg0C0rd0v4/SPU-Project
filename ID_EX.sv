
module ID_EX(clk,reset,ReadData1_in,ReadData2_in,ReadData3_in,immediate_in,PC_plusEight_in,ReadData1_out,ReadData2_out,ReadData3_out,immediate_out,PC_plusEight_out); //Edit for the control signals 

parameter PC_bitsize=32;

input clk,reset;

input [127:0] ReadData1_in,ReadData2_in,ReadData3_in,immediate_in;

input [PC_bitsize-1:0] PC_plusEight_in;

output logic [127:0] ReadData1_out,ReadData2_out,ReadData3_out,immediate_out;

output logic [PC_bitsize-1:0] PC_plusEight_out;

always_ff @(posedge clk) begin

	if (reset==1) begin 
		ReadData1_out <= 0;
		ReadData2_out <=0;
		ReadData3_out <= 0;
		immediate_out <= 0; 

	end
	else begin

		ReadData1_out <= ReadData1_in;
		ReadData2_out <=ReadData2_in;
		ReadData3_out <= ReadData3_out;
		immediate_out <= immediate_out; 
	end
end

endmodule
