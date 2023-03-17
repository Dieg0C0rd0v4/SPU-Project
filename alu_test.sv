module ALU(a, b,c, ALUctr, out,zero_signal);

input [127:0] a; 
input [127:0] b; 
input [127:0] c; 
input [3:0] ALUctr;
output logic [127:0] out;
output logic zero_signal;

logic [127:0] twos_comp;
	
always_comb begin
//twos_comp= (~b) + 1; 
	case (ALUctr)
		4'b000 : begin 
			twos_comp= (~b) + 1; 
			out = a + twos_comp; 
			end
		4'b0001 : out = a + b;  //add
		4'b0010 : out = a & b; // AND 
		4'b0011 : out = a | b; //OR  
		4'b0100 : out = a ^ b; //XOR
		4'b0101 : out = a << b; //Shift left
		4'b0110 : out = a >> b; //shift Right
                4'b0111  :  out=a*b; //multiply 
                4'b1000:  if(a==b) begin
                     out=1;
                  end
                 else begin
                 out=0; 
                 end
               

                     
		default : out = out; // no operation
	endcase

	if(out==0) begin 
		zero_signal=1;//zero flag is on, result is 0 
	end 	
	else begin
		zero_signal=0; //the result is not 0 
	end
end
endmodule 



module ALU_tb();

logic [127:0] a,b,out ; 
logic [3:0] ALUctr; 
logic zero_signal,clk;
ALU alu_test(a, b, ALUctr, out,zero_signal);
initial clk = 0;
always #5 clk = ~clk;
initial begin 
 @(posedge clk);
a=10;
b=5;
ALUctr=4'b0000;
 @(posedge clk);
a=10;
b=5;
ALUctr=4'b0001;
 @(posedge clk);
a=10;
b=5;
ALUctr=4'b0010;
 @(posedge clk);
a=10;
b=5;
ALUctr=4'b0011;
 @(posedge clk);
a=10;
b=5;
ALUctr=4'b0100;
 @(posedge clk);
a=10;
b=5;
ALUctr=4'b0101;
 @(posedge clk);
a=10;
b=5;
ALUctr=4'b0110;
 @(posedge clk);
a=10;
b=5;
ALUctr=4'b0110;

 @(posedge clk);
a=10;
b=1;
ALUctr=4'b0110;

 @(posedge clk);
a=10;
b=5;
ALUctr=4'b0111;

 @(posedge clk);
a=10;
b=5;
ALUctr=4'b1000;

 @(posedge clk);
a=10;
b=10;
ALUctr=4'b1000;

@(posedge clk);
$finish;
end 
endmodule 











