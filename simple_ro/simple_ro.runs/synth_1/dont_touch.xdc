# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: new/design_1_wrapper.xdc

# Block Designs: bd/design_1/design_1.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1 || ORIG_REF_NAME==design_1} -quiet] -quiet

# IP: bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_processing_system7_0_0 || ORIG_REF_NAME==design_1_processing_system7_0_0} -quiet] -quiet

# IP: bd/design_1/ip/design_1_rst_ps7_0_100M_0/design_1_rst_ps7_0_100M_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_rst_ps7_0_100M_0 || ORIG_REF_NAME==design_1_rst_ps7_0_100M_0} -quiet] -quiet

# IP: bd/design_1/ip/design_1_Arm_Core_axi_periph_0/design_1_Arm_Core_axi_periph_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_Arm_Core_axi_periph_0 || ORIG_REF_NAME==design_1_Arm_Core_axi_periph_0} -quiet] -quiet

# IP: bd/design_1/ip/design_1_LUT6_RO_0_0/design_1_LUT6_RO_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_LUT6_RO_0_0 || ORIG_REF_NAME==design_1_LUT6_RO_0_0} -quiet] -quiet

# IP: bd/design_1/ip/design_1_LUT6_RO_1_0/design_1_LUT6_RO_1_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_LUT6_RO_1_0 || ORIG_REF_NAME==design_1_LUT6_RO_1_0} -quiet] -quiet

# IP: bd/design_1/ip/design_1_LUT6_RO_2_0/design_1_LUT6_RO_2_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_LUT6_RO_2_0 || ORIG_REF_NAME==design_1_LUT6_RO_2_0} -quiet] -quiet

# IP: bd/design_1/ip/design_1_LUT6_RO_3_0/design_1_LUT6_RO_3_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_LUT6_RO_3_0 || ORIG_REF_NAME==design_1_LUT6_RO_3_0} -quiet] -quiet

# IP: bd/design_1/ip/design_1_xbar_0/design_1_xbar_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_xbar_0 || ORIG_REF_NAME==design_1_xbar_0} -quiet] -quiet

# IP: bd/design_1/ip/design_1_AXI4_heater_0_0/design_1_AXI4_heater_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_AXI4_heater_0_0 || ORIG_REF_NAME==design_1_AXI4_heater_0_0} -quiet] -quiet

# IP: bd/design_1/ip/design_1_xadc_wiz_0_1/design_1_xadc_wiz_0_1.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_xadc_wiz_0_1 || ORIG_REF_NAME==design_1_xadc_wiz_0_1} -quiet] -quiet

# IP: bd/design_1/ip/design_1_xlconcat_0_0/design_1_xlconcat_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_xlconcat_0_0 || ORIG_REF_NAME==design_1_xlconcat_0_0} -quiet] -quiet

# IP: bd/design_1/ip/design_1_AXI_counter_0_2/design_1_AXI_counter_0_2.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_AXI_counter_0_2 || ORIG_REF_NAME==design_1_AXI_counter_0_2} -quiet] -quiet

# IP: bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_auto_pc_0 || ORIG_REF_NAME==design_1_auto_pc_0} -quiet] -quiet

# XDC: bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==design_1_processing_system7_0_0 || ORIG_REF_NAME==design_1_processing_system7_0_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: bd/design_1/ip/design_1_rst_ps7_0_100M_0/design_1_rst_ps7_0_100M_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==design_1_rst_ps7_0_100M_0 || ORIG_REF_NAME==design_1_rst_ps7_0_100M_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: bd/design_1/ip/design_1_rst_ps7_0_100M_0/design_1_rst_ps7_0_100M_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==design_1_rst_ps7_0_100M_0 || ORIG_REF_NAME==design_1_rst_ps7_0_100M_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: bd/design_1/ip/design_1_xadc_wiz_0_1/design_1_xadc_wiz_0_1_ooc.xdc

# XDC: bd/design_1/ip/design_1_xadc_wiz_0_1/design_1_xadc_wiz_0_1.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==design_1_xadc_wiz_0_1 || ORIG_REF_NAME==design_1_xadc_wiz_0_1} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0_ooc.xdc

# XDC: bd/design_1/design_1_ooc.xdc
