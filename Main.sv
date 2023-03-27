
module main(clk,reset); 

//Control Signals
input clk,reset;
logic regWriteEnable_ID1, regWriteEnable_REG1, regWriteEnable_EX1, regWriteEnable_ST21, regWriteEnable_ST31, regWriteEnable_ST41, regWriteEnable_ST51, regWriteEnable_ST61, regWriteEnable_ST71, regWriteEnable_WB1;
logic regWriteEnable_ID2, regWriteEnable_REG2, regWriteEnable_EX2, regWriteEnable_ST22, regWriteEnable_ST32, regWriteEnable_ST42, regWriteEnable_ST52, regWriteEnable_ST62, regWriteEnable_ST72, regWriteEnable_WB2;  
  
logic source_ID1,source_REG1,source_EX1;
logic source_ID2,source_REG2,source_EX2;  
      
logic [3:0] control_ID1,control_REG1,control_EX1;   
logic [3:0] control_ID2,control_REG2,control_EX2; 

logic [2:0] unitID_EX1, unitID_ST21, unitID_ST31, unitID_ST41, unitID_ST51, unitID_ST61, unitID_ST71;
logic [2:0] unitID_EX2, unitID_ST22, unitID_ST32, unitID_ST42, unitID_ST52, unitID_ST62, unitID_ST72;

logic [2:0] latency_EX1, latency_ST21, latency_ST31, latency_ST41, latency_ST51, latency_ST61, latency_ST71;
logic [2:0] latency_EX2, latency_ST22, latency_ST32, latency_ST42, latency_ST52, latency_ST62, latency_ST72;
// ReadRegisters (Addresses) 
wire [6:0] readRegisterRA_ID1, readRegisterRA_REG1, readRegisterRA_EX1; 
wire [6:0] readRegisterRA_ID2, readRegisterRA_REG2, readRegisterRA_EX2; 
wire [6:0] readRegisterRB_ID1, readRegisterRB_REG1, readRegisterRB_EX1;
wire [6:0] readRegisterRB_ID2, readRegisterRB_REG2, readRegisterRB_EX2;
wire [6:0] readRegisterRC_ID1, readRegisterRC_REG1, readRegisterRC_EX1;
wire [6:0] readRegisterRC_ID2, readRegisterRC_REG2, readRegisterRC_EX2;
wire [6:0] readRegisterRT_ID1, readRegisterRT_REG1, readRegisterRT_EX1, readRegisterRT_ST21, readRegisterRT_ST31, readRegisterRT_ST41, readRegisterRT_ST51, readRegisterRT_ST61, readRegisterRT_ST71, readRegisterRT_WB1;
wire [6:0] readRegisterRT_ID2, readRegisterRT_REG2, readRegisterRT_EX2, readRegisterRT_ST22, readRegisterRT_ST32, readRegisterRT_ST42, readRegisterRT_ST52, readRegisterRT_ST62, readRegisterRT_ST72, readRegisterRT_WB2;


wire [127:0] readDataRA_REG1, readDataRA_EX1;
wire [127:0] readDataRA_REG2, readDataRA_EX2;
wire [127:0] readDataRB_REG1, readDataRB_EX1;
wire [127:0] readDataRB_REG2, readDataRB_EX2;
wire [127:0] readDataRC_REG1, readDataRC_EX1;
wire [127:0] readDataRC_REG2, readDataRC_EX2, readDataRC_ST22, readDataRC_ST32, readDataRC_ST42, readDataRC_ST52, readDataRC_ST62, readDataRC_ST72;
wire [6:0] immediate7BIT_ID1, immediate7BIT_REG1, immediate7BIT_EX1;
wire [6:0] immediate7BIT_ID2, immediate7BIT_REG2, immediate7BIT_EX2;
wire [9:0] immediate10BIT_ID1, immediate10BIT_EX1;
wire [9:0] immediate10BIT_ID2, immediate10BIT_EX2;
wire [15:0] immediate16BIT_ID1, immediate16BIT_EX1;
wire [15:0] immediate16BIT_ID2, immediate16BIT_EX2;
wire [17:0]immediate18BIT_ID1, immediate18BIT_EX1;
wire [17:0] immediate18BIT_ID2, immediate18BIT_EX2;

ID_REG_STAGE id_reg(regWriteEnable_ID1, source_ID1, control_ID1,// control inputs2
                    regWriteEnable_ID2, source_ID2, control_ID2,// control inputs1
		    readRegisterRA_ID1, readRegisterRB_ID1, readRegisterRC_ID1, readRegisterRT_ID1, immediate7BIT_ID1, immediate10BIT_ID1, immediate16BIT_ID1, immediate18BIT_ID1, //Datapath inputs1
                    readRegisterRA_ID2, readRegisterRB_ID2, readRegisterRC_ID2, readRegisterRT_ID2, immediate7BIT_ID2, immediate10BIT_ID2, immediate16BIT_ID2, immediate18BIT_ID2,
		    regWriteEnable_REG1, source_REG1, control_REG1,
		    regWriteEnable_REG2, source_REG2, control_REG2,
		    readRegisterRA_REG1, readRegisterRB_REG1, readRegisterRC_REG1, readRegisterRT_REG1,immediate7BIT_REG1, immediate10BIT_REG1, immediate16BIT_REG1, immediate18BIT_REG1,
         	    readRegisterRA_REG2, readRegisterRB_REG2, readRegisterRC_REG2, readRegisterRT_REG2,immediate7BIT_REG2, immediate10BIT_REG2, immediate16BIT_REG2, immediate18BIT_REG2,
		    clk,reset);

RegisterFetchStage regist(readRegisterRA_REG1, readRegisterRA_REG2, readRegisterRB_REG1, readRegisterRB_REG2, readRegisterRC_REG1, readRegisterRC_REG2, readRegisterRT_WB1, readRegisterRT_WB2,
			  writeData_WB1, writeData_WB2, regWriteEnable_WB1, regWriteEnable_WB2,
			  readDataRA_REG1, readDataRA_REG2, readDataRB_REG1, readDataRB_REG2, readDataRC_REG1, readDataRC_REG2);


REG_EX_STAGE reg_ex(regWriteEnable_REG1, source_REG1, control_REG1,
	            regWriteEnable_REG2, source_REG2, control_REG2,
                    readDataRA_REG1, readDataRB_REG1, readDataRC_REG1, readRegisterRA_REG1, readRegisterRB_REG1,
	            readDataRA_REG2, readDataRB_REG2, readDataRC_REG2, readRegisterRA_REG2, readRegisterRB_REG2,
	            immediate7BIT_REG1, immediate10BIT_REG1, immediate16BIT_REG1, immediate18BIT_REG1,
	            immediate7BIT_REG2, immediate10BIT_REG2, immediate16BIT_REG2, immediate18BIT_REG2,
	            regWriteEnable_EX1, source_EX1, control_EX1,
	            regWriteEnable_EX2, source_EX2, control_EX2,
                    readDataRA_EX1, readDataRB_EX1, readDataRC_EX1, readRegisterRA_EX1, readRegisterRB_EX1,
	            readDataRA_EX2, readDataRB_EX2, readDataRC_EX2, readRegisterRA_EX2, readRegisterRB_EX2,
	            immediate7BIT_EX1, immediate10BIT_EX1, immediate16BIT_EX1, immediate18BIT_EX1,
	            immediate7BIT_EX2, immediate10BIT_EX2, immediate16BIT_EX2, immediate18BIT_EX2,
	            reset);
//EXecute () 

STAGES EX_STAGE2   ( regWriteEnable_EX1, result_EX1, registerRT_EX1, unitID_EX1, latency_EX1,
		     regWriteEnable_EX2, result_EX2, registerRT_EX2, unitID_EX2, latency_EX2,
		     regWriteEnable_ST21, result_ST21, registerRT_ST21, unitID_ST21, latency_ST21,
		     regWriteEnable_ST22, result_ST22, registerRT_ST22, unitID_ST22, latency_ST22,
		     readDataRC_EX2,readDataRC_ST22, reset, clk) ;

/*module STAGES (regWriteEnable_in1, result_in1, registerRT_in1, unitID_in1, latency_in1,
	         regWriteEnable_in2, result_in2, registerRT_in2, unitID_in2, latency_in2,
	         regWriteEnable_out1, result_out1, registerRT_out1, unitID_out1, unitID_out2,
	         regWriteEnable_out2, result_out2, registerRT_out2, latency_out1, latency_out2,	       
                 readDataRC_in2, readDataRC_out2, clk, reset);

*/

STAGES STAGE2_STAGE3(regWriteEnable_ST21, result_ST21, registerRT_ST21, unitID_ST21, latency_ST21,
		     regWriteEnable_ST22, result_ST22, registerRT_ST22, unitID_ST22, latency_ST22,
		     regWriteEnable_ST31, result_ST31, registerRT_ST31, unitID_ST31, latency_ST31,
		     regWriteEnable_ST32, result_ST32, registerRT_ST32, unitID_ST32, latency_ST32,
		     readDataRC_ST22,readDataRC_ST32, clk,reset);

STAGES STAGE3_STAGE4(regWriteEnable_ST31, result_ST31, registerRT_ST31, unitID_ST31, latency_ST31, 
		     regWriteEnable_ST32, result_ST32, registerRT_ST32, unitID_ST32, latency_ST32, 
		     regWriteEnable_ST41, result_ST41, registerRT_ST41, unitID_ST41, latency_ST41, 
		     regWriteEnable_ST42, result_ST42, registerRT_ST42, unitID_ST42, latency_ST42, 
		     readDataRC_ST32, readDataRC_ST42, clk,reset);

STAGES STAGE4_STAGE5(regWriteEnable_ST41, result_ST41, registerRT_ST41, unitID_ST41, latency_ST41, 
		     regWriteEnable_ST42, result_ST42, registerRT_ST42, unitID_ST42, latency_ST42, 
		     regWriteEnable_ST51, result_ST51, registerRT_ST51, unitID_ST51, latency_ST51, 
		     regWriteEnable_ST52, result_ST52, registerRT_ST52, unitID_ST52, latency_ST52,
		     readDataRC_ST42, readDataRC_ST52, clk,reset);

STAGES STAGE5_STAGE6(regWriteEnable_ST51, result_ST51, registerRT_ST51, unitID_ST51, latency_ST51,  
		     regWriteEnable_ST52, result_ST52, registerRT_ST52, unitID_ST52, latency_ST52,
		     regWriteEnable_ST61, result_ST61, registerRT_ST61, unitID_ST61, latency_ST61,
		     regWriteEnable_ST62, result_ST62, registerRT_ST62, unitID_ST62, latency_ST62,
		     readDataRC_ST52, readDataRC_ST62, clk,reset);

STAGES STAGE6_STAGE7(regWriteEnable_ST61, result_ST61, registerRT_ST61, unitID_ST61, latency_ST61,
		     regWriteEnable_ST62, result_ST62, registerRT_ST62, unitID_ST62, latency_ST62,
		     regWriteEnable_ST71, result_ST71, registerRT_ST71, unitID_ST71, latency_ST71,
		     regWriteEnable_ST72, result_ST72, registerRT_ST72, unitID_ST72, latency_ST72,
		     readDataRC_ST62, readDataRC_ST72, clk,reset);

DataMemory mem(result_ST72, readDataRC_ST72, unitID_ST72, regWriteEnable_ST72, memoryData);

logic [127:0] regOrMem;
always_comb begin 

	if (unitID_ST72 == 7) regOrMem = memoryData;
	else regOrMem = result_ST72;
end 

STAGES STAGE7_WB(regWriteEnable_ST71, result_ST71, registerRT_ST71, unitID_ST71, latency_ST71,
		 regWriteEnable_ST72, regOrMem, registerRT_ST72, unitID_ST72, latency_ST72,
		 regWriteEnable_WB1,  result_WB1,  registerRT_WB1, unitID_WB1, latency_WB1,
		 regWriteEnable_WB2,  result_WB2,  registerRT_WB2, unitID_WB2, latency_WB2,
		 readDataRC_ST72, readDataRC_WB2, clk,reset);

// Write back for even pipe;
assign writeData_WB1 = result_WB1; 
// Write back for odd pipe(has memory);
assign writeData_WB2 = result_WB2; 

endmodule 

