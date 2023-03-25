//shift left halfword
module shift_left_halfword_imm(register_RA,imm7,register_RT); 
input [127:0] register_RA;
logic [15:0] s_temp,r_temp,imm_extended; //16 bits 
input logic [6:0] imm7; 
logic [31:0] t_temp; //32 bits 
output logic [127:0] register_RT; 
always_comb begin 
imm_extended={ {11{imm7[6]}},imm7[6:0]};//sign extension from imm7 from 7 bits to 16 bits 
s_temp=imm_extended&16'h1F; 
for(int j=0;j<15;j+=2) begin 
 
t_temp=register_RA[(j*8)+:16];//halfword access +:16 

for(int b=0;b<15;b++) begin 
if((b+s_temp)<16) begin 
 r_temp[b]=t_temp[b+s_temp];

end 
else begin 
r_temp[b]=0;

end 


end 

register_RT[(j*8)+:16]=r_temp; //set 16 bits of register RT to r_temp  
end 

end 

endmodule 
