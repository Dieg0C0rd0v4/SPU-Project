module imm_select( in, out,select);
    input logic signed [31:0]in ;
    output logic signed [127:0]out ;
    input  [1:0]select;//must be unpacked, meaning parameters are before the name declaration "select" or else case statement bug 
    logic signed [31:0]imm7=32'd0; //set initial value to zero 
    logic signed [31:0]imm10=32'd0;
    logic signed [31:0]imm16=32'd0;
    logic signed [31:0] imm18 =32'd0;
    logic signed [31:0]out_temp;



always_comb begin
imm7[17:11]=in[17:11];
imm10[17:8]=in[17:8];
imm16[24:9]=in[24:9];
imm18[24:7]=in[24:7];
case(select)
2'b00:out_temp=imm7; 
2'b01:out_temp=imm10;
2'b01:out_temp=imm16;
2'b11:out_temp=imm18;
endcase


end
sign_ext extend_sign(out_temp,out);
endmodule
    

    //assign out = in;
module sign_ext(in,out);
input  signed [31:0]in;
 output logic signed [127:0]out ;
assign out=in;
endmodule


module sign_ext_tb();
logic signed [31:0] in;
logic signed [127:0] out; 
logic [1:0] select; 
logic clk;
initial clk = 0;
always #10 clk = ~clk;


always begin
@(posedge clk)
 in=32'hAABBCCDD; 
 select=0; 
@(posedge clk) 
select=1; 
@(posedge clk) 
select=2;
@(posedge clk) 
select=3;
 
	  
	 
	  
	
end

imm_select sign_test(in,out,select);

endmodule 
