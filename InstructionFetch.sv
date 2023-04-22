
module InstructionFetch(clk, reset, enablePC, branchFlag, branchTarget, instruction1, instruction2);


input clk, reset;
input enablePC; //pipe so address goes by +4; If stall then this is set to 0 from enablePC1 = ~(stallEven); 

input branchFlag;
input [10:0] branchTarget; 

output logic  [31:0] instruction1, instruction2;

reg [63:0] mem[0:249]; // Memory of the instructions; 2KB = ? ;
logic [10:0] address; 
logic [10:0] PC; 

assign address=PC>>3; // Renaming PC as address for better understanding

initial begin 
	$readmemh("code.txt", mem); // Read the file of the instructions; 
end 

always_ff @(posedge clk) begin
	if (reset) begin 
		PC <= 0; 
	end
	else begin
		if (branchFlag) begin 
			PC <= branchTarget;
		end 
	
		else if (enablePC) begin  
		  	PC <= PC+8; 
	        end 
	end
end

always_comb begin

	instruction1 = mem[address][63:32];
	instruction2 = mem[address][31:0]; 



end

endmodule
