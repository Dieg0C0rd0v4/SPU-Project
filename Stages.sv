
module STAGES (regWriteEnable_in1, result_in1, readRegisterRT_in1, unitID_in1, latency_in1,
	       regWriteEnable_in2, result_in2, readRegisterRT_in2, unitID_in2, latency_in2,
	       regWriteEnable_out1, result_out1, readRegisterRT_out1, unitID_out1, latency_out1,
	       regWriteEnable_out2, result_out2, readRegisterRT_out2, unitID_out2, latency_out2,	       
               LSA_in2, LSA_out2, readDataRC_in2, readDataRC_out2, clk, reset);



input clk,reset; 

input regWriteEnable_in1;
input regWriteEnable_in2;
input [127:0] result_in1;
input [127:0] result_in2;
input [6:0] readRegisterRT_in1;
input [6:0] readRegisterRT_in2;
input [2:0] unitID_in1, unitID_in2;
input [2:0] latency_in1, latency_in2;
input [127:0] readDataRC_in2; 
input [31:0] LSA_in2;

output logic regWriteEnable_out1;
output logic regWriteEnable_out2;
output logic[127:0] result_out1;
output logic[127:0] result_out2; 	 	
output logic[6:0] readRegisterRT_out1;
output logic[6:0] readRegisterRT_out2;
output logic[2:0] unitID_out1, unitID_out2;
output logic[2:0] latency_out1, latency_out2;
output logic[127:0] readDataRC_out2;
output logic [31:0] LSA_out2; 


always_ff @(posedge clk) begin

	if(reset == 1) begin 

	regWriteEnable_out1<=0;
	regWriteEnable_out2<=0;
	result_out1<=0; 
	result_out2<=0; 	 	
	readRegisterRT_out1<=0;
	readRegisterRT_out2<=0;
	unitID_out1<=0; unitID_out2<=0;
	latency_out2<=0; latency_out1<=0;

	end

	else begin

	regWriteEnable_out1<=regWriteEnable_in1;regWriteEnable_out2<=regWriteEnable_in2;
	result_out1<=result_in1; result_out2<=result_in2; 	 	
	readRegisterRT_out1<=readRegisterRT_in1; readRegisterRT_out2<=readRegisterRT_in2;
	unitID_out1<=unitID_in1; unitID_out2<=unitID_in2;
	readDataRC_out2<=readDataRC_in2; 
	LSA_out2 <= LSA_in2;
	
	if (latency_in1 != 0)
		latency_out1<=(latency_in1 - 1);
	else 
		latency_out1<=latency_in1;
	if (latency_in2 != 0)
		latency_out2<=(latency_in2-1);
	else
		latency_out2<=latency_in2;

	end
end


endmodule