## Clock signal (Physical Pin)
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clock }];

## Define the clock - Let's try 50 MHz (20ns) for stability
create_clock -period 20.000 -name clock -waveform {0.000 10.000} [get_ports clock]

## Reset Switch
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { reset }];

## IMPORTANT: Tell Vivado NOT to worry about timing for the reset switch
## This often fixes "Hold" issues caused by the tool trying to time a manual switch
set_false_path -from [get_ports reset]
