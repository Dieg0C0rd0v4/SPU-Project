
module mux2_to_1_11BIT(out,inputA,inputB,sel); // signal multiplexing between 2 11-Bit words.

output logic [10:0] out;
input [10:0] inputA;
input [10:0] inputB;
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