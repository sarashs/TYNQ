
`timescale 1 ns / 1 ps

	module AXI4_heater_v1_0 #
	(
		// Users to add parameters here
        parameter num_blocks = 5,
        parameter block_size = 4,
        parameter elements_on = 2,
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
	    .slv_reg0_out(slv_out0[C_S00_AXI_DATA_WIDTH - 1:0]),
	    .slv_reg1_out(slv_out0[2*C_S00_AXI_DATA_WIDTH - 1:C_S00_AXI_DATA_WIDTH]),
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
	wire [2*C_S00_AXI_DATA_WIDTH - 1:0] slv_out0; // we use slv 0 and 1 as heater control
	//wire [C_S00_AXI_DATA_WIDTH - 1:0] slv_out1 = 10000; //and slv 2 as counter load  
	wire [block_size*num_blocks - 1:0] w;
	reg [num_blocks - 1:0] block_enable = elements_on;
	reg [C_S00_AXI_DATA_WIDTH - 1:0] cnt;
	// heaters
    generate
    genvar i;
    genvar j;
    for (i=0; i < num_blocks; i=i+1) 
    begin : SHE_block
        for (j=0; j < block_size; j=j+1)
        begin : SHE
           (*DONT_TOUCH= "true"*) LUT6_SHE SHE(.control(slv_out0[i] & block_enable[i]),
                                               .in_clk(w[i*block_size+j]),
                                                .feedback(w[i*block_size+j]));
        end
    end
    endgenerate
    
    // counter
    always @ (posedge s00_axi_aclk)
    begin
        if (cnt == 0) begin
            block_enable <= {block_enable[0], block_enable[num_blocks - 1:1]};
            cnt <= 1000;
        end else begin
            cnt <= cnt - 1;
        end
	end
	// User logic ends
    
	endmodule