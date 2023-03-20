
module ID_EX(clk,reset,mem_to_reg_in,regWrite_enable_in,branch_in,memRead_in,memWrite_in,ALUSource_in,DestinationRegister_in,ALUcontrol_in,ReadData1_in,ReadData2_in,ReadData3_in,immediate_in,PC_plusEight_in,DestinationRegister_RT_in,DestinationRegister_RRR_in,ReadRegisterRA_in,ReadRegisterRB_in,
             mem_to_reg_out,regWrite_enable_out,branch_out,memRead_out,memWrite_out,ALUSource_out,DestinationRegister_out,ALUcontrol_out,ReadData1_out,ReadData2_out,ReadData3_out,immediate_out,PC_plusEight_out,DestinationRegister_RT_out,DestinationRegister_RRR_out,ReadRegisterRA_out,ReadRegisterRB_out); //Edit for the control signals 

parameter PC_bitsize=11;
input clk,reset;

//CONTROL SIGNALS_in
input mem_to_reg_in,regWrite_enable_in,branch_in,memRead_in,memWrite_in,ALUSource_in,DestinationRegister_in;
input [3:0] ALUcontrol_in;
///////////////////////////
input [127:0] ReadData1_in,ReadData2_in,ReadData3_in,immediate_in;
input [PC_bitsize-1:0] PC_plusEight_in;
input [6:0] DestinationRegister_RT_in;
input [6:0] DestinationRegister_RRR_in;
input [6:0] ReadRegisterRA_in; 
input [6:0] ReadRegisterRB_in; 


//CONTROL SIGNALS_out
output logic mem_to_reg_out,regWrite_enable_out,branch_out,memRead_out,memWrite_out,ALUSource_out,DestinationRegister_out;
output logic [3:0] ALUcontrol_out;
//////////////////////////
output logic [127:0] ReadData1_out,ReadData2_out,ReadData3_out,immediate_out;
output logic [PC_bitsize-1:0] PC_plusEight_out;
output logic[ 6:0] DestinationRegister_RT_out;
output logic [6:0]DestinationRegister_RRR_out;
output logic [6:0] ReadRegisterRA_out; 
output logic [6:0] ReadRegisterRB_out; 

///////////////////////////

always_ff @(posedge clk) begin

	if (reset==1) begin 
		ReadData1_out <= 0;
		ReadData2_out <=0;
		ReadData3_out <= 0;
		immediate_out <= 0; 
		DestinationRegister_RT_out <= 0;
		DestinationRegister_RRR_out <= 0;
		mem_to_reg_out <=0;
		regWrite_enable_out <=0;
		branch_out <=0;
		memRead_out <=0;
		memWrite_out <=0;
		ALUSource_out <=0;
		DestinationRegister_out <= 0;
		ALUcontrol_out <= 0;

	end
	else begin
		
		mem_to_reg_out <=mem_to_reg_in;
		regWrite_enable_out <=regWrite_enable_in;
		branch_out <=branch_in;
		memRead_out <=memRead_in;
		memWrite_out <=memWrite_in;
		ALUSource_out <=ALUSource_in;
		DestinationRegister_out <= DestinationRegister_in;
		ALUcontrol_out <= ALUcontrol_in;
		ReadData1_out <= ReadData1_in;
		ReadData2_out <=ReadData2_in;
		ReadData3_out <= ReadData3_in;
		immediate_out <= immediate_in;
		DestinationRegister_RT_out <= DestinationRegister_RT_in;
		DestinationRegister_RRR_out <= DestinationRegister_RRR_in;
		ReadRegisterRA_out <= ReadRegisterRA_in; 
		ReadRegisterRB_out <=ReadRegisterRB_in;
	end
end

endmodule
