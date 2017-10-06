vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/hdl/design_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

