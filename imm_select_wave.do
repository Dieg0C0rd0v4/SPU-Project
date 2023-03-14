onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sign_ext_tb/clk
add wave -noupdate -radix hexadecimal /sign_ext_tb/in
add wave -noupdate -radix hexadecimal /sign_ext_tb/out
add wave -noupdate /sign_ext_tb/select
add wave -noupdate -radix hexadecimal /sign_ext_tb/sign_test/imm7
add wave -noupdate -radix hexadecimal /sign_ext_tb/sign_test/imm10
add wave -noupdate -radix hexadecimal /sign_ext_tb/sign_test/imm16
add wave -noupdate -radix hexadecimal /sign_ext_tb/sign_test/imm18
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 296
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
WaveRestoreZoom {18 ps} {104 ps}
