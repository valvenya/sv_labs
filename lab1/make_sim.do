vlib work

vlog -sv rtl/serializer.sv
vlog -sv tb/test.sv

vsim -novopt test
add log -r /*
add wave -r -ports *
run -all