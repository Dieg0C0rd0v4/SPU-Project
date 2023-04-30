module decoder (instruction, readRegisterRA, readRegisterRB, readRegisterRC, readRegisterRT, 
		useRA, useRB, useRC, imm7, imm10, imm16, imm18, isEven, latency, unitID,regWriteEnable, reset,opcode);

input [31:0] instruction;
input logic  reset;
output logic [6:0] readRegisterRA,readRegisterRB,readRegisterRC,readRegisterRT;
output logic [6:0] imm7;
output logic [9:0] imm10;
output logic [15:0] imm16;
output logic [17:0] imm18;  
output logic useRA,useRB,useRC;
output logic  [2:0] latency;
//output logic [1:0] select_imm; //which imm is being used not sure if needd for forwarding so might not be used 
output logic [6:0] opcode; 


output logic [2:0] unitID; 
output logic isEven,regWriteEnable;		 

logic isFour=0, isSeven=0, isEight=0, isNine=0, isEleven=0; //will check opcode by size in order    

logic opcode_found=0;
//As of 4/2/2023 immediate or halfword lower is what I got up to
//as of 4/18/2023 I got up to compare equal byte immediate	
//as of 4/18/2023, finished all opcodes now have to add unit ids  
//need to do nop instructions 


always_comb begin
	//if(reset==1'b1) begin 
		
		isFour=0;
		isSeven=0; 
		isEight=0; 
		isNine=0; 
		isEleven=0;
		opcode_found=0; 
		
	//end 
	if(isFour==0&&opcode_found==0) begin  //multiply and add
	case(instruction[31:28]) 
		4'b1100: begin 
		readRegisterRT=instruction[27:21]; 
		readRegisterRA=instruction[20:14];
		readRegisterRB=instruction[13:7];
		readRegisterRC=instruction[6:0];
		isFour=1;
		opcode_found=1;					  
		useRA=1;
		useRB=1;
		useRC=1; 	 
		unitID=3;	 
		opcode=58; 
			
	  end 
	  4'b1110: begin //floating multiply and add
		readRegisterRT=instruction[27:21]; 
		readRegisterRA=instruction[20:14];
		readRegisterRB=instruction[13:7];
		readRegisterRC=instruction[6:0];
			useRA=1;
		useRB=1;
		useRC=1; 
		isFour=1;
		opcode_found=1;	
		unitID=3; 
		opcode=62;
		  
		  
	  end 
	  4'b1111: begin //floating multiply and subtract 
		readRegisterRT=instruction[27:21]; 
		readRegisterRA=instruction[20:14];
		readRegisterRB=instruction[13:7];
		readRegisterRC=instruction[6:0]; 
		useRA=1;
		useRB=1;
		useRC=1; 
		isFour=1;
		opcode_found=1; 
		unitID=3; 
		opcode=63; 
	 	  
	end 
	  endcase 
		
		
	end 
if(isSeven==0&&opcode_found==0) begin 
	//case(instruction[31:25])
	if(instruction[31:25]== 7'b0100001) begin 	 //load address 
	imm18=instruction[24:7];
	readRegisterRT=instruction[6:0];
	    useRA=0;
		useRB=0;
		useRC=0;
		unitID=1;
		opcode=43;
		opcode_found=1; 
		isSeven=1; 
	end 
	
	
	//endcase 
		
	end  
	 
	
	
	
 

if(isEight==0&&opcode_found==0) begin 
	case(instruction[31:24])
8'b00011101: begin //add halfword-immediate
	    imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;	  
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;
		opcode=6;
		
end   	 
8'b00011100: begin //add word immediate 
	   imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;  
		unitID=1; 
		opcode=8;
	
	
end    
8'b00001101: begin 	//subtract from halfword immediate
	   imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;
		useRA=1;
		useRB=0;
		useRC=0; 
		unitID=1;
		opcode=10;
	
end  
8'b00001100: begin //subtract from word immediate
   	imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;  
		opcode=12;
	
end 	  
8'b00010101: begin //and halfword immediate
	    imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;
		opcode=17;
		
	
end
8'b00010100: begin 	 //and word immediate 
	  imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;  
		opcode=18; 
		
	
end  
8'b00000101: begin  //or halfword immediate 
	   imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;
		opcode=21;
	
end    
8'b00000100: begin //or word immediate
        imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;
		useRA=1;
		useRB=0;
		useRC=0; 
		unitID=1; 
		opcode=22;
	
	
end

8'b01000101: begin //exclusive or halfword immediate  
	 imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;  
		unitID=1;  
		opcode=24;
	
end
8'b01000100: begin //exclusive or word immediate 
	 imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;
		useRA=1;
		useRB=0;
		useRC=0;	
		unitID=1;
		opcode=25;
		
end   
8'b01111101: begin 	//compare equal halfword immediate 
	    imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1; 
		opcode=29;
end 	
8'b01111100: begin //compare equal word immediate 
	  imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1; 
		opcode=31;
	
end 
8'b01001101: begin //compare greater than halfword immediate
	  imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;  
		opcode=33;
	
end   
8'b01001100: begin //compare greater than word immediate 
	  imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;
		useRA=1;
		useRB=0;
		useRC=0;  
		unitID=1; 
		opcode=35;
	
end 
8'b01011101: begin //Compare Logical Greater Than Halfword Immediate
	 imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;
		opcode=37; 
	
end	
8'b01011100: begin //compare logical greater than word immediate
	 imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEight=1;
		useRA=1;
		useRB=0;
		useRC=0;  
		unitID=1;  
		opcode=39;
	
	
	
end	
8'b00010110: begin  //and byte immediate 
	 imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;
		opcode=45;
	
end  
8'b01110100: begin //multiply immediate
	 imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;
		opcode=56;
	
	
end 
8'b01110101: begin 	//multiply unsigned immediate
	 imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;
		opcode=57;
	
end
8'b01111110: begin //Compare Equal Byte Immediate
       imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=1;
		opcode=69;
	
end 
8'b00110100: begin //load quadword d form  
        imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=6;	 
		opcode=82;
	
end 
8'b00100100: begin //store quadword d form 
	   imm10=instruction[23:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEight=1;	
		useRA=1;
		useRB=0;
		useRC=0;	
		unitID=6; 
		opcode=84;
	
end 
	
	endcase 
 
end 

if(isNine==0&opcode_found==0) begin 
	case(instruction[31:23]) //immediate load halfowrd
	9'b010000011: begin 
	imm16=instruction[22:7];  // imm16=instruction[24:9];  befort]
		readRegisterRT=instruction[6:0]; // readRegisterRT=instruction[6:0];  (before)
	    useRA=0;
		useRB=0;
		useRC=0;
		unitID=1;	
		isNine=1;
		opcode_found=1;	
		opcode=40;
		
	end
	9'b010000010: begin 	 //immediate load halfword upper
	imm16=instruction[22:7];  // imm16=instruction[24:9];  befort]
		readRegisterRT=instruction[6:0]; // readRegisterRT=instruction[6:0];  (before) 
	    useRA=0;
		useRB=0;
		useRC=0;
		unitID=1; 
		isNine=1;
		opcode_found=1;	
		opcode=41;
		
	end  
	9'b010000001: begin   //immediate load word 
	imm16=instruction[22:7];  // imm16=instruction[24:9];  befort]
		readRegisterRT=instruction[6:0]; // readRegisterRT=instruction[6:0];  (before)
	    useRA=0;
		useRB=0;
		useRC=0;
		unitID=1;
		isNine=1;
		opcode_found=1;	  
		opcode=42;
	end  
	9'b011000001: begin //immdiate or halfword lower
	 imm16=instruction[22:7];  // imm16=instruction[24:9];  befort]
		readRegisterRT=instruction[6:0]; // readRegisterRT=instruction[6:0];  (before)
	    useRA=0;
		useRB=0;
		useRC=0;	
		unitID=1; 
		isNine=1;
		opcode_found=1;	
		opcode=44;
	end 
	/*9'b001100001: begin //load quadword a form 
		
	    imm16=instruction[24:9]; 
	    readRegisterRT=instruction[31:25];
	    useRA=0;
		useRB=0;
		useRC=0;
		unitID=6;
		isNine=1;
		opcode_found=1;
		
	end */ 
	9'b001000010: begin   //branch if not zero 
	    imm16=instruction[22:7];  // imm16=instruction[24:9];  befort]
		readRegisterRT=instruction[6:0]; // readRegisterRT=instruction[6:0];  (before)
	    useRA=0;
		useRB=0;
		useRC=0;	
		unitID=7; 
		isNine=1;
		opcode_found=1;	 
		opcode=86;
		
	end   
	9'b001000110: begin //branch if not zero halfword 
		imm16=instruction[22:7];  // imm16=instruction[24:9];  befort]
		readRegisterRT=instruction[6:0]; // readRegisterRT=instruction[6:0];  (before)
	    useRA=0;
		useRB=0;
		useRC=0;
		unitID=7; 	
		isNine=1;
		opcode_found=1;	 
		opcode=87;
		
		
	end  
	9'b001000000: begin  //branch if zero word 
	    imm16=instruction[22:7];  // imm16=instruction[24:9];  befort]
		readRegisterRT=instruction[6:0]; // readRegisterRT=instruction[6:0];  (before)
	    useRA=0;
		useRB=0;
		useRC=0;	
		unitID=7; 
		isNine=1;
		opcode_found=1;		 
		opcode=90;
			
		
	end  
	9'b001100000: begin 	  //branch absolute 
		imm16=instruction[22:7];  // imm16=instruction[24:9];  befort]
		readRegisterRT=instruction[6:0]; // readRegisterRT=instruction[6:0];  (before)
	    useRA=0;
		useRB=0;
		useRC=0;	
		unitID=7; 	
		isNine=1;
		opcode_found=1;
		opcode=91;
			
		
		
	end   
	9'b001100100: begin    //branch relative 
	    imm16=instruction[22:7];  // imm16=instruction[24:9];  befort]
		readRegisterRT=instruction[6:0]; // readRegisterRT=instruction[6:0];  (before)
	    useRA=0;
		useRB=0;
		useRC=0;
		unitID=7; 
		isNine=1;
		opcode_found=1;	
		opcode=93;
		
	end 
	
	endcase 
	
end 

if(isEleven==0&&opcode_found==0) begin 
	case(instruction[31:21])  //add halfword 
	11'b00011001000: begin 
		readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;  
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=1; 
		opcode=5; 
		
	end  
	11'b00011000000: begin //add word 
		readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=1;
		opcode=7;
		
		
	end 
	11'b00001001000: begin //subtract from halfword 
	   readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;  
		unitID=1; 
		opcode=9;
	end 
  11'b00001000000: begin //subtract from word  
	    readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1; 
		useRA=1;
		useRB=1;
		useRC=0;  
		unitID=1; 
		opcode=11;
	  
  end 
  11'b00011000010: begin   //carry generate
	   readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=1; 
		opcode=13;
	  
  end 
  11'b01010100101: begin //count leading zeross 
	  	readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=1;
		opcode=14;
	  
  end 
  11'b00011000001:	begin  //and 
  	   readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1; 
		useRA=1;
		useRB=1;
		useRC=0;	
		unitID=1; 
		opcode=15;
	end 	
	11'b01011000001: begin //and with compliment  
		 readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1; 
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=1;  
		opcode=16;
		
	end 
	
	11'b00001000001: begin //or
	    readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEleven=1; 
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=1; 
		opcode=19;
		
		
	end  
	
	11'b01011001001: begin 	//or with compliment 
		readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;  
		useRA=1;
		useRB=1;
		useRC=0;  
		unitID=1;  
		opcode=20;
		
	
		end 
  	11'b01001000001: begin 	 //exclusive OR 
		readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;  
		useRA=1;
		useRB=1;
		useRC=0;  
		unitID=1;
		opcode=23;
		  
		  
		  
     end  
	 
11'b00011001001: begin //nand 
	 readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1; 
		useRA=1;
		useRB=1;
		useRC=0;  
		unitID=1; 
		opcode=26;
	
	
end   

11'b00001001001: begin  //nor  
	  readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;   
		useRA=1;
		useRB=1;
		useRC=0; 
		unitID=1;
		opcode=27;
	
end
11'b01111001000: begin //compare equal halfword 
	   readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;  
		unitID=1;	
		opcode=28;
	
end 
11'b01111000000: begin //compare equal word
	  readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1; 
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=1; 
		opcode=30;
	
end 
11'b01001001000: begin //compare greater than halfword 
	 readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;	 
		unitID=1;	  
		opcode=32;
	
	
end

11'b01001000000: begin 	 //compare greater than word 
	readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;	
		unitID=1;
		opcode=34;
	
end
11'b01011001000: begin //compare logical greater than halfword
	    readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=1;
		opcode=36;
end 
11'b01011000000: begin 	//Compare Logical Greater Than Word
	readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		isEleven=1; 
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=1;	 
		opcode=38;
	
end  
11'b00001011111: begin //shift left halfword 
	    readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
	   useRA=1;
		useRB=1;
		useRC=0;
		unitID=2;
		opcode=46;
	
end 
11'b00001111111: begin //shift left halfword immediate
		//readRegisterRB=instruction[17:11]; 
		imm7=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0;
		useRC=0;
		
		unitID=2;
		opcode=47; 
end 
11'b00001011011: begin  //shift left word  
	    readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=2; 
		opcode=48;
	
	
end 
11'b00001111011: begin 	//shift left word immediate
	// readRegisterRB=instruction[17:11];   
	    imm7=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1; 
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=2;
		opcode=49;
	
end 
11'b00001011100: begin  //rotate halfword
	   readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1; 
		useRA=1;
		useRB=1;
		useRC=0;	
		unitID=2; 
		opcode=50;
end 
11'b00001111100: begin //rotate halfword immediate 
	//readRegisterRB=instruction[17:11];
	   imm7=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=2;  
		opcode=51; 
	
end  
11'b00001011000: begin //rotate word 
	   readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=2;  
		opcode=52; 
	
	
end  
11'b00001111000: begin 	//rotate word immediate
   //readRegisterRB=instruction[17:11]; 
        imm7=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0;
		useRC=0;  
		unitID=2; 
		opcode=53;
	
end	
11'b01111000100: begin //multiply 
	   readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEleven=1; 
		useRA=1;
		useRB=1;
		useRC=0; 
		unitID=3; 
		opcode=54; 
	
end 
11'b01111001100: begin 	//multiply unsigned
       readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1; 
		useRA=1;
		useRB=1;
		useRC=0;	
		unitID=3;  
		opcode=55;
		
	
end 
11'b01011000100: begin //floating add
    readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=3; 
		opcode=59;
	
end 
11'b01011000101: begin 	 //floating subtract 
 readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0; 
		unitID=3; 
		opcode=60;
		
	
end 
11'b01011000110: begin 	//floating multiply 
       readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;	
		useRA=1;
		useRB=1;
		useRC=0;  
		unitID=3;	 
		opcode=61; 
	
end 
11'b00011010011: begin 	//average bytes 
        readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=3; 
		opcode=64; 
	
end
11'b01010110100:begin //count ones in bytes register B is not used
        //readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0;
		useRC=0; 
		unitID=3; 
		opcode=65;
	
end 
11'b00001010011: begin 	//absolute differences in bytes
        readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=4;
		opcode=66; 
		
	
end 
11'b01001010011: begin 	//sum bytes into halfwords
readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=4;
		opcode=67;
	
end  
11'b01111010000: begin //compare equal byte 
        readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=4;	
		opcode=68; 
	
end 
11'b00111011011: begin //shift left quadword by bits  
	    readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=5;
		opcode=70;
	
	
end 
11'b00111111011: begin 	  //shift left by quadword immediate 
	// readRegisterRB=instruction[17:11];
	   readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0; //immediate used instead 
		useRC=0;
		unitID=5; 
		opcode=71;
		
	
	
end 
11'b00111011111: begin 	 //shift left quadword bytes
        readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=5; 
		opcode=72;
	
end 
11'b00111111111: begin //Shift Left Quadword by Bytes Immediate	 
	    imm7=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0];  
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0; //immediate used instead 
		useRC=0;	
		unitID=5; 
		opcode=73;
	
	
end 
11'b00111001111: begin 	//Shift Left Quadword by Bytes from Bit Shift Count
	    readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=5;	
		opcode=74; 
	
	
end  
11'b00111011100:begin //rotate quadword by bytes
       readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;		
		unitID=5; 
		opcode=75; 
	
	
end 
11'b00111111100: begin 		//Rotate Quadword by Bytes Immediate  
	    imm7=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0; //immediate used instead 
		useRC=0;		
		unitID=5;  
		opcode=76; 
	
	
end  
11'b00111011000: begin //rotate quadword by bits  
        readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;
		unitID=5;
		opcode=77;
	
	
	
end
11'b00111111000: begin //Rotate Quadword by Bits Immediate
	    imm7=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=1;
		useRC=0;	
		unitID=5;
		opcode=78; 
	
	
	
end 
11'b00110110010: begin 	//gather bits from bytes 
       // readRegisterRB=instruction[17:11]; 
		//readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0;
		useRC=0;
		unitID=5;
		opcode=79;
	
end  
11'b00110110001: begin 	 //Gather Bits from Halfwords
	   // readRegisterRB=instruction[17:11]; 
		//readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0;
		useRC=0;	
		unitID=5;
		opcode=80; 
	
end 	 
11'b00110110000: begin //Gather Bits from Words 
	  // readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0; //immediate used instead 
		useRC=0; 
		unitID=5; 	
		opcode=81; 
		
	
end 	 
11'b00101000100: begin //store quadword x form  
	    readRegisterRB=instruction[22:14];
		readRegisterRA=instruction[13:7];
		readRegisterRT=instruction[6:0]; 
		opcode_found=1;	
		isEleven=1;
		useRA=1;
		useRB=0; //immediate used instead 
		useRC=0;  
		unitID=6;
		opcode=85;
	
end 
11'b00000000001: begin 	//lnop load (odd) 
       useRA=0;
		useRB=0; 
		useRC=0; 
		unitID=0;
		opcode=3;
	
end    
11'b01000000001: begin 	 //nop even 
	   useRA=0;
		useRB=0; 
		useRC=0; 
		unitID=0; 
		readRegisterRT=instruction[6:0]; 	 
		opcode=2;
	
	
end    
11'b00000000000: begin //stop and signal 
	    useRA=0;
		useRB=0; 
		useRC=0; 
		unitID=0; 
		readRegisterRT=instruction[13:0]; //stop and signal type  
		opcode=4;
	
end 



	endcase 
end 
	if (!opcode_found) begin 
		unitID = 0 ;
	end

	if ( unitID == 1 | unitID == 2 | unitID == 3 | unitID == 4 | unitID == 5 ) begin
		isEven = 1; 
	end

	else if ( unitID == 6 | unitID == 7 | unitID == 8)begin
		isEven = 0; 
	end

	if (unitID==1) begin
		regWriteEnable = 1;
	end
	else  begin
		regWriteEnable = 0;
	end
	
end

endmodule
module decoder_test_tb();
logic [31:0] instruction;
logic reset;
 logic [6:0] readRegisterRA,readRegisterRB,readRegisterRC,readRegisterRT,imm7;
 logic [9:0] imm10;
 logic [25:0] imm16;	
 logic [2:0] unitID;
 logic [17:0] imm18;  
 logic useRA,useRB,useRC;   
 
 logic  [3:0] latency;
 //logic [1:0] select_imm; //which imm is being used not sure if needd for forwarding so might not be used 
   
	 
 
 logic isEven;	
 //logic clk;    
  
 logic [31:0] temp; 
 //logic isFour, isSeven, isEight, isNine, isEleven; //will check opcode by size in order    

//logic opcode_found;

new_instruction_decoder dut(instruction,reset,readRegisterRA,readRegisterRB,readRegisterRC,readRegisterRT,useRA,useRB,useRC,imm7, imm10, imm16,imm18,isEven,latency,unitID); 
//initial clk = 0; 
initial reset=1; 

//always #5 clk = ~clk;
initial begin
	//@(posedge clk)
	#5;
	//temp=32'b00010100;
	instruction= {{temp[07:00]},
                       {temp[15:08]},
                       {temp[23:16]},
                       {temp[31:24]}};		
	instruction=32'h16000000 ; //and byte immediate 
	//instruction[23:0]=0;
	
	//@(posedge clk)	
	#5;
	instruction=32'h36200000  ; //gather bits from halfwords 
	//instruction[20:0]=0; 
	 #5;
	//@(posedge clk)	
	
	instruction=32'h41800000 ; //immediate load halfword  
	//instruction[22:0]=0;
	#5;
	//@(posedge clk) 	
	
	instruction=32'hc0000000; //multiply and add 
	//instruction[27:0]=0;  
	#5; 
//@(posedge clk);	 
//@(posedge clk);   
$finish;	
end 
endmodule 


