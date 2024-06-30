quit -sim

# compile our VHDL file
vcom digital_clock.vhd

# start the simulation - set timescale to nanoseconds
vsim -t ns digital_clock

add wave -divider Inputs:
add wave clk resetn SetTime SetHour SetMinute SetMSD SetLSD


add wave -divider Outputs:
add wave clk_1s counter_hour counter_minute counter_second hour_out_msd hour_out_lsd min_out_msd min_out_lsd sec_out_msd sec_out_lsd HMSD HLSD MMSD MLSD SMSD SLSD

force SetTime 0
force clk 0, 1 10ns -r 20ns
force resetn 0
run 30ns

force resetn 1
run 30ns

force SetTime 1
force SetHour 1
run 20ns

force SetHour 0
force SetMinute 0 

run 20ns
force SetHour 1
force SetMSD "0001"
force SetLSD "0111"

run 60ns
force SetHour 0
force SetMSD "0000"
force SetLSD "0000"
force SetMSD "0011"
force SetLSD "1011"
run 40ns


run 40ns
force SetMinute 1
force SetMSD "0011"
force SetLSD "1011"
run 40ns

force SetMinute 0
force SetTime 0
force SetMSD "0000"
force SetLSD "0000"
run 20ns
force clk 0, 1 10ns -r 20ns

# run
run 400000ns