

module mux2_to_1_128BIT(out,inputA,inputB,sel); // signal multiplexing between 2 128-Bit words.

output logic [127:0] out;
input [127:0] inputA;
input [127:0] inputB;
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