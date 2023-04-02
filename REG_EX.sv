

module REG_EX_STAGE(regWriteEnable_REG1, source_REG1, control_REG1,
	            regWriteEnable_REG2, source_REG2, control_REG2,
                    readDataRA_REG1, readDataRB_REG1, readDataRC_REG1, readRegisterRA_REG1, readRegisterRB_REG1,
	            readDataRA_REG2,readDataRB_REG2,readDataRC_REG2,readRegisterRA_REG2,readRegisterRB_REG2,
	            immediate7BIT_REG1, immediate10BIT_REG1, immediate16BIT_REG1, immediate18BIT_REG1,
	            immediate7BIT_REG2, immediate10BIT_REG2, immediate16BIT_REG2, immediate18BIT_REG2,
	            regWriteEnable_EX1, source_EX1, control_EX1,
	            regWriteEnable_EX2, source_EX2, control_EX2,
                    readDataRA_EX1, readDataRB_EX1, readDataRC_EX1, readRegisterRA_EX1, readRegisterRB_EX1,
	            readDataRA_EX2, readDataRB_EX2, readDataRC_EX2, readRegisterRA_EX2, readRegisterRB_EX2,
	            immediate7BIT_EX1, immediate10BIT_EX1, immediate16BIT_EX1, immediate18BIT_EX1,
	            immediate7BIT_EX2, immediate10BIT_EX2, immediate16BIT_EX2, immediate18BIT_EX2,
		    
	            clk, reset);
	     
input clk, reset; 
input regWriteEnable_REG1, source_REG1;
input regWriteEnable_REG2, source_REG2;
input [3:0] control_REG1;
input [3:0] control_REG2;
input [127:0] readDataRA_REG1, readDataRB_REG1, readDataRC_REG1;
input [127:0] readDataRA_REG2, readDataRB_REG2, readDataRC_REG2;
input [6:0] readRegisterRA_REG1, readRegisterRB_REG1;
input [6:0] readRegisterRA_REG2, readRegisterRB_REG2;
//
input [6:0] immediate7BIT_REG1, immediate7BIT_REG2;
input [9:0] immediate10BIT_REG1, immediate10BIT_REG2;
input [15:0] immediate16BIT_REG1, immediate16BIT_REG2;
input [17:0] immediate18BIT_REG1, immediate18BIT_REG2;

	      
output logic regWriteEnable_EX1, source_EX1;
output logic regWriteEnable_EX2, source_EX2;
output logic [3:0] control_EX1;
output logic [3:0] control_EX2;
output logic [127:0] readDataRA_EX1, readDataRB_EX1, readDataRC_EX1;
output logic [127:0] readDataRA_EX2, readDataRB_EX2, readDataRC_EX2;
output logic [6:0] readRegisterRA_EX1, readRegisterRB_EX1;
output logic [6:0] readRegisterRA_EX2, readRegisterRB_EX2;
//
output logic [6:0]  immediate7BIT_EX1, immediate7BIT_EX2;
output logic [9:0]  immediate10BIT_EX1, immediate10BIT_EX2;
output logic [15:0] immediate16BIT_EX1, immediate16BIT_EX2;
output logic [17:0] immediate18BIT_EX1, immediate18BIT_EX2; 


always_ff @(posedge clk) begin

	if (reset==1) begin 
	
		regWriteEnable_EX1<=0; source_EX1<=0;
		regWriteEnable_EX2<=0; source_EX2<=0;
		control_EX1<=0; control_EX2<=0;
		readDataRA_EX1<=0; readDataRB_EX1<=0; readDataRC_EX1<=0;
		readDataRA_EX2<=0; readDataRB_EX2<=0; readDataRC_EX2<=0;
		readRegisterRA_EX1<=0; readRegisterRB_EX1<=0;
		readRegisterRA_EX2<=0; readRegisterRB_EX2<=0;
		immediate7BIT_EX1<=0; immediate7BIT_EX2<=0;
		immediate10BIT_EX1<=0; immediate10BIT_EX2<=0;
		immediate16BIT_EX1<=0; immediate16BIT_EX2<=0;
		immediate18BIT_EX1<=0; immediate18BIT_EX2<=0;
	end
	else begin
		regWriteEnable_EX1<=regWriteEnable_REG1; source_EX1<=source_REG1;
		regWriteEnable_EX2<=regWriteEnable_REG2; source_EX2<=source_REG2;
		control_EX1<=control_REG1; control_EX2<=control_REG2;
		readDataRA_EX1<=readDataRA_REG1; readDataRB_EX1<=readDataRB_REG1; readDataRC_EX1<=readDataRC_REG1;
		readDataRA_EX2<=readDataRA_REG2; readDataRB_EX2<=readDataRB_REG2; readDataRC_EX2<=readDataRC_REG2;
		readRegisterRA_EX1<=readRegisterRA_REG1; readRegisterRB_EX1<=readRegisterRB_REG1;
		readRegisterRA_EX2<=readRegisterRA_REG2; readRegisterRB_EX2<=readRegisterRB_REG2;
		immediate7BIT_EX1<=immediate7BIT_REG1; immediate7BIT_EX2<=immediate7BIT_REG2;
		immediate10BIT_EX1<=immediate10BIT_REG1; immediate10BIT_EX2<=immediate10BIT_REG2;
		immediate16BIT_EX1<=immediate16BIT_REG1; immediate16BIT_EX2<=immediate16BIT_REG2;
		immediate18BIT_EX1<=immediate18BIT_REG1; immediate18BIT_EX2<=immediate18BIT_REG2;

		
		
	end
end

endmodule