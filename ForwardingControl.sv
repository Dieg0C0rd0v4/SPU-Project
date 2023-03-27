
module ForwardingControl(readRegisterRA_EX, readRegisterRB_EX,
			 readRegisterRT_ST3,readRegisterRT_ST4,readRegisterRT_ST5,readRegisterRT_ST6,readRegisterRT_ST7,
			 regWriteEnable_ST3,regWriteEnable_ST4,regWriteEnable_ST5,regWriteEnable_ST6,regWriteEnable_ST7,
			 latency_ST3,latency_ST4,latency_ST5,latency_ST6,latency_ST7,
			 result_ST3,result_ST4,result_ST5,result_ST6,result_ST7,
			 forwardDataRA_EX, forwardDataRB_EX,
			 selectForwardRA_EX, selectForwardRB_EX);

input [6:0] readRegisterRA_EX, readRegisterRB_EX; 
input [6:0] readRegisterRT_ST3,readRegisterRT_ST4,readRegisterRT_ST5,readRegisterRT_ST6,readRegisterRT_ST7; 
input regWriteEnable_ST3,regWriteEnable_ST4,regWriteEnable_ST5,regWriteEnable_ST6,regWriteEnable_ST7;
input [2:0] latency_ST3,latency_ST4,latency_ST5,latency_ST6,latency_ST7;
input [127:0] result_ST3,result_ST4,result_ST5,result_ST6,result_ST7;
	
output logic [127:0] forwardDataRA_EX, forwardDataRB_EX; 
output logic selectForwardRA_EX;
output logic selectForwardRB_EX;  

	
always_comb begin
	
//fowardRA 
	if ((latency_ST3 == 0) & regWriteEnable_ST3 & (readRegisterRA_EX == readRegisterRT_ST3)) begin 
		forwardDataRA_EX = result_ST3;
		selectForwardRA_EX = 1; 
	end
	else if ((latency_ST4 == 0) & regWriteEnable_ST4 & (readRegisterRA_EX == readRegisterRT_ST4)) begin 
		forwardDataRA_EX = result_ST4;
		selectForwardRA_EX = 1; 
	end	
	else if ((latency_ST5 == 0) & regWriteEnable_ST5 & (readRegisterRA_EX == readRegisterRT_ST5)) begin 
		forwardDataRA_EX = result_ST5;
		selectForwardRA_EX = 1; 
	end
	else if ((latency_ST6 == 0) & regWriteEnable_ST6 & (readRegisterRA_EX == readRegisterRT_ST6)) begin 
		forwardDataRA_EX = result_ST6;
		selectForwardRA_EX = 1; 
	end
	else if ((latency_ST7 == 0) & regWriteEnable_ST7 & (readRegisterRA_EX == readRegisterRT_ST7)) begin 
		forwardDataRA_EX = result_ST7;
		selectForwardRA_EX = 1; 
	end
	
	else begin
		selectForwardRA_EX= 0; 
	end
	//fowardRB
	if ((latency_ST3 == 0) & regWriteEnable_ST3 & (readRegisterRB_EX == readRegisterRT_ST3)) begin 
		forwardDataRB_EX = result_ST3;
		selectForwardRB_EX = 1; 
	end

	else if ((latency_ST4 == 0) & regWriteEnable_ST4 & (readRegisterRB_EX == readRegisterRT_ST4)) begin 
		forwardDataRB_EX = result_ST4;
		selectForwardRB_EX = 1;
	end	
	else if ((latency_ST5 == 0) & regWriteEnable_ST5 & (readRegisterRB_EX == readRegisterRT_ST5)) begin 
		forwardDataRB_EX = result_ST5;
		selectForwardRB_EX = 1;
	end
	else if ((latency_ST6 == 0) & regWriteEnable_ST6 & (readRegisterRB_EX == readRegisterRT_ST6)) begin 
		forwardDataRB_EX = result_ST6;
		selectForwardRB_EX = 1;
	end
	else if ((latency_ST7 == 0) & regWriteEnable_ST7 & (readRegisterRB_EX == readRegisterRT_ST7)) begin 
		forwardDataRB_EX = result_ST7;
		selectForwardRB_EX = 1;
	end	
	else begin 
		selectForwardRB_EX = 0; 
	end
	
end


	
	
endmodule
