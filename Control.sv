module controller(clk,reset);

/////CONTROL SIGNALS /////
input clk,reset;         // from control module
logic regWrite_enable,regWrite_enable_EX,regWrite_enable_MEM,regWrite_enable_ST3,regWrite_enable_ST4,regWrite_enable_ST5,regWrite_enable_ST6,regWrite_enable_ST7,regWrite_enable_WB;    // from control module
logic mem_to_reg,mem_to_reg_EX,mem_to_reg_MEM,mem_to_reg_ST3,mem_to_reg_ST4,mem_to_reg_ST5,mem_to_reg_ST6,mem_to_reg_ST7,mem_to_reg_WB;        // from control module
logic branch,branch_EX,branch_MEM;          // from control module
logic memRead,memRead_EX,memRead_MEM;       // from control module
logic memWrite,memWrite_EX,memWrite_MEM;        // from control module
logic ALU_Source,ALU_Source_EX;      // from control module
logic [3:0] ALU_control,ALU_control_EX;    // from control module
logic DestinationRegister,DestinationRegister_EX; // from control module
logic PC_enable; // from control module
logic [1:0] immediate_select; // from control module
wire zero_EX,zero_MEM; // from datapath 
wire PC_source,PC_Source_MEM; // from datapath 
////////////////////////////

wire [31:0] Instruction1_IF,Instruction2_IF,Instruction1_ID,Instruction2_ID;
wire [10:0] PCadderOut_IF,PC_plusEight_in_ID,PC_plusEight_out_ID,PC_plusEight_out_EX;
wire [10:0] Jump_PC_EX,Jump_PC_MEM;

wire [127:0] writeData,writeData_WB;
wire [6:0] readRegister_RB_ID, readRegister_RB_EX;
wire [6:0] readRegister_RA_ID,readRegister_RA_EX; 
wire [127:0] readDataRB_ID,readDataRB_EX; // Read Data 1 
wire [127:0] readDataRA_ID,readDataRA_EX,ReadDataRA_MEM;
wire [127:0] readDataRC_ID,readDataRC_EX;
wire [6:0] RegisterRT,RegisterRT_EX,RegisterRT_MEM,RegisterRT_ST3,RegisterRT_ST4,RegisterRT_ST5,RegisterRT_ST6,RegisterRT_ST7,RegisterRT_WB;
wire [127:0] immediate_ID,immediate_EX;
wire [6:0] DestinationRegister_RT_ID,DestinationRegister_RT_EX;
wire [6:0] DestinationRegister_RRR_ID,DestinationRegister_RRR_EX;
wire [127:0] ALUResult_EX,ALUResult_MEM,ALUResult_ST3,ALUResult_ST4,ALUResult_ST5,ALUResult_ST6,ALUResult_ST7,ALUResult_WB;
wire [127:0] memReadData_MEM,memReadData_WB;
wire 	ReadData1Sel_ID,ReadData2Sel_ID;
wire [1:0] ReadData1Sel_EX,ReadData2Sel_EX;

assign PC_source = PC_Source_MEM;
assign RegisterRT = RegisterRT_WB;
assign writeData= writeData_WB;

InstructionFetch InstructionFetch_if(reset,clk,PC_source,PC_enable,Jump_PC_MEM,
                    			Instruction1_IF,Instruction2_IF,PCadderOut_IF);

IF_ID if_id(clk,reset, PCadderOut_IF,Instruction1_IF,Instruction2_IF,
            PC_plusEight_in_ID,Instruction1_ID,Instruction2_ID);

InstructionDecoder InstructionDecoder_id(clk, reset, PC_plusEight_in_ID, Instruction1_ID,RegisterRT,writeData,regWrite_enable_WB,immediate_select,
                      PC_plusEight_out_ID,DestinationRegister_RT_ID,DestinationRegister_RRR_ID,readDataRB_ID,readDataRA_ID,readDataRC_ID,readRegister_RB_ID,readRegister_RA_ID);

ID_EX id_ex(clk,reset,mem_to_reg,regWrite_enable,branch,memRead,memWrite,ALU_Source,DestinationRegister,ALU_control,
		readDataRB_ID,readDataRA_ID,readDataRC_ID,immediate_ID,PC_plusEight_out_ID,DestinationRegister_RT_ID,DestinationRegister_RRR_ID,readRegister_RA_ID,readRegister_RB_ID,
		mem_to_reg_EX,regWrite_enable_EX,branch_EX,memRead_EX,memWrite_EX,ALU_Source_EX,DestinationRegister_EX,ALU_control_EX,
		readDataRB_EX,readDataRA_EX,readDataRC_EX,immediate_EX,PC_plusEight_out_EX,DestinationRegister_RT_EX,DestinationRegister_RRR_EX,readRegister_RA_EX,readRegister_RB_EX);

Execute Execute_ex(PC_plusEight_out_EX,immediate_EX,readDataRB_EX,readDataRA_EX,readDataRC_EX,DestinationRegister_RT_EX,DestinationRegister_RRR_EX,DestinationRegister_EX,ALU_control_EX,ALU_Source_EX,
			Jump_PC_EX,zero_EX,ALUResult_EX,RegisterRT_EX);

EX_MEM ex_mem(reset, clk, mem_to_reg_EX, regWrite_enable_EX, branch_EX, memRead_EX, memWrite_EX,
		Jump_PC_EX,zero_EX,ALUResult_EX,readDataRC_EX,RegisterRT_EX,
		mem_to_reg_MEM, regWrite_enable_MEM, branch_MEM, memRead_MEM, memWrite_MEM,
		Jump_PC_MEM,zero_MEM,ALUResult_MEM,ReadDataRC_MEM,RegisterRT_MEM);

Memory Memory_mem(clk,reset,branch_MEM,zero_MEM,memWrite_MEM,memRead_MEM,ALUResult_MEM,ReadDataRC_MEM,RegisterRT_MEM,
			PC_Source_MEM,memReadData_MEM);

STAGES MEM_STAGE3(clk,reset, mem_to_reg_MEM,regWrite_enable_MEM, memReadData_MEM, ALUResult_MEM, registerRT_MEM,
			mem_to_reg_ST3, regWrite_enable_ST3, memReadData_ST3, ALUResult_ST3, RegisterRT_ST3);

STAGES STAGE3_STAGE4(clk,reset, mem_to_reg_ST3,regWrite_enable_ST3, memReadData_ST3, ALUResult_ST3, registerRT_ST3,
			mem_to_reg_ST4, regWrite_enable_ST4, memReadData_ST4, ALUResult_ST4, RegisterRT_ST4);

STAGES STAGE4_STAGE5(clk,reset, mem_to_reg_ST4,regWrite_enable_ST4, memReadData_ST4, ALUResult_ST4, registerRT_ST4,
			mem_to_reg_ST5, regWrite_enable_ST5, memReadData_ST5, ALUResult_ST5, RegisterRT_ST5);

STAGES STAGE5_STAGE6(clk,reset, mem_to_reg_ST5,regWrite_enable_ST5, memReadData_ST5, ALUResult_ST5, registerRT_ST5,
			mem_to_reg_ST6, regWrite_enable_ST6, memReadData_ST6, ALUResult_ST6, RegisterRT_ST6);

STAGES STAGE6_STAGE7(clk,reset, mem_to_reg_ST6,regWrite_enable_ST6, memReadData_ST6, ALUResult_ST6, registerRT_ST6,
			mem_to_reg_ST7, regWrite_enable_ST7, memReadData_ST7, ALUResult_ST7, RegisterRT_ST7);

STAGES STAGE7_WB(clk,reset, mem_to_reg_ST7,regWrite_enable_ST7, memReadData_ST7, ALUResult_ST7, registerRT_ST7,
			mem_to_reg_WB, regWrite_enable_WB, memReadData_WB, ALUResult_WB, RegisterRT_WB);

mux2_to_1_128BIT writeData_WB_SELECT(writeData_WB,ALUResult_WB,memReadData_WB,mem_to_reg_WB); // WB Stage

//*Forward Control//

ForwardingControl(readRegister_RB_ID,readRegister_RB_EX,readRegister_RA_ID,readRegister_RA_EX,regWrite_enable_MEM,RegisterRT_MEM,mem_to_reg_WB,RegisterRT_WB,
				ReadData1Sel_ID,ReadData2Sel_ID,ReadData1Sel_EX,ReadData2Sel_EX);


//ForwardingControl(RB_ID,RB_EX,RA_ID,RA_EX,RegWrite_MEM,WriteRegAddress_MEM,RegWrite_WB,WriteRegAddress_WB,
	//			ReadData1Sel_ID,ReadData2Sel_ID,ReadData1Sel_EX,ReadData2Sel_EX);


wire [10:0] opcode_RR;
wire [3:0] opcode_RRR;
wire [10:0] opcode_RI7;
wire [7:0] opcode_RI10;
wire [8:0] opcode_RI16;
wire [6:0] opcode_RI18;


assign opcode_RR = Instruction1_ID [31:21];
assign opcode_RRR = Instruction1_ID [31:28];
assign opcode_RI7 = Instruction1_ID [31:21];
assign opcode_RI10 = Instruction1_ID [31:24];
assign opcode_RI16 = Instruction1_ID [31:23];
assign opcode_RI18  = Instruction1_ID [31:25];


always_ff @(posedge clk) begin

	if (reset == 1) begin 
		mem_to_reg <=0;
		regWrite_enable <= 0; 
		branch <= 0; 
		memRead <= 0; 
		memWrite<= 1;	
		ALU_Source <=0;
		ALU_control <=0;
		DestinationRegister <=0; 
		PC_enable <=1; 
		immediate_select<=0;

	end

	else if (opcode_RI16 != 0) begin
	
		case (opcode_RI16) 
			129: begin //Immediate Load Word
				mem_to_reg <=0; //Not getting anything from memory
				regWrite_enable <= 1; // Writing to the RT register  
				branch <= 0; // No jumpo 
				memRead <= 0; // No memory read
				memWrite<= 0;// No memory to write
				ALU_Source <=1; // Choose immediate (1)
				ALU_control <=4'b1111; // Foward Value 1111
				DestinationRegister <= 0; // Select RT 
				immediate_select<=2'b10; // select immediate 16 
			end
		endcase
	end
end
endmodule


module Controller_tb();

	reg Clk,Reset;

	controller c(Clk,Reset);
	
	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
		# 500; 
	end
	
	initial begin
		Reset <= 1;
		#20;
		Reset <= 0;
	end


endmodule


