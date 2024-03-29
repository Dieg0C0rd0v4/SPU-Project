

module Memory(clk,reset,branch,zero,memWrite,memRead,ALU_Result,readDataRC,registerRT_in,
PC_Source,Mem_readData);

input clk, reset; 

input branch; 
input zero; 
input memWrite;
input memRead; 
input [127:0] ALU_Result; 
input [127:0] readDataRC;
input [6:0] registerRT_in;

output PC_Source; 
output [127:0] Mem_readData;



assign PC_Source = branch & zero; 


DataMemory DM(ALU_Result, readDataRC ,clk, memWrite, memRead, Mem_readData);

//module DataMemory(address, writeData,clk, memWrite, memRead, readData);


endmodule

