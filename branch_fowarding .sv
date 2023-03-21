module branch_fowarding(branch_control, EX_MEM_RegisterRD, IF_ID_RegisterRsA,IF_ID_RegisterRsB,branchselA,branchselB);
input [127:0] IF_ID_RegisterRsA,IF_ID_RegisterRsB,EX_MEM_RegisterRD;
input branch_control; 	
output logic branchselA,branchselB; 
always_comb begin 
	if(EX_MEM_RegisterRD==IF_ID_RegisterRsA&&branch_control) 
		begin 
			 branchselA=1; 		//registerRd is connected to 1 on the mux
		end
	else begin 
		 branchselA=0;
	end 
	if(EX_MEM_RegisterRD==IF_ID_RegisterRsB&branch_control) 
		begin 
			 branchselB=0; //registerRd is connected to 0 on the mux  
		end
	else begin 
		 branchselB=1;
		end 
	
	end 
	//made the two muxes connected slightly differently. 

 endmodule 