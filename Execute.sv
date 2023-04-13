
module Execute(readDataRA_EX,readDataRB_EX,readDataRC_EX,opcode_EX,
	       result_EX, latency_EX,imm7, imm10, imm16,imm18);

                          

//Jump Branch datapath 
input [127:0] readDataRA_EX; 
input [127:0] readDataRB_EX;
input [127:0] readDataRC_EX;
input [10:0]   opcode_EX;  
input [6:0] imm7; 
input [9:0] imm10;
input [15:0] imm16;
input [17:0] imm18; 


output [127:0] result_EX; //perhaps not needed, if we have 
output logic [2:0] latency_EX; 

logic [127:0] RT;
logic [127:0] RA;
logic [127:0] RB; 
logic [127:0] RC;
logic [127:0] unsigned_RA;
logic [127:0] unsigned_RB;
logic [127:0] unsigned_RC;

logic [15:0] imm_extended;
logic [31:0] imm_extended_32; 
logic [31:0] temp_32,temp_u,temp_t;  
logic [15:0] unsigned_imm_extended;
logic [31:0] unsigned_imm_extended_32;

assign result_EX     = RT; 
assign RA = readDataRA_EX; 
assign RB = readDataRB_EX; 
assign RC = readDataRC_EX; 
assign unsigned_RA=	unsigned'(readDataRA_EX);

assign unsigned_RB=	unsigned'(readDataRB_EX);

assign unsigned_RC=	unsigned'(readDataRC_EX);

//assign unsigned_imm_extended=unsigned'(imm_extended);  
//assign unsigned_imm_extended_32=unsigned'(imm_extended_32);


always_comb begin
	case(opcode_EX) 
		11'b00011001000: begin //add halfword 
			latency_EX= 3-1; 
			RT[0+:16] = RA[0+:16]+RB[0+:16]; //bytes 0 and 1
			RT[16+:16]=RA[16+:16]+RB[16+:16]; //bytes 2 and 3
			RT[32+:16]=RA[32+:16]+RB[32+:16]; //bytes 4 and 5
			RT[48+:16]=RA[48+:16]+RB[48+:16]; //bytes 6 and 7
			RT[64+:16]=RA[64+:16]+RB[64+:16]; //bytes 8 and 9 
			RT[80+:16]=RA[80+:16]+RB[80+:16]; //bytes 10 and 11 
			RT[96+:16]=RA[96+:16]+RB[96+:16]; //bytes 12 and 13
			RT[112+:16]=RA[112+:16]+RB[112+:16]; //bytes 14 and 15 

		end 
		
	11'b00011101: //add	halfword immediate 
	begin 
	        latency_EX= 3-1; 	 //add halfword immediate
			imm_extended={ {11{imm7[6]}},imm7[6:0]};
			RT[0+:16] = RA[0+:16]+imm_extended;
			RT[16+:16]=RA[16+:16]+imm_extended;
			RT[32+:16]=RA[32+:16]+imm_extended;
			RT[48+:16]=RA[48+:16]+imm_extended;
			RT[64+:16]=RA[64+:16]+imm_extended;
			RT[80+:16]=RA[80+:16]+imm_extended;
			RT[96+:16]=RA[96+:16]+imm_extended;
			RT[112+:16]=RA[112+:16]+imm_extended; 
	end 
	11'b00011000000: //add word 
	begin 
	        RT[0+:32] = RA[0+:32]+RB[0+:32]; //bytes 0 and 3
			RT[32+:32]=RA[32+:32]+RB[32+:32]; //bytes 4 and 7
			RT[64+:32]=RA[64+:32]+RB[64+:32]; //bytes 8 and 11
			RT[96+:32]=RA[96+:32]+RB[96+:32]; //bytes 12 and 15
				
		
		
		
	end   
	11'b00011100:
	begin 
	        latency_EX= 3-1; //add word immediate	   
	 		imm_extended_32={ {22{imm10[9]}},imm10[9:0]};
			RT[0+:32] = RA[0+:32]+imm_extended_32;
			RT[32+:32]=RA[32+:32]+imm_extended_32;
			RT[64+:32]=RA[64+:32]+imm_extended_32;
			RT[96+:32]=RA[96+:32]+imm_extended_32; 	
		
		
	end	 
	11'b00001001000: 
	begin  //subtract from halfword 
	        latency_EX= 3-1;  
			RT[0+:16] = RB[0+:16]+ (~RA[0+:16]+1); //bytes 0 and 1
			RT[16+:16]=RB[16+:16]+(~RA[16+:16]+1); //bytes 2 and 3
			RT[32+:16]=RB[32+:16]+(~RA[32+:16]+1); //bytes 4 and 5
			RT[48+:16]=RB[48+:16]+(~RA[48+:16]+1); //bytes 6 and 7
			RT[64+:16]=RB[64+:16]+(~RA[64+:16]+1); //bytes 8 and 9 
			RT[80+:16]=RB[80+:16]+(~RA[80+:16]+1); //bytes 10 and 11 
			RT[96+:16]=RB[96+:16]+(~RA[96+:16]+1); //bytes 12 and 13
			RT[112+:16]=RB[112+:16]+(~RA[112+:16]+1); //bytes 14 and 15 	
		
		
	end
	11'b00001101: begin	 //subtract from halfword immediate  
			latency_EX= 3-1; 	 
			imm_extended={ {11{imm7[6]}},imm7[6:0]};
			RT[0+:16] = (~RA[0+:16]+1)+imm_extended;
			RT[16+:16]=(~RA[16+:16]+1)+imm_extended;
			RT[32+:16]=(~RA[32+:16]+1)+imm_extended;
			RT[48+:16]=(~RA[48+:16]+1)+imm_extended;
			RT[64+:16]=(~RA[64+:16]+1)+imm_extended;
			RT[80+:16]=(~RA[80+:16]+1)+imm_extended;
			RT[96+:16]=(~RA[96+:16]+1)+imm_extended;
			RT[112+:16]=(~RA[112+:16]+1)+imm_extended; 
		
	end 
	11'b00001000000: //subtract from word
	begin 
		    latency_EX= 3-1; //subtract from word
			RT[0+:32] = (~RA[0+:32]+1)+RB[0+:32]; //bytes 0 and 3
			RT[32+:32]=(~RA[32+:32]+1)+RB[32+:32]; //bytes 4 and 7
			RT[64+:32]=(~RA[64+:32]+1)+RB[64+:32]; //bytes 8 and 11
			RT[96+:32]=(~RA[96+:32]+1)+RB[96+:32]; //bytes 12 and 15
			
		
		
	end   
	11'b00001100:
	begin 
			latency_EX= 3-1; //subtract from word immediate 
			imm_extended_32={ {22{imm10[9]}},imm10[9:0]};
			RT[0+:32] = (~RA[0+:32]+1)+imm_extended_32;
			RT[32+:32]=(~RA[32+:32]+1)+imm_extended_32;
			RT[64+:32]=(~RA[64+:32]+1)+imm_extended_32;
			RT[96+:32]=(~RA[96+:32]+1)+imm_extended_32; 
				
		
		
	end	 
	11'b01010100101: begin //count leading zeros   
		latency_EX= 3-1; 
				for(int j=0;j<16;j+=4) begin 
					temp_32=32'd0;
					temp_u=RA[(j*8)+:32];
					for(int m=0;m<32;m+=1) begin 
						if(temp_u[m]==1) begin 
							break;  
							
						end	//end if
					else begin 
					temp_32=temp_32+1;	
						
					end //end else 
						
					end // end m loop
					
				RT[(j*8)+:32]=	temp_32;
				end// end for j loop
				
			end	 //end instr 
		11'b00011000001: begin 	//and
			latency_EX= 3-1; 
		    RT[0+:32] = RA[0+:32]&RB[0+:32]; //bytes 0 and 3
			RT[32+:32]=RA[32+:32]&RB[32+:32]; //bytes 4 and 7
			RT[64+:32]=RA[64+:32]&RB[64+:32]; //bytes 8 and 11
			RT[96+:32]=RA[96+:32]&RB[96+:32]; //bytes 12 and 15
				
			
			
		end	 
		11'b01011000001: begin //and with compliment
			latency_EX= 3-1; 
		    RT[0+:32] = RA[0+:32]&(~RB[0+:32]); //bytes 0 and 3
			RT[32+:32]=RA[32+:32]&(~RB[32+:32]); //bytes 4 and 7
			RT[64+:32]=RA[64+:32]&(~RB[64+:32]); //bytes 8 and 11
			RT[96+:32]=RA[96+:32]&(~RB[96+:32]); //bytes 12 and 15
				
	    end 
	   	11'b00010101: begin  //and halfword immediate 
			latency_EX= 3-1; 	 
			imm_extended={ {11{imm7[6]}},imm7[6:0]};
			RT[0+:16] = RA[0+:16]&imm_extended;
			RT[16+:16]=RA[16+:16]&imm_extended;
			RT[32+:16]=RA[32+:16]&imm_extended;
			RT[48+:16]=RA[48+:16]&imm_extended;
			RT[64+:16]=RA[64+:16]&imm_extended;
			RT[80+:16]=RA[80+:16]&imm_extended;
			RT[96+:16]=RA[96+:16]&imm_extended;
			RT[112+:16]=RA[112+:16]&imm_extended;    
			   
	    end
		11'b00010100: begin //and word immediate
		    latency_EX= 3-1;   
	 		imm_extended_32={ {22{imm10[9]}},imm10[9:0]};
			RT[0+:32] = RA[0+:32]&imm_extended_32;
			RT[32+:32]=RA[32+:32]&imm_extended_32;
			RT[64+:32]=RA[64+:32]&imm_extended_32;
			RT[96+:32]=RA[96+:32]&imm_extended_32; 	
			
		end	  
		11'b00001000001: begin //or 
			latency_EX= 3-1; 
		    RT[0+:32] = RA[0+:32]|RB[0+:32]; //bytes 0 and 3
			RT[32+:32]=RA[32+:32]|RB[32+:32]; //bytes 4 and 7
			RT[64+:32]=RA[64+:32]|RB[64+:32]; //bytes 8 and 11
			RT[96+:32]=RA[96+:32]|RB[96+:32]; //bytes 12 and 15
			
		end 
		11'b01011001001: begin 	//or with complement 
			latency_EX= 3-1; 
		    RT[0+:32] = RA[0+:32]|(~RB[0+:32]); //bytes 0 and 3
			RT[32+:32]=RA[32+:32]|(~RB[32+:32]); //bytes 4 and 7
			RT[64+:32]=RA[64+:32]|(~RB[64+:32]); //bytes 8 and 11
			RT[96+:32]=RA[96+:32]|(~RB[96+:32]); //bytes 12 and 15
				
			
		end 			
		11'b00000101: begin   //or halfword immediate 
					latency_EX= 3-1; 	 
			imm_extended={ {11{imm7[6]}},imm7[6:0]};
			RT[0+:16] = RA[0+:16]|imm_extended;
			RT[16+:16]=RA[16+:16]|imm_extended;
			RT[32+:16]=RA[32+:16]|imm_extended;
			RT[48+:16]=RA[48+:16]|imm_extended;
			RT[64+:16]=RA[64+:16]|imm_extended;
			RT[80+:16]=RA[80+:16]|imm_extended;
			RT[96+:16]=RA[96+:16]|imm_extended;
			RT[112+:16]=RA[112+:16]|imm_extended;    
			
		end 
		11'b00000100: begin    //or word immediate 
		    latency_EX= 3-1;   
	 		imm_extended_32={ {22{imm10[9]}},imm10[9:0]};
			RT[0+:32] = RA[0+:32]|imm_extended_32;
			RT[32+:32]=RA[32+:32]|imm_extended_32;
			RT[64+:32]=RA[64+:32]|imm_extended_32;
			RT[96+:32]=RA[96+:32]|imm_extended_32; 	
			
			
		end 
		11'b01001000001: begin //exclusive or 
			latency_EX= 3-1; 
		    RT[0+:32] = RA[0+:32]^RB[0+:32]; //bytes 0 and 3
			RT[32+:32]=RA[32+:32]^RB[32+:32]; //bytes 4 and 7
			RT[64+:32]=RA[64+:32]^RB[64+:32]; //bytes 8 and 11
			RT[96+:32]=RA[96+:32]^RB[96+:32]; //bytes 12 and 15
			
		end  
		11'b01000101: begin    //exclusive or halfword immediate 
			latency_EX= 3-1; 	 
			imm_extended={ {11{imm7[6]}},imm7[6:0]};
			RT[0+:16] = RA[0+:16]^imm_extended;
			RT[16+:16]=RA[16+:16]^imm_extended;
			RT[32+:16]=RA[32+:16]^imm_extended;
			RT[48+:16]=RA[48+:16]^imm_extended;
			RT[64+:16]=RA[64+:16]^imm_extended;
			RT[80+:16]=RA[80+:16]^imm_extended;
			RT[96+:16]=RA[96+:16]^imm_extended;
			RT[112+:16]=RA[112+:16]^imm_extended;  	
			
		end 
		11'b01000100: begin //exclusive or word immediate 
			 latency_EX= 3-1;   
	 		imm_extended_32={ {22{imm10[9]}},imm10[9:0]};
			RT[0+:32] = RA[0+:32]^imm_extended_32;
			RT[32+:32]=RA[32+:32]^imm_extended_32;
			RT[64+:32]=RA[64+:32]^imm_extended_32;
			RT[96+:32]=RA[96+:32]^imm_extended_32; 	
			
			
		end 
		11'b00011001001: begin 	 //nand 
		   	latency_EX= 3-1; 
		    RT[0+:32] = ~(RA[0+:32]&RB[0+:32]); //bytes 0 and 3
			RT[32+:32]=~(RA[32+:32]&RB[32+:32]); //bytes 4 and 7
			RT[64+:32]=~(RA[64+:32]&RB[64+:32]); //bytes 8 and 11
			RT[96+:32]=~(RA[96+:32]&RB[96+:32]); //bytes 12 and 15
				
			
			
		end
		11'b00001001001: begin 	 //nor 
			latency_EX= 3-1; 
		    RT[0+:32] = ~(RA[0+:32]|RB[0+:32]); //bytes 0 and 3
			RT[32+:32]=~(RA[32+:32]|RB[32+:32]); //bytes 4 and 7
			RT[64+:32]=~(RA[64+:32]|RB[64+:32]); //bytes 8 and 11
			RT[96+:32]=~(RA[96+:32]|RB[96+:32]); //bytes 12 and 15
			
		end 
		11'b01111001000: begin 	//compare equal halfward
		latency_EX= 3-1;
		for(int j=0; j<16;j+=2) begin 
			if(RA[(j*8)+:16]==RB[(j*8)+:16]) begin 
				RT[(j*8)+:16]=11'hFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:16]=11'h00000;
			
		end 
			
		end 
			
			
		end	   
	11'b01111101: begin   //compare equal halfword immediate
		imm_extended={ {6{imm10[9]}},imm10[9:0]};
	for(int j=0; j<16;j+=2) begin 
			if(RA[(j*8)+:16]==imm_extended) begin 
				RT[(j*8)+:16]=11'hFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:16]=11'h00000;
			
		end 
			
		end 
			
			
	end	
	11'b01111000000: begin //compare equal word
			
	latency_EX= 3-1;
		for(int j=0; j<16;j+=4) begin 
			if(RA[(j*8)+:32]==RB[(j*8)+:32]) begin 
				RT[(j*8)+:32]=11'hFFFFFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:32]=11'h00000;
			
		end 
			
		end 
			
			
	end	  
	11'b01111100: begin  //compare equal word immediate
		latency_EX= 3-1;
		imm_extended_32={ {22{imm10[9]}},imm10[9:0]};
	for(int j=0; j<16;j+=2) begin 
			if(RA[(j*8)+:32]==imm_extended_32) begin 
				RT[(j*8)+:32]=11'hFFFFFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:32]=11'h00000;
			
		end 
			
		end 
			
			
	end		
		
	 
	11'b01001001000: begin 	  //compare greater than halfword
	latency_EX= 3-1;
		for(int j=0; j<16;j+=2) begin 
			if(RA[(j*8)+:16]>RB[(j*8)+:16]) begin 
				RT[(j*8)+:16]=11'hFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:16]=11'h00000;
			
		end 
			
		end 
			
			
		end	
		
	11'b01001101: begin //compare greater than halfword immediate
		latency_EX= 3-1;
		imm_extended={ {6{imm10[9]}},imm10[9:0]};
	for(int j=0; j<16;j+=2) begin 
			if(RA[(j*8)+:16]>imm_extended) begin 
				RT[(j*8)+:16]=11'hFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:16]=11'h00000;
			
		end 
			
	end  
	
	end 
	 11'b01001000000: begin //compare greater than word 
		latency_EX= 3-1;
		for(int j=0; j<16;j+=4) begin 
			if(RA[(j*8)+:32]>RB[(j*8)+:32]) begin 
				RT[(j*8)+:32]=11'hFFFFFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:32]=11'h00000;
			
		end 
			
		end 
			
			
	end	 
	11'b01001100: begin //compare greater than word immediate
			latency_EX= 3-1;
		imm_extended_32={ {22{imm10[9]}},imm10[9:0]};
	for(int j=0; j<16;j+=2) begin 
			if(RA[(j*8)+:32]>imm_extended_32) begin 
				RT[(j*8)+:32]=11'hFFFFFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:32]=11'h00000;
			
		end 
			
		end 
			
			
	end		
	11'b01011001000: begin //compare logical greater than halfword

	latency_EX= 3-1;
		for(int j=0; j<16;j+=2) begin 
			if(unsigned_RA[(j*8)+:16]>unsigned_RB[(j*8)+:16]) begin 
				RT[(j*8)+:16]=11'hFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:16]=11'h00000;
			
		end 
			
		end 
			
			
		end	 
	11'b01011101: begin  //compare logical greater than halfword immediate 
	latency_EX= 3-1;
	imm_extended={ {6{imm10[9]}},imm10[9:0]}; 
	unsigned_imm_extended=unsigned'(imm_extended);
	for(int j=0; j<16;j+=2) begin 
			if(unsigned_RA[(j*8)+:16]>unsigned_imm_extended) begin 
				RT[(j*8)+:16]=11'hFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:16]=11'h00000;
			
		end 
			
	end  
	
	end 
	
	11'b01011000000:  begin //compare logical greater than word
			latency_EX= 3-1;
		for(int j=0; j<16;j+=4) begin 
			if(unsigned_RA[(j*8)+:32]>unsigned_RB[(j*8)+:32]) begin 
				RT[(j*8)+:32]=11'hFFFFFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:32]=11'h00000;
			
		end 
			
		end 
			
			
	end	 
	11'b01011100: begin   //compare logical greater than word immediate 
			latency_EX= 3-1;
		imm_extended={ {6{imm10[9]}},imm10[9:0]};
		unsigned_imm_extended=unsigned'(imm_extended);
	for(int j=0; j<16;j+=2) begin 
			if(unsigned_RA[(j*8)+:16]>unsigned_imm_extended) begin 
				RT[(j*8)+:16]=11'hFFFF;
				
				
			end 
		else begin 
			RT[(j*8)+:16]=11'h00000;
			
		end 
			
	end  
	
	end  
	
	11'b010000011:begin //immediate load halfword
	latency_EX= 3-1;
	
	RT=imm16; 
		
	end 
	11'b0010000010: begin //immediate load halfword upper
		latency_EX= 3-1;
			
		temp_t=imm16<<16; //left shift by 16 to put in upper half
		RT=temp_t; 
		
	end   
	11'b010000001: begin //imm load word
	latency_EX= 3-1;
	imm_extended_32={ {22{imm10[9]}},imm10[9:0]};	
	RT=imm_extended_32; 
		
	end 
	11'b0100001: begin //immediate load address 
	latency_EX= 3-1;
	RT=imm18;
	RT[31:18]=0; //set rest of the bits to 0
		
	end 
	
	11'b011000001: begin //immediate or halfword lower
	latency_EX=3-1; 
	temp_t=imm16;
	temp_t[31:16]=0;  
	RT=RT|temp_t;
	
	
		
	end  
	
	endcase 
 
   end 
										   
// ALU aluexecute(ALU_A,ALU_B,ALU_C,ALUControl,ALUResult,zero); // ALU Module
endmodule 



/*
module Execute_Testbench();

logic [127:0] readDataRA_EX; 
logic [127:0] readDataRB_EX;
logic [127:0] readDataRC_EX;
//where's register RT??????
logic [3:0] opcode_EX;
logic [127:0] result;
logic [10:0] opcode; 
logic [127:0] result_EX; //perhaps not needed, if we have  


assign opcode = 11'b00011001000; 
assign readDataRA_EX= 128'd543534534452345043;
assign readDataRB_EX= 128'd234234234545610253; 


Execute ex(readDataRA_EX,readDataRB_EX,readDataRC_EX,result,opcode,opcode_EX,result_EX);

endmodule
*/
