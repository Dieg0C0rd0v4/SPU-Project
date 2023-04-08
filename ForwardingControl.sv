
module ForwardingControl(readRegisterRA_ID,  readRegisterRB_ID, readRegisterRC_ID,
			 readRegisterRT_ST3, readRegisterRT_ST4, readRegisterRT_ST5, readRegisterRT_ST6, readRegisterRT_ST7,
			 regWriteEnable_ST3, regWriteEnable_ST4, regWriteEnable_ST5, regWriteEnable_ST6, regWriteEnable_ST7,
			 latency_ST3, latency_ST4, latency_ST5, latency_ST6, latency_ST7,
			 result_ST3, result_ST4, result_ST5, result_ST6, result_ST7,
			 forwardDataRA_ID, forwardDataRB_ID, forwardDataRC_ID,
			 selectForwardRA_ID, selectForwardRB_ID, selectForwardRC_ID,
			 nop);

input [6:0] readRegisterRA_ID, readRegisterRB_ID, readRegisterRC_ID; 
input [6:0] readRegisterRT_ST3,readRegisterRT_ST4,readRegisterRT_ST5,readRegisterRT_ST6,readRegisterRT_ST7; 
input regWriteEnable_ST3,regWriteEnable_ST4,regWriteEnable_ST5,regWriteEnable_ST6,regWriteEnable_ST7;
input [2:0] latency_ST3,latency_ST4,latency_ST5,latency_ST6,latency_ST7;
input [127:0] result_ST3,result_ST4,result_ST5,result_ST6,result_ST7;
	
output logic [127:0] forwardDataRA_ID, forwardDataRB_ID, forwardDataRC_ID; 
output logic selectForwardRA_ID, selectForwardRB_ID, selectForwardRC_ID;
output logic nop; 

	
always_comb begin
	
//fowardRA 
	if     (regWriteEnable_ST3 & (readRegisterRA_ID == readRegisterRT_ST3)) begin 
		if (latency_ST3 == 0) begin
			forwardDataRA_ID = result_ST3;
			selectForwardRA_ID = 1; 
			nop = 0;
		end
		else begin
			nop = 1; 
		end
	end
	else if (regWriteEnable_ST4 & (readRegisterRA_ID == readRegisterRT_ST4)) begin 
		if (latency_ST4 == 0) begin
			forwardDataRA_ID = result_ST4;
			selectForwardRA_ID = 1; 
			nop = 0;
		end
		else begin 
			nop = 1;
		end
	end	
	else if (regWriteEnable_ST5 & (readRegisterRA_ID == readRegisterRT_ST5)) begin 
		if (latency_ST5 == 0) begin
			forwardDataRA_ID = result_ST5;
			selectForwardRA_ID = 1; 
			nop = 0;
		end
		else begin
			nop = 1;
		end 
	end
	else if (regWriteEnable_ST6 & (readRegisterRA_ID == readRegisterRT_ST6)) begin 
		if (latency_ST6 == 0) begin
			forwardDataRA_ID = result_ST6;
			selectForwardRA_ID = 1;
			nop = 0; 
		end
		else begin 
			nop = 1;
		end 
	end
	else if (regWriteEnable_ST7 & (readRegisterRA_ID == readRegisterRT_ST7)) begin 
		if (latency_ST7 == 0) begin 
			forwardDataRA_ID = result_ST7;
			selectForwardRA_ID = 1;
			nop = 0;  
		end
		else begin
			nop = 1;
		end
	end
	
	else begin
		forwardDataRA_ID = 0; 
		selectForwardRA_ID= 0; 
		nop = 0; 
	end
	
//forwardRB
	if     (regWriteEnable_ST3 & (readRegisterRB_ID == readRegisterRT_ST3)) begin 
		if (latency_ST3 == 0) begin
			forwardDataRB_ID = result_ST3;
			selectForwardRB_ID = 1; 
			nop = 0;
		end
		else begin
			nop = 1; 
		end
	end
	else if (regWriteEnable_ST4 & (readRegisterRB_ID == readRegisterRT_ST4)) begin 
		if (latency_ST4 == 0) begin
			forwardDataRB_ID = result_ST4;
			selectForwardRB_ID = 1; 
			nop = 0;
		end
		else begin 
			nop = 1;
		end
	end	
	else if (regWriteEnable_ST5 & (readRegisterRB_ID == readRegisterRT_ST5)) begin 
		if (latency_ST5 == 0) begin
			forwardDataRB_ID = result_ST5;
			selectForwardRB_ID = 1; 
			nop = 0;
		end
		else begin
			nop = 1;
		end 
	end
	else if (regWriteEnable_ST6 & (readRegisterRB_ID == readRegisterRT_ST6)) begin 
		if (latency_ST6 == 0) begin
			forwardDataRB_ID = result_ST6;
			selectForwardRB_ID = 1;
			nop = 0; 
		end
		else begin 
			nop = 1;
		end 
	end
	else if (regWriteEnable_ST7 & (readRegisterRA_ID == readRegisterRT_ST7)) begin 
		if (latency_ST7 == 0) begin 
			forwardDataRB_ID = result_ST7;
			selectForwardRB_ID = 1;
			nop = 0;  
		end
		else begin
			nop = 1;
		end
	end
	
	else begin
		forwardDataRA_ID = 0; 
		selectForwardRA_ID= 0; 
		nop = 0; 
	end
	
//forwardRC
	if     (regWriteEnable_ST3 & (readRegisterRC_ID == readRegisterRT_ST3)) begin 
		if (latency_ST3 == 0) begin
			forwardDataRC_ID = result_ST3;
			selectForwardRC_ID = 1; 
			nop = 0;
		end
		else begin
			nop = 1; 
		end
	end
	else if (regWriteEnable_ST4 & (readRegisterRC_ID == readRegisterRT_ST4)) begin 
		if (latency_ST4 == 0) begin
			forwardDataRC_ID = result_ST4;
			selectForwardRC_ID = 1; 
			nop = 0;
		end
		else begin 
			nop = 1;
		end
	end	
	else if (regWriteEnable_ST5 & (readRegisterRC_ID == readRegisterRT_ST5)) begin 
		if (latency_ST5 == 0) begin
			forwardDataRC_ID = result_ST5;
			selectForwardRC_ID = 1; 
			nop = 0;
		end
		else begin
			nop = 1;
		end 
	end
	else if (regWriteEnable_ST6 & (readRegisterRC_ID == readRegisterRT_ST6)) begin 
		if (latency_ST6 == 0) begin
			forwardDataRC_ID = result_ST6;
			selectForwardRC_ID = 1;
			nop = 0; 
		end
		else begin 
			nop = 1;
		end 
	end
	else if (regWriteEnable_ST7 & (readRegisterRC_ID == readRegisterRT_ST7)) begin 
		if (latency_ST7 == 0) begin 
			forwardDataRC_ID = result_ST7;
			selectForwardRC_ID = 1;
			nop = 0;  
		end
		else begin
			nop = 1;
		end
	end
	
	else begin
		forwardDataRC_ID = 0; 
		selectForwardRC_ID = 0; 
		nop = 0; 
	end
	

end
	
	
endmodule
