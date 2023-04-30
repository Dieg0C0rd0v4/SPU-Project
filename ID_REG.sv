
module ID_REG_STAGE(regWriteEnable_ID1, opcode_ID1, unitID_ID1,// control inputs2
                    regWriteEnable_ID2, opcode_ID2, unitID_ID2,// control inputs1
		    readRegisterRA_ID1, readRegisterRB_ID1, readRegisterRC_ID1, readRegisterRT_ID1, immediate7BIT_ID1, immediate10BIT_ID1, immediate16BIT_ID1, immediate18BIT_ID1, //Datapath inputs1
                    readRegisterRA_ID2, readRegisterRB_ID2, readRegisterRC_ID2, readRegisterRT_ID2, immediate7BIT_ID2, immediate10BIT_ID2, immediate16BIT_ID2, immediate18BIT_ID2,
		    forwardDataRA_ID1, forwardDataRB_ID1, forwardDataRC_ID1,
		    forwardDataRA_ID2, forwardDataRB_ID2, forwardDataRC_ID2,
		    selectForwardRA_ID1, selectForwardRB_ID1, selectForwardRC_ID1,
		    selectForwardRA_ID2, selectForwardRB_ID2, selectForwardRC_ID2,
		    regWriteEnable_REG1, opcode_REG1, unitID_REG1,
		    regWriteEnable_REG2, opcode_REG2, unitID_REG2,
		    readRegisterRA_REG1, readRegisterRB_REG1, readRegisterRC_REG1, readRegisterRT_REG1,immediate7BIT_REG1, immediate10BIT_REG1, immediate16BIT_REG1, immediate18BIT_REG1,
         	    readRegisterRA_REG2, readRegisterRB_REG2, readRegisterRC_REG2, readRegisterRT_REG2,immediate7BIT_REG2, immediate10BIT_REG2, immediate16BIT_REG2, immediate18BIT_REG2,
		    forwardDataRA_REG1, forwardDataRB_REG1, forwardDataRC_REG1,
		    forwardDataRA_REG2, forwardDataRB_REG2, forwardDataRC_REG2,
                    selectForwardRA_REG1, selectForwardRB_REG1, selectForwardRC_REG1,
                    selectForwardRA_REG2, selectForwardRB_REG2, selectForwardRC_REG2,
	            clk, reset, stall, flush, isEven1, isEven2, stallOut);


input clk;
input stall, flush;
input isEven1, isEven2;
input reset; 

input regWriteEnable_ID1, regWriteEnable_ID2; //Control Signals Input from Instruction decoder
input [6:0] opcode_ID1, opcode_ID2; //Control Signal for Execution
input [2:0] unitID_ID1, unitID_ID2; 
input [6:0]  readRegisterRA_ID1, readRegisterRB_ID1, readRegisterRC_ID1, readRegisterRT_ID1; // ReadRegisters inputs
input [6:0]  readRegisterRA_ID2, readRegisterRB_ID2, readRegisterRC_ID2, readRegisterRT_ID2; // ReadRegisters inputs
input [6:0]  immediate7BIT_ID1, immediate7BIT_ID2;  
input [9:0]  immediate10BIT_ID1, immediate10BIT_ID2;
input [15:0] immediate16BIT_ID1, immediate16BIT_ID2;
input [17:0] immediate18BIT_ID1, immediate18BIT_ID2;
input [127:0] forwardDataRA_ID1, forwardDataRB_ID1, forwardDataRC_ID1; 
input [127:0] forwardDataRA_ID2, forwardDataRB_ID2, forwardDataRC_ID2; 
input         selectForwardRA_ID1, selectForwardRB_ID1, selectForwardRC_ID1;
input         selectForwardRA_ID2, selectForwardRB_ID2, selectForwardRC_ID2;
	
logic selectInst = 0; 

output logic stallOut; 
output logic  regWriteEnable_REG1, regWriteEnable_REG2; //Control Signals Input from Instruction decoder
output logic  [6:0] opcode_REG1, opcode_REG2; //Control Signal for Execution
output logic  [2:0] unitID_REG1, unitID_REG2; 
output logic  [6:0] readRegisterRA_REG1, readRegisterRB_REG1, readRegisterRC_REG1, readRegisterRT_REG1; // ReadRegisters inputs
output logic  [6:0] readRegisterRA_REG2, readRegisterRB_REG2, readRegisterRC_REG2, readRegisterRT_REG2; // ReadRegisters inputs
output logic  [6:0] immediate7BIT_REG1, immediate7BIT_REG2;  
output logic  [9:0] immediate10BIT_REG1, immediate10BIT_REG2;
output logic  [15:0] immediate16BIT_REG1, immediate16BIT_REG2;
output logic  [17:0] immediate18BIT_REG1, immediate18BIT_REG2;
output logic [127:0] forwardDataRA_REG1, forwardDataRB_REG1, forwardDataRC_REG1; 
output logic [127:0] forwardDataRA_REG2, forwardDataRB_REG2, forwardDataRC_REG2; 
output logic 	     selectForwardRA_REG1, selectForwardRB_REG1, selectForwardRC_REG1;
output logic 	     selectForwardRA_REG2, selectForwardRB_REG2, selectForwardRC_REG2;


always_ff @(posedge clk) begin

	if (flush) begin
		// flush Even Pipe
		regWriteEnable_REG1<=0; opcode_REG1<=0; unitID_REG1<=0;
		// flush ood pipe 
		regWriteEnable_REG2<=0; opcode_REG2<=0; unitID_REG1<=1;
		
	end

	if (isEven1 ^ isEven2) begin
		if (!stall) begin // If there is not stalling then next values pass through the register 
			if (isEven1 & !isEven2) begin // The first instruction is even and the second instruction is odd
				//Even Pipe
				regWriteEnable_REG1<=regWriteEnable_ID1; opcode_REG1<=opcode_ID1; unitID_REG1<= unitID_ID1;
				readRegisterRA_REG1<=readRegisterRA_ID1; readRegisterRB_REG1<=readRegisterRB_ID1; readRegisterRC_REG1<=readRegisterRC_ID1; readRegisterRT_REG1<=readRegisterRT_ID1;
				immediate7BIT_REG1<=immediate7BIT_ID1; immediate10BIT_REG1<=immediate10BIT_ID1; immediate16BIT_REG1<=immediate16BIT_ID1; immediate18BIT_REG1<=immediate18BIT_ID1;
				forwardDataRA_REG1<=forwardDataRA_ID1; forwardDataRB_REG1<=forwardDataRB_ID1; forwardDataRC_REG1<=forwardDataRC_ID1;
				selectForwardRA_REG1<=selectForwardRA_ID1; selectForwardRB_REG1<=selectForwardRB_ID1; selectForwardRC_REG1<=selectForwardRC_ID1;
				//Odd Pipe
				regWriteEnable_REG2<=regWriteEnable_ID2;  opcode_REG2<=opcode_ID2; unitID_REG2<= unitID_ID2; 
				readRegisterRA_REG2<=readRegisterRA_ID2; readRegisterRB_REG2<=readRegisterRB_ID2; readRegisterRC_REG2<=readRegisterRC_ID2; readRegisterRT_REG2<=readRegisterRT_ID2;
				immediate7BIT_REG2<=immediate7BIT_ID2; immediate10BIT_REG2<=immediate10BIT_ID2; immediate16BIT_REG2<=immediate16BIT_ID2; immediate18BIT_REG2<=immediate18BIT_ID2;
				forwardDataRA_REG2<=forwardDataRA_ID2; forwardDataRB_REG2<=forwardDataRB_ID2; forwardDataRC_REG2<=forwardDataRC_ID2; 
				selectForwardRA_REG2<=selectForwardRA_ID2; selectForwardRB_REG2<=selectForwardRB_ID2; selectForwardRC_REG2<=selectForwardRC_ID2;
			end
			else if (!isEven1 & isEven2) begin
				// Odd Pipe
				regWriteEnable_REG1<=regWriteEnable_ID2; opcode_REG1<=opcode_ID2; unitID_REG1<= unitID_ID2; 
				readRegisterRA_REG1<=readRegisterRA_ID2; readRegisterRB_REG1<=readRegisterRB_ID2; readRegisterRC_REG1<=readRegisterRC_ID2; readRegisterRT_REG1<=readRegisterRT_ID2;
				immediate7BIT_REG1<=immediate7BIT_ID2; immediate10BIT_REG1<=immediate10BIT_ID2; immediate16BIT_REG1<=immediate16BIT_ID2; immediate18BIT_REG1<=immediate18BIT_ID2;
				forwardDataRA_REG1<=forwardDataRA_ID2; forwardDataRB_REG1<=forwardDataRB_ID2; forwardDataRC_REG1<=forwardDataRC_ID2;
				selectForwardRA_REG1<=selectForwardRA_ID2; selectForwardRB_REG2<=selectForwardRB_ID2; selectForwardRC_REG1<=selectForwardRC_ID2;
				// Even Pipe
				regWriteEnable_REG2<=regWriteEnable_ID1;  opcode_REG2<=opcode_ID1; unitID_REG2<= unitID_ID1; 
				readRegisterRA_REG2<=readRegisterRA_ID1; readRegisterRB_REG2<=readRegisterRB_ID1; readRegisterRC_REG2<=readRegisterRC_ID1; readRegisterRT_REG2<=readRegisterRT_ID1;
				immediate7BIT_REG2<=immediate7BIT_ID1; immediate10BIT_REG2<=immediate10BIT_ID1; immediate16BIT_REG2<=immediate16BIT_ID1; immediate18BIT_REG2<=immediate18BIT_ID1;
				forwardDataRA_REG2<=forwardDataRA_ID1; forwardDataRB_REG2<=forwardDataRB_ID1; forwardDataRC_REG2<=forwardDataRC_ID1; 
				selectForwardRA_REG2<=selectForwardRA_ID1; selectForwardRB_REG2<=selectForwardRB_ID1; selectForwardRC_REG2<=selectForwardRC_ID1;
			end
		end
	end
	else if (!(isEven1 ^ isEven2)) begin
		if (!stall) begin 
			if (isEven1 & isEven2) begin
				//Even Pipe 1st instruction if [selectInst = 0]
				if (!selectInst) begin
					regWriteEnable_REG1<=regWriteEnable_ID1; opcode_REG1<=opcode_ID1; unitID_REG1<= unitID_ID1;
					readRegisterRA_REG1<=readRegisterRA_ID1; readRegisterRB_REG1<=readRegisterRB_ID1; readRegisterRC_REG1<=readRegisterRC_ID1; readRegisterRT_REG1<=readRegisterRT_ID1;
					immediate7BIT_REG1<=immediate7BIT_ID1; immediate10BIT_REG1<=immediate10BIT_ID1; immediate16BIT_REG1<=immediate16BIT_ID1; immediate18BIT_REG1<=immediate18BIT_ID1;
					forwardDataRA_REG1<=forwardDataRA_ID1; forwardDataRB_REG1<=forwardDataRB_ID1; forwardDataRC_REG1<=forwardDataRC_ID1;
					selectForwardRA_REG1<=selectForwardRA_ID1; selectForwardRB_REG1<=selectForwardRB_ID1; selectForwardRC_REG1<=selectForwardRC_ID1;
					regWriteEnable_REG2<=0; opcode_REG2<=0; unitID_REG2<= 0;
					selectInst <= 1;
		
				end
				//Even Pipe 2st instruction if [selectInst = 1]
				else if (selectInst) begin 
					regWriteEnable_REG1<=regWriteEnable_ID2; opcode_REG1<=opcode_ID2; unitID_REG1<= unitID_ID2;
					readRegisterRA_REG1<=readRegisterRA_ID2; readRegisterRB_REG1<=readRegisterRB_ID2; readRegisterRC_REG1<=readRegisterRC_ID2; readRegisterRT_REG1<=readRegisterRT_ID2;
					immediate7BIT_REG1<=immediate7BIT_ID2; immediate10BIT_REG1<=immediate10BIT_ID2; immediate16BIT_REG1<=immediate16BIT_ID2; immediate18BIT_REG1<=immediate18BIT_ID2;
					forwardDataRA_REG1<=forwardDataRA_ID2; forwardDataRB_REG1<=forwardDataRB_ID2; forwardDataRC_REG1<=forwardDataRC_ID2;
					selectForwardRA_REG1<=selectForwardRA_ID2; selectForwardRB_REG2<=selectForwardRB_ID2; selectForwardRC_REG1<=selectForwardRC_ID2;
					regWriteEnable_REG2<=0; opcode_REG2<=0; unitID_REG2<= 0;
					selectInst <= 0;
					
				end
			end
			else if (!isEven1 & !isEven2) begin
				//Odd Pipe 1st instruction if [selectInst = 0]
				if (!selectInst) begin
					regWriteEnable_REG2<=regWriteEnable_ID1;  opcode_REG2<=opcode_ID1; unitID_REG2<= unitID_ID1;
					readRegisterRA_REG2<=readRegisterRA_ID1; readRegisterRB_REG2<=readRegisterRB_ID1; readRegisterRC_REG2<=readRegisterRC_ID1; readRegisterRT_REG2<=readRegisterRT_ID1;
					immediate7BIT_REG2<=immediate7BIT_ID1; immediate10BIT_REG2<=immediate10BIT_ID1; immediate16BIT_REG2<=immediate16BIT_ID1; immediate18BIT_REG2<=immediate18BIT_ID1;
					forwardDataRA_REG2<=forwardDataRA_ID1; forwardDataRB_REG2<=forwardDataRB_ID1; forwardDataRC_REG2<=forwardDataRC_ID1; 
					selectForwardRA_REG2<=selectForwardRA_ID1; selectForwardRB_REG2<=selectForwardRB_ID1; selectForwardRC_REG2<=selectForwardRC_ID1;
					regWriteEnable_REG1<=0; opcode_REG1<=0; unitID_REG1<= 0;
					selectInst <= 1;
					
				end
				//Odd Pipe 2st instruction if [selectInst = 1]
				else if (selectInst) begin 
					regWriteEnable_REG2<=regWriteEnable_ID2;  opcode_REG2<=opcode_ID2; unitID_REG2<= unitID_ID2;
					readRegisterRA_REG2<=readRegisterRA_ID2; readRegisterRB_REG2<=readRegisterRB_ID2; readRegisterRC_REG2<=readRegisterRC_ID2; readRegisterRT_REG2<=readRegisterRT_ID2;
					immediate7BIT_REG2<=immediate7BIT_ID2; immediate10BIT_REG2<=immediate10BIT_ID2; immediate16BIT_REG2<=immediate16BIT_ID2; immediate18BIT_REG2<=immediate18BIT_ID2;
					forwardDataRA_REG2<=forwardDataRA_ID2; forwardDataRB_REG2<=forwardDataRB_ID2; forwardDataRC_REG2<=forwardDataRC_ID2; 
					selectForwardRA_REG2<=selectForwardRA_ID2; selectForwardRB_REG2<=selectForwardRB_ID2; selectForwardRC_REG2<=selectForwardRC_ID2;
					regWriteEnable_REG1<=0; opcode_REG1<=0; unitID_REG1<= 0;
					selectInst <= 0;
				end
			end
		end
	end
end

always_comb begin
	if (reset) begin
		stallOut=0;
	end
	else if ( !(isEven1 ^ isEven2) ) begin 
		if(!selectInst) begin
			stallOut = 1;
		end
		else begin
			stallOut = 0; 
		end
	end
	
end

endmodule


//scrapped 
/*
	if (reset) begin 
		regWriteEnable_REG1<=0; opcode_REG1<=0;
		regWriteEnable_REG2<=0; opcode_REG2<=0;
		readRegisterRA_REG1<=0; readRegisterRB_REG1<=0; readRegisterRC_REG1<=0; readRegisterRT_REG1<=0;
		readRegisterRA_REG2<=0; readRegisterRB_REG2<=0; readRegisterRC_REG2<=0; readRegisterRT_REG2<=0;
		immediate7BIT_REG1<=0; immediate10BIT_REG1<=0; immediate16BIT_REG1<=0; immediate18BIT_REG1<=0;
		immediate7BIT_REG2<=0; immediate10BIT_REG2<=0; immediate16BIT_REG2<=0; immediate18BIT_REG2<=0;
		forwardDataRA_REG1<=0; forwardDataRB_REG1<=0; forwardDataRC_REG1<=0;
		forwardDataRA_REG2<=0; forwardDataRB_REG2<=0; forwardDataRC_REG2<=0;
		selectForwardRA_REG1<=0; selectForwardRB_REG1<=0; selectForwardRC_REG1<=0;
		selectForwardRA_REG2<=0; selectForwardRB_REG2<=0; selectForwardRC_REG2<=0;
	end


	
*/