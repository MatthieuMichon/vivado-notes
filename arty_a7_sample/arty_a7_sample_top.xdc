set_property -dict {PACKAGE_PIN E3} [get_ports gclk100]
create_clock -period 10 -name gclk100 -add [get_ports gclk100]

set_property -dict {PACKAGE_PIN H5} [get_ports led4]
set_property -dict {PACKAGE_PIN C2} [get_ports rstn]

set_property IOSTANDARD LVCMOS33 [get_ports -filter { LOC =~ IOB_* }]
