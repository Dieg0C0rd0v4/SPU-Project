module multiply(register_RA,register_RB,register_RT); 
input [127:0] register_RA,register_RB;
//logic [15:0] s_temp,r_temp,imm_extended; //16 bits 
//logic [31:0] t_temp; //32 bits 
output logic [127:0] register_RT; 
always_comb begin 
register_RT[0+:24]=register_RA[8+:8]*register_RB[8+:8]; //RT is bytes 0 to 3, RA and RB are bytes 2 to 3 
register_RT[24+:24]=register_RA[40+:8]*register_RB[40+:8]; //40+:8, is bytes 6 to 7 , since bit 40  is the beginning of the sixth bit, 8*(6-1)=40 RT is bytes 4 to 7
register_RT[56+:24]=register_RA[72+:8]*register_RB[72+:8]; //72+:8 is bytes 10 to 11 since 8*(10-1)=72, RT is bytes 8 to 11 
register_RT[88+:24]=register_RA[104+:8]*register_RB[104+:8]; //104+:8, is bytes 14 to 15 since 8*(14-1)=104. RT is bytes 12 to 15
//RTL code 
//RT0:3 ? RA2:3 * RB2:3
//RT4:7 ? RA6:7 * RB6:7
//RT8:11 ? RA10:11 * RB10:11
//RT12:15 ? RA14:15 * RB14:15
end 
endmodule
