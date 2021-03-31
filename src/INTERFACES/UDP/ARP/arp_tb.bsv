import arp::*;
import Assert::*;


typedef enum {LOAD, WAIT, CHECK, DONE} State deriving (Bits,Eq);
module arp_testbench(Empty);
	ARPPacketizer s1 <- arp_packetizer();
	ARPDepacketizer s2 <- arp_depacketizer();

	Reg#(State) x <- mkReg(LOAD);
	Reg#(Bit#(16)) cnt <- mkReg(0);
	let sendHType = 16'h0001;
	let sendPType = 16'h0800;
	let sendHLen = 8'h6;
	let sendPLen = 8'h4;

	rule connect;
		s2.putARPPacket(s1.getARPPacket());
	endrule

	rule state1 (x == LOAD);
		s1.putHardwareType(sendHType);
		s1.putProtocolType(sendPType);
		s1.putHardwareLen(sendHLen);
		s1.putProtocolLen(sendPLen);
		s1.putOperationCode('h1);
		s1.putSendHardwareAddr(0);
		s1.putSendProtocolAddr(0);
		s1.putRecHardwareAddr(0);
		s1.putRecProtocolAddr(0);
		x <= WAIT;
	endrule
	rule state2 (x == WAIT);
		x <= CHECK;
	endrule
	rule state3 (x == CHECK);
		let recHType = s2.getHardwareType();
		let recPType = s2.getProtocolType();
		let recHLen = s2.getHardwareLen();
		let recPLen = s2.getProtocolLen();
		let recOcode = s2.getOperationCode();
		let recSendHAddr = s2.getSendHardwareAddr();
		let recSendPAddr = s2.getSendProtocolAddr();
		let recRecHAddr = s2.getRecHardwareAddr();
		let recRecPAddr = s2.getRecProtocolAddr();

		dynamicAssert(recHType == sendHType,"Sent hardware type differs from recieved hardware type.");
		
		cnt <= cnt + 1;
		x <= LOAD;
	endrule


endmodule
