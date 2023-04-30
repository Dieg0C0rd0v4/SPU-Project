onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /main_cpu/clk
add wave -noupdate /main_cpu/reset
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ID1
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_REG1
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_EX1
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST21
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST31
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST41
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST51
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST61
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST71
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_WB1
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ID2
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_REG2
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_EX2
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST22
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST32
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST42
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST52
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST62
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_ST72
add wave -noupdate -group WriteEnable /main_cpu/regWriteEnable_WB2
add wave -noupdate -group Opcode /main_cpu/opcode_ID1
add wave -noupdate -group Opcode /main_cpu/opcode_REG1
add wave -noupdate -group Opcode /main_cpu/opcode_EX1
add wave -noupdate -group Opcode /main_cpu/opcode_ID2
add wave -noupdate -group Opcode /main_cpu/opcode_REG2
add wave -noupdate -group Opcode /main_cpu/opcode_EX2
add wave -noupdate -group UnitID /main_cpu/unitID_ID1
add wave -noupdate -group UnitID /main_cpu/unitID_REG1
add wave -noupdate -group UnitID /main_cpu/unitID_EX1
add wave -noupdate -group UnitID /main_cpu/unitID_ST21
add wave -noupdate -group UnitID /main_cpu/unitID_ST31
add wave -noupdate -group UnitID /main_cpu/unitID_ST41
add wave -noupdate -group UnitID /main_cpu/unitID_ST51
add wave -noupdate -group UnitID /main_cpu/unitID_ST61
add wave -noupdate -group UnitID /main_cpu/unitID_ST71
add wave -noupdate -group UnitID /main_cpu/unitID_WB1
add wave -noupdate -group UnitID /main_cpu/unitID_ID2
add wave -noupdate -group UnitID /main_cpu/unitID_REG2
add wave -noupdate -group UnitID /main_cpu/unitID_EX2
add wave -noupdate -group UnitID /main_cpu/unitID_ST22
add wave -noupdate -group UnitID /main_cpu/unitID_ST32
add wave -noupdate -group UnitID /main_cpu/unitID_ST42
add wave -noupdate -group UnitID /main_cpu/unitID_ST52
add wave -noupdate -group UnitID /main_cpu/unitID_ST62
add wave -noupdate -group UnitID /main_cpu/unitID_ST72
add wave -noupdate -group UnitID /main_cpu/unitID_WB2
add wave -noupdate -group Latency /main_cpu/latency_ID1
add wave -noupdate -group Latency /main_cpu/latency_EX1
add wave -noupdate -group Latency /main_cpu/latency_ST21
add wave -noupdate -group Latency /main_cpu/latency_ST31
add wave -noupdate -group Latency /main_cpu/latency_ST41
add wave -noupdate -group Latency /main_cpu/latency_ST51
add wave -noupdate -group Latency /main_cpu/latency_ST61
add wave -noupdate -group Latency /main_cpu/latency_ST71
add wave -noupdate -group Latency /main_cpu/latency_WB1
add wave -noupdate -group Latency /main_cpu/latency_ID2
add wave -noupdate -group Latency /main_cpu/latency_EX2
add wave -noupdate -group Latency /main_cpu/latency_ST22
add wave -noupdate -group Latency /main_cpu/latency_ST32
add wave -noupdate -group Latency /main_cpu/latency_ST42
add wave -noupdate -group Latency /main_cpu/latency_ST52
add wave -noupdate -group Latency /main_cpu/latency_ST62
add wave -noupdate -group Latency /main_cpu/latency_ST72
add wave -noupdate -group Latency /main_cpu/latency_WB2
add wave -noupdate -expand -group {Instructions Fecth} /main_cpu/instruction1_IF
add wave -noupdate -expand -group {Instructions Fecth} /main_cpu/instruction1_ID
add wave -noupdate -expand -group {Instructions Fecth} /main_cpu/instruction2_IF
add wave -noupdate -expand -group {Instructions Fecth} /main_cpu/instruction2_ID
add wave -noupdate -group {Control Signals} /main_cpu/flushOdd
add wave -noupdate -group {Control Signals} /main_cpu/stall_IF_ID
add wave -noupdate -group {Control Signals} /main_cpu/routeControlStall
add wave -noupdate -group {Control Signals} /main_cpu/forwControlStall
add wave -noupdate -group {Control Signals} /main_cpu/enablePC
add wave -noupdate -group {Control Signals} /main_cpu/branchTarget
add wave -noupdate -group {Control Signals} /main_cpu/branch_PC1
add wave -noupdate -group {Control Signals} /main_cpu/branch_PC2
add wave -noupdate -group Registers /main_cpu/readRegisterRA_ID1
add wave -noupdate -group Registers /main_cpu/readRegisterRA_REG1
add wave -noupdate -group Registers /main_cpu/readRegisterRA_EX1
add wave -noupdate -group Registers /main_cpu/readRegisterRA_ID2
add wave -noupdate -group Registers /main_cpu/readRegisterRA_REG2
add wave -noupdate -group Registers /main_cpu/readRegisterRA_EX2
add wave -noupdate -group Registers /main_cpu/readRegisterRB_ID1
add wave -noupdate -group Registers /main_cpu/readRegisterRB_REG1
add wave -noupdate -group Registers /main_cpu/readRegisterRB_EX1
add wave -noupdate -group Registers /main_cpu/readRegisterRB_ID2
add wave -noupdate -group Registers /main_cpu/readRegisterRB_REG2
add wave -noupdate -group Registers /main_cpu/readRegisterRB_EX2
add wave -noupdate -group Registers /main_cpu/readRegisterRC_ID1
add wave -noupdate -group Registers /main_cpu/readRegisterRC_REG1
add wave -noupdate -group Registers /main_cpu/readRegisterRC_EX1
add wave -noupdate -group Registers /main_cpu/readRegisterRC_ID2
add wave -noupdate -group Registers /main_cpu/readRegisterRC_REG2
add wave -noupdate -group Registers /main_cpu/readRegisterRC_EX2
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ID1
add wave -noupdate -group Registers /main_cpu/readRegisterRT_REG1
add wave -noupdate -group Registers /main_cpu/readRegisterRT_EX1
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST21
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST31
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST41
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST51
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST61
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST71
add wave -noupdate -group Registers /main_cpu/readRegisterRT_WB1
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ID2
add wave -noupdate -group Registers /main_cpu/readRegisterRT_REG2
add wave -noupdate -group Registers /main_cpu/readRegisterRT_EX2
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST22
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST32
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST42
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST52
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST62
add wave -noupdate -group Registers /main_cpu/readRegisterRT_ST72
add wave -noupdate -group Registers /main_cpu/readRegisterRT_WB2
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRA_REG1
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRA_EX1
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRA_REG2
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRA_EX2
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRB_REG1
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRB_EX1
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRB_REG2
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRB_EX2
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_REG1
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_EX1
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_REG2
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_EX2
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_ST22
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_ST32
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_ST42
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_ST52
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_ST62
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_ST72
add wave -noupdate -expand -group {Registers Data} /main_cpu/readDataRC_WB2
add wave -noupdate -expand -group Results /main_cpu/writeData_WB1
add wave -noupdate -expand -group Results /main_cpu/writeData_WB2
add wave -noupdate -expand -group Results /main_cpu/result_EX1
add wave -noupdate -expand -group Results /main_cpu/result_ST21
add wave -noupdate -expand -group Results /main_cpu/result_ST31
add wave -noupdate -expand -group Results /main_cpu/result_ST41
add wave -noupdate -expand -group Results /main_cpu/result_ST51
add wave -noupdate -expand -group Results /main_cpu/result_ST61
add wave -noupdate -expand -group Results /main_cpu/result_ST71
add wave -noupdate -expand -group Results /main_cpu/result_WB1
add wave -noupdate -expand -group Results /main_cpu/result_EX2
add wave -noupdate -expand -group Results /main_cpu/result_ST22
add wave -noupdate -expand -group Results /main_cpu/result_ST32
add wave -noupdate -expand -group Results /main_cpu/result_ST42
add wave -noupdate -expand -group Results /main_cpu/result_ST52
add wave -noupdate -expand -group Results /main_cpu/result_ST62
add wave -noupdate -expand -group Results /main_cpu/result_ST72
add wave -noupdate -expand -group Results /main_cpu/result_WB2
add wave -noupdate /main_cpu/memoryData_ST72
add wave -noupdate /main_cpu/LSA_EX1
add wave -noupdate /main_cpu/LSA_EX2
add wave -noupdate /main_cpu/LSA_ST22
add wave -noupdate /main_cpu/LSA_ST32
add wave -noupdate /main_cpu/LSA_ST42
add wave -noupdate /main_cpu/LSA_ST52
add wave -noupdate /main_cpu/LSA_ST62
add wave -noupdate /main_cpu/LSA_ST72
add wave -noupdate /main_cpu/LSA_STWB
add wave -noupdate /main_cpu/forwardDataRA_ID1
add wave -noupdate /main_cpu/forwardDataRA_REG1
add wave -noupdate /main_cpu/forwardDataRA_EX1
add wave -noupdate /main_cpu/forwardDataRA_ID2
add wave -noupdate /main_cpu/forwardDataRA_REG2
add wave -noupdate /main_cpu/forwardDataRA_EX2
add wave -noupdate /main_cpu/forwardDataRB_ID1
add wave -noupdate /main_cpu/forwardDataRB_REG1
add wave -noupdate /main_cpu/forwardDataRB_EX1
add wave -noupdate /main_cpu/forwardDataRB_ID2
add wave -noupdate /main_cpu/forwardDataRB_REG2
add wave -noupdate /main_cpu/forwardDataRB_EX2
add wave -noupdate /main_cpu/forwardDataRC_ID1
add wave -noupdate /main_cpu/forwardDataRC_REG1
add wave -noupdate /main_cpu/forwardDataRC_EX1
add wave -noupdate /main_cpu/forwardDataRC_ID2
add wave -noupdate /main_cpu/forwardDataRC_REG2
add wave -noupdate /main_cpu/forwardDataRC_EX2
add wave -noupdate /main_cpu/selectForwardRA_ID1
add wave -noupdate /main_cpu/selectForwardRA_REG1
add wave -noupdate /main_cpu/selectForwardRA_EX1
add wave -noupdate /main_cpu/selectForwardRA_ID2
add wave -noupdate /main_cpu/selectForwardRA_REG2
add wave -noupdate /main_cpu/selectForwardRA_EX2
add wave -noupdate /main_cpu/selectForwardRB_ID1
add wave -noupdate /main_cpu/selectForwardRB_REG1
add wave -noupdate /main_cpu/selectForwardRB_EX1
add wave -noupdate /main_cpu/selectForwardRB_ID2
add wave -noupdate /main_cpu/selectForwardRB_REG2
add wave -noupdate /main_cpu/selectForwardRB_EX2
add wave -noupdate /main_cpu/selectForwardRC_ID1
add wave -noupdate /main_cpu/selectForwardRC_REG1
add wave -noupdate /main_cpu/selectForwardRC_EX1
add wave -noupdate /main_cpu/selectForwardRC_ID2
add wave -noupdate /main_cpu/selectForwardRC_REG2
add wave -noupdate /main_cpu/selectForwardRC_EX2
add wave -noupdate /main_cpu/operandA1
add wave -noupdate /main_cpu/operandB1
add wave -noupdate /main_cpu/operandC1
add wave -noupdate /main_cpu/operandA2
add wave -noupdate /main_cpu/operandB2
add wave -noupdate /main_cpu/operandC2
add wave -noupdate /main_cpu/immediate7BIT_ID1
add wave -noupdate /main_cpu/immediate7BIT_REG1
add wave -noupdate /main_cpu/immediate7BIT_EX1
add wave -noupdate /main_cpu/immediate7BIT_ID2
add wave -noupdate /main_cpu/immediate7BIT_REG2
add wave -noupdate /main_cpu/immediate7BIT_EX2
add wave -noupdate /main_cpu/immediate10BIT_ID1
add wave -noupdate /main_cpu/immediate10BIT_REG1
add wave -noupdate /main_cpu/immediate10BIT_EX1
add wave -noupdate /main_cpu/immediate10BIT_ID2
add wave -noupdate /main_cpu/immediate10BIT_REG2
add wave -noupdate /main_cpu/immediate10BIT_EX2
add wave -noupdate /main_cpu/immediate16BIT_ID1
add wave -noupdate /main_cpu/immediate16BIT_REG1
add wave -noupdate /main_cpu/immediate16BIT_EX1
add wave -noupdate /main_cpu/immediate16BIT_ID2
add wave -noupdate /main_cpu/immediate16BIT_REG2
add wave -noupdate /main_cpu/immediate16BIT_EX2
add wave -noupdate /main_cpu/immediate18BIT_ID1
add wave -noupdate /main_cpu/immediate18BIT_REG1
add wave -noupdate /main_cpu/immediate18BIT_EX1
add wave -noupdate /main_cpu/immediate18BIT_ID2
add wave -noupdate /main_cpu/immediate18BIT_REG2
add wave -noupdate /main_cpu/immediate18BIT_EX2
add wave -noupdate /main_cpu/branchFlag
add wave -noupdate /main_cpu/flush
add wave -noupdate /main_cpu/useRA_ID1
add wave -noupdate /main_cpu/useRB_ID1
add wave -noupdate /main_cpu/useRC_ID1
add wave -noupdate /main_cpu/isEven1
add wave -noupdate /main_cpu/useRA_ID2
add wave -noupdate /main_cpu/useRB_ID2
add wave -noupdate /main_cpu/useRC_ID2
add wave -noupdate /main_cpu/isEven2
add wave -noupdate /main_cpu/branchOutcome
add wave -noupdate /main_cpu/flushEven
add wave -noupdate /main_cpu/stall
add wave -noupdate /main_cpu/branch_flag1
add wave -noupdate /main_cpu/branch_flag2
add wave -noupdate /main_cpu/regOrMem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {132 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 292
configure wave -valuecolwidth 133
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
WaveRestoreZoom {0 ps} {1346 ps}
