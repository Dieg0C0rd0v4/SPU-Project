module sign_ext(in_7bits,in_10bits,in_16bits,in_18bits,out,select);

	input [6:0]in_7bits;
	input [9:0]in_10bits;
	input [15:0]in_16bits;
	input [17:0]in_18bits;

	output logic signed [127:0]out;
	input  [1:0]select;

always_comb begin
		case(select)
		2'b00: begin
			if (in_7bits[6]) begin
				out = {{121{1'b1}},in_7bits};
			end
			else begin
				out = {{121{1'b0}},in_7bits};
			end
		end	
		2'b01: begin
			if (in_10bits[9]) begin
				out = {{118{1'b1}},in_10bits};
			end
			else begin
				out = {{118{1'b0}},in_10bits};
			end
		end
		2'b10: begin 
			if (in_16bits[15]) begin
				out = {{112{1'b1}},in_16bits};
			end
			else begin
				out = {{112{1'b0}},in_16bits};
			end
		end
		2'b11:begin
			if (in_18bits[17]) begin
				out = {{110{1'b1}},in_18bits};
			end
			else begin
				out = {{110{1'b0}},in_18bits};
			end
		end
	endcase
end

//sign_ext ET(out_temp,out,negative,select);
	
endmodule
    

    //assign out = in;
/*module sign_ext(in,out,negative, select);

	input [31:0]in;
	input negative;
	output logic signed [127:0]out;
	
always_comb begin
	if (negative == 0) begin
		out=in;
	end
	else begin
		out={128'hffff,in};
	end
end
endmodule

*/
module sign_ext_tb();

	logic [6:0]in1;
	logic [9:0]in2;
	logic [15:0]in3;
	logic [17:0]in4;
logic signed [127:0] out; 
logic [1:0] select; 
logic clk;
initial clk = 0;
always #10 clk = ~clk;

assign in1=7'hDD;
assign in2=10'h1AA;
assign in3=16'h1DD;
assign in4=18'h1AD;
always begin
     
     select=0; //needs a fix here, but omit for now
@(posedge clk) 
	select=1; 
@(posedge clk) 
	select=2;
@(posedge clk) 
	select=3;
end

sign_ext sign_test(in1,in2,in3,in4,out,select);

endmodule 
