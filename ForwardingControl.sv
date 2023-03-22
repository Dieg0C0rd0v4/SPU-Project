
module ForwardingControl(RB_ID,RB_EX,RA_ID,RA_EX,RegWrite_MEM,WriteRegAddress_MEM,RegWrite_WB,WriteRegAddress_WB,
				ReadData1Sel_ID,ReadData2Sel_ID,ReadData1Sel_EX,ReadData2Sel_EX);

	input [6:0] RB_ID,RA_ID,RA_EX,RB_EX,WriteRegAddress_MEM,WriteRegAddress_WB;
	input RegWrite_MEM,RegWrite_WB;

	output ReadData1Sel_ID,ReadData2Sel_ID;
	output [1:0] ReadData1Sel_EX,ReadData2Sel_EX;

	reg ReadData1Sel_ID,ReadData2Sel_ID;
	reg [1:0] ReadData1Sel_EX,ReadData2Sel_EX;
	
	
	always @(RB_ID,RA_ID,RA_EX,RB_EX,WriteRegAddress_MEM,WriteRegAddress_WB,RegWrite_MEM,RegWrite_WB) begin
		//////////////////////////////

		if (RB_EX == WriteRegAddress_MEM && RegWrite_MEM == 1) begin

			ReadData1Sel_EX <= 1;
		end 
		else if (RB_EX == WriteRegAddress_WB && RegWrite_WB == 1) begin

			ReadData1Sel_EX <= 2;
		end 
		else begin
			ReadData1Sel_EX <= 0;
		end
	
		if (RA_EX == WriteRegAddress_MEM && RegWrite_MEM == 1) begin

			ReadData2Sel_EX <= 1;

		end 
		else if (RA_EX == WriteRegAddress_WB && RegWrite_WB == 1) begin

			ReadData2Sel_EX <= 2;
		end 
		else begin
			ReadData2Sel_EX <= 0;
		end

		
		if (RB_ID == WriteRegAddress_WB && RegWrite_WB == 1) begin
			ReadData1Sel_ID <= 1;
		end else begin
			ReadData1Sel_ID <= 0;
		end
		
		if (RA_ID == WriteRegAddress_WB && RegWrite_WB == 1) begin
			ReadData2Sel_ID <= 1;
		end else begin
			ReadData2Sel_ID <= 0;
		end
	end
	
	
	
endmodule