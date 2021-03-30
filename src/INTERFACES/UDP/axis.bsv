package axis;
	typedef struct {
		Bit#(TMul#(n,8)) tDATA;
		Bit#(n) tSTRB;
		Bit#(n) tKEEP;
		Bool tLAST;
		Bit#(i) tID;
		Bit#(d) tDEST;
		Bit#(u) tUSER;
	} Axi4StreamPayload#(
		numeric type n,
		numeric type i,
		numeric type d,
		numeric type u
	) deriving (Bits);

	interface AXIS_S_IFC#(numeric type n, numeric type i, numeric type d, numeric type u);
	method Bool   sendRDY;
	method Action getValid(Bool tValid);
	method Action getPayload(Axi4StreamPayload#(n,i,d,u) payload);
endinterface

	interface AXIS_M_IFC#(numeric type n, numeric type i, numeric type d, numeric type u);
	method Action getRDY (Bool tREADY);
	method Bool sendValid;
	method Axi4StreamPayload#(n,i,d,u) sendPayload;
endinterface

(* doc = "Reference AXI4 Stream slave" *)
module basicSlave (AXIS_S_IFC#(n,i,d,u)) provisos (Max#(i,8,8),Max#(d,4,4));
	Reg#(Bit#(TMul#(n,8)))      m_data <- mkReg(0);
	Reg#(Bit#(n))               m_strb <- mkReg(0);
	Reg#(Bit#(n))		    m_keep <- mkReg(0);
	Reg#(Bool)		    m_last <- mkReg(False);
	Reg#(Bit#(i))		    m_id   <- mkReg(0);
	Reg#(Bit#(d))		    m_dest <- mkReg(0);
	Reg#(Bit#(u))		    m_user <- mkReg(0);
	Reg#(Bool)		    m_rdy  <- mkReg(False);
	Reg#(Bool)		    m_val  <- mkReg(False);
	Reg#(Bool)		    m_hdsk <- mkReg(False);

	rule handshake;
		m_rdy <= True;
		m_hdsk <= m_val && m_rdy;
	endrule
	method Bool sendRDY;
		return m_rdy;
	endmethod

	method Action getValid (Bool tValid);
		m_val <= tValid;
	endmethod

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
endmodule

endpackage
