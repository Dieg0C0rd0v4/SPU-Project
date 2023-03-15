
module instruction_memory(addr,Instruction1,Instruction2); // Memory read for all instruction in a text file

input [31:0] addr;
output [31:0] Instruction1;
output [31:0] Instruction2; 

reg [7:0][7:0] mem[0:249]; 


initial begin
 $readmemh("code.txt",mem);
end

assign Instruction1 = mem[addr>>3][7:4];
assign Instruction2 = mem[addr>>3][3:0]; 

endmodule
