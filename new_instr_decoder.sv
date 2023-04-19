module new_instruction_decoder(instr1_id,reset,register_RA_addr,register_RB_addr,register_RC_addr,register_RT_addr,use_RA,use_RB,use_RC,imm7_output, imm10_output, imm16_output,imm18_output,is_even,instruction_latency,unit_id);
input [31:0] instr1_id;
input logic  reset;
output logic [6:0] register_RA_addr,register_RB_addr,register_RC_addr,register_RT_addr,imm7_output;
output logic [9:0] imm10_output;
output logic [25:0] imm16_output;
output logic [17:0] imm18_output;  
output logic use_RA,use_RB,use_RC;
output logic  [3:0] instruction_latency;
//output logic [1:0] select_imm; //which imm is being used not sure if needd for forwarding so might not be used 

output logic [2:0] unit_id; 
output logic is_even;		 

logic is_four_checked=0, is_seven_checked=0, is_eight_checked=0, is_nine_checked=0, is_eleven_checked=0; //will check opcode by size in order    

logic opcode_found=0;
//As of 4/2/2023 immediate or halfword lower is what I got up to
//as of 4/18/2023 I got up to compare equal byte immediate	
//as of 4/18/2023, finished all opcodes now have to add unit ids  
//need to do nop instructions 


always_comb begin
	if(reset==1'b1) begin 
		
	is_four_checked=0;
	is_seven_checked=0; 
	is_eight_checked=0; 
	is_nine_checked=0; 
	is_eleven_checked=0;
	opcode_found=0; 
		
	end 
	if(is_four_checked==0&&opcode_found==0) begin  //multiply and add
	case(instr1_id[31:28]) 
		4'b1100: begin 
		register_RT_addr=instr1_id[10:4]; 
		register_RA_addr=instr1_id[24:18];
		register_RB_addr=instr1_id[17:11];
		register_RC_addr=instr1_id[31:25];
		is_four_checked=1;
		opcode_found=1;					  
		use_RA=1;
		use_RB=1;
		use_RC=1; 	 
		unit_id=3;
			
	  end 
	  4'b1110: begin //floating multiply and add
		 register_RT_addr=instr1_id[10:4]; 
		register_RA_addr=instr1_id[24:18];
		register_RB_addr=instr1_id[17:11];
		register_RC_addr=instr1_id[31:25]; 
			use_RA=1;
		use_RB=1;
		use_RC=1; 
		is_four_checked=1;
		opcode_found=1;	
		unit_id=3;
		  
		  
	  end 
	  4'b1111: begin //floating multiply and subtract 
		register_RT_addr=instr1_id[10:4]; 
		register_RA_addr=instr1_id[24:18];
		register_RB_addr=instr1_id[17:11];
		register_RC_addr=instr1_id[31:25]; 
		use_RA=1;
		use_RB=1;
		use_RC=1; 
		is_four_checked=1;
		opcode_found=1; 
		unit_id=3;
	 	  
	end 
	  endcase 
		
		
	end 
else if(is_seven_checked==0&&opcode_found==0) begin 
	case(instr1_id[31:25])
	7'b0100001: begin 	 //load address 
	imm18_output=instr1_id[24:7];
	register_RT_addr=instr1_id[31:25];
	    use_RA=0;
		use_RB=0;
		use_RC=0;
		unit_id=1;
	end 
	
	
	endcase 
		
	end  
	 
	
	
	
 

if(is_eight_checked==0&&opcode_found==0) begin 
	case(instr1_id[31:24])
8'b00011101: begin //add halfword-immediate
	    imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	  
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
		
end   	 
8'b00011100: begin //add word immediate 
	   imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;  
		unit_id=1;
	
	
end    
8'b00001101: begin 	//subtract from halfword immediate
	    imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0; 
		unit_id=1;
	
end  
8'b00001100: begin //subtract from word immediate
   	  imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
	
end 	  
8'b00010101: begin //and halfword immediate
	    imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
		
		
	
end
8'b00010100: begin 	 //and word immediate 
	   imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
		
	
end  
8'b00000101: begin  //or halfword immediate 
	   imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
	
end    
8'b00000100: begin //or word immediate
        imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0; 
		unit_id=1;
	
	
end

8'b01000101: begin //exclusive or halfword immediate  
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;  
		unit_id=1;
	
end
8'b01000100: begin //exclusive or word immediate 
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;	
		unit_id=1;
		
end   
8'b01111101: begin 	//compare equal halfword immediate 
	    imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
end 	
8'b01111100: begin //compare equal word immediate 
	  imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
	
end 
8'b01001101: begin //compare greater than halfword immediate
	  imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
	
end   
8'b01001100: begin //compare greater than word immediate 
	  imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;  
		unit_id=1;
	
end 
8'b01011101: begin //Compare Logical Greater Than Halfword Immediate
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
	
	
end	
8'b01011100: begin //compare logical greater than word immediate
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;  
		unit_id=1;
	
	
	
end	
8'b00010110: begin  //and byte immediate 
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
		
	
end  
8'b01110100: begin //multiply immediate
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
	
	
end 
8'b01110101: begin 	//multiply unsigned immediate
	 imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
	
end
8'b01111110: begin //Compare Equal Byte Immediate
       imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=1;
	
end 
8'b00110100: begin //load quadword d form  
        imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=6;
	
end 
8'b00100100: begin //store quadword d form 
	    imm10_output=instr1_id[17:8];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eight_checked=1;	
		use_RA=1;
		use_RB=0;
		use_RC=0;	
		unit_id=6;
	
end 
	
	endcase 
 
end 

if(is_nine_checked==0&opcode_found==0) begin 
	case(instr1_id[31:23]) //immediate load halfowrd
	9'b010000011: begin 
	imm16_output=instr1_id[24:9]; 
	register_RT_addr=instr1_id[31:25];
	    use_RA=0;
		use_RB=0;
		use_RC=0;
		unit_id=1;	
		is_nine_checked=1;
		opcode_found=1;
		
	end
	9'b010000010: begin 	 //immediate load halfword upper
	imm16_output=instr1_id[24:9]; 
	register_RT_addr=instr1_id[31:25]; 
	    use_RA=0;
		use_RB=0;
		use_RC=0;
		unit_id=1; 
		is_nine_checked=1;
		opcode_found=1;
		
	end  
	9'b010000001: begin   //immediate load word 
	imm16_output=instr1_id[24:9]; 
	register_RT_addr=instr1_id[31:25]; 	
	    use_RA=0;
		use_RB=0;
		use_RC=0;
		unit_id=1;
		is_nine_checked=1;
		opcode_found=1;
	end  
	9'b011000001: begin //immdiate or halfword lower
	 imm16_output=instr1_id[24:9]; 
	register_RT_addr=instr1_id[31:25];
	    use_RA=0;
		use_RB=0;
		use_RC=0;	
		unit_id=1; 
		is_nine_checked=1;
		opcode_found=1;
	end 
	9'b001100001: begin //load quadword a form 
		
	    imm16_output=instr1_id[24:9]; 
	    register_RT_addr=instr1_id[31:25];
	    use_RA=0;
		use_RB=0;
		use_RC=0;
		unit_id=6;
		is_nine_checked=1;
		opcode_found=1;
		
	end  
	9'b001000010: begin   //branch if not zero 
	    imm16_output=instr1_id[24:9]; 
	    register_RT_addr=instr1_id[31:25];
	    use_RA=0;
		use_RB=0;
		use_RC=0;	
		unit_id=7; 
		is_nine_checked=1;
		opcode_found=1;
		
	end   
	9'b001000110: begin //branch if not zero halfword 
		imm16_output=instr1_id[24:9]; 
	    register_RT_addr=instr1_id[31:25];
	    use_RA=0;
		use_RB=0;
		use_RC=0;
		unit_id=7; 	
		is_nine_checked=1;
		opcode_found=1;
		
		
	end  
	9'b001000000: begin  //branch if zero word 
	    imm16_output=instr1_id[24:9]; 
	    register_RT_addr=instr1_id[31:25];
	    use_RA=0;
		use_RB=0;
		use_RC=0;	
		unit_id=7; 
		is_nine_checked=1;
		opcode_found=1;
			
		
	end  
	9'b001100000: begin 	  //branch absolute 
		imm16_output=instr1_id[24:9]; 
	    register_RT_addr=instr1_id[31:25];
	    use_RA=0;
		use_RB=0;
		use_RC=0;	
		unit_id=7; 	
		is_nine_checked=1;
		opcode_found=1;
			
		
		
	end   
	9'b001100100: begin    //branch relative 
	    imm16_output=instr1_id[24:9]; 
	    register_RT_addr=instr1_id[31:25];
	    use_RA=0;
		use_RB=0;
		use_RC=0;
		unit_id=7; 
		is_nine_checked=1;
		opcode_found=1;
		
	end 
	
	endcase 
	
end 

if(is_eleven_checked==0&&opcode_found==0) begin 
	case(instr1_id[31:21])  //add halfword 
	11'b00011001000: begin 
		register_RB_addr=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;  
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=1;
		
	end  
	11'b00011000000: begin //add word 
		register_RB_addr=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=1;
		
		
	end 
	11'b00001001000: begin //subtract from halfword 
	   register_RB_addr=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;  
		unit_id=1;
	end 
  11'b00001000000: begin //subtract from word  
	    register_RB_addr=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=1;
		use_RC=0;  
		unit_id=1;
	  
  end 
  11'b00011000010: begin   //carry generate
	    register_RB_addr=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=1;
	  
  end 
  11'b01010100101: begin //count leading zeross 
	  	register_RB_addr=instr1_id[17:11]; //register_RB is not being used here
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=1;
	  
  end 
  11'b00011000001:	begin  //and 
  	   register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=1;
		use_RC=0;	
		unit_id=1;
	end 	
	11'b01011000001: begin //and with compliment  
		 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=1;
		
	end 
	
	11'b00001000001: begin //or
		 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=1;
		
		
	end  
	
	11'b01011001001: begin 	//or with compliment 
		 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;  
		use_RA=1;
		use_RB=1;
		use_RC=0;  
		unit_id=1;
		
	
		end 
  	11'b01001000001: begin 	 //exclusive OR 
		 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;  
		use_RA=1;
		use_RB=1;
		use_RC=0;  
		unit_id=1;
		  
		  
		  
     end  
	 
11'b00011001001: begin //nand 
	 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=1;
		use_RC=0;  
		unit_id=1;
	
	
end   

11'b00001001001: begin  //nor  
	  register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;   
		use_RA=1;
		use_RB=1;
		use_RC=0; 
		unit_id=1;
	
end
11'b01111001000: begin //compare equal halfword 
	    register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;  
		unit_id=1;
	
end 
11'b01111000000: begin //compare equal word
	   register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=1;
	
end 
11'b01001001000: begin //compare greater than halfword 
	 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;	 
		unit_id=1;
	
	
end

11'b01001000000: begin 	 //compare greater than word 
	register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;	
		unit_id=1;
	
end
11'b01011001000: begin //compare logical greater than halfword
	    register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=1;
end 
11'b01011000000: begin 	//Compare Logical Greater Than Word
	register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=1;
	
end  
11'b00001011111: begin //shift left halfword 
	    register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
	   use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=2;
	
end 
11'b00001111111: begin //shift left halfword immediate
		//register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;
		
		unit_id=2;
	
end 
11'b00001011011: begin  //shift left word  
	    register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=2;
	
	
end 
11'b00001111011: begin 	//shift left word immediate
	// register_RB_addr=instr1_id[17:11];   
	    imm7_output=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=2;
	
end 
11'b00001011100: begin  //rotate halfword
	    register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=1;
		use_RC=0;	
		unit_id=2;
end 
11'b00001111100: begin //rotate halfword immediate 
	//register_RB_addr=instr1_id[17:11];
	    imm7_output=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=2; 
	
end  
11'b00001011000: begin //rotate word 
	   register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=2;
	
	
end  
11'b00001111000: begin 	//rotate word immediate
   //register_RB_addr=instr1_id[17:11]; 
        imm7_output=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;  
		unit_id=2;
	
end	
11'b01111000100: begin //multiply 
	   register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=1;
		use_RC=0; 
		unit_id=3; 
	
end 
11'b01111001100: begin 	//multiply unsigned
       register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1; 
		use_RA=1;
		use_RB=1;
		use_RC=0;	
		unit_id=3;
		
	
end 
11'b01011000100: begin //floating add
    register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=3;
	
end 
11'b01011000101: begin 	 //floating subtract 
 register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0; 
		unit_id=3;
		
	
end 
11'b01011000110: begin 	//floating multiply 
       register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;	
		use_RA=1;
		use_RB=1;
		use_RC=0;  
		unit_id=3;
	
end 
11'b00011010011: begin 	//average bytes 
        register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=3;
	
end
11'b01010110100:begin //count ones in bytes register B is not used
        register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0; 
		unit_id=3;
	
end 
11'b00001010011: begin 	//absolute differences in bytes
        register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=4;
		
	
end 
11'b01001010011: begin 	//sum bytes into halfwords
        register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=4;
	
end  
11'b01111010000: begin //compare equal byte 
        register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=4;
	
end 
11'b00111011011: begin //shift left quadword by bits  
	    register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=5; 
	
	
end 
11'b00111111011: begin 	  //shift left by quadword immediate 
	// register_RB_addr=instr1_id[17:11];
	    imm7_output=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0; //immediate used instead 
		use_RC=0;
		unit_id=5;
		
	
	
end 
11'b00111011111: begin 	 //shift left quadword bytes
        register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=5;
	
end 
11'b00111111111: begin //Shift Left Quadword by Bytes Immediate	 
	    imm7_output=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0; //immediate used instead 
		use_RC=0;	
		unit_id=5;
	
	
end 
11'b00111001111: begin 	//Shift Left Quadword by Bytes from Bit Shift Count
	    register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=5;
	
	
end  
11'b00111011100:begin //rotate quadword by bytes
        register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;		
		unit_id=5; 
	
	
end 
11'b00111111100: begin 		//Rotate Quadword by Bytes Immediate  
	    imm7_output=instr1_id[17:11];
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0; //immediate used instead 
		use_RC=0;		
		unit_id=5; 
	
	
end  
11'b00111011000: begin //rotate quadword by bits  
        register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;
		unit_id=5;
	
	
	
end
11'b00111111000: begin //Rotate Quadword by Bits Immediate
	    imm7_output=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=1;
		use_RC=0;	
		unit_id=5; 
	
	
	
end 
11'b00110110010: begin 	//gather bits from bytes 
       // register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;
		unit_id=5;
	
end  
11'b00110110001: begin 	 //Gather Bits from Halfwords
	   // register_RB_addr=instr1_id[17:11]; 
		register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0;
		use_RC=0;	
		unit_id=5;
	
end 	 
11'b00110110000: begin //Gather Bits from Words 
	    register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0; //immediate used instead 
		use_RC=0; 
		unit_id=5; 
		
	
end 	 
11'b00101000100: begin //store quadword x form  
	    register_RB_addr=instr1_id[17:11];
	    register_RA_addr=instr1_id[24:18];
		register_RT_addr=instr1_id[31:25]; 
		opcode_found=1;	
		is_eleven_checked=1;
		use_RA=1;
		use_RB=0; //immediate used instead 
		use_RC=0;  
		unit_id=6; 
	
end 
11'b00000000001: begin 	//lnop load (odd) 
       use_RA=0;
		use_RB=0; 
		use_RC=0; 
		unit_id=0; 
	
end    
11'b01000000001: begin 	 //nop even 
	   use_RA=0;
		use_RB=0; 
		use_RC=0; 
		unit_id=0; 
		register_RT_addr=instr1_id[31:25]; 
	
	
end    
11'b00000000000: begin //stop and signal 
	    use_RA=0;
		use_RB=0; 
		use_RC=0; 
		unit_id=0; 
		register_RT_addr=instr1_id[31:18]; //stop and signal type
	
end 



	endcase 
	end 
	
end

endmodule
module decoder_test_tb();
logic [31:0] instr1_id;
logic reset;
 logic [6:0] register_RA_addr,register_RB_addr,register_RC_addr,register_RT_addr,imm7_output;
 logic [9:0] imm10_output;
 logic [25:0] imm16_output;	
 logic [2:0] unit_id;
 logic [17:0] imm18_output;  
 logic use_RA,use_RB,use_RC;   
 
 logic  [3:0] instruction_latency;
 //logic [1:0] select_imm; //which imm is being used not sure if needd for forwarding so might not be used 
   
	 
 
 logic is_even;	
 //logic clk;    
  
 logic [31:0] temp; 
 //logic is_four_checked, is_seven_checked, is_eight_checked, is_nine_checked, is_eleven_checked; //will check opcode by size in order    

//logic opcode_found;

new_instruction_decoder dut(instr1_id,reset,register_RA_addr,register_RB_addr,register_RC_addr,register_RT_addr,use_RA,use_RB,use_RC,imm7_output, imm10_output, imm16_output,imm18_output,is_even,instruction_latency,unit_id); 
//initial clk = 0; 
initial reset=1; 

//always #5 clk = ~clk;
initial begin
	//@(posedge clk)
	#5;
	//temp=32'b00010100;
	instr1_id= {{temp[07:00]},
                       {temp[15:08]},
                       {temp[23:16]},
                       {temp[31:24]}};		
	instr1_id=32'h16000000 ; //and byte immediate 
	//instr1_id[23:0]=0;
	
	//@(posedge clk)	
	#5;
	instr1_id=32'h36200000  ; //gather bits from halfwords 
	//instr1_id[20:0]=0; 
	 #5;
	//@(posedge clk)	
	
	instr1_id=32'h41800000 ; //immediate load halfword  
	//instr1_id[22:0]=0;
	#5;
	//@(posedge clk) 	
	
	instr1_id=32'hc0000000; //multiply and add 
	//instr1_id[27:0]=0;  
	#5; 
//@(posedge clk);	 
//@(posedge clk);   
$finish;	
end 
endmodule 