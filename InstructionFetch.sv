
module InstructionFetch(clk,reset,enablePC,instruction1,instruction2);


input clk,reset,enablePC;

output logic  [31:0] instruction1, instruction2;

reg [7:0][7:0] mem[0:249]; 
logic [11:0] address; 
logic PC; 
assign address=PC; 

initial begin 
	$readmemh("code.txt",mem); // Read the file of the instructions; 
end 

always_ff @(posedge clk) begin
	
        if (enablePC == 1) begin 
	  	PC <= PC+8; 
        end 
	
	else
		PC <= PC;
	end
end
 
always_comb begin
	       
	instruction1 = mem[(address>>2)];    //instruction_memory 
	instruction2 = mem[(address>>2)];  //instruction_memory 
	
end 



endmodule
