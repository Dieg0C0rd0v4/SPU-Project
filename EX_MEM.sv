
module EX_MEM ( memToReg_EX1, regWriteEnable_EX1, memRead_EX1, memWrite_EX1,
		memToReg_EX2, regWriteEnable_EX2, memRead_EX2, memWrite_EX2,
		result_EX1, registerRT_EX1, readDataRC_EX1,
		result_EX2, registerRT_EX2, readDataRC_EX2,
		memToReg_MEM1, regWriteEnable_MEM1, memRead_MEM1, memWrite_MEM1,
		memToReg_MEM2, regWriteEnable_MEM2, memRead_MEM2, memWrite_MEM2,
		result_MEM1, registerRT_MEM1, readDataRC_MEM1,
		result_MEM2, registerRT_MEM2, readDataRC_MEM2,
		reset, clk) ;

input reset, clk;
input memToReg_EX1, regWriteEnable_EX1, memRead_EX1, memWrite_EX1;
input memToReg_EX2, regWriteEnable_EX2, memRead_EX2, memWrite_EX2;
input [127:0] result_EX1,readDataRC_EX1;
input [127:0] result_EX2,readDataRC_EX2;
input [6:0] registerRT_EX1;
input [6:0] registerRT_EX2;

output logic memToReg_MEM1, regWriteEnable_MEM1, memRead_MEM1, memWrite_MEM1;
output logic memToReg_MEM2, regWriteEnable_MEM2, memRead_MEM2, memWrite_MEM2;
output logic [127:0] result_MEM1, readDataRC_MEM1;
output logic [127:0] result_MEM2, readDataRC_MEM2;
output logic [6:0] registerRT_MEM1;
output logic [6:0] registerRT_MEM2;


always_ff @(posedge clk) begin 

	if (reset == 1) begin
		memToReg_MEM1<=0; regWriteEnable_MEM1<=0; memRead_MEM1<=0; memWrite_MEM1<=0;
		memToReg_MEM2<=0; regWriteEnable_MEM2<=0; memRead_MEM2<=0; memWrite_MEM2<=0;
		result_MEM1<=0; readDataRC_MEM1 <=0;
		result_MEM2<=0; readDataRC_MEM2 <=0;
		registerRT_MEM1<=0;
		registerRT_MEM2<=0;
	end
	
	else begin
		memToReg_MEM1<=memToReg_EX1; regWriteEnable_MEM1<=regWriteEnable_EX1; memRead_MEM1<=memRead_EX1; memWrite_MEM1<=memWrite_EX1;
		memToReg_MEM2<=memToReg_EX2; regWriteEnable_MEM2<=regWriteEnable_EX2; memRead_MEM2<=memRead_EX2; memWrite_MEM2<=memWrite_EX2;
		result_MEM1<=result_EX1; readDataRC_MEM1<=readDataRC_EX1; 
		result_MEM2<=result_EX2; readDataRC_MEM2<=readDataRC_EX2;
		registerRT_MEM1<=registerRT_EX1;
		registerRT_MEM2<=registerRT_EX2;
	end
end
endmodule 