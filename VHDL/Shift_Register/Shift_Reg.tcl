transcript off
vcom Shift_Reg.vhd
vcom test_Shift_Reg.vhd

vsim test_Shift_Reg
add wave sim_/test_Shift_Reg/dev_to_test/*

run 350 ns