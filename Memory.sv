

module memory(clk,reset,branch,zero,memWrite,memRead,ALU_Result,readData2,registerRT_in,,PC_Source,Mem_readData,ALUResult_WB,registerRT_out);

input clk, reset; 

input branch; 
input zero; 
input memWrite;
input memRead; 
input [127:0] ALU_Result; 
input [127:0] readData2;
input [6:0] registerRT_in;

output PC_Source; 
output [127:0] Mem_readData;
output [127:0] ALUResult_WB;
output [6:0] registerRT_out;


assign PC_Source = branch & zero; 
assign ALUResult_WB =  ALU_Result;  
assign registerRT_out = registerRT_in; 
DataMemory DM(ALU_Result, readData2 ,clk, memWrite, memRead, Mem_readData);


endmodule

