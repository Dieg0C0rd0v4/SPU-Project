
module main(clk,reset); 

//Control Signals
input clk,reset;
logic regWriteEnable_ID, regWriteEnable_REG, regWriteEnable_EX,regWriteEnable_MEM,regWriteEnable_ST3,regWriteEnable_ST4,regWriteEnable_ST5,regWriteEnable_ST6,regWriteEnable_ST7,regWriteEnable_WB;   
logic memToReg_ID,memToReg_REG,memToReg_EX,memToReg_MEM,memToReg_ST3,mem_to_reg_ST4,mem_to_reg_ST5,mem_to_reg_ST6,mem_to_reg_ST7,mem_to_reg_WB;    
logic memRead_ID,memRead_REG,memRead_EX,memRead_MEM;    
logic memWrite_ID,memWrite_REG,memWrite_EX,memWrite_MEM;       
logic source_ID,source_REG,source_EX;     
logic [3:0] control_ID,control_REG,control_EX;    


// ReadRegisters (Addresses) 
wire [6:0] readRegisterRA_ID, readRegisterRA_REG, readRegisterRA_EX; 
wire [6:0] readRegisterRB_ID, readRegisterRB_REG, readRegisterRB_EX;
wire [6:0] readRegisterRC_ID, readRegisterRC_REG, readRegisterRC_EX;
wire [6:0] readRegisterRT_ID, readRegisterRT_EX, readRegisterRT_MEM, readRegisterRT_ST3, readRegisterRT_ST4, readRegisterRT_ST5, readRegisterRT_ST6, readRegisterRT_ST7, readRegisterRT_WB;




ID_REG_STAGE id_reg(memToReg_ID1, regWriteEnable_ID1, memRead_ID1, memWrite_ID1, source_ID1, control_ID1,// control inputs2
                    memToReg_ID2, regWriteEnable_ID2, memRead_ID2, memWrite_ID2, source_ID2, control_ID2,// control inputs1
		    readRegisterRA_ID1, readRegisterRB_ID1, readRegisterRC_ID1, readRegisterRT_ID1, immediate7BIT_ID1, immediate10BIT_ID1, immediate16BIT_ID1, immediate18BIT_ID1, //Datapath inputs1
                    readRegisterRA_ID2, readRegisterRB_ID2, readRegisterRC_ID2, readRegisterRT_ID2, immediate7BIT_ID2, immediate10BIT_ID2, immediate16BIT_ID2, immediate18BIT_ID2,
		    memToReg_REG1, regWriteEnable_REG1, memRead_REG1, memWrite_REG1, source_REG1, control_REG1,
		    memToReg_REG2, regWriteEnable_REG2, memRead_REG2, memWrite_REG2, source_REG2, control_REG2,
		    readRegisterRA_REG1, readRegisterRB_REG1, readRegisterRC_REG1, readRegisterRT_REG1,immediate7BIT_REG1, immediate10BIT_REG1, immediate16BIT_REG1, immediate18BIT_REG1,
         	    readRegisterRA_REG2, readRegisterRB_REG2, readRegisterRC_REG2, readRegisterRT_REG2,immediate7BIT_REG2, immediate10BIT_REG2, immediate16BIT_REG2, immediate18BIT_REG2,
		    clk,reset);

RegisterFetchStage regist(readRegisterRA_REG1, readRegisterRA_REG2, readRegisterRB_REG1, readRegisterRB_REG2, readRegisterRC_REG1, readRegisterRC_REG2, readRegisterRT_WB1, readRegisterRT_WB2,
			  writeData_WB1, writeData_WB2, regWriteEnable_WB1, regWriteEnable_WB2,
			  readDataRA_REG1, readDataRA_REG2, readDataRB_REG1, readDataRB_REG2, readDataRC_REG1, readDataRC_REG2);


REG_EX_STAGE reg_ex(memToReg_REG1, regWriteEnable_REG1, memRead_REG1, memWrite_REG1, source_REG1, control_REG1,
	      memToReg_REG2, regWriteEnable_REG2, memRead_REG2, memWrite_REG2, source_REG2, control_REG2,
              readDataRA_REG1, readDataRB_REG1, readDataRC_REG1, readRegisterRA_REG1, readRegisterRB_REG1,
	      readDataRA_REG2,readDataRB_REG2,readDataRC_REG2,readRegisterRA_REG2,readRegisterRB_REG2,
	      immediate7BIT_REG1, immediate10BIT_REG1, immediate16BIT_REG1, immediate18BIT_REG1,
	      immediate7BIT_REG2, immediate10BIT_REG2, immediate16BIT_REG2, immediate18BIT_REG2,
	      memToReg_EX1, regWriteEnable_EX1, memRead_EX1, memWrite_EX1, source_EX1, control_EX1,
	      memToReg_EX2, regWriteEnable_EX2, memRead_EX2, memWrite_EX2, source_EX2, control_EX2,
              readDataRA_EX1, readDataRB_EX1, readDataRC_EX1, readRegisterRA_EX1, readRegisterRB_EX1,
	      readDataRA_EX2, readDataRB_EX2, readDataRC_EX2, readRegisterRA_EX2, readRegisterRB_EX2,
	      immediate7BIT_EX1, immediate10BIT_EX1, immediate16BIT_EX1, immediate18BIT_EX1,
	      immediate7BIT_EX2, immediate10BIT_EX2, immediate16BIT_EX2, immediate18BIT_EX2,
	      reset);

//EXecute () 

EX_MEM_STAGE ex_mem( memToReg_EX1, regWriteEnable_EX1, memRead_EX1, memWrite_EX1,
		memToReg_EX2, regWriteEnable_EX2, memRead_EX2, memWrite_EX2,
		result_EX1,registerRT_EX1,
		result_EX2,registerRT_EX2,
		memToReg_MEM1, regWriteEnable_MEM1, memRead_MEM1, memWrite_MEM1,
		memToReg_MEM2, regWriteEnable_MEM2, memRead_MEM2, memWrite_MEM2,
		result_MEM1, registerRT_MEM1,
		result_MEM2, registerRT_MEM2,
		reset, clk) ;


STAGES MEM_STAGE3   (memToReg_MEM1, regWriteEnable_MEM1, memReadData_MEM1, result_MEM1, registerRT_MEM1,
		     memToReg_MEM2, regWriteEnable_MEM2, memReadData_MEM2, result_MEM2, registerRT_MEM2,
		     memToReg_ST31, regWriteEnable_ST31, memReadData_ST31, result_ST31, registerRT_ST31,
		     memToReg_ST32, regWriteEnable_ST32, memReadData_ST32, result_ST32, registerRT_ST32,
		     clk,reset);

STAGES STAGE3_STAGE4(memToReg_ST31, regWriteEnable_ST31, memReadData_ST31, result_ST31, registerRT_ST31,
		     memToReg_ST32, regWriteEnable_ST32, memReadData_ST32, result_ST32, registerRT_ST32,
		     memToReg_ST41, regWriteEnable_ST41, memReadData_ST41, result_ST41, registerRT_ST41,
		     memToReg_ST42, regWriteEnable_ST42, memReadData_ST42, result_ST42, registerRT_ST42,
		     clk,reset);

STAGES STAGE4_STAGE5(memToReg_ST41, regWriteEnable_ST41, memReadData_ST41, result_ST41, registerRT_ST41,
		     memToReg_ST42, regWriteEnable_ST42, memReadData_ST42, result_ST42, registerRT_ST42,
		     memToReg_ST51, regWriteEnable_ST51, memReadData_ST51, result_ST51, registerRT_ST51,
		     memToReg_ST52, regWriteEnable_ST52, memReadData_ST52, result_ST52, registerRT_ST52,
		     clk,reset);

STAGES STAGE5_STAGE6(memToReg_ST51, regWriteEnable_ST51, memReadData_ST51, result_ST51, registerRT_ST51,
		     memToReg_ST52, regWriteEnable_ST52, memReadData_ST52, result_ST52, registerRT_ST52,
		     memToReg_ST61, regWriteEnable_ST61, memReadData_ST61, result_ST61, registerRT_ST61,
		     memToReg_ST62, regWriteEnable_ST62, memReadData_ST62, result_ST62, registerRT_ST62,
		     clk,reset);

STAGES STAGE6_STAGE7(memToReg_ST61, regWriteEnable_ST61, memReadData_ST61, result_ST61, registerRT_ST61,
		     memToReg_ST62, regWriteEnable_ST62, memReadData_ST62, result_ST62, registerRT_ST62,
		     memToReg_ST71, regWriteEnable_ST71, memReadData_ST71, result_ST71, registerRT_ST71,
		     memToReg_ST72, regWriteEnable_ST72, memReadData_ST72, result_ST72, registerRT_ST72
		     clk,reset);

STAGES STAGE7_WB    (memToReg_ST71, regWriteEnable_ST71, memReadData_ST71, result_ST71, registerRT_ST71,
		     memToReg_ST72, regWriteEnable_ST72, memReadData_ST72, result_ST72, registerRT_ST72,
		     memToReg_WB1,  regWriteEnable_WB1,  memReadData_WB1,  result_WB1,  registerRT_WB1,
		     memToReg_WB2,  regWriteEnable_WB2,  memReadData_WB2,  result_WB2,  registerRT_WB2,
		     clk,reset);

mux2_to_1_128BIT writeData_WB_SELECT(writeData_WB,ALUResult_WB,memReadData_WB,memToReg_WB); // WB Stage

endmodule

