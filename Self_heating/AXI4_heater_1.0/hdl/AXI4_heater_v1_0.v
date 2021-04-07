
`timescale 1 ns / 1 ps

	module AXI4_heater_v1_0 #
	(
		// Users to add parameters here
        parameter SIZE = 45,
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 6
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
	AXI4_heater_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) AXI4_heater_v1_0_S00_AXI_inst (
	    .slv_reg0_out(slv_out[C_S00_AXI_DATA_WIDTH - 1:0]),
	    .slv_reg1_out(slv_out[2*C_S00_AXI_DATA_WIDTH - 1:C_S00_AXI_DATA_WIDTH]),
	    .slv_reg2_out(slv_out[3*C_S00_AXI_DATA_WIDTH - 1:2*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg3_out(slv_out[4*C_S00_AXI_DATA_WIDTH - 1:3*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg4_out(slv_out[5*C_S00_AXI_DATA_WIDTH - 1:4*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg5_out(slv_out[6*C_S00_AXI_DATA_WIDTH - 1:5*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg6_out(slv_out[7*C_S00_AXI_DATA_WIDTH - 1:6*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg7_out(slv_out[8*C_S00_AXI_DATA_WIDTH - 1:7*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg8_out(slv_out[9*C_S00_AXI_DATA_WIDTH - 1:8*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg9_out(slv_out[10*C_S00_AXI_DATA_WIDTH - 1:9*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg10_out(slv_out[11*C_S00_AXI_DATA_WIDTH - 1:10*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg11_out(slv_out[12*C_S00_AXI_DATA_WIDTH - 1:11*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg12_out(slv_out[13*C_S00_AXI_DATA_WIDTH - 1:12*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg13_out(slv_out[14*C_S00_AXI_DATA_WIDTH - 1:13*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg14_out(slv_out[15*C_S00_AXI_DATA_WIDTH - 1:14*C_S00_AXI_DATA_WIDTH]),
	    .slv_reg15_out(slv_out[16*C_S00_AXI_DATA_WIDTH - 1:15*C_S00_AXI_DATA_WIDTH]),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here
	wire [16 * C_S00_AXI_DATA_WIDTH - 1:0] slv_out;
	wire [16*SIZE - 1:0] w;
    generate
    genvar i;
    genvar j;
    for (i=0; i<SIZE; i=i+1) 
    begin : SHE_16
    for (j=0; j<16; j=j+1)
    begin : SHE
        (*DONT_TOUCH= "true"*) LUT6_SHE SHE(.control(slv_out[i]),
                                            .in_clk(w[i+j]),
                                            .feedback(w[i+j]));
    end
    end
    endgenerate
	// User logic ends

	endmodule
