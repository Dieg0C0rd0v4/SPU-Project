module MEM_WB_STAGE (clk,reset, mem_to_reg_in, regWrite_enable_in, readData_in, ALUResult_in, RegisterRT_in,
mem_to_reg_out, regWrite_enable_out, readData_out, ALUResult_out, RegisterRT_out);

input clk,reset;

input mem_to_reg_in; 
input regWrite_enable_in;
input [127:0] readData_in; 
input [127:0] ALUResult_in; 
input [6:0] RegisterRT_in;

output logic mem_to_reg_out; 
output logic regWrite_enable_out;
output logic[127:0] readData_out; 
output logic[127:0] ALUResult_out; 	
output logic[6:0] RegisterRT_out;

always_ff @(posedge clk) begin

	if(reset == 1) begin 

		mem_to_reg_out<=0; 
		regWrite_enable_out<=0;
		readData_out<=0;
		ALUResult_out<=0;
		RegisterRT_out<=0;
	end

	else begin

		mem_to_reg_out<=mem_to_reg_in; 
		regWrite_enable_out<=regWrite_enable_in;
		readData_out<=readData_in;
		ALUResult_out<=ALUResult_in;
		RegisterRT_out<=RegisterRT_in;	
	end

end


endmodule