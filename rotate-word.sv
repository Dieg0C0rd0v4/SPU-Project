module rotate_word(register_RA,register_RB,register_RT);
input [127:0] register_RA,register_RB;
logic [15:0] s_temp,r_temp; //16 bits 
logic [31:0] t_temp; //32 bits 
output logic [127:0] register_RT;
always_comb begin 
for(int j=0;j<16;j+=2) begin 

s_temp=register_RB[(j*8)+:16]&16'h1F; //halfword access +:16  
t_temp=register_RA[(j*8)+:16];//halfword access +:16 
for(int b=0;b<16;b++)
begin 
if(b+s_temp<16) begin 
r_temp[b]=t_temp[b+s_temp];

end 
else begin 
r_temp[b]=t_temp[b+s_temp-16];
end 

end 
 end 
end 
endmodule 