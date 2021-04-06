<<<<<<< HEAD
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets {design_1_i/LUT6_RO_0/inst/w[0]}]

create_pblock RO_1
resize_pblock [get_pblocks RO_1] -add {SLICE_X44Y50:SLICE_X45Y74}
set_property IS_SOFT TRUE [get_pblocks RO_1]


create_pblock RO2
add_cells_to_pblock [get_pblocks RO2] [get_cells -quiet [list design_1_i/LUT6_RO_0]]
resize_pblock [get_pblocks RO2] -add {SLICE_X46Y50:SLICE_X47Y74}
=======
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets design_1_i/Ring_Oscillator/inst/w[150]]

create_pblock Ring_Oscillator
add_cells_to_pblock [get_pblocks Ring_Oscillator] [get_cells -quiet [list design_1_i/Ring_Oscillator]]
resize_pblock [get_pblocks Ring_Oscillator] -add {SLICE_X50Y50:SLICE_X67Y74}
resize_pblock [get_pblocks Ring_Oscillator] -add {RAMB18_X3Y20:RAMB18_X3Y29}
resize_pblock [get_pblocks Ring_Oscillator] -add {RAMB36_X3Y10:RAMB36_X3Y14}
create_pblock Counter
add_cells_to_pblock [get_pblocks Counter] [get_cells -quiet [list design_1_i/Frequency_counter_AX_0/inst/frequency_counter_instance_01]]
resize_pblock [get_pblocks Counter] -add {SLICE_X32Y50:SLICE_X51Y74}
resize_pblock [get_pblocks Counter] -add {DSP48_X2Y20:DSP48_X2Y29}
resize_pblock [get_pblocks Counter] -add {RAMB18_X2Y20:RAMB18_X2Y29}
resize_pblock [get_pblocks Counter] -add {RAMB36_X2Y10:RAMB36_X2Y14}
>>>>>>> f3848b29b5d14e8ab23699531079dfde33d4b48f
