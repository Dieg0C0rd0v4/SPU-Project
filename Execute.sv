
module Execute(readDataRA_EX,readDataRB_EX,readDataRC_EX,control_EX,
	       result_EX, latency_EX,imm7, imm10,imm16,imm18);

//Jump Branch datapath 
input [127:0] readDataRA_EX; 
input [127:0] readDataRB_EX;
input [127:0] readDataRC_EX;
input [6:0]   control_EX,imm7;
input [9:0] imm10;
input [15:0] imm16;
input [17:0] imm18; 


output [127:0] result_EX; //perhaps not needed, if we have 
output logic [2:0] latency_EX; 

logic [127:0] RT;
logic [127:0] RA;
logic [127:0] RB; 
logic [127:0] RC;
logic [15:0] imm_extended;
logic [31:0] imm_extended_32;

logic [31:0] temp_32,temp_u;
assign result_EX     = RT; 
assign RA = readDataRA_EX; 
assign RB = readDataRB_EX; 
assign RC = readDataRC_EX; 


always_comb begin
	case(control_EX) 
		7'd1: begin
			latency_EX= 3-1;  //add halfword
			RT[0+:16] = RA[0+:16]+RB[0+:16]; //bytes 0 and 1
			RT[16+:16]=RA[16+:16]+RB[16+:16]; //bytes 2 and 3
			RT[32+:16]=RA[32+:16]+RB[32+:16]; //bytes 4 and 5
			RT[48+:16]=RA[48+:16]+RB[48+:16]; //bytes 6 and 7
			RT[64+:16]=RA[64+:16]+RB[64+:16]; //bytes 8 and 9 
			RT[80+:16]=RA[80+:16]+RB[80+:16]; //bytes 10 and 11 
			RT[96+:16]=RA[96+:16]+RB[96+:16]; //bytes 12 and 13
			RT[112+:16]=RA[112+:16]+RB[112+:16]; //bytes 14 and 15 

		end
		7'd2: begin  
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
		
		7'd3: begin    	
			latency_EX= 3-1; //add word
			RT[0+:32] = RA[0+:32]+RB[0+:32]; //bytes 0 and 3
			RT[32+:32]=RA[32+:32]+RB[32+:32]; //bytes 4 and 7
			RT[64+:32]=RA[64+:32]+RB[64+:32]; //bytes 8 and 11
			RT[96+:32]=RA[96+:32]+RB[96+:32]; //bytes 12 and 15
			
			
		end  
		7'd4: begin 
			latency_EX= 3-1; //add word immediate	   
			imm_extended_32={ {22{imm10[9]}},imm10[9:0]};
			RT[0+:32] = RA[0+:32]+imm_extended_32;
			RT[32+:32]=RA[32+:32]+imm_extended_32;
			RT[64+:32]=RA[64+:32]+imm_extended_32;
			RT[96+:32]=RA[96+:32]+imm_extended_32; 
			
		end 
		7'd5: begin   //subtract from halfword 
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
		7'd6: begin //subtract from halfword immediate 
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
		7'd7: begin 
			latency_EX= 3-1; //subtract from word
			RT[0+:32] = (~RA[0+:32]+1)+RB[0+:32]; //bytes 0 and 3
			RT[32+:32]=(~RA[32+:32]+1)+RB[32+:32]; //bytes 4 and 7
			RT[64+:32]=(~RA[64+:32]+1)+RB[64+:32]; //bytes 8 and 11
			RT[96+:32]=(~RA[96+:32]+1)+RB[96+:32]; //bytes 12 and 15
			
			
		end 
		7'd8: begin //subtract from word immediate
			latency_EX= 3-1; //subtract from word  
			imm_extended_32={ {22{imm10[9]}},imm10[9:0]};
			RT[0+:32] = (~RA[0+:32]+1)+imm_extended_32;
			RT[32+:32]=(~RA[32+:32]+1)+imm_extended_32;
			RT[64+:32]=(~RA[64+:32]+1)+imm_extended_32;
			RT[96+:32]=(~RA[96+:32]+1)+imm_extended_32; 
			
			
			
	    end 
		7'd9: begin  //carry generate 
			for(int j=0;j<16;j+=4) begin 
				temp_32=(32'd0||RA[(j*8)+:32])+(32'd0||RB[(j*8)+:32]);	 
				RT[(j*8)+:32]=32'd0||temp_32;
				
			end 
			end 
			7'd10: begin //count leading zeros 
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
logic [3:0] control_EX;
logic [127:0] result;
logic [10:0] opcode; 
logic [127:0] result_EX; //perhaps not needed, if we have  


assign opcode = 11'b00011001000; 
assign readDataRA_EX= 128'd543534534452345043;
assign readDataRB_EX= 128'd234234234545610253; 


Execute ex(readDataRA_EX,readDataRB_EX,readDataRC_EX,result,opcode,control_EX,result_EX);

endmodule
*/
