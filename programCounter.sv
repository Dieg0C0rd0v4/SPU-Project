
module ProgramCounter(PCNext,PCout,reset,clk,PCenable); // Program counter with adder included

 parameter bitsize = 11;
 
 input clk,reset,PCenable;	
 input [bitsize-1:0] PCNext;


 output reg [bitsize-1:0] PCout;

always_comb begin
	
        if(PCenable==1) begin 
	  	PCout <= PCNext; 
        end 
 
end
endmodule
