onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Controller /Controller_tb/c/clk
add wave -noupdate -expand -group Controller /Controller_tb/c/reset
add wave -noupdate -expand -group Controller /Controller_tb/c/regWrite_enable
add wave -noupdate -expand -group Controller /Controller_tb/c/regWrite_enable_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/regWrite_enable_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/regWrite_enable_WB
add wave -noupdate -expand -group Controller /Controller_tb/c/regWrite_enable_final
add wave -noupdate -expand -group Controller /Controller_tb/c/mem_to_reg
add wave -noupdate -expand -group Controller /Controller_tb/c/mem_to_reg_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/mem_to_reg_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/mem_to_reg_WB
add wave -noupdate -expand -group Controller /Controller_tb/c/branch
add wave -noupdate -expand -group Controller /Controller_tb/c/branch_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/branch_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/memRead
add wave -noupdate -expand -group Controller /Controller_tb/c/memRead_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/memRead_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/memWrite
add wave -noupdate -expand -group Controller /Controller_tb/c/memWrite_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/memWrite_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/ALU_Source
add wave -noupdate -expand -group Controller /Controller_tb/c/ALU_Source_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/ALU_control
add wave -noupdate -expand -group Controller /Controller_tb/c/ALU_control_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/DestinationRegister
add wave -noupdate -expand -group Controller /Controller_tb/c/DestinationRegister_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/PC_enable
add wave -noupdate -expand -group Controller /Controller_tb/c/immediate_select
add wave -noupdate -expand -group Controller /Controller_tb/c/zero_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/zero_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/PC_source
add wave -noupdate -expand -group Controller /Controller_tb/c/PC_Source_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/Instruction1_IF
add wave -noupdate -expand -group Controller /Controller_tb/c/Instruction2_IF
add wave -noupdate -expand -group Controller /Controller_tb/c/Instruction1_ID
add wave -noupdate -expand -group Controller /Controller_tb/c/Instruction2_ID
add wave -noupdate -expand -group Controller /Controller_tb/c/PCadderOut_IF
add wave -noupdate -expand -group Controller /Controller_tb/c/PC_plusEight_in_ID
add wave -noupdate -expand -group Controller /Controller_tb/c/PC_plusEight_out_ID
add wave -noupdate -expand -group Controller /Controller_tb/c/PC_plusEight_out_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/Jump_PC_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/Jump_PC_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/writeData
add wave -noupdate -expand -group Controller /Controller_tb/c/writeData_WB
add wave -noupdate -expand -group Controller /Controller_tb/c/readDataRB_ID
add wave -noupdate -expand -group Controller /Controller_tb/c/readDataRB_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/readDataRA_ID
add wave -noupdate -expand -group Controller /Controller_tb/c/readDataRA_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/readDataRA_EX2
add wave -noupdate -expand -group Controller /Controller_tb/c/ReadDataRA_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/readDataRC_ID
add wave -noupdate -expand -group Controller /Controller_tb/c/readDataRC_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/RegisterRT_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/RegisterRT_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/registerRT_MEM2
add wave -noupdate -expand -group Controller /Controller_tb/c/RegisterRT_WB
add wave -noupdate -expand -group Controller /Controller_tb/c/RegisterRT
add wave -noupdate -expand -group Controller /Controller_tb/c/immediate_ID
add wave -noupdate -expand -group Controller /Controller_tb/c/immediate_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/DestinationRegister_RT_ID
add wave -noupdate -expand -group Controller /Controller_tb/c/DestinationRegister_RT_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/DestinationRegister_RRR_ID
add wave -noupdate -expand -group Controller /Controller_tb/c/DestinationRegister_RRR_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/ALUResult_EX
add wave -noupdate -expand -group Controller /Controller_tb/c/ALUResult_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/ALUResult_MEM2
add wave -noupdate -expand -group Controller /Controller_tb/c/ALUResult_WB
add wave -noupdate -expand -group Controller /Controller_tb/c/Mem_readData_MEM
add wave -noupdate -expand -group Controller /Controller_tb/c/Mem_readData_WB
add wave -noupdate -expand -group Controller /Controller_tb/c/opcode_RR
add wave -noupdate -expand -group Controller /Controller_tb/c/opcode_RRR
add wave -noupdate -expand -group Controller /Controller_tb/c/opcode_RI7
add wave -noupdate -expand -group Controller /Controller_tb/c/opcode_RI10
add wave -noupdate -expand -group Controller /Controller_tb/c/opcode_RI16
add wave -noupdate -expand -group Controller /Controller_tb/c/opcode_RI18
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/clk
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/reset
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/PC_enable
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/PC_source
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/PC_jump
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/PC_out
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/PC_next
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/instruction1
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/instruction2
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/PC_adderOut
add wave -noupdate -group {Instruction Fetch} -radix hexadecimal /Controller_tb/c/InstructionFetch_IF/PCenable
add wave -noupdate -group IF_ID -radix hexadecimal /Controller_tb/c/if_id/clk
add wave -noupdate -group IF_ID -radix hexadecimal /Controller_tb/c/if_id/reset
add wave -noupdate -group IF_ID -radix hexadecimal /Controller_tb/c/if_id/PC_adderOut
add wave -noupdate -group IF_ID -radix hexadecimal -childformat {{{/Controller_tb/c/if_id/instruction1[31]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[30]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[29]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[28]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[27]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[26]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[25]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[24]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[23]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[22]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[21]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[20]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[19]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[18]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[17]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[16]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[15]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[14]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[13]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[12]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[11]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[10]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[9]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[8]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[7]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[6]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[5]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[4]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[3]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[2]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[1]} -radix hexadecimal} {{/Controller_tb/c/if_id/instruction1[0]} -radix hexadecimal}} -subitemconfig {{/Controller_tb/c/if_id/instruction1[31]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[30]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[29]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[28]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[27]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[26]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[25]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[24]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[23]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[22]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[21]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[20]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[19]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[18]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[17]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[16]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[15]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[14]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[13]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[12]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[11]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[10]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[9]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[8]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[7]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[6]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[5]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[4]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[3]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[2]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[1]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/instruction1[0]} {-height 15 -radix hexadecimal}} /Controller_tb/c/if_id/instruction1
add wave -noupdate -group IF_ID -radix hexadecimal /Controller_tb/c/if_id/instruction2
add wave -noupdate -group IF_ID -radix hexadecimal /Controller_tb/c/if_id/PC_plusEight
add wave -noupdate -group IF_ID -radix hexadecimal -childformat {{{/Controller_tb/c/if_id/first_instruction[31]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[30]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[29]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[28]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[27]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[26]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[25]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[24]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[23]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[22]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[21]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[20]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[19]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[18]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[17]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[16]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[15]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[14]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[13]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[12]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[11]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[10]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[9]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[8]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[7]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[6]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[5]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[4]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[3]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[2]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[1]} -radix hexadecimal} {{/Controller_tb/c/if_id/first_instruction[0]} -radix hexadecimal}} -subitemconfig {{/Controller_tb/c/if_id/first_instruction[31]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[30]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[29]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[28]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[27]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[26]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[25]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[24]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[23]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[22]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[21]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[20]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[19]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[18]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[17]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[16]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[15]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[14]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[13]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[12]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[11]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[10]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[9]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[8]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[7]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[6]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[5]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[4]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[3]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[2]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[1]} {-height 15 -radix hexadecimal} {/Controller_tb/c/if_id/first_instruction[0]} {-height 15 -radix hexadecimal}} /Controller_tb/c/if_id/first_instruction
add wave -noupdate -group IF_ID -radix hexadecimal /Controller_tb/c/if_id/second_instruction
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/clk
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/reset
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/pcpluseight_in
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/instruction
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/registerRT
add wave -noupdate -group InstructionDecoder -radix decimal /Controller_tb/c/InstructionDecoder_id/writeData
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/regWriteEnable
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/immediate_select
add wave -noupdate -group InstructionDecoder -radix binary /Controller_tb/c/InstructionDecoder_id/opcode
add wave -noupdate -group InstructionDecoder -radix hexadecimal -childformat {{{/Controller_tb/c/InstructionDecoder_id/readRegisterRB[6]} -radix hexadecimal} {{/Controller_tb/c/InstructionDecoder_id/readRegisterRB[5]} -radix hexadecimal} {{/Controller_tb/c/InstructionDecoder_id/readRegisterRB[4]} -radix hexadecimal} {{/Controller_tb/c/InstructionDecoder_id/readRegisterRB[3]} -radix hexadecimal} {{/Controller_tb/c/InstructionDecoder_id/readRegisterRB[2]} -radix hexadecimal} {{/Controller_tb/c/InstructionDecoder_id/readRegisterRB[1]} -radix hexadecimal} {{/Controller_tb/c/InstructionDecoder_id/readRegisterRB[0]} -radix hexadecimal}} -subitemconfig {{/Controller_tb/c/InstructionDecoder_id/readRegisterRB[6]} {-height 15 -radix hexadecimal} {/Controller_tb/c/InstructionDecoder_id/readRegisterRB[5]} {-height 15 -radix hexadecimal} {/Controller_tb/c/InstructionDecoder_id/readRegisterRB[4]} {-height 15 -radix hexadecimal} {/Controller_tb/c/InstructionDecoder_id/readRegisterRB[3]} {-height 15 -radix hexadecimal} {/Controller_tb/c/InstructionDecoder_id/readRegisterRB[2]} {-height 15 -radix hexadecimal} {/Controller_tb/c/InstructionDecoder_id/readRegisterRB[1]} {-height 15 -radix hexadecimal} {/Controller_tb/c/InstructionDecoder_id/readRegisterRB[0]} {-height 15 -radix hexadecimal}} /Controller_tb/c/InstructionDecoder_id/readRegisterRB
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/readRegisterRA
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/readRegisterRC
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/readRegisterRT
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/in_7bits
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/in_10bits
add wave -noupdate -group InstructionDecoder -radix decimal /Controller_tb/c/InstructionDecoder_id/in_16bits
add wave -noupdate -group InstructionDecoder -radix decimal /Controller_tb/c/InstructionDecoder_id/in_18bits
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/out
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/pcpluseight_out
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/DestinationRegister_RT
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/DestinationRegister_RRR
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/readDataRB
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/readDataRA
add wave -noupdate -group InstructionDecoder -radix hexadecimal /Controller_tb/c/InstructionDecoder_id/readDataRC
add wave -noupdate -group InstructionDecoder -radix decimal /Controller_tb/c/InstructionDecoder_id/immediate
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/clk
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/reset
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/mem_to_reg_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/regWrite_enable_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/branch_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/memRead_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/memWrite_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/ALUSource_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/DestinationRegister_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/ALUcontrol_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/ReadData1_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/ReadData2_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/ReadData3_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/immediate_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/PC_plusEight_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/DestinationRegister_RT_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/DestinationRegister_RRR_in
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/mem_to_reg_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/regWrite_enable_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/branch_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/memRead_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/memWrite_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/ALUSource_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/DestinationRegister_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/ALUcontrol_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/ReadData1_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/ReadData2_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/ReadData3_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/immediate_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/PC_plusEight_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/DestinationRegister_RT_out
add wave -noupdate -group ID_EX /Controller_tb/c/id_ex/DestinationRegister_RRR_out
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/PC_plusEight
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/immediate
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/ReadData1
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/ReadData2
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/ReadData3
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/DestinationRegister_RT
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/DestinationRegister_RRR
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/DestinationRegister
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/ALUControl
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/ALUSource
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/Jump_add
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/input_ALU_A
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/Jump_PC
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/zero
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/ALUResult
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/ReadData2_out
add wave -noupdate -group Execute /Controller_tb/c/Execute_ex/Register_RT
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/reset
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/clk
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/mem_to_reg_in
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/regWrite_enable_in
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/branch_in
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/memRead_in
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/memWrite_in
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/JumpPC_in
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/zero_in
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/ALUResult_in
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/ReadData2_in
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/RegisterRT_in
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/mem_to_reg_out
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/regWrite_enable_out
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/branch_out
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/memRead_out
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/memWrite_out
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/JumpPC_out
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/zero_out
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/ALUResult_out
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/ReadData2_out
add wave -noupdate -group EX_MEM /Controller_tb/c/ex_mem/RegisterRT_out
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/clk
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/reset
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/branch
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/zero
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/memWrite
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/memRead
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/ALU_Result
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/readData2
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/registerRT_in
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/PC_Source
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/Mem_readData
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/ALUResult_WB
add wave -noupdate -group Memory /Controller_tb/c/Memory_mem/registerRT_out
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/clk
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/reset
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/mem_to_reg_in
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/regWrite_enable_in
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/readData_in
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/ALUResult_in
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/RegisterRT_in
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/mem_to_reg_out
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/regWrite_enable_out
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/readData_out
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/ALUResult_out
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/RegisterRT_out
add wave -noupdate -group {MEM_WB_with WB} /Controller_tb/c/MEM_WB_With_WB/writeData_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {145 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 357
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {204 ps}
