
module controller(clk,reset);

/////CONTROL SIGNALS /////
input clk,reset;         // from control module
logic regWrite_enable,regWrite_enable_EX;    // from control module
logic mem_to_reg,mem_to_reg_EX;        // from control module
logic branch,branch_EX;          // from control module
logic memRead,memRead_EX;       // from control module
logic memWrite,memWrite_EX;        // from control module
logic ALU_Source,ALU_Source_EX;      // from control module
logic [3:0] ALU_control,ALU_control_EX;    // from control module
logic DestinationRegister,DestinationRegister_EX; // from control module
logic PC_enable; // from control module
logic immediate_select; // from control module
wire zero_ID,zero_MEM; // from datapath 
wire PC_source; // from datapath 
////////////////////////////

wire [31:0] Instruction1_IF,Instruction2_IF,Instruction1_ID,Instruction2_ID;
wire [10:0] PCadderOut_IF,PC_plusEight_in_ID,PC_plusEight_out_ID,PC_plusEight_out_EX;
wire [10:0] PC_Jump;

wire [127:0] writeData;
wire [6:0] RegisterRT;
wire [127:0] readDataRB_ID,readDataRB_EX;
wire [127:0] readDataRA_ID,readDataRA_EX;
wire [127:0] readDataRC_ID,readDataRC_EX,
wire [127:0] immediate_ID,immediate_EX;
wire [7:0] DestinationRegister_RT_ID,DestinationRegister_RT_EX;
wire [7:0] DestinationRegister_RRR_ID,DestinationRegister_RRR_EX;

InstructionFetch IF(reset,clk,PC_source,PC_enable,PC_jump,Instruction1_IF,Instruction2_IF,PCadderOut_IF);

IF_ID if_id(clk,reset, PCadderOut_IF,Instruction1_IF,Instruction2_IF,PC_plusEight_in_ID,Instruction1_ID,Instruction2_ID);

InstructionDecoder ID(PC_plusEight_in_ID,Instruction1_ID,registerRT,writeData,regWriteEnable,immediate_select,PC_plusEight_out_ID,DestinationRegister_RT_ID,DestinationRegister_RRR_ID,readDataRB_ID,readDataRA_ID,readDataRC_ID,immediate_ID);

ID_EX id_ex(clk,reset,mem_to_reg,regWriteEnable,branch,memRead,memWrite,ALU_Source,DestinationRegister,ALU_control,
readDataRB_ID,readDataRA_ID,readDataRC_ID,immediate_ID,PC_plusEight_out_ID,DestinationRegister_RT_ID,DestinationRegister_RRR_ID,
mem_to_reg_EX,regWrite_enable_EX,branch_EX,memRead_EX,memWrite_EX,ALU_Source_EX,DestinationRegister_EX,ALU_control_EX,
readDataRB_EX,readDataRA_EX,readDataRC_EX,immediate_EX,PC_plusEight_out_EX,DestinationRegister_RT_out,DestinationRegister_RRR_out);

wire [10:0] opcode_RR;
wire [3:0] opcode_RRR;
wire [10:0] opcode_RI7;
wire [7:0] opcode_RI10;
wire [8:0] opcode_RI16;
wire [6:0] opcode_RI18;


assign  opcode_RR = Instruction1_ID [31:21];
assign opcode_RRR = Instruction1_ID [31:28];
assign  opcode_RI7 = Instruction1_ID [31:21];
assign  opcode_RI10 = Instruction1_ID [31:24];
assign  opcode_RI16 = Instruction1_ID [31:23];
assign opcode_RI18  = Instruction1_ID [31:25];


always_ff @(posedge clk) begin

	if (reset == 1) begin 
		
		mem_to_reg <=0;
		regWrite_enable <= 0; 
		branch <= 0; 
		memRead <= 0; 
		memWrite<= 0;	
		ALU_Source <=0;
		ALU_control <=S 0;
		DestinationRegister <= 0; 
		PC_enable <=0; 
		immediate_select<=0;

	end

	if (Instruction1_ID != 0) begin

		immediate_select<= 0;
	end
end
endmodule
