
module controller(clk,reset);


input clk; 
input reset; 

wire [31:0] InstructionID_1,InstructionID_2;



InstructionFetch(reset,clk,PC_source,PC_enable,PC_jump,instruction1,instruction2,PC_adderOut);
 
always_ff @(posedge clk) begin

	if (reset == 1) begin 

		regWrite_enable <= 0; 
		ALU_Source <=0;
		ALU_OP <= 0;
		DestinationRegister <= 0; 
		branch <= 0;
		memWrite<= 0;
		memRead <= 0; 
		mem_to_reg<=0;
		PC_enable <=0; 
	
		

	end

	if (!Instrucion_ID1 != 0) begin

		
		 
