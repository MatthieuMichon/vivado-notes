read_vhdl -vhdl2008 ./arty_a7_sample_top.vhdl
read_xdc ./arty_a7_sample_top.xdc

synth_design -top arty_a7_sample_top -part xc7a35ticsg324-1L
opt_design
place_design
phys_opt_design -placement_opt
route_design
phys_opt_design -routing_opt
write_bitstream -force -file arty_a7_sample_top.bit
open_hw
connect_hw_server
open_hw_target
set_property PROGRAM.FILE ./arty_a7_sample_top.bit [lindex [get_hw_devices] 0]
program_hw_devices [lindex [get_hw_devices] 0]
