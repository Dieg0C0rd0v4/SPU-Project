

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