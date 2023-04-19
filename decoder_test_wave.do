onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /decoder_test_tb/instr1_id
add wave -noupdate /decoder_test_tb/dut/is_seven_checked
add wave -noupdate /decoder_test_tb/dut/is_nine_checked
add wave -noupdate /decoder_test_tb/dut/is_four_checked
add wave -noupdate /decoder_test_tb/dut/is_even
add wave -noupdate /decoder_test_tb/dut/is_eleven_checked
add wave -noupdate /decoder_test_tb/dut/is_eight_checked
add wave -noupdate /decoder_test_tb/dut/use_RC
add wave -noupdate /decoder_test_tb/dut/use_RB
add wave -noupdate /decoder_test_tb/dut/use_RA
add wave -noupdate /decoder_test_tb/dut/unit_id
add wave -noupdate /decoder_test_tb/dut/reset
add wave -noupdate /decoder_test_tb/dut/opcode_found
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 231
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
WaveRestoreZoom {4 ps} {27 ps}
