//
//module route   (input [6:0] readRegisterRA1,readRegisterRB1,readRegisterRC1,readRegisterRT1,
//		input [6:0] readRegisterRA2,readRegisterRB2,readRegisterRC2,readRegisterRT2,
//		input regWriteEnable1, regWriteEnable2, 
//		input [6:0] imm71, imm72,
//		input [9:0] imm101, imm102,
//		input [25:0] imm161, imm162,
//		input [17:0] imm181, imm182,
//		//input useRA1,useRB1,useRC1;
//		//input useRA2,useRB2,useRC2;
//		input [3:0] latency1, latency2,
//		input [2:0] unitID1, unitID2,
//		input isEven1, isEven2,
//
//		output logic [6:0] readRegisterRA_ID1,readRegisterRB_ID1,readRegisterRC_ID1,readRegisterRT_ID1,
//		output logic [6:0] readRegisterRA_ID2,readRegisterRB_ID2,readRegisterRC_ID2,readRegisterRT_ID2,
//		output logic [6:0] immediate7BIT_ID1, immediate7BIT_ID2,
//		output logic [9:0] immediate10BIT_ID1, immediate10BIT_ID2,
//		output logic [25:0] immediate16BIT_ID1, immediate16BIT_ID2,
//		output logic [17:0] immediate18BIT_ID1, immediate18BIT_ID2,
//		//output logic useRA1,useRB1,useRC1;
//		//output logic useRA2,useRB2,useRC2;
//		output logic [3:0] latency_ID1, latency_ID2,
//		output logic [2:0] unitID_ID1, unitID_ID2,
//		input clk);
//
//
//
//
//logic sendFirst,sendSecond; 
//
//always_comb begin
//
//	
//		if (isEven1 & !isEven2) begin 
//			readRegisterRA_ID1=readRegisterRA1; readRegisterRB_ID1=readRegisterRB1; readRegisterRC_ID1=readRegisterRC1; readRegisterRT_ID1=readRegisterRT1;
//			readRegisterRA_ID2=readRegisterRA2; readRegisterRB_ID2=readRegisterRB2; readRegisterRC_ID2=readRegisterRC2; readRegisterRT_ID2=readRegisterRT2;
//			immediate7BIT_ID1=imm71; immediate7BIT_ID2=imm72;
//			immediate10BIT_ID1=imm101; immediate10BIT_ID2=imm102; 
//			immediate16BIT_ID1=imm161; immediate16BIT_ID2=imm162; 
//			immediate18BIT_ID1=imm181;  immediate18BIT_ID2=imm182;   
//			latency_ID1=latency1; latency_ID2=latency2; 
//			unitID_ID1=unitID1; unitID_ID2=unitID2; 			 
//		end
//		else begin
//			readRegisterRA_ID2=readRegisterRA1; readRegisterRB_ID2=readRegisterRB1; readRegisterRC_ID2=readRegisterRC2; readRegisterRT_ID2=readRegisterRT1;
//			readRegisterRA_ID1=readRegisterRA2; readRegisterRB_ID1=readRegisterRB2; readRegisterRC_ID1=readRegisterRC2; readRegisterRT_ID1=readRegisterRT2;
//			immediate7BIT_ID2=imm71; immediate7BIT_ID1=imm72;
//			immediate10BIT_ID2=imm101; immediate10BIT_ID1=imm102; 
//			immediate16BIT_ID2=imm161; immediate16BIT_ID1=imm162; 
//			immediate18BIT_ID2=imm181;  immediate18BIT_ID1=imm182;   
//			latency_ID2=latency1; latency_ID1=latency2; 
//			unitID_ID2=unitID1; unitID_ID1=unitID2; 		
//		end
//	end
//
//	else begin 
//		if (isEven1 & isEven2) begin
//			if (sendFirst & !sendSecond) begin 
//				readRegisterRA_ID1=readRegisterRA1; readRegisterRB_ID1=readRegisterRB1; readRegisterRC_ID1=readRegisterRC1; readRegisterRT_ID1=readRegisterRT1;
//				immediate7BIT_ID1=imm71; 
//				immediate10BIT_ID1=imm101; 
//				immediate16BIT_ID1=imm161;
//				immediate18BIT_ID1=imm181; 
//				latency_ID1=latency1;
//				unitID_ID1=unitID1; 
//			end
//			else if (!sendFirst & sendSecond) begin
//				readRegisterRA_ID1=readRegisterRA2; readRegisterRB_ID1=readRegisterRB2; readRegisterRC_ID1=readRegisterRC2; readRegisterRT_ID1=readRegisterRT2;
//				immediate7BIT_ID1=imm72;
//				immediate10BIT_ID1=imm102; 
//				immediate16BIT_ID1=imm162; 
//				immediate18BIT_ID1=imm182;   
//				latency_ID1=latency2; 
//				unitID_ID1=unitID2; 	
//			end	
//		end
//		else if (isEven1 & isEven2) begin 
//			if (sendFirst & !sendSecond) begin 
//				readRegisterRA_ID2=readRegisterRA1; readRegisterRB_ID2=readRegisterRB1; readRegisterRC_ID2=readRegisterRC1; readRegisterRT_ID2=readRegisterRT1;
//				immediate7BIT_ID2=imm71; 
//				immediate10BIT_ID2=imm101; 
//				immediate16BIT_ID2=imm161;
//				immediate18BIT_ID2=imm181; 
//				latency_ID2=latency1;
//				unitID_ID2=unitID1; 
//			end
//			else if (!sendFirst & sendSecond) begin
//				readRegisterRA_ID2=readRegisterRA2; readRegisterRB_ID2=readRegisterRB2; readRegisterRC_ID2=readRegisterRC2; readRegisterRT_ID2=readRegisterRT2;
//				immediate7BIT_ID2=imm72;
//				immediate10BIT_ID2=imm102; 
//				immediate16BIT_ID2=imm162; 
//				immediate18BIT_ID2=imm182;   
//				latency_ID2=latency2; 
//				unitID_ID2=unitID2; 	
//			end	
//		end
//	end
//end
//
//always_ff @(posedge clk) begin 
//	if (!(isEven1 ^ isEven2))
//		if (sendFirst & !sendSecond) begin
//			sendFirst <= 0; 
//			sendSecond <= 1; 
//		end
//		else begin
//			sendFirst  <= 1;
//			sendSecond <= 0;
//		end
//	else begin
//			sendFirst <= 1; 
//			sendSecond <= 0; 
//	end
//			
//end
//
//
//endmodule 
//
//
//
//
//
