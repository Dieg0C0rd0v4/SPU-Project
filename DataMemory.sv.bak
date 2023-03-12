
module TestMemory(address, writeData,clk, memWrite, memRead, readData);

input [31:0] address; 
input [127:0] writeData;

input clk, memWrite,memRead;
output reg [127:0] readData; 

reg [16:0][8:0] Memory[0:2000]; 



endmodule


module DataMemory(address, writeData,clk, memWrite, memRead, readData);

input [31:0] address; 
input [127:0] writeData;

input clk, memWrite,memRead;
output reg [127:0] readData; 

reg [128:0] Memory[0:2000]; 



logic memorycheck1;
logic memorycheck2;
logic [31:0] memorycheck3;

always @(posedge clk) begin 

	
	if(memWrite == 1) begin

		Memory[address>>4] = writeData; //Quadword addresable address+16 
		
	end 

	if (memRead == 1) begin 
		
		readData <= Memory[address]; //

	end

	else begin
		readData <= 128'h0; 

	end

	memorycheck1 <= address[1:0];
	memorycheck2 <= address[1];
	memorycheck3 <= address>>4;
end


endmodule


module DataMemory_TestBench();

logic [31:0] address=32'h0;
logic [127:0] writeData= 128'd120;
logic clk=0;
logic memWrite,memRead;
logic [127:0] readData; 

assign memWrite=1;
assign memRead=1; 

always begin  
	#10 clk = 1;
	#10 clk = 0;
end

always begin  
	#20 begin 
	address = address + 16; 
	writeData = writeData + 10;
	end
end



DataMemory dm(address, writeData,clk, memWrite, memRead, readData);

endmodule

