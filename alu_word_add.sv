module ALU(a, b, ALUctr, out,zero_signal);

input [127:0] a; 
input [127:0] b;
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
module ALU_word_op(a,b,ALUctr,half_or_fullword,out_half,out_full,zero_signal);
input logic   [127:0] a; 
input logic  [127:0] b;
input [3:0] ALUctr;
input half_or_fullword;
//there are 4 words in a quadword, a word is 4 bytes
//there are 8 half words in a quadword, a halfword is 2 bytes
//a quadword is 16 bytes 
logic [127:0] half_one; 
logic [127:0] half_two,half_three,half_four,half_five,half_six,half_seven,half_eight; //half_word operations  


logic [127:0] halfb_one,halfb_two,halfb_three,halfb_four,halfb_five,halfb_six,halfb_seven,halfb_eight;


logic [127:0] halfout_one,halfout_two,halfout_three,halfout_four,halfout_five,halfout_six,halfout_seven,halfout_eight;

logic [127:0] full_one,full_two,full_three,full_four;  //full word operations

logic [127:0] fullb_one,fullb_two,fullb_three,fullb_four; 

logic [127:0] fullout_one,fullout_two,fullout_three,fullout_four;
output logic [127:0] out_half,out_full;
//output logic [127:0] out;
logic zero_one,zero_two,zero_three,zero_four,zero_five,zero_six,zero_seven,zero_eight;
logic zerofull_one,zerofull_two,zerofull_three,zerofull_four; 
output logic zero_signal;


assign half_one=a[15:0];
 assign half_two=a[31:16]<<16; //left shift to right spot
 assign half_three=a[47:32]<<32;
 assign half_four=a[63:48]<<48;
 assign half_five=a[79:64]<<64; 
 assign half_six=a[95:80]<<80;
 assign half_seven=a[111:96]<<96; 
 assign half_eight=a[127:112]<<112;

 assign halfb_one=b[15:0];
 assign halfb_two=b[31:16]<<16;
 assign halfb_three=b[47:32]<<32;
 assign halfb_four=b[63:48]<<48;
 assign halfb_five=b[79:64]<<64; 
 assign halfb_six=b[95:80]<<80;
 assign halfb_seven=b[111:96]<<96; 
 assign halfb_eight=b[127:112]<<112;

 assign full_one=a[31:0];
 assign full_two=a[63:32]<<32;
 assign full_three=a[95:64]<<64;
 assign full_four=a[127:96]<<96;

 assign fullb_one=b[31:0];
 assign fullb_two=b[63:32]<<32;
 assign fullb_three=b[95:64]<<64;
 assign fullb_four=b[127:96]<<96;

//error because the module is using half_one and assigning half_one a value at the same time;
ALU half_calc_one(half_one, halfb_one, ALUctr, halfout_one,zero_one);
ALU half_calc_two(half_two, halfb_two, ALUctr, halfout_two,zero_two);
ALU half_calc_three(half_three, halfb_three, ALUctr, halfout_three,zero_three);
ALU half_calc_four(half_four, halfb_four, ALUctr, halfout_four,zero_four);
ALU half_calc_five(half_five, halfb_five, ALUctr, halfout_five,zero_five);
ALU half_calc_six(half_six, halfb_six, ALUctr, halfout_six,zero_six);
ALU half_calc_seven(half_seven, halfb_seven, ALUctr, halfout_seven,zero_seven);
//ALU half_calc_eight(half_eight, halfb_eight, ALUctr, halfout_eight,zero_eight);
//need to OR all the results
ALU half_calc_eight(half_eight,halfb_eight,ALUctr,halfout_eight,zero_eight); 
  
OR_eight calc_half(halfout_one,halfout_two,halfout_three,halfout_four,halfout_five,halfout_six,halfout_seven,halfout_eight,out_half);


ALU full_calc_one(full_one,fullb_one,ALUctr,fullout_one,zerofull_one);
ALU full_calc_two(full_two,fullb_two,ALUctr,fullout_two,zerofull_two);
ALU full_calc_three(full_three,fullb_three,ALUctr,fullout_three,zerofull_three);
ALU full_calc_four(full_four,fullb_four,ALUctr,fullout_four,zerofull_four);

OR_four calc_full(fullout_one,fullout_two,fullout_three,fullout_four,out_full);
//need to OR all the results 




endmodule
module ALU_final(a,b,ALUctr,half_or_full_word,out,zero_signal);
input [127:0] a,b;
input [3:0] ALUctr; 
input half_or_full_word;
output logic [127:0] out;
logic [127:0] out_half,out_full; 
output logic zero_signal; 
 ALU_word_op ALU_result(a,b,ALUctr,half_or_fullword,out_half,out_full,zero_signal);
always_comb begin 
if(half_or_full_word) begin 
out=out_half;
end 
else begin 
out=out_full;
end 

end 




endmodule 
module OR_eight(a,b,c,d,e,f,g,h,result);
input logic [127:0] a,b,c,d,e,f,g,h;
output logic [127:0] result;
always_comb begin
result=a|b|c|d|e|f|g|h; 
end 

endmodule 
module OR_four(a,b,c,d,result);
input logic [127:0] a,b,c,d; 
output logic [127:0] result; 
always_comb begin
result=a|b|c|d;
end 
endmodule 
module ALU_num_test;
logic [127:0] a,b,out_half,out_full;
logic [3:0] ALUctr;
logic half_or_full_word, zero_signal,clk;
initial a=100000; //2^16 goes to around 65,000. Make higher for testing
initial b=5000;
initial ALUctr=0;
ALU_word_op alu_numbertest(a, b,ALUctr,half_or_full_word, out_half,out_full,zero_signal);
endmodule
module ALU_tb();

logic [127:0] a,b,out ; 
logic [3:0] ALUctr;
 
logic half_or_full_word, zero_signal,clk;
ALU_final alu_test(a, b,ALUctr,half_or_full_word, out,zero_signal);
initial clk = 0;
initial half_or_full_word=0;
always #5 clk = ~clk;
initial begin 
 @(posedge clk);
a=100000;
b=100000;
ALUctr=4'b0001;
 @(posedge clk);
a=100000;
b=100000;
ALUctr=4'b0001;
 @(posedge clk);
a=100000;
b=100000;
ALUctr=4'b0001;
 @(posedge clk);
a=100000;
b=100000;
ALUctr=4'b0001;
 @(posedge clk);
a=10000;
b=100000;
ALUctr=4'b0001;
 @(posedge clk);
a=100000;
b=100000;
ALUctr=4'b0001;
 @(posedge clk);
a=100000;
b=100000;
ALUctr=4'b0001;
 @(posedge clk);
a=100000;
b=100000;
ALUctr=4'b0001;

 @(posedge clk);
a=10000;
b=3;
ALUctr=4'b0110;

 @(posedge clk);
a=10000;
b=500;
ALUctr=4'b0111;

 @(posedge clk);
a=1000;
b=500;
ALUctr=4'b1000;

 @(posedge clk);
a=1000;
b=10;
ALUctr=4'b1000;

@(posedge clk);
$finish;
end 
endmodule 











