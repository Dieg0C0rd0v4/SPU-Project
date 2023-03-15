
module ProgramCounter(PCNext,PCout,reset,clk,PCenable); // Program counter with adder included

 parameter bitsize = 11;
 
 input clk,reset,PCenable;	

 input [bitsize-1:0] PCNext;
 output reg [bitsize-1:0] PCout;


 always @(posedge clk) begin 
	
	if (reset == 1) begin
	 	PCout <= 0;
	end
	else begin
         	if(PCenable==1) begin 
	  		PCout <= PCNext; 
         	end 
        end
end
endmodule
