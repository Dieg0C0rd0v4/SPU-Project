

module PCAdder(PCout,PCAdderOut); // Adder + 8 for PC output

parameter bitSize = 11;
input [bitSize-1:0] PCout;
output logic [bitSize-1:0] PCAdderOut;

always@(PCout) begin
	PCAdderOut <= PCout + 11'h8;    
end

endmodule
