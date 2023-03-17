
module RegisterFileMemory(readRegisterRB, readRegisterRA, readRegisterRT, readRegisterRC, writeData, regWriteEnable, clk,reset, readDataRB, readDataRA, readDataRC);

input [6:0] readRegisterRB, readRegisterRA, readRegisterRT, readRegisterRC;
input [127:0] writeData;
input regWriteEnable, clk,reset;

output reg [127:0] readDataRB, readDataRA, readDataRC;

reg [127:0] Memory_Register [0:127];

initial begin
	for (int i = 0; i <128; i++) begin
		if (reset==1) begin
			Memory_Register[i] = 128'h00000000000000000000000000000000; // 24 hexadecimal numbers
		end
	end

end

always @(posedge clk) begin
	if (regWriteEnable == 1) begin
		Memory_Register[readRegisterRT] <= writeData;
	end 
end

always @(negedge clk) begin
	readDataRB <= Memory_Register[readRegisterRB];
        readDataRA <= Memory_Register[readRegisterRA];
        readDataRC <= Memory_Register[readRegisterRC];
end
endmodule


module RegisterFileMemory_TestBench();

logic [6:0] readRegisterRB, readRegisterRA, readRegisterRT, readRegisterRC;
logic [127:0] writeData = 128'd54;
logic regWriteEnable;

logic clk;

logic [127:0] readDataRB, readDataRA, readDataRC;

initial begin
	regWriteEnable= 1;
	readRegisterRB = 7'd0;
	readRegisterRA = 7'd1;
	readRegisterRT = 7'd2;
	readRegisterRC = 7'd3;				
end

always begin  
	#10 clk = 0;
	#10 clk = 1;
end

always begin
	#10 writeData = writeData + 128'd10;
end
always begin	
	#10 readRegisterRT = readRegisterRT+1;
end

RegisterFileMemory RegFileMem(readRegisterRB, readRegisterRA, readRegisterRT, readRegisterRC, writeData, regWriteEnable, clk, readDataRB, readDataRA, readDataRC);

endmodule
