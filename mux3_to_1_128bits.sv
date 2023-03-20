


module mux2_to_1_128BIT(out,selection0,selection1,selection2,sel); // signal multiplexing between 2 128-Bit words.

output logic [127:0] out;
input [127:0] selection0;
input [127:0] selection1;
input [127:0] selection2;

input sel;

always @(selection0 or selection1 or selection2 or sel) begin
  
 	case (sel) 
	0: out <= selection0;
	1: out <= selection1; 
	2: out <=selection2;
	endcase;
 
end
endmodule
