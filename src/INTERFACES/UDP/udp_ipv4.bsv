package udp_ipv4;
	import accu::*;
	import axis::*;
	import skid_buf::*;
	import onesCompAdder::*;
	import Vector::*;

	import StmtFSM::*;
	typedef union tagged {
		struct{
			Bit#(4) version;
			Bit#(4) ihl;
			Bit#(6) dscp;
			Bit#(2) ecn;
			Bit#(16) totalLength;
		} Word1;
		struct {
			Bit#(16) identification;
			Bit#(3)  flags;
			Bit#(13) fragOffset;
		} Word2;
		struct {
			Bit#(8) ttl;
			Bit#(8) protocol;
			Bit#(16) hchecksum;
		} Word3;
		Bit#(32) SrcIPAddr;
		Bit#(32) DestIPAddr;
	} IPv4_Header;

	interface AXIS_IPV4_IFC#(numeric type n, numeric type i, numeric type d, numeric type u);
	interface AXIS_S_IFC#(n,i,d,u) ifc;
	method Bit#(32) sendData;
endinterface
//TODO: FSM to build data packet
//EDIT: NO

module basicUdpSlaveIPv4 (AXIS_IPV4_IFC#(n,i,d,u)) provisos (Literal#(Bool),Literal#(IPv4_Header),Bits#(IPv4_Header,_),Max#(i,8,8),Max#(d,4,4),Div#(n,2,16));
	Reg#(Bit#(TMul#(n,8)))      m_data <- mkReg(0);
	Reg#(Bit#(n))               m_strb <- mkReg(0);
	Reg#(Bit#(n))		    m_keep <- mkReg(0);
	Reg#(Bool)		    m_last <- mkReg(0);
	Reg#(Bit#(i))		    m_id   <- mkReg(0);
	Reg#(Bit#(d))		    m_dest <- mkReg(0);
	Reg#(Bit#(u))		    m_user <- mkReg(0);
	Reg#(Bool)		    m_rdy  <- mkReg(0);
	Reg#(Bool)		    m_val  <- mkReg(0);
	Reg#(Bool)		    m_hdsk <- mkReg(0);

	AccIFCWithOverflowCarry#(16) msacc <- mkAccumulatorWithOverflowCarry;
	AccIFCWithOverflowCarry#(16) lsacc <- mkAccumulatorWithOverflowCarry;

	Buffer#(16) msbskb <- mkSkidBuffer;
	Buffer#(16) lsbskb <- mkSkidBuffer;

	Buffer#(16) msbskb2 <- mkSkidBuffer;
	Buffer#(16) lsbskb2 <- mkSkidBuffer;

	AdderWithOverflow#(16) adr <- mkOnesCompAdder;

	function Bit#(TDiv#(n,2)) getHighHalf (Bit#(TMul#(n,8)) data);
		let high = valueOf(n);
		let mid = high / 2;
		return data[high-1:mid];
	endfunction

	function Bit#(TDiv#(n,2)) getLowHalf (Bit#(TMul#(n,8)) data);
		let high = valueOf(n);
		let mid = high / 2;
		return data[mid-1:0];
	endfunction

	rule axiHandshake;
		msbskb.getDownstreamRDY(!unpack(msacc.getOverflow));
		lsbskb.getDownstreamRDY(!unpack(lsacc.getOverflow));
		m_rdy <= (msbskb.putUpstreamRDY) && (lsbskb.putUpstreamRDY);
		m_hdsk <= m_val && m_rdy;
	endrule

	//TODO: Set valid signals and break up section
	rule driveChecksum (m_hdsk);
		msbskb.getUpstreamData(getHighHalf(m_data));
		lsbskb.getUpstreamData(getLowHalf(m_data));

		msacc.base.write(msbskb.putDownstreamData);
		lsacc.base.write(lsbskb.putDownstreamData);

		msbskb2.getUpstreamData(msacc.base.read);
		lsbskb2.getUpstreamData(lsacc.base.read);

		msbskb2.getDownstreamRDY(!adr.getOverflow);
		lsbskb2.getDownstreamRDY(!adr.getOverflow);
		
		adr.putData(msbskb2.putDownstreamData,lsbskb2.putDownstreamData);

	endrule
	interface AXIS_S_IFC ifc;
		method Bool sendRDY;
			return m_rdy;
		endmethod

		method Action getValid (Bool tValid);
			m_val <= tValid;
		endmethod

		//TODO: remove unneeded signals
		method Action getPayload(Axi4StreamPayload#(n,i,d,u) payload);
			if(m_hdsk)
			begin
				m_data <= payload.tDATA;
				m_strb <= payload.tSTRB;
				m_keep <= payload.tKEEP;
				m_last <= payload.tLAST;
				m_id   <= payload.tID;
				m_dest <= payload.tDEST;
				m_user <= payload.tUSER;
			end
			else
			begin
				m_data <= m_data;
				m_strb <= m_strb;
				m_keep <= m_keep;
				m_last <= m_last;
				m_id   <= m_id;
				m_dest <= m_dest;
				m_user <= m_user;
			end
		endmethod
	endinterface
endmodule
endpackage
