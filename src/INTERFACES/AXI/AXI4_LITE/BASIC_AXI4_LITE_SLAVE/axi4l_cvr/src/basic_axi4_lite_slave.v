
module basic_axi4_lite_slave #(parameter p_ADDRESS_WIDTH = 2, parameter p_DATA_WIDTH = 8)(
	input wire i_ACLK,
	input wire i_ARESETN,
	input wire [p_ADDRESS_WIDTH-1:0] i_M_AWADDR,
//	input wire i_M_AWPROT,
	input wire i_M_AWVALID,
	output reg o_S_AWREADY,
	input wire [p_DATA_WIDTH-1:0] i_M_WDATA,
	input wire i_M_WVALID,
	output reg o_S_WREADY,
	output reg [1:0] o_S_BRESP,
//	output reg [1:0] o_S_RRESP,
	output reg o_S_BVALID,
	input wire i_M_BREADY,
	input wire [p_ADDRESS_WIDTH-1:0] i_M_ARADDR,
//	input wire i_M_ARPROT,
	input wire i_M_ARVALID,
	output reg o_S_ARREADY,
	output reg [p_DATA_WIDTH-1:0] o_S_RDATA,
	output reg o_S_RVALID,
//	input wire [lp_STROBE_WIDTH-1:0] i_M_WSTRB,
	input wire i_M_RREADY
	//***
	//USER PORTS HERE
	//***

);
//TODO: Add strobes
//

localparam lp_STROBE_WIDTH =  (p_DATA_WIDTH >= 8) ? p_DATA_WIDTH / 8 : 1; //Get byte count

reg [p_DATA_WIDTH-1:0] r_MEMORY [0:2];
initial begin
	integer i;
	for(i = 0; i < p_ADDRESS_WIDTH; i = i + 1)
		r_MEMORY[0] = {p_DATA_WIDTH{1'b0}};
end
always@(posedge i_ACLK)
begin
	o_S_BRESP <= 2'b00;
end

always@(posedge i_ACLK)
begin
	if(o_S_AWREADY == 0 && o_S_WREADY == 0)
		r_MEMORY[i_M_AWADDR] <= i_M_WDATA;
	if(o_S_ARREADY == 0 && i_M_RREADY == 1)//FIXME
		o_S_RDATA <=  r_MEMORY[i_M_ARADDR];
end


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
//***
//USER LOGIC HERE
//***
//
`ifdef FORMAL
	reg r_PAST_VALID = 0;
	always@(posedge i_ACLK)
	begin
		assume($changed(i_ACLK));
		r_PAST_VALID <= 1;
		if(r_PAST_VALID == 1 && $rose(i_ACLK))
		begin
			if($past(i_ARESETN) == 0)
			begin
				assert(o_S_BVALID == 0);
				assert(o_S_RVALID == 0);
			end
			else
			begin
				cover(r_MEMORY[0] == 9 && o_S_RDATA == 9);
				assert(o_S_BRESP == 0);
				if($past(o_S_RVALID == 1))
					assert(o_S_RVALID == 0);
				if($past(o_S_ARREADY) == 0)
					assert(o_S_ARREADY == 1);
				if(o_S_BVALID == 1)
					assert($past(o_S_BVALID) == 0); //check this
				if(o_S_WREADY == 0)
					assert($past(o_S_WREADY) == 1);
				if(o_S_AWREADY == 0)
					assert($past(o_S_AWREADY) == 1);
				if($past(i_M_AWVALID) == 1 && $past(o_S_AWREADY) == 1)
					assert(o_S_AWREADY == 0);
				else
					assert(o_S_AWREADY == 1);
				if($past(i_M_WVALID) == 1 && $past(o_S_WREADY) == 1)
					assert(o_S_WREADY == 0);
				else
					assert(o_S_WREADY == 1);
				if($past(i_M_BREADY) == 1 && $past(o_S_BVALID) == 0)
					assert(o_S_BVALID == 1);
				else
					assert(o_S_BVALID == 0);
				if($past(i_M_ARVALID) == 1 && $past(o_S_ARREADY) == 1)
					assert(o_S_ARREADY == 1'b0);
				else
					assert(o_S_ARREADY == 1'b1);


			end

		end
	end
`endif
endmodule
