

module JumpPCAdder(PCplusEight,PCJumpAdd,Jump_PC); // Adder + 8 for PC output

parameter bitSize = 11;
input [bitSize-1:0] PCplusEight,PCJumpAdd;

output [bitSize-1:0] Jump_PC;


assign Jump_PC = PCplusEight + PCJumpAdd;    


endmodule
