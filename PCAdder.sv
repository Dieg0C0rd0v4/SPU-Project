

module PCAdder(PCout,PCAdderOut); // Adder + 8 for PC output

parameter bitSize = 32;
input [bitSize-1:0] PCout;
output logic [bitSize-1:0] PCAdderOut;

always@(PCout) begin
	PCAdderOut <= PCout + 32'h8;    
end

endmodule
