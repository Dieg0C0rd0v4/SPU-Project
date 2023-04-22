
module ID_REG_STAGE(regWriteEnable_ID1, source_ID1, opcode_ID1,// control inputs2
                    regWriteEnable_ID2, source_ID2, opcode_ID2,// control inputs1
		    readRegisterRA_ID1, readRegisterRB_ID1, readRegisterRC_ID1, readRegisterRT_ID1, immediate7BIT_ID1, immediate10BIT_ID1, immediate16BIT_ID1, immediate18BIT_ID1, //Datapath inputs1
                    readRegisterRA_ID2, readRegisterRB_ID2, readRegisterRC_ID2, readRegisterRT_ID2, immediate7BIT_ID2, immediate10BIT_ID2, immediate16BIT_ID2, immediate18BIT_ID2,
		    forwardDataRA_ID1, forwardDataRB_ID1, forwardDataRC_ID1,
		    forwardDataRA_ID2, forwardDataRB_ID2, forwardDataRC_ID2,
		    selectForwardRA_ID1, selectForwardRB_ID1, selectForwardRC_ID1,
		    selectForwardRA_ID2, selectForwardRB_ID2, selectForwardRC_ID2,
		    regWriteEnable_REG1, source_REG1, opcode_REG1,
		    regWriteEnable_REG2, source_REG2, opcode_REG2,
		    readRegisterRA_REG1, readRegisterRB_REG1, readRegisterRC_REG1, readRegisterRT_REG1,immediate7BIT_REG1, immediate10BIT_REG1, immediate16BIT_REG1, immediate18BIT_REG1,
         	    readRegisterRA_REG2, readRegisterRB_REG2, readRegisterRC_REG2, readRegisterRT_REG2,immediate7BIT_REG2, immediate10BIT_REG2, immediate16BIT_REG2, immediate18BIT_REG2,
		    forwardDataRA_REG1, forwardDataRB_REG1, forwardDataRC_REG1,
		    forwardDataRA_REG2, forwardDataRB_REG2, forwardDataRC_REG2,
                    selectForwardRA_REG1, selectForwardRB_REG1, selectForwardRC_REG1,
                    selectForwardRA_REG2, selectForwardRB_REG2, selectForwardRC_REG2,
	            clk, reset, stallEven, stallOdd, flushEven, flushOdd);

		

input clk,reset;
input stallEven, stallOdd, flushEven, flushOdd;
input regWriteEnable_ID1, source_ID1;	//Control Signals Input from Instruction decoder
input regWriteEnable_ID2, source_ID2; //Control Signals Input from Instruction decoder
input [10:0] opcode_ID1; //Control Signal for Execution 1
input [10:0] opcode_ID2; //Control Signal for Execution
input [6:0]  readRegisterRA_ID1, readRegisterRB_ID1, readRegisterRC_ID1, readRegisterRT_ID1; // ReadRegisters inputs
input [6:0]  readRegisterRA_ID2, readRegisterRB_ID2, readRegisterRC_ID2, readRegisterRT_ID2; // ReadRegisters inputs
input [6:0]  immediate7BIT_ID1; // Immediates inputs for # bits  
input [6:0]  immediate7BIT_ID2;  
input [9:0]  immediate10BIT_ID1;  
input [9:0]  immediate10BIT_ID2;
input [15:0] immediate16BIT_ID1;
input [15:0] immediate16BIT_ID2;
input [17:0] immediate18BIT_ID1;
input [17:0] immediate18BIT_ID2;
input [127:0] forwardDataRA_ID1, forwardDataRB_ID1, forwardDataRC_ID1; 
input [127:0] forwardDataRA_ID2, forwardDataRB_ID2, forwardDataRC_ID2; 
input         selectForwardRA_ID1, selectForwardRB_ID1, selectForwardRC_ID1;
input         selectForwardRA_ID2, selectForwardRB_ID2, selectForwardRC_ID2;
	

output logic  regWriteEnable_REG1, source_REG1;	//Control Signals Input from Instruction decoder
output logic  regWriteEnable_REG2, source_REG2; //Control Signals Input from Instruction decoder
output logic  [10:0] opcode_REG1; //Control Signal for Execution 1
output logic  [10:0] opcode_REG2; //Control Signal for Execution
output logic  [6:0] readRegisterRA_REG1, readRegisterRB_REG1, readRegisterRC_REG1, readRegisterRT_REG1; // ReadRegisters inputs
output logic  [6:0] readRegisterRA_REG2, readRegisterRB_REG2, readRegisterRC_REG2, readRegisterRT_REG2; // ReadRegisters inputs
output logic  [6:0] immediate7BIT_REG1; // Immediates outputs for # bits  
output logic  [6:0] immediate7BIT_REG2;  
output logic  [9:0] immediate10BIT_REG1;  
output logic  [9:0] immediate10BIT_REG2;
output logic  [15:0] immediate16BIT_REG1;
output logic  [15:0] immediate16BIT_REG2;
output logic  [17:0] immediate18BIT_REG1;
output logic  [17:0] immediate18BIT_REG2;
output logic [127:0] forwardDataRA_REG1, forwardDataRB_REG1, forwardDataRC_REG1; 
output logic [127:0] forwardDataRA_REG2, forwardDataRB_REG2, forwardDataRC_REG2; 
output logic 	     selectForwardRA_REG1, selectForwardRB_REG1, selectForwardRC_REG1;
output logic 	     selectForwardRA_REG2, selectForwardRB_REG2, selectForwardRC_REG2;

always_ff @(posedge clk) begin

	if (reset==1) begin 
		regWriteEnable_REG1<=0; source_REG1<=0; opcode_REG1<=0;
		regWriteEnable_REG2<=0; source_REG2<=0; opcode_REG2<=0;
		readRegisterRA_REG1<=0; readRegisterRB_REG1<=0; readRegisterRC_REG1<=0; readRegisterRT_REG1<=0;
		readRegisterRA_REG2<=0; readRegisterRB_REG2<=0; readRegisterRC_REG2<=0; readRegisterRT_REG2<=0;
		immediate7BIT_REG1<=0; immediate10BIT_REG1<=0; immediate16BIT_REG1<=0; immediate18BIT_REG1<=0;
		immediate7BIT_REG2<=0; immediate10BIT_REG2<=0; immediate16BIT_REG2<=0; immediate18BIT_REG2<=0;
		forwardDataRA_REG1<=0; forwardDataRB_REG1<=0; forwardDataRC_REG1<=0;
		forwardDataRA_REG2<=0; forwardDataRB_REG2<=0; forwardDataRC_REG2<=0;
		selectForwardRA_REG1<=0; selectForwardRB_REG1<=0; selectForwardRC_REG1<=0;
		selectForwardRA_REG2<=0; selectForwardRB_REG2<=0; selectForwardRC_REG2<=0;
	end	
	
	else begin
		if (!stallEven) begin

			regWriteEnable_REG1<=regWriteEnable_ID1; source_REG1<=source_ID1; opcode_REG1<=opcode_ID1;
			readRegisterRA_REG1<=readRegisterRA_ID1; readRegisterRB_REG1<=readRegisterRB_ID1; readRegisterRC_REG1<=readRegisterRC_ID1; readRegisterRT_REG1<=readRegisterRT_ID1;
			immediate7BIT_REG1<=immediate7BIT_ID1; immediate10BIT_REG1<=immediate10BIT_ID1; immediate16BIT_REG1<=immediate16BIT_ID1; immediate18BIT_REG1<=immediate18BIT_ID1;
			forwardDataRA_REG1<=forwardDataRA_ID1; forwardDataRB_REG1<=forwardDataRB_ID1; forwardDataRC_REG1<=forwardDataRC_ID1;
			selectForwardRA_REG1<=selectForwardRA_ID1; selectForwardRB_REG1<=0; selectForwardRC_REG1<=selectForwardRC_ID1;
			
		end

		if (!stallOdd) begin
			
			regWriteEnable_REG2<=regWriteEnable_ID2; source_REG2<=source_ID2; opcode_REG2<=opcode_ID2;
			readRegisterRA_REG2<=readRegisterRA_ID2; readRegisterRB_REG2<=readRegisterRB_ID2; readRegisterRC_REG2<=readRegisterRC_ID2; readRegisterRT_REG2<=readRegisterRT_ID2;
			immediate7BIT_REG2<=immediate7BIT_ID2; immediate10BIT_REG2<=immediate10BIT_ID2; immediate16BIT_REG2<=immediate16BIT_ID2; immediate18BIT_REG2<=immediate18BIT_ID2;
			forwardDataRA_REG2<=forwardDataRA_ID2; forwardDataRB_REG2<=forwardDataRB_ID2; forwardDataRC_REG2<=forwardDataRC_ID2; 
			selectForwardRA_REG2<=selectForwardRA_ID2; selectForwardRB_REG2<=0; selectForwardRC_REG2<=selectForwardRC_ID2;
		end
		if (flushEven) begin
	
			regWriteEnable_REG1<=0; source_REG1<=0; opcode_REG1<=0;
			readRegisterRA_REG1<=0; readRegisterRB_REG1<=0; readRegisterRC_REG1<=0; readRegisterRT_REG1<=0;
			immediate7BIT_REG1<=0; immediate10BIT_REG1<=0; immediate16BIT_REG1<=0; immediate18BIT_REG1<=0;
			forwardDataRA_REG1<=0; forwardDataRB_REG1<=0; forwardDataRC_REG1<=0;
			selectForwardRA_REG1<=0; selectForwardRB_REG1<=0; selectForwardRC_REG1<=0;
		end

		if (flushOdd) begin
	
			regWriteEnable_REG2<=0; source_REG2<=0; opcode_REG2<=0;
			readRegisterRA_REG2<=0; readRegisterRB_REG2<=0; readRegisterRC_REG2<=0; readRegisterRT_REG2<=0;
			immediate7BIT_REG2<=0; immediate10BIT_REG2<=0; immediate16BIT_REG2<=0; immediate18BIT_REG2<=0;
			forwardDataRA_REG2<=0; forwardDataRB_REG2<=0; forwardDataRC_REG2<=0;
			selectForwardRA_REG2<=0; selectForwardRB_REG2<=0; selectForwardRC_REG2<=0;
		end
	end
end

endmodule
