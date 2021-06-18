vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_7
vlib activehdl/processing_system7_vip_v1_0_9
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_register_slice_v2_1_21
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/axi_data_fifo_v2_1_20
vlib activehdl/axi_crossbar_v2_1_22
vlib activehdl/axi_protocol_converter_v2_1_21

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_7 activehdl/axi_vip_v1_1_7
vmap processing_system7_vip_v1_0_9 activehdl/processing_system7_vip_v1_0_9
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_21 activehdl/axi_register_slice_v2_1_21
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_20 activehdl/axi_data_fifo_v2_1_20
vmap axi_crossbar_v2_1_22 activehdl/axi_crossbar_v2_1_22
vmap axi_protocol_converter_v2_1_21 activehdl/axi_protocol_converter_v2_1_21

vlog -work xilinx_vip  -sv2k12 "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"D:/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"D:/xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_7  -sv2k12 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_9  -sv2k12 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_rst_ps7_0_100M_0/sim/design_1_rst_ps7_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_21  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_20  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_22  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/b68e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_conv_funs_pkg.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_proc_common_pkg.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_ipif_pkg.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_family_support.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_family.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_soft_reset.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/proc_common_v3_30_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_pselect_f.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_address_decoder.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_slave_attachment.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/interrupt_control_v2_01_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_interrupt_control.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_1_xadc_wiz_0_1_axi_lite_ipif.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/design_1_xadc_wiz_0_1_xadc_core_drp.vhd" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/design_1_xadc_wiz_0_1_axi_xadc.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_1/design_1_xadc_wiz_0_1.v" \
"../../../bd/design_1/ipshared/1e76/hdl/AXI_BTI_v1_0_S00_AXI.v" \
"../../../bd/design_1/ipshared/1e76/LUT6_NAND.v" \
"../../../bd/design_1/ipshared/1e76/LUT6_NOT.v" \
"../../../bd/design_1/ipshared/1e76/frequency_counter.v" \
"../../../bd/design_1/ipshared/1e76/hdl/AXI_BTI_v1_0.v" \
"../../../bd/design_1/ip/design_1_AXI_BTI_0_0/sim/design_1_AXI_BTI_0_0.v" \
"../../../bd/design_1/ipshared/8403/hdl/AXI_counter_v1_0_S00_AXI.v" \
"../../../../simple_ro.srcs/sources_1/bd/AppData/Roaming/Xilinx/Vivado/-force/LUT6_NOT.v" \
"../../../bd/design_1/ipshared/8403/src/frequency_counter.v" \
"../../../bd/design_1/ipshared/8403/hdl/one2two.v" \
"../../../bd/design_1/ipshared/8403/hdl/AXI_counter_v1_0.v" \
"../../../bd/design_1/ip/design_1_AXI_RO_0_1/sim/design_1_AXI_RO_0_1.v" \
"../../../bd/design_1/ipshared/308e/hdl/AXI4_heater_v1_0_S00_AXI.v" \
"../../../bd/design_1/ipshared/308e/src/LUT6_SHE.v" \
"../../../bd/design_1/ipshared/308e/hdl/AXI4_heater_v1_0.v" \
"../../../bd/design_1/ip/design_1_AXI4_heater_0_1/sim/design_1_AXI4_heater_0_1.v" \
"../../../bd/design_1/ip/design_1_s00_data_fifo_0/sim/design_1_s00_data_fifo_0.v" \

vlog -work axi_protocol_converter_v2_1_21  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../simple_ro.srcs/sources_1/bd/design_1/ipshared/6b56/hdl" "+incdir+D:/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

