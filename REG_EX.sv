

module REG_EX_STAGE(regWriteEnable_REG1, opcode_REG1, unitID_REG1,
	            regWriteEnable_REG2, opcode_REG2, unitID_REG2,
                    readDataRA_REG1, readDataRB_REG1, readDataRC_REG1, readRegisterRA_REG1, readRegisterRB_REG1, readRegisterRT_REG1,
	            readDataRA_REG2, readDataRB_REG2, readDataRC_REG2, readRegisterRA_REG2, readRegisterRB_REG2, readRegisterRT_REG2,
	            immediate7BIT_REG1, immediate10BIT_REG1, immediate16BIT_REG1, immediate18BIT_REG1,
	            immediate7BIT_REG2, immediate10BIT_REG2, immediate16BIT_REG2, immediate18BIT_REG2,
		    forwardDataRA_REG1, forwardDataRB_REG1, forwardDataRC_REG1,
		    forwardDataRA_REG2, forwardDataRB_REG2, forwardDataRC_REG2,
		    selectForwardRA_REG1, selectForwardRB_REG1, selectForwardRC_REG1,
		    selectForwardRA_REG2, selectForwardRB_REG2, selectForwardRC_REG2,
	            regWriteEnable_EX1, opcode_EX1, unitID_EX1,
	            regWriteEnable_EX2, opcode_EX2, unitID_EX2,
                    readDataRA_EX1, readDataRB_EX1, readDataRC_EX1, readRegisterRA_EX1, readRegisterRB_EX1, readRegisterRT_EX1,
	            readDataRA_EX2, readDataRB_EX2, readDataRC_EX2, readRegisterRA_EX2, readRegisterRB_EX2, readRegisterRT_EX2,
	            immediate7BIT_EX1, immediate10BIT_EX1, immediate16BIT_EX1, immediate18BIT_EX1,
	            immediate7BIT_EX2, immediate10BIT_EX2, immediate16BIT_EX2, immediate18BIT_EX2,
		    forwardDataRA_EX1, forwardDataRB_EX1, forwardDataRC_EX1,
		    forwardDataRA_EX2, forwardDataRB_EX2, forwardDataRC_EX2,
                    selectForwardRA_EX1, selectForwardRB_EX1, selectForwardRC_EX1,
                    selectForwardRA_EX2, selectForwardRB_EX2, selectForwardRC_EX2,
	            clk, stall, flush);
	     
input clk;
input stall, flush;
input regWriteEnable_REG1, regWriteEnable_REG2;
input [6:0] opcode_REG1, opcode_REG2;
input [2:0] unitID_REG1, unitID_REG2;
input [127:0] readDataRA_REG1, readDataRB_REG1, readDataRC_REG1;
input [127:0] readDataRA_REG2, readDataRB_REG2, readDataRC_REG2;
input [6:0] readRegisterRA_REG1, readRegisterRB_REG1, readRegisterRT_REG1;
input [6:0] readRegisterRA_REG2, readRegisterRB_REG2, readRegisterRT_REG2;
input [6:0] immediate7BIT_REG1, immediate7BIT_REG2;
input [9:0] immediate10BIT_REG1, immediate10BIT_REG2;
input [15:0] immediate16BIT_REG1, immediate16BIT_REG2;
input [17:0] immediate18BIT_REG1, immediate18BIT_REG2;
input [127:0] forwardDataRA_REG1, forwardDataRB_REG1, forwardDataRC_REG1; 
input [127:0] forwardDataRA_REG2, forwardDataRB_REG2, forwardDataRC_REG2; 
input         selectForwardRA_REG1, selectForwardRB_REG1, selectForwardRC_REG1;
input         selectForwardRA_REG2, selectForwardRB_REG2, selectForwardRC_REG2;


output logic regWriteEnable_EX1, regWriteEnable_EX2;
output logic [6:0] opcode_EX1, opcode_EX2;
output logic [2:0] unitID_EX1, unitID_EX2;
output logic [127:0] readDataRA_EX1, readDataRB_EX1, readDataRC_EX1;
output logic [127:0] readDataRA_EX2, readDataRB_EX2, readDataRC_EX2;
output logic [6:0] readRegisterRA_EX1, readRegisterRB_EX1, readRegisterRT_EX1;
output logic [6:0] readRegisterRA_EX2, readRegisterRB_EX2, readRegisterRT_EX2;
output logic [6:0]  immediate7BIT_EX1, immediate7BIT_EX2;
output logic [9:0]  immediate10BIT_EX1, immediate10BIT_EX2;
output logic [15:0] immediate16BIT_EX1, immediate16BIT_EX2;
output logic [17:0] immediate18BIT_EX1, immediate18BIT_EX2; 
output logic [127:0] forwardDataRA_EX1, forwardDataRB_EX1, forwardDataRC_EX1; 
output logic [127:0] forwardDataRA_EX2, forwardDataRB_EX2, forwardDataRC_EX2; 
output logic 	     selectForwardRA_EX1, selectForwardRB_EX1, selectForwardRC_EX1;
output logic 	     selectForwardRA_EX2, selectForwardRB_EX2, selectForwardRC_EX2;


always_ff @(posedge clk) begin

	if (flush | stall) begin
		regWriteEnable_EX1<=0; regWriteEnable_EX2<=0;
		opcode_EX1<=0; opcode_EX2<=0;
		
	end
	else if (!stall) begin 
		// Even Pipe
		regWriteEnable_EX1<=regWriteEnable_REG1;
		opcode_EX1<=opcode_REG1;
		unitID_EX1<=unitID_REG1;
		readDataRA_EX1<=readDataRA_REG1; readDataRB_EX1<=readDataRB_REG1; readDataRC_EX1<=readDataRC_REG1;
		readRegisterRA_EX1<=readRegisterRA_REG1; readRegisterRB_EX1<=readRegisterRB_REG1; readRegisterRT_EX1<=readRegisterRT_REG1;
		immediate7BIT_EX1<=immediate7BIT_REG1;
		immediate10BIT_EX1<=immediate10BIT_REG1;
		immediate16BIT_EX1<=immediate16BIT_REG1;
		immediate18BIT_EX1<=immediate18BIT_REG1;
		forwardDataRA_EX1<=forwardDataRA_REG1; forwardDataRB_EX1<=forwardDataRB_REG1; forwardDataRC_EX1<=forwardDataRC_REG1;
		selectForwardRA_EX1<=selectForwardRA_REG1; selectForwardRB_EX1<=selectForwardRB_REG1; selectForwardRC_EX1<=selectForwardRC_REG1;
		//Odd Pipe
		regWriteEnable_EX2<=regWriteEnable_REG2;
		opcode_EX2<=opcode_REG2;
		unitID_EX2<=unitID_REG2;
		readDataRA_EX2<=readDataRA_REG2; readDataRB_EX2<=readDataRB_REG2; readDataRC_EX2<=readDataRC_REG2;
		readRegisterRA_EX2<=readRegisterRA_REG2; readRegisterRB_EX2<=readRegisterRB_REG2; readRegisterRT_EX2<=readRegisterRT_REG2;
		immediate7BIT_EX2<=immediate7BIT_REG2;
		immediate10BIT_EX2<=immediate10BIT_REG2;
		immediate16BIT_EX2<=immediate16BIT_REG2;
		immediate18BIT_EX2<=immediate18BIT_REG2;
		forwardDataRA_EX2<=forwardDataRA_REG2; forwardDataRB_EX2<=forwardDataRB_REG2; forwardDataRC_EX2<=forwardDataRC_REG2;
		selectForwardRA_EX2<=selectForwardRA_REG2; selectForwardRB_EX2<=selectForwardRB_REG2; selectForwardRC_EX2<=selectForwardRC_REG2;
	end
end

endmodule
