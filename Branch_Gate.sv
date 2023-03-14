
module BranchGate(branch,zero,PC_source);


input branch,zero;
output PC_source;

assign PC_source = branch & zero; 

endmodule

