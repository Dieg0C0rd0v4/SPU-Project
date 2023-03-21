module compare_equal(registerA,registerB,equal_flag); 
input [127:0] registerA,registerB;
output logic equal_flag; 
always_comb begin
	if(registerA==registerB) begin 
		  equal_flag=1;
	end
else  begin 
	 equal_flag=0;
	end 
end 

endmodule 
