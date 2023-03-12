


module instruction_memory(addr,Instruction); // Memory read for all instruction in a text file

input [31:0] addr;
output [31:0] Instruction; 
reg [31:0] mem[0:1024];

initial begin
 $readmemh("code.txt",mem);
end

assign Instruction = mem[addr>>2]; 

endmodule


module mux2_to_1_32BIT(out,inputA,inputB,sel); // signal multiplexing between 2 32-Bit words.

output logic [31:0] out;
input [31:0] inputA;
input [31:0] inputB;
input sel;

always @(inputA or inputB or sel) begin
  
  if (sel == 0) begin
	out <= inputA;
  end
  else begin
	out <= inputB; 
  end
end
endmodule


module main_TB();

logic clk = 0;
logic reset= 0;
logic PCwrite = 1;
logic select = 0;

reg [31:0] PC;
reg [31:0] JumpPC = 32'd16;
reg[31:0] PC_next =32'd0;
reg [31:0] instruction;


always begin 
 #5 clk = 1;
 #5 clk = 0;
end

program_counter pc(PC,clk,reset,PCwrite);
mux2_to_1_32BIT Jump_or_Pc4(PC_next,PC,JumpPC,select);
instruction_memory insMem(PC_next,instruction);


endmodule
