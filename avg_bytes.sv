module average_bytes(register_RA,register_RB,register_RT); 
input [127:0] register_RA,register_RB;
output logic [127:0] register_RT;
always_comb begin 
for(int j=0; j<16;j++) begin 
register_RT=( (128'h0 || register_RA[j*8+:8])+(128'h0 || register_RB[j*8+:8]) );

end 
end 


endmodule 
