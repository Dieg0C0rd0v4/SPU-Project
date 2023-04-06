
module RegisterFetchStage(readRegisterRA_REG1, readRegisterRA_REG2, readRegisterRB_REG1, readRegisterRB_REG2, readRegisterRC_REG1, readRegisterRC_REG2, readRegisterRT_WB1, readRegisterRT_WB2,
			  writeData_WB1, writeData_WB2, regWriteEnable_WB1, regWriteEnable_WB2,
			  readDataRA_REG1, readDataRA_REG2, readDataRB_REG1, readDataRB_REG2, readDataRC_REG1, readDataRC_REG2, 
			  reset);

input reset; 
input [6:0] readRegisterRA_REG1, readRegisterRA_REG2, readRegisterRB_REG1, readRegisterRB_REG2, readRegisterRC_REG1, readRegisterRC_REG2, readRegisterRT_WB1, readRegisterRT_WB2; // Address of registers
input [127:0] writeData_WB1, writeData_WB2; // ALU Result to write back
input         regWriteEnable_WB1, regWriteEnable_WB2; // write back to enable register to write value
output reg [127:0] readDataRA_REG1, readDataRA_REG2, readDataRB_REG1, readDataRB_REG2, readDataRC_REG1, readDataRC_REG2; // Values of the registers in 128 bits 

reg [127:0] Memory_Register [0:127]; // 128 registers with 128 bits

// 1 = First instruction, 2 = Second Instruction 
logic [127:0] data; 
always_comb begin 
	//Simulate Load Condition Testing

	if (reset==1) begin
		data = 128'd5000;
		for (int j=0; j<30;j++) begin	
		
			Memory_Register[j] = data;
			data = data +128'd300;
		end
	end
	else begin
    		readDataRA_REG1 = Memory_Register[readRegisterRA_REG1];
		readDataRA_REG2 = Memory_Register[readRegisterRA_REG2];
        	readDataRB_REG1 = Memory_Register[readRegisterRB_REG1];
       	 	readDataRB_REG2 = Memory_Register[readRegisterRB_REG2];
        	readDataRC_REG1 = Memory_Register[readRegisterRC_REG1];
        	readDataRC_REG2 = Memory_Register[readRegisterRC_REG2];
	
		if(regWriteEnable_WB1) Memory_Register[readRegisterRT_WB1] = writeData_WB1; 
		if(regWriteEnable_WB2) Memory_Register[readRegisterRT_WB2] = writeData_WB2;
	end
end

// 


endmodule

