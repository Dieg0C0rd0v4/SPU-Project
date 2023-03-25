
module STAGES (memToReg_in1, regWriteEnable_in1, memReadData_in1, result_in1, registerRT_in1,
	       memToReg_in2, regWriteEnable_in2, memReadData_in2, result_in2, registerRT_in2,
	       memToReg_out1, regWriteEnable_out1, memReadData_out1, result_out1, registerRT_out1,
	       memToReg_out2, regWriteEnable_out2, memReadData_out2, result_out2, registerRT_out2
	       clk, reset);

input clk,reset; 

input memToReg_in1, regWriteEnable_in1;
input memToReg_in2, regWriteEnable_in2;
input [127:0] memReadData_in1;
input [127:0] memReadData_in2;
input [127:0] result_in1;
input [127:0] result_in2;
input [6:0] registerRT_in1;
input [6:0] registerRT_in2;

output logic memToReg_out1, regWriteEnable_out1;
output logic memToReg_out2, regWriteEnable_out2;
output logic[127:0] memReadData_out1; 
output logic[127:0] memReadData_out2; 
output logic[127:0] result_out1;
output logic[127:0] result_out2; 	 	
output logic[6:0] registerRT_out1;
output logic[6:0] registerRT_out2;

always_ff @(posedge clk) begin

	if(reset == 1) begin 

	memToReg_out1<=0; regWriteEnable_out1<=0;
	memToReg_out2<=0; regWriteEnable_out2<=0;
	memReadData_out1<=0;
	memReadData_out2<=0;
	result_out1<=0; 
	result_out2<=0; 	 	
	registerRT_out1<=0;
	registerRT_out2<=0;

	end

	else begin

	memToReg_out1<=memToReg_in1; regWriteEnable_out1<=regWriteEnable_in1;
	memToReg_out2<=memToReg_in2; regWriteEnable_out2<=regWriteEnable_in2;
	memReadData_out1<=memReadData_in1;
	memReadData_out2<=memReadData_in2;
	result_out1<=result_in1; 
	result_out2<=result_in2; 	 	
	registerRT_out1<=registerRT_in1;
	registerRT_out2<=registerRT_in2;	
	end

end


endmodule