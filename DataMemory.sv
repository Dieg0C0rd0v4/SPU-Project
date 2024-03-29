

module DataMemory(address, writeData, unitID, regWriteEnable, readData);


input [31:0] address; // result ( LSA )
input [127:0] writeData; // readregisterRC
input [2:0] unitID; //unit id of store and load is 7
input regWriteEnable;// regWriteEnable_ST72
output reg [127:0] readData; // output of memory; 

reg [127:0] Memory[0:2000]; 

always_comb begin
	if(unitID == 7 & regWriteEnable == 0) begin // store from rt to memory
		Memory[address>>4] <= writeData;  	
	end 

	if (unitID == 7 & regWriteEnable == 1) begin // load from memory to rc
		readData <= Memory[address>>4];
	end
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



//DataMemory dm(address, writeData,clk, memWrite, memRead, readData);

endmodule
