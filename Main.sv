
module main_cpu(clk,reset); 

//Control Signals
input clk,reset; 

//RegWriteEnableEnables: the register to write back to the register memory, if off then the write back values does not matter.
logic regWriteEnable_ID1, regWriteEnable_REG1, regWriteEnable_EX1, regWriteEnable_ST21, regWriteEnable_ST31, regWriteEnable_ST41, regWriteEnable_ST51, regWriteEnable_ST61, regWriteEnable_ST71, regWriteEnable_WB1;
logic regWriteEnable_ID2, regWriteEnable_REG2, regWriteEnable_EX2, regWriteEnable_ST22, regWriteEnable_ST32, regWriteEnable_ST42, regWriteEnable_ST52, regWriteEnable_ST62, regWriteEnable_ST72, regWriteEnable_WB2;  
//Opcodes
logic [10:0] opcode_ID1,opcode_REG1,opcode_EX1;   // Tells the Execute stage what operation to do. 
logic [10:0] opcode_ID2,opcode_REG2,opcode_EX2;   // Tells the Execute stage what operation to do.
 //UnitID
logic [2:0] unitID_EX1, unitID_ST21, unitID_ST31, unitID_ST41, unitID_ST51, unitID_ST61, unitID_ST71, unitID_WB1; // Is the unit in which the the operands and operation is being used. (even)
logic [2:0] unitID_EX2, unitID_ST22, unitID_ST32, unitID_ST42, unitID_ST52, unitID_ST62, unitID_ST72, unitID_WB2; // Is the unit in which the the operands and operation is being used. (odd)
//Latencies
logic [2:0] latency_EX1, latency_ST21, latency_ST31, latency_ST41, latency_ST51, latency_ST61, latency_ST71, latency_WB1; // The delay at which the result becomes available to forward (even)
logic [2:0] latency_EX2, latency_ST22, latency_ST32, latency_ST42, latency_ST52, latency_ST62, latency_ST72, latency_WB2; // The delay at which the result becomes available to forward (odd)
//Inststructions
wire [31:0] instruction1_IF, instruction1_ID;
wire [31:0] instruction2_IF, instruction2_ID;
wire        flush; 
wire        nop, nop1, nop2; //Nop Singals 
wire        enablePC_IF;
// ReadRegisters (Addresses) 
wire [6:0] readRegisterRA_ID1, readRegisterRA_REG1, readRegisterRA_EX1; 
wire [6:0] readRegisterRA_ID2, readRegisterRA_REG2, readRegisterRA_EX2; 
wire [6:0] readRegisterRB_ID1, readRegisterRB_REG1, readRegisterRB_EX1;
wire [6:0] readRegisterRB_ID2, readRegisterRB_REG2, readRegisterRB_EX2;
wire [6:0] readRegisterRC_ID1, readRegisterRC_REG1, readRegisterRC_EX1;
wire [6:0] readRegisterRC_ID2, readRegisterRC_REG2, readRegisterRC_EX2;
wire [6:0] readRegisterRT_ID1, readRegisterRT_REG1, readRegisterRT_EX1, readRegisterRT_ST21, readRegisterRT_ST31, readRegisterRT_ST41, readRegisterRT_ST51, readRegisterRT_ST61, readRegisterRT_ST71, readRegisterRT_WB1;
wire [6:0] readRegisterRT_ID2, readRegisterRT_REG2, readRegisterRT_EX2, readRegisterRT_ST22, readRegisterRT_ST32, readRegisterRT_ST42, readRegisterRT_ST52, readRegisterRT_ST62, readRegisterRT_ST72, readRegisterRT_WB2;

//Read data from the registers (128 bits)
wire [127:0] readDataRA_REG1, readDataRA_EX1;
wire [127:0] readDataRA_REG2, readDataRA_EX2;
wire [127:0] readDataRB_REG1, readDataRB_EX1;
wire [127:0] readDataRB_REG2, readDataRB_EX2;
wire [127:0] readDataRC_REG1, readDataRC_EX1;
wire [127:0] readDataRC_REG2, readDataRC_EX2, readDataRC_ST22, readDataRC_ST32, readDataRC_ST42, readDataRC_ST52, readDataRC_ST62, readDataRC_ST72, readDataRC_WB2;

//Results of the execute unit forwarded in each stage
wire [127:0] writeData_WB1,writeData_WB2;
wire [127:0] result_EX1, result_ST21, result_ST31, result_ST41, result_ST51, result_ST61, result_ST71, result_WB1; //Execute results (even) 
wire [127:0] result_EX2, result_ST22, result_ST32, result_ST42, result_ST52, result_ST62, result_ST72, result_WB2; // Execute results (odd)
wire [127:0] memoryData_ST72; //Data from memory

//Forward data and operands to use for the execute unit. 
wire [127:0] forwardDataRA_ID1, forwardDataRA_REG1, forwardDataRA_EX1;
wire [127:0] forwardDataRA_ID2, forwardDataRA_REG2, forwardDataRA_EX2;
wire [127:0] forwardDataRB_ID1, forwardDataRB_REG1, forwardDataRB_EX1; 
wire [127:0] forwardDataRB_ID2, forwardDataRB_REG2, forwardDataRB_EX2; 
wire [127:0] forwardDataRC_ID1, forwardDataRC_REG1, forwardDataRC_EX1; 
wire [127:0] forwardDataRC_ID2, forwardDataRC_REG2, forwardDataRC_EX2;
wire         selectForwardRA_ID1, selectForwardRA_REG1, selectForwardRA_EX1;
wire         selectForwardRA_ID2, selectForwardRA_REG2, selectForwardRA_EX2;
wire	     selectForwardRB_ID1, selectForwardRB_REG1, selectForwardRB_EX1;// use forward data or register RA/RB values (even)
wire	     selectForwardRB_ID2, selectForwardRB_REG2, selectForwardRB_EX2;// use forward data or register RA/RB values (even)
wire         selectForwardRC_ID1, selectForwardRC_REG1, selectForwardRC_EX1;
wire         selectForwardRC_ID2, selectForwardRC_REG2, selectForwardRC_EX2;
wire [127:0] operandA1, operandB1, operandC1;
wire [127:0] operandA2, operandB2, operandC2; 

//immediates
wire [6:0]   immediate7BIT_ID1, immediate7BIT_REG1, immediate7BIT_EX1;
wire [6:0]   immediate7BIT_ID2, immediate7BIT_REG2, immediate7BIT_EX2;
wire [9:0]   immediate10BIT_ID1, immediate10BIT_REG1, immediate10BIT_EX1;
wire [9:0]   immediate10BIT_ID2, immediate10BIT_REG2, immediate10BIT_EX2;
wire [15:0]  immediate16BIT_ID1, immediate16BIT_REG1, immediate16BIT_EX1;
wire [15:0]  immediate16BIT_ID2, immediate16BIT_REG2, immediate16BIT_EX2;
wire [17:0]  immediate18BIT_ID1, immediate18BIT_REG1, immediate18BIT_EX1;
wire [17:0]  immediate18BIT_ID2, immediate18BIT_REG2, immediate18BIT_EX2;





//Testing purposes, delete after, same in register memory
assign control_ID1= 7'd1;
assign readRegisterRA_ID1 = 1;
assign readRegisterRB_ID1 = 2;
assign readRegisterRT_ID1 = 3;
assign regWriteEnable_ID1 = 1; 

// InstructionFetch

InstructionFetch InsFetch(clk, reset, enablePC_IF, instruction1_IF, instruction2_IF);

IF_ID if_id(instruction1_IF, instruction2_IF,
            instruction1_ID, instruction2_ID,
	    clk, reset, flush);

//Stage InstructionDecoder
ForwardingControl forwControl(readRegisterRA_ID1,  readRegisterRB_ID1, readRegisterRC_ID1,
	   		      readRegisterRA_ID2, readRegisterRB_ID2, readRegisterRC_ID2,
			      readRegisterRT_ST31, readRegisterRT_ST41, readRegisterRT_ST51, readRegisterRT_ST61, readRegisterRT_ST71,
			      readRegisterRT_ST32, readRegisterRT_ST42, readRegisterRT_ST52, readRegisterRT_ST62, readRegisterRT_ST72,
			      regWriteEnable_ST31, regWriteEnable_ST41, regWriteEnable_ST51, regWriteEnable_ST61, regWriteEnable_ST71,
			      regWriteEnable_ST32, regWriteEnable_ST42, regWriteEnable_ST52, regWriteEnable_ST62, regWriteEnable_ST72,
			      latency_ST31, latency_ST41, latency_ST51, latency_ST61, latency_ST71,
			      latency_ST32, latency_ST42, latency_ST52, latency_ST62, latency_ST72,
			      result_ST31, result_ST41, result_ST51, result_ST61, result_ST71,
			      result_ST32, result_ST42, result_ST52, result_ST62, result_ST72,
			      forwardDataRA_ID1, forwardDataRB_ID1, forwardDataRC_ID1,
			      forwardDataRA_ID2, forwardDataRB_ID2, forwardDataRC_ID2, 
			      selectForwardRA_ID1, selectForwardRB_ID1, selectForwardRC_ID1,
			      selectForwardRA_ID2, selectForwardRB_ID2, selectForwardRC_ID2,
			      nop);
assign nop = nop1 || nop2; 
assign enablePC_IF = ~nop;

ID_REG_STAGE id_reg(regWriteEnable_ID1, source_ID1, opcode_ID1,
                    regWriteEnable_ID2, source_ID2, opcode_ID2,
		    readRegisterRA_ID1, readRegisterRB_ID1, readRegisterRC_ID1, readRegisterRT_ID1, immediate7BIT_ID1, immediate10BIT_ID1, immediate16BIT_ID1, immediate18BIT_ID1, //Datapath inputs1
                    readRegisterRA_ID2, readRegisterRB_ID2, readRegisterRC_ID2, readRegisterRT_ID2, immediate7BIT_ID2, immediate10BIT_ID2, immediate16BIT_ID2, immediate18BIT_ID2,
		    regWriteEnable_REG1, source_REG1, opcode_REG1,
		    regWriteEnable_REG2, source_REG2, opcode_REG2,
		    readRegisterRA_REG1, readRegisterRB_REG1, readRegisterRC_REG1, readRegisterRT_REG1, immediate7BIT_REG1, immediate10BIT_REG1, immediate16BIT_REG1, immediate18BIT_REG1,
         	    readRegisterRA_REG2, readRegisterRB_REG2, readRegisterRC_REG2, readRegisterRT_REG2 ,immediate7BIT_REG2, immediate10BIT_REG2, immediate16BIT_REG2, immediate18BIT_REG2,
		    clk,reset,nop);
//Stage Register
RegisterFetchStage regist(readRegisterRA_REG1, readRegisterRA_REG2, readRegisterRB_REG1, readRegisterRB_REG2, readRegisterRC_REG1, readRegisterRC_REG2, readRegisterRT_WB1, readRegisterRT_WB2,
			  writeData_WB1, writeData_WB2, regWriteEnable_WB1, regWriteEnable_WB2,
			  readDataRA_REG1, readDataRA_REG2, readDataRB_REG1, readDataRB_REG2, readDataRC_REG1, readDataRC_REG2,
			  reset);

REG_EX_STAGE reg_ex(regWriteEnable_REG1, source_REG1, opcode_REG1,
	            regWriteEnable_REG2, source_REG2, opcode_REG2,
                    readDataRA_REG1, readDataRB_REG1, readDataRC_REG1, readRegisterRA_REG1, readRegisterRB_REG1, readRegisterRT_REG1,
	            readDataRA_REG2, readDataRB_REG2, readDataRC_REG2, readRegisterRA_REG2, readRegisterRB_REG2, readRegisterRT_REG2,
	            immediate7BIT_REG1, immediate10BIT_REG1, immediate16BIT_REG1, immediate18BIT_REG1,
	            immediate7BIT_REG2, immediate10BIT_REG2, immediate16BIT_REG2, immediate18BIT_REG2,
	            regWriteEnable_EX1, source_EX1, opcode_EX1,
	            regWriteEnable_EX2, source_EX2, opcode_EX2,
                    readDataRA_EX1, readDataRB_EX1, readDataRC_EX1, readRegisterRA_EX1, readRegisterRB_EX1, readRegisterRT_EX1,
	            readDataRA_EX2, readDataRB_EX2, readDataRC_EX2, readRegisterRA_EX2, readRegisterRB_EX2, readRegisterRT_EX2,
	            immediate7BIT_EX1, immediate10BIT_EX1, immediate16BIT_EX1, immediate18BIT_EX1,
	            immediate7BIT_EX2, immediate10BIT_EX2, immediate16BIT_EX2, immediate18BIT_EX2,
	            clk, reset);

//stage Execute (Stage 1)

mux2_to_1_128BIT forwardA1(operandA1,readDataRA_EX1,forwardDataRA_EX1,selectForwardRA_EX1); //Select the value of register RA1 or select the forward value for RA1. 
mux2_to_1_128BIT forwardB1(operandB1,readDataRB_EX1,forwardDataRB_EX1,selectForwardRB_EX1); //Select the value of register RB1 or select the forward value for RB1. 
mux2_to_1_128BIT forwardC1(operandC1,readDataRC_EX1,forwardDataRC_EX1,selectForwardRC_EX1); //Select the value of register RB1 or select the forward value for RB1. 

mux2_to_1_128BIT forwardA2(operandA2,readDataRA_EX2,forwardDataRA_EX2,selectForwardRA_EX2); //Select the value of register RA2 or se*lect the forward value for RA2. 
mux2_to_1_128BIT forwardB2(operandB2,readDataRB_EX2,forwardDataRB_EX2,selectForwardRB_EX2); //Select the value of register RB2 or select the forward value for RB2. 
mux2_to_1_128BIT forwardC2(operandC2,readDataRC_EX2,forwardDataRC_EX2,selectForwardRC_EX2); //Select the value of register RB2 or select the forward value for RB2. 


Execute exEven(operandA1, operandB1, operandC1, opcode_EX1,
	       result_EX1, latency_EX1);
Execute exOdd (operandA2, operandB2, operandC2, opcode_EX2,
	       result_EX2, latency_EX2);

STAGES EX_STAGE2    (regWriteEnable_EX1, result_EX1, readRegisterRT_EX1, unitID_EX1, latency_EX1,
		     regWriteEnable_EX2, result_EX2, readRegisterRT_EX2, unitID_EX2, latency_EX2,
		     regWriteEnable_ST21, result_ST21, readRegisterRT_ST21, unitID_ST21, latency_ST21,
		     regWriteEnable_ST22, result_ST22, readRegisterRT_ST22, unitID_ST22, latency_ST22,
		     readDataRC_EX2, readDataRC_ST22, clk, reset);

//stage 2
STAGES STAGE2_STAGE3(regWriteEnable_ST21, result_ST21, readRegisterRT_ST21, unitID_ST21, latency_ST21,
		     regWriteEnable_ST22, result_ST22, readRegisterRT_ST22, unitID_ST22, latency_ST22,
		     regWriteEnable_ST31, result_ST31, readRegisterRT_ST31, unitID_ST31, latency_ST31,
		     regWriteEnable_ST32, result_ST32, readRegisterRT_ST32, unitID_ST32, latency_ST32,
		     readDataRC_ST22, readDataRC_ST32, clk, reset);
//stage 3
STAGES STAGE3_STAGE4(regWriteEnable_ST31, result_ST31, readRegisterRT_ST31, unitID_ST31, latency_ST31, 
		     regWriteEnable_ST32, result_ST32, readRegisterRT_ST32, unitID_ST32, latency_ST32, 
		     regWriteEnable_ST41, result_ST41, readRegisterRT_ST41, unitID_ST41, latency_ST41, 
		     regWriteEnable_ST42, result_ST42, readRegisterRT_ST42, unitID_ST42, latency_ST42, 
		     readDataRC_ST32, readDataRC_ST42, clk, reset);
//stage 4
STAGES STAGE4_STAGE5(regWriteEnable_ST41, result_ST41, readRegisterRT_ST41, unitID_ST41, latency_ST41, 
		     regWriteEnable_ST42, result_ST42, readRegisterRT_ST42, unitID_ST42, latency_ST42, 
		     regWriteEnable_ST51, result_ST51, readRegisterRT_ST51, unitID_ST51, latency_ST51, 
		     regWriteEnable_ST52, result_ST52, readRegisterRT_ST52, unitID_ST52, latency_ST52,
		     readDataRC_ST42, readDataRC_ST52, clk, reset);
//stage 5
STAGES STAGE5_STAGE6(regWriteEnable_ST51, result_ST51, readRegisterRT_ST51, unitID_ST51, latency_ST51,  
		     regWriteEnable_ST52, result_ST52, readRegisterRT_ST52, unitID_ST52, latency_ST52,
		     regWriteEnable_ST61, result_ST61, readRegisterRT_ST61, unitID_ST61, latency_ST61,
		     regWriteEnable_ST62, result_ST62, readRegisterRT_ST62, unitID_ST62, latency_ST62,
		     readDataRC_ST52, readDataRC_ST62, clk, reset);
//stage 6
STAGES STAGE6_STAGE7(regWriteEnable_ST61, result_ST61, readRegisterRT_ST61, unitID_ST61, latency_ST61,
		     regWriteEnable_ST62, result_ST62, readRegisterRT_ST62, unitID_ST62, latency_ST62,
		     regWriteEnable_ST71, result_ST71, readRegisterRT_ST71, unitID_ST71, latency_ST71,
		     regWriteEnable_ST72, result_ST72, readRegisterRT_ST72, unitID_ST72, latency_ST72,
		     readDataRC_ST62, readDataRC_ST72, clk, reset);
//stage 7 (Memory for Odd pipe)

DataMemory mem(result_ST72, readDataRC_ST72, unitID_ST72, regWriteEnable_ST72, memoryData_ST72);

 
logic [127:0] regOrMem;
always_comb begin 

	if (unitID_ST72 == 7) regOrMem = memoryData_ST72;
	else regOrMem = result_ST72;
end 

STAGES STAGE7_WB(regWriteEnable_ST71, result_ST71, readRegisterRT_ST71, unitID_ST71, latency_ST71,
		 regWriteEnable_ST72, regOrMem   , readRegisterRT_ST72, unitID_ST72, latency_ST72,
		 regWriteEnable_WB1,  result_WB1,  readRegisterRT_WB1, unitID_WB1, latency_WB1,
		 regWriteEnable_WB2,  result_WB2,  readRegisterRT_WB2, unitID_WB2, latency_WB2,
		 readDataRC_ST72, readDataRC_WB2, clk,reset);

// Write back for even pipe;
assign writeData_WB1 = result_WB1; 
// Write back for odd pipe(has memory);
assign writeData_WB2 = result_WB2; 

endmodule 

module main_TestBench();
logic clk, reset;
initial begin
	clk = 0;
	reset=0;
end

always begin

#5 clk = ~clk;

end 

main_cpu m(clk,reset);

endmodule

