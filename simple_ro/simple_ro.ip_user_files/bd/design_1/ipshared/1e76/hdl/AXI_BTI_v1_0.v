
`timescale 1 ns / 1 ps

	module AXI_BTI_v1_0 #
	(
		// Users to add parameters here
		parameter num_oscillators = 31,
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 7
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
    wire [31:0] slv_reg_out;
	AXI_BTI_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) AXI_BTI_v1_0_S00_AXI_inst (
	    .frequency_counter_out(frequency_counter_wire),
	    .slv_reg0_out(slv_reg_out),
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
	(*DONT_TOUCH= "true"*) wire [num_oscillators*4-1 : 0] w;
    (*DONT_TOUCH= "true"*) wire [num_oscillators - 1 : 0] input_signal;
    (*DONT_TOUCH= "true"*) wire [32*31 - 1 : 0] frequency_counter_wire;
    // when the control signal is off, the middle inverter will experience BTI and the other two won't experience anything
    //when the control signal is on, everything will toggle (and experience HCI)
    generate
    genvar i;
    for (i = 0; i<num_oscillators; i=i+1)
    begin : CRO
    LUT6_NAND NAND(
        .control(slv_reg_out[i]),
        .in_sig(w[i*4]),
        .out_sig(w[i*4+1])
        );
    LUT6_NOTv2 Inverter0(
        .in_sig(w[i*4+1]),
        .out_sig(w[i*4+2])
        );
    LUT6_NOTv2 Inverter1(
        .in_sig(w[i*4+2]),
        .out_sig(w[i*4+3])
        );
    (*DONT_TOUCH= "true"*) assign w[i*4] = w[i*4+3]; //nand Control(w[0], w[SIZE-1], rst);
    assign input_signal[i] = w[i*4];
    end
    endgenerate
        frequency_counter #
    ( .num_counters(num_oscillators)) frequency_counter_instance
    (
    .in_signal(input_signal),
    .clk(s00_axi_aclk),
    .freq(frequency_counter_wire)
        );
	// User logic ends

	endmodule
