
module instruction_memory(addr,Instruction); // Memory read for all instruction in a text file

input [31:0] addr;
output [31:0] Instruction; 
reg [31:0] mem[0:1024];

initial begin
 $readmemh("code.txt",mem);
end

assign Instruction = mem[addr>>2]; 

endmodule