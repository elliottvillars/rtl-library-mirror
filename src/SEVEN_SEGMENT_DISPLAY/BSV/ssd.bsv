package ssd;
	import Vector::*;

	(* always_ready   *)
	(* always_enabled *)
	interface Driver;
	(* prefix = "" *)
	method Action group_enable(Bool i_SW_ENABLE, Bool i_DRIVE_ENABLE);
	(* result = "o_ANODES" *)
	method UInt#(4) anode_value;
	(* result = "o_CATHODES" *)
	method UInt#(7) cathode_value;

endinterface

(* default_clock_osc = "i_CLK" *)
(* default_reset = "i_RESET_N" *)
(* doc = "Author: Elliott Villars" *)
(* doc = "Date: 11/22/2020" *)
(* doc = "Description: A seven segment display driver. Can drive four seven segment digits. Common anode." *)
(* doc = "Ports: " *)

module ssd_driver(Driver);
	Reg#(UInt#(4)) anodes <- mkReg(0);
	Reg#(UInt#(7)) cathodes <- mkReg(0);
	Reg#(UInt#(2)) d_switch <- mkReg(0);
	Reg#(UInt#(4)) current_digit <- mkReg(0);

	Wire#(Bool) sw_en <- mkWire();
	Wire#(Bool) dr_en <- mkWire();

	Vector#(4, Reg#(UInt#(4))) digits <- replicateM( mkReg(0) );

	rule inc_switch (sw_en == True);
		d_switch <= d_switch + 1;
	endrule

	rule drive_anode;
		case (d_switch) matches
			'd0 : anodes <= 'b1110;
			'd1 : anodes <= 'b1101;
			'd2 : anodes <= 'b1011;
			'd3 : anodes <= 'b0111;
		endcase
	endrule

	rule switch_current;
		current_digit <= digits[d_switch];
	endrule

	rule drive_cathode;
		case (current_digit) matches
			'h0 : cathodes <= 'b1000000;
         		'h1 : cathodes <= 'b1111001;
         		'h2 : cathodes <= 'b0100100;
         		'h3 : cathodes <= 'b0110000;
         		'h4 : cathodes <= 'b0011001;
         		'h5 : cathodes <= 'b0010010;
         		'h6 : cathodes <= 'b0000010;
         		'h7 : cathodes <= 'b1111000;
         		'h8 : cathodes <= 'b0000000;
         		'h9 : cathodes <= 'b0010000;
         		'hA : cathodes <= 'b0001000;
         		'hB : cathodes <= 'b0000011;
         		'hC : cathodes <= 'b1000110;
         		'hD : cathodes <= 'b0100001;
         		'hE : cathodes <= 'b0000110;
         		'hF : cathodes <= 'b0001110;
		endcase
	endrule

	rule drive_d0 (dr_en == True);
		digits[0] <= digits[0] + 1;
	endrule

	rule inc_digit;
		for(Integer idx = 0; idx < 3; idx = idx + 1)
		begin
			if(digits[idx] == 'hF)
				digits[idx+1] <= digits[idx+1] + 1;
		end
	endrule

	method Action group_enable(Bool i_SW_ENABLE, Bool i_DRIVE_ENABLE);
		sw_en <= i_SW_ENABLE;
		dr_en <= i_DRIVE_ENABLE;
	endmethod

	method UInt#(4) anode_value;
		return anodes;
	endmethod

	method UInt#(7) cathode_value;
		return cathodes;
	endmethod
endmodule

module mkTB (Empty);
	Driver dut <- ssd_driver();
	Reg#(UInt#(32)) counter <- mkReg(0);

	rule run;
		$dumpvars();
		dut.group_enable(True,True);
		if(counter == 'd65536)
			$finish();
		else
		begin
			counter <= counter + 1;
		end
	endrule
endmodule
endpackage
