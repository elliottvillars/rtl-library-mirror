`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2019 06:27:18 PM
// Design Name: 
// Module Name: led_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_tb(

    );
    
    reg r_ACLK = 1'b0;
    reg r_ARST = 1'b0;
    
    reg [31:0] r_WRITE_ADDR = 32'd0;
    reg [2:0] r_WRITE_PROT = 3'd0;
    reg r_WRITE_ADDR_VALID = 1'd0;
    wire w_WRITE_ADDR_READY;
    
    reg [31:0] r_WRITE_DATA =32'd0;
    reg [3:0] r_WRITE_STRB = 4'd0;
    reg r_WRITE_DATA_VALID = 1'd0;
    wire w_WRITE_DATA_READY;
    
    reg r_WRITE_RESP_READY = 1'd0;
    wire [1:0] w_WRITE_RESP;
    wire w_WRITE_RESP_VALID;
    
    reg [31:0] r_READ_ADDR = 32'd0;
    reg [2:0] r_READ_PROT = 3'd0;
    reg r_READ_ADDR_VALID = 1'd0;
    wire w_READ_ADDR_READY;    
    
    reg r_READ_DATA_READY = 1'd0;
    wire [31:0] w_READ_DATA;
    wire [1:0] w_READ_RESP;
    wire w_READ_DATA_VALID;
    
    wire [3:0] w_LED;
    
    
    
    LED_CONTROLLER_v1_0 #(
        .C_S_AXI_DATA_WIDTH(32),
		.C_S_AXI_ADDR_WIDTH(32)
		) LED_CONTROLLER_v1_UUT (
		.s_axi_aclk(r_ACLK),
		.s_axi_aresetn(r_ARST),

		.s_axi_awaddr(r_WRITE_ADDR),
		.s_axi_awprot(r_WRITE_PROT),
		.s_axi_awvalid(r_WRITE_ADDR_VALID),
		.s_axi_awready(w_WRITE_ADDR_READY),

		.s_axi_wdata(r_WRITE_DATA),
		.s_axi_wstrb(r_WRITE_STRB),
		.s_axi_wvalid(r_WRITE_DATA_VALID),
		.s_axi_wready(w_WRITE_DATA_READY),

		.s_axi_bresp(w_WRITE_RESP),
		.s_axi_bvalid(w_WRITE_RESP_VALID),
		.s_axi_bready(r_WRITE_RESP_READY),

		.s_axi_araddr(r_READ_ADDR),
		.s_axi_arprot(r_READ_PROT),
		.s_axi_arvalid(r_READ_ADDR_VALID),
		.s_axi_arready(w_READ_ADDR_READY),

		.s_axi_rdata(w_READ_DATA),
		.s_axi_rresp(w_READ_RESP),
		.s_axi_rvalid(w_READ_DATA_VALID),
		.s_axi_rready(r_READ_DATA_READY),
		.o_LED(w_LED)
		);
		
		
		always
		      #5 r_ACLK <= ~r_ACLK;
		      
		integer i;   
		initial begin
		      r_ARST = 0;
		      #20 r_ARST = 1;
		      
		      for(i= 0; i< 32'hF; i = i +1)
		      begin
		          #20 AXI_WRITE(.addr(32'd0),.data(i));
		      
		      end
		end
		
    task AXI_WRITE;
        input [31:0] addr;
	    input [31:0] data;
	begin
		#3 r_WRITE_ADDR <= addr;	//Put write address on bus
		r_WRITE_DATA <= data;	//put write data on bus
		r_WRITE_ADDR_VALID <= 1'b1;	//indicate address is valid
		r_WRITE_DATA_VALID <= 1'b1;	//indicate data is valid
		r_WRITE_RESP_READY <= 1'b1;	//indicate ready for a response
		r_WRITE_STRB <= 4'hF;		//writing all 4 bytes

		//wait for one slave ready signal or the other
		wait(w_WRITE_DATA_READY || w_WRITE_ADDR_READY);
			
		@(posedge r_ACLK); //one or both signals and a positive edge
		if(w_WRITE_DATA_READY && w_WRITE_ADDR_READY)//received both ready signals
		begin
			r_WRITE_ADDR_VALID <=0;
			r_WRITE_DATA_VALID <=0;
		end
		else    //wait for the other signal and a positive edge
		begin
			if(w_WRITE_DATA_READY)    //case data handshake completed
			begin
				r_WRITE_DATA_VALID <=0;
				wait(w_WRITE_ADDR_READY); //wait for address address ready
			end
            		else if(w_WRITE_ADDR_READY)   //case address handshake completed
            		begin
				r_WRITE_ADDR_VALID <=0;
                		wait(w_WRITE_DATA_READY); //wait for data ready
            		end 
			@ (posedge r_ACLK);// complete the second handshake
			r_WRITE_ADDR_VALID <=0; //make sure both valid signals are deasserted
			r_WRITE_DATA_VALID<=0;
		end
            
		//both handshakes have occured
		//deassert strobe
		r_WRITE_STRB <=0; 

		//wait for valid response
		wait(w_WRITE_RESP_VALID);
		
		//both handshake signals and rising edge
		@(posedge r_ACLK);

		//deassert ready for response
		r_WRITE_RESP_READY <=0;


		//end of write transaction
	end
	endtask
endmodule
