


module main_TB();

logic clk = 0;
logic reset= 0;
logic PCwrite = 1;
logic select = 0;

reg [31:0] PC;
reg [31:0] JumpPC = 32'd16;
reg[31:0] PC_next =32'd0;
reg [31:0] instruction;





program_counter pc(PC,clk,reset,PCenable);
mux2_to_1_32BIT Jump_or_Pc4(PC_next,PC,JumpPC,select);
instruction_memory insMem(PC_next,Instruction1,Instruction2);


endmodule
