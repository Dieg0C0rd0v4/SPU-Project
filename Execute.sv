
module Execute(readDataRA_EX,readDataRB_EX,readDataRC_EX,control_EX,opcode,
	       result_EX                                                   );

//Jump Branch datapath 
input [127:0] readDataRA_EX; 
input [127:0] readDataRB_EX;
input [127:0] readDataRC_EX;
input [3:0]   control_EX;
input [10:0]  opcode; 


output [127:0] result_EX; //perhaps not needed, if we have 

logic         result;
logic [127:0] RT;
logic [127:0] RA;
logic [127:0] RB; 
logic [127:0] RC; 


assign result_EX     = RT; 
assign readDataRA_EX = RA; 
assign readDataRB_EX = RB; 
assign readDataRC_EX = RC; 


always_comb begin
	case(opcode) 
		11'b00011001000: begin 
		
			RT[0+:16] = RA[0+:16]+RB[0+:16]; //bytes 0 and 1
			RT[16+:16]=RA[16+:16]+RB[16+:16]; //bytes 2 and 3
			RT[32+:16]=RA[32+:16]+RB[32+:16]; //bytes 4 and 5
			RT[48+:16]=RA[48+:16]+RB[48+:16]; //bytes 6 and 7
			RT[64+:16]=RA[64+:16]+RB[64+:16]; //bytes 8 and 9 
			RT[80+:16]=RA[80+:16]+RB[80+:16]; //bytes 10 and 11 
			RT[96+:16]=RA[96+:16]+RB[96+:16]; //bytes 12 and 13
			RT[112+:16]=RA[112+:16]+RB[112+:16]; //bytes 14 and 15 

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