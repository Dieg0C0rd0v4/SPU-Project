onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Main_TB /main_TB/clk
add wave -noupdate -expand -group Main_TB /main_TB/reset
add wave -noupdate -expand -group Main_TB /main_TB/PCwrite
add wave -noupdate -expand -group Main_TB /main_TB/select
add wave -noupdate -expand -group Main_TB -radix decimal /main_TB/PC
add wave -noupdate -expand -group Main_TB -radix decimal /main_TB/JumpPC
add wave -noupdate -expand -group Main_TB -radix decimal /main_TB/PC_next
add wave -noupdate -expand -group Main_TB -radix decimal /main_TB/instruction
add wave -noupdate -group PC /main_TB/pc/clk
add wave -noupdate -group PC /main_TB/pc/reset
add wave -noupdate -group PC /main_TB/pc/PCwrite
add wave -noupdate -group PC /main_TB/pc/PC
add wave -noupdate -group Jump_or_Pc4 /main_TB/Jump_or_Pc4/out
add wave -noupdate -group Jump_or_Pc4 /main_TB/Jump_or_Pc4/inputA
add wave -noupdate -group Jump_or_Pc4 /main_TB/Jump_or_Pc4/inputB
add wave -noupdate -group Jump_or_Pc4 /main_TB/Jump_or_Pc4/sel
add wave -noupdate -expand -group instructionMemory -radix decimal /main_TB/insMem/addr
add wave -noupdate -expand -group instructionMemory -radix hexadecimal /main_TB/insMem/Instruction
add wave -noupdate -expand -group instructionMemory -radix hexadecimal /main_TB/insMem/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {45 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 254
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
WaveRestoreZoom {44 ps} {146 ps}
