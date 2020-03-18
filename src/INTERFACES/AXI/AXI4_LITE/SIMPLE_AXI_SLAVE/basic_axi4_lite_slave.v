
module basic_axi4_lite_slave(
	input wire i_ACLK,
	input wire i_ARESETN,
	input wire i_M_AWADDR,
	input wire i_M_AWPROT,
	input wire i_M_AWVALID,
	output reg o_S_AWREADY,
	input wire i_M_WDATA,
	input wire i_M_WVALID,
	output reg o_S_WREADY,
	output reg o_S_BRESP,
	output reg o_S_BVALID,
	input wire i_M_BREADY,
	input wire i_M_ARADDR,
	input wire i_M_ARPROT,
	input wire i_M_ARVALID,
	output reg o_S_ARREADY,
	output reg o_S_RDATA,
	output reg o_S_RRESP,
	output reg o_S_RVALID,
	//input wire i_M_WSTRB,
	input wire i_M_RREADY

);
//TODO: Add strobes
//TODO: Add memory mapped registers
//


always@(posedge i_ACLK) begin: WRITE_ADDRESS
	if(i_M_AWVALID == 1 && o_S_AWREADY == 1)
		o_S_AWREADY <= 1'b0;
	else
		o_S_AWREADY <= 1'b1;
end
always@(posedge i_ACLK) begin: WRITE_DATA
	if(i_M_WVALID == 1 && o_S_WREADY == 1)
		o_S_WREADY <= 1'b0;
	else
		o_S_WREADY <= 1'b1;
end
always@(posedge i_ACLK) begin: WRITE_RESPONSE
	if(i_ARESETN == 0)
		o_S_BVALID <= 1'b0;
	else
	begin
		if(i_M_BREADY == 1 && o_S_BVALID == 0)
			o_S_BVALID <= 1'b1;
		else
			o_S_BVALID <= 1'b0;
	end
end
always@(posedge i_ACLK) begin: READ_ADDRESS
	if(i_M_ARVALID == 1 && o_S_ARREADY == 1)
		o_S_ARREADY <= 1'b0;
	else
		o_S_ARREADY <= 1'b1;
end
always@(posedge i_ACLK) begin: READ_DATA
	if(i_ARESETN == 0)
		o_S_RVALID <= 1'b0;
	else
	begin
		if(i_M_RREADY == 1 && o_S_RVALID == 0)
			o_S_RVALID <= 1'b1;
		else
			o_S_RVALID <= 1'b0;
	end
end
endmodule
