module InstructionFetch(clk, reset, enablePC, instruction1, instruction2,branch_PC,branch_flag);


input clk,reset,enablePC,branch_flag;
input [31:0] branch_PC;

output logic  [31:0] instruction1, instruction2;  


reg [31:0] mem[0:249]; 
logic [31:0] address; 
logic [31:0] PC; 
assign address=PC; 

initial begin 
	$readmemh("code.txt",mem); // Read the file of the instructions; 
end 

always_ff @(posedge clk) begin
	
	if (enablePC == 1) begin 
		if(branch_flag==0) begin 
	  	PC <= PC+8;  
	end 
	else begin 
	PC<=branch_PC; 	
		
	end 
		
	
        end 
	
	else begin
		PC <= PC;
	end
end
 
always_comb begin
	       
	instruction1 = mem[(address>>2)-1];    //instruction_memory 
	instruction2 = mem[(address>>2)];  //instruction_memory 
	
end 



endmodule