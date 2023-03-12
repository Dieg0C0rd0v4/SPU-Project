
module program_counter(PC,clk,reset,PCwrite); // Program counter with adder included


 input clk,reset,PCwrite;	
 output logic [31:0] PC =  32'd0;


 always_ff@(posedge clk) begin 
	
	if (reset == 1) begin
	 PC <= 32'd0;
	end
	else begin
         if(PCwrite==1) begin 
	  PC <= PC + 4; 
         end 
        end
 end
endmodule