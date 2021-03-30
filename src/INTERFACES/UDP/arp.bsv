package arp;
	//Assumes IPv4 and Ethernet
	typedef struct {
		//Hardware Type: Specfies network protocol type.
		//Ethernet is 0x1.
		Bit#(16) hTYPE;

		//Protocol Type: Specfies the internetwork protocol type.
		//IPv4 is 0x0800.
		Bit#(16) pTYPE;

		//Hardware Length: Length in bytes of a MAC address.
		//Ethernet MAC length is 0x6.
		Bit#(8)  hLEN;

		//Protocol Length: Length in bytes of the internetwork
		//protocol addresses.
		//IPv4 address length is 0x4.
		Bit#(8)  pLEN;

		//Operation: Is the sender creating a request or reply.
		//0x1 is request, 0x2 is reply.
		Bit#(16) oPER;

		//Sender Hardware Address: MAC address of the sender.
		Bit#(48) sHA;

		//Sender Protocol Address: internetwork addresses of the
		//sender.
		Bit#(32) sPA;

		//Target Hardware Address: MAC address of the receiver.
		//Contains the address of the host who initiated the
		//request in an ARP reply. Ignored in ARP request.
		Bit#(48) tHA;

		//Target Protocol Address: internetwork address of the 
		//receiver.
		Bit#(32) tPA;

	} ARPPacket deriving (Bits, FShow);
	(* always_ready,always_enabled *)
	interface ARPPacketizer;
	method Action putHardwareType(Bit#(16) i_HTYPE);
	method Action putProtocolType(Bit#(16) i_PTYPE);
	method Action putHardwareLen(Bit#(8) i_HLEN);
	method Action putProtocolLen(Bit#(8) i_PLEN);
	method Action putOperationCode(Bit#(16) i_OPER);
	method Action putSendHardwareAddr(Bit#(48) i_SEND_MAC_ADDR);
	method Action putSendProtocolAddr(Bit#(32) i_SEND_IP_ADDR);
	method Action putRecHardwareAddr(Bit#(48) i_REC_MAC_ADDR);
	method Action putRecProtocolAddr(Bit#(32) i_REC_IP_ADDR);
	method ARPPacket getARPPacket;
endinterface
	(* always_ready,always_enabled *)
	interface ARPDepacketizer;
	method Action putARPPacket(ARPPacket i_PACKET);
	method Bit#(16) getHardwareType;
	method Bit#(16) getProtocolType;
	method Bit#(8) getHardwareLen;
	method Bit#(8) getProtocolLen;
	method Bit#(16) getOperationCode;
	method Bit#(48) getSendHardwareAddr;
	method Bit#(32) getSendProtocolAddr;
	method Bit#(48) getRecHardwareAddr;
	method Bit#(32) getRecProtocolAddr;
endinterface

(*default_clock_osc = "i_CLK" *)
(* default_reset = "i_RESETN" *)
(* doc = "A module to build an ARP packet in parallel." *)
(* doc = "Mostly a glorified concatenation block."  *)
(* doc = "Current setup implies Ethernet and IPv4." *)
module arp_packetizer(ARPPacketizer) provisos (Literal#(ARPPacket));
	Reg#(ARPPacket) arp <- mkReg(0);
	Wire#(Bit#(16)) w_HTYPE <- mkWire;
	Wire#(Bit#(16)) w_PTYPE <- mkWire;
	Wire#(Bit#(8)) w_HLEN <- mkWire;
	Wire#(Bit#(8)) w_PLEN <- mkWire;
	Wire#(Bit#(16)) w_OPER <- mkWire;
	Wire#(Bit#(48)) w_SHA <- mkWire;
	Wire#(Bit#(32)) w_SPA <- mkWire;
	Wire#(Bit#(48)) w_THA <- mkWire;
	Wire#(Bit#(32)) w_TPA <- mkWire;

	//Packs an ARPPacket struct with incoming data.
	rule buildPacket;
		arp.hTYPE <= w_HTYPE;
		arp.pTYPE <= w_PTYPE;
		arp.hLEN <= w_HLEN;
		arp.pLEN <= w_PLEN;
		arp.oPER <= w_OPER;
		arp.sHA <= w_SHA;
		arp.sPA <= w_SPA;
		arp.tHA <= w_THA;
		arp.tPA <= w_TPA;
	endrule

	method Action putHardwareType(Bit#(16) i_HTYPE);
		w_HTYPE <= i_HTYPE;
	endmethod
	method Action putProtocolType(Bit#(16) i_PTYPE);
		w_PTYPE <= i_PTYPE;
	endmethod
	method Action putHardwareLen(Bit#(8) i_HLEN);
		w_HLEN <= i_HLEN;
	endmethod
	method Action putProtocolLen(Bit#(8) i_PLEN);
		w_PLEN <= i_PLEN;
	endmethod
	method Action putOperationCode(Bit#(16) i_OPER);
		w_OPER <= i_OPER;
	endmethod
	method Action putSendHardwareAddr(Bit#(48) i_SEND_MAC_ADDR);
		w_SHA <= i_SEND_MAC_ADDR;
	endmethod
	method Action putSendProtocolAddr(Bit#(32) i_SEND_IP_ADDR);
		w_SPA <= i_SEND_IP_ADDR;
	endmethod
	method Action putRecHardwareAddr(Bit#(48) i_REC_MAC_ADDR);
		w_THA <= i_REC_MAC_ADDR;
	endmethod
	method Action putRecProtocolAddr(Bit#(32) i_REC_IP_ADDR);
		w_TPA <= i_REC_IP_ADDR;
	endmethod 
	method ARPPacket getARPPacket;
		return arp;
	endmethod
endmodule

(*default_clock_osc = "i_CLK" *)
(* default_reset = "i_RESETN" *)
(* doc = "A module to strip an ARP packet in parallel." *)
(* doc = "Mostly a glorified splice block."  *)
(* doc = "Current setup implies Ethernet and IPv4." *)
module arp_depacketizer(ARPDepacketizer);
	Wire#(ARPPacket) arp <- mkWire;
	Reg#(Bit#(16)) r_HTYPE <- mkReg(0);
	Reg#(Bit#(16)) r_PTYPE <- mkReg(0);
	Reg#(Bit#(8)) r_HLEN <- mkReg(0);
	Reg#(Bit#(8)) r_PLEN <- mkReg(0);
	Reg#(Bit#(16)) r_OPER <- mkReg(0);
	Reg#(Bit#(48)) r_SHA <- mkReg(0);
	Reg#(Bit#(32)) r_SPA <- mkReg(0);
	Reg#(Bit#(48)) r_THA <- mkReg(0);
	Reg#(Bit#(32)) r_TPA <- mkReg(0);

	//Unpacks an ARP packet into its constituent data fields.
	rule splitPacket;
		r_HTYPE <= arp.hTYPE;
		r_PTYPE <= arp.pTYPE;
		r_HLEN <= arp.hLEN;
		r_PLEN <= arp.pLEN;
		r_OPER <= arp.oPER;
		r_SHA <= arp.sHA;
		r_SPA <= arp.sPA;
		r_THA <= arp.tHA;
		r_TPA <= arp.tPA;
	endrule
	method Action putARPPacket(ARPPacket i_PACKET);
		arp <= i_PACKET;
	endmethod
	method Bit#(16) getHardwareType;
		return r_HTYPE;
	endmethod
	method Bit#(16) getProtocolType;
		return r_PTYPE;
	endmethod
	method Bit#(8) getHardwareLen;
		return r_HLEN;
	endmethod
	method Bit#(8) getProtocolLen;
		return r_PLEN;
	endmethod
	method Bit#(16) getOperationCode;
		return r_OPER;
	endmethod
	method Bit#(48) getSendHardwareAddr;
		return r_SHA;
	endmethod
	method Bit#(32) getSendProtocolAddr;
		return r_SPA;
	endmethod
	method Bit#(48) getRecHardwareAddr;
		return r_THA;
	endmethod
	method Bit#(32) getRecProtocolAddr;
		return r_TPA;
	endmethod
endmodule
endpackage
