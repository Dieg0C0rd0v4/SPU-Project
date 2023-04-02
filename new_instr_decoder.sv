module instruction_decoder(instr1_id,instr2_id,register_RA_addr,register_RB_addr,register_RT_addr,imm7_output, imm10_output, imm16_output,imm18_output,imm10_output,is_even,instruction_latency);
input [31:0] instr1_id,instr2_id; 
output logic [6:0] register_RA_addr,register_RB_addr,register_RT_addr,imm7_output;
output logic [9:0] imm10_output;
output logic [25:0] imm16_output;
output logic [17:0] imm18_output;  

output logic  [3:0] instruction_latency; 		


output logic is_even;		 

logic is_four_checked, is_seven_checked, is_eight_checked, is_nine_checked, is_eleven_checked=0; //will check opcode by size in order    

logic opcode_found=0;
//As of 4/2/2023 immediate or halfword lower is what I got up to  


always_comb begin 
	if(is_four_checked==0) begin 
		
		
		
	end 
else if(is_seven_checked==0&&opcode_found==0) begin 
	case(instr1_id[6:0])
	7'b0100001: begin 
	imm18_output=instr1_id[24:7];
	register_RT_addr=instr1_id[31:25];
		
	end 
	
	
	endcase 
		
	end  
	 
	
	
	
 

else if(is_eight_checked==0&&opcode_found==0) begin 
	case(instr1_id[7:0])
8'b00011101: begin //add halfword-immediate
	    imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		
end   	 
8'b00011100: begin //add word immediate 
	   imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
	
end    
8'b00001101: begin 	//subtract from halfword immediate
	    imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
end  
8'b00001100: begin //subtract from word immediate
   	  imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
end 	  
8'b00010101: begin //and halfword immediate
	    imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		
		
	
end
8'b00010100: begin 	 //and word immediate 
	   imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		
	
end  
8'b00000101: begin  //or halfword immediate 
	   imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
end    
8'b00000100: begin //or word immediate
        imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
	
end

8'b01000101: begin //exclusive or halfword immediate  
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
end
8'b01000100: begin //exclusive or word immediate 
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		
end   
8'b01111101: begin 	//compare equal halfword immediate 
	    imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
end 	
8'b01111100: begin //compare equal word immediate 
	  imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
	
end 
8'b01001101: begin //compare greater than halfword immediate
	  imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
	
end   
8'b01001100: begin //compare greater than word immediate 
	  imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
end 
8'b01011101: begin //Compare Logical Greater Than Halfword Immediate
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
	
end	
8'b01011100: begin //compare logical greater than word immediate
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
	
	
	
	end
	
	endcase 
 
end 

else if(is_nine_checked==0&opcode_found==0) begin 
	case(instr1_id[8:0]) //immediate load halfowrd
	9'b010000011: begin 
	imm16_output=instr1_id[24:9]; 
	register_RT_addr=instr1_id[31:25];
		
		
	end
	9'b010000010: begin 	 //immediate load halfword upper
	imm16_output=instr1_id[24:9]; 
	register_RT_addr=instr1_id[31:25]; 
		
		
	end  
	9'b010000001: begin   //immediate load word 
	imm16_output=instr1_id[24:9]; 
	register_RT_addr=instr1_id[31:25]; 	
		
	end  
	9'b011000001: begin //immdiate or halfword lower
	 imm16_output=instr1_id[24:9]; 
	register_RT_addr=instr1_id[31:25]; 	
	end 
	
	
	endcase 
	
end 

else if(is_eleven_checked==0&&opcode_found==0) begin 
	case(instr1_id[10:0])  //add halfword 
	11'b00011001000: begin 
		register_RB_addr=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_seven_checked=1;
		
	end  
	11'b00011000000: begin //add word 
		register_RB_addr=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		
		
	end 
	11'b00001001000: begin //subtract from halfword 
	   register_RB_addr=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_seven_checked=1;
	end 
  11'b00001000000: begin //subtract from word  
	    register_RB_addr=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
	  
  end 
  11'b00011000010: begin   //carry generate
	    register_RB_addr=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
	  
  end 
  11'b01010100101: begin //count leading zeross 
	  	register_RB_addr=instr1_id[17:11]; //register_RB is not being used here
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
	  
  end 
  11'b00011000001:	begin  //and 
  	   register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;  
	end 	
	11'b01011000001: begin //and with compliment  
		 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;  
		
	end 
	
	11'b00001000001: begin //or
		 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;  
		
		
	end  
	
	11'b01011001001: begin 	//or with compliment 
		 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;  
		
	
		end 
  	11'b01001000001: begin 	 //exclusive OR 
		 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;  
		  
		  
		  
     end  
	 
11'b00011001001: begin //nand 
	 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;  
	
	
end   

11'b00001001001: begin  //nor  
	  register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;  
	
end
11'b01111001000: begin //compare equal halfword 
	    register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
	
end 
11'b01111000000: begin //compare equal word
	   register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
	
end 
11'b01001001000: begin //compare greater than halfword 
	 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
	
	
end

11'b01001000000: begin 	 //compare greater than word 
	register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
	
end
11'b01011001000: begin //compare logical greater than halfword
	    register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;	
end 
11'b01011000000: begin 	//Compare Logical Greater Than Word
	register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
	
end 



	
	endcase 
	end 
	
end

endmodule 

