module MEM_WB(clk,reset,readData_in,readData_out,ALUResult_in,ALUResult_out,RegisterRT_in,RegisterRT_out);

input clk,reset;

input [128:0] readData_in; 
output logic[128:0] readData_out; 

input [128:0] ALUResult_in; 
output logic[128:0] ALUResult_out; 	

input [6:0] RegisterRT_in;
output logic[6:0] RegisterRT_out;


always_ff @(posedge clk) begin

	if(reset == 1) begin 
		readData_out<=0;
		ALUResult_out<=0;
		RegisterRT_out<=0;
	end

	else begin
		readData_out<=readData_in;
		ALUResult_out<=ALUResult_in;
		RegisterRT_out<=RegisterRT_in;	
	end

end

endmodule
