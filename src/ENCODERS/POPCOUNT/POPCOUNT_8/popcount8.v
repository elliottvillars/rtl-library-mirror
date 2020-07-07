module popcount8 (
	input wire i_CLK,
	input wire i_INVERSE,
	input wire [7:0] i_INPUT,
	output reg [3:0] o_OUTPUT
);

reg [3:0] r_POPCOUNT;
reg [3:0] r_INVERSE_POPCOUNT;

always@(posedge i_CLK)
begin
	case(i_INPUT)
		8'd0:
		begin
			r_POPCOUNT <= 4'd0;
			r_INVERSE_POPCOUNT <= 4'd8;
		end
		8'd1:
		begin
			r_POPCOUNT <= 4'd1;
			r_INVERSE_POPCOUNT <= 4'd7;
		end
		8'd2:
		begin
			r_POPCOUNT <= 4'd1;
			r_INVERSE_POPCOUNT <= 4'd7;
		end
		8'd3:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd4:
		begin
			r_POPCOUNT <= 4'd1;
			r_INVERSE_POPCOUNT <= 4'd7;
		end
		8'd5:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd6:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd7:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd8:
		begin
			r_POPCOUNT <= 4'd1;
			r_INVERSE_POPCOUNT <= 4'd7;
		end
		8'd9:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd10:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd11:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd12:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd13:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd14:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd15:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd16:
		begin
			r_POPCOUNT <= 4'd1;
			r_INVERSE_POPCOUNT <= 4'd7;
		end
		8'd17:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd18:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd19:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd20:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd21:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd22:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd23:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd24:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd25:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd26:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd27:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd28:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd29:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd30:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd31:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd32:
		begin
			r_POPCOUNT <= 4'd1;
			r_INVERSE_POPCOUNT <= 4'd7;
		end
		8'd33:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd34:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd35:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd36:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd37:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd38:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd39:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd40:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd41:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd42:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd43:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd44:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd45:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd46:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd47:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd48:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd49:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd50:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd51:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd52:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd53:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd54:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd55:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd56:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd57:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd58:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd59:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd60:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd61:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd62:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd63:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd64:
		begin
			r_POPCOUNT <= 4'd1;
			r_INVERSE_POPCOUNT <= 4'd7;
		end
		8'd65:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd66:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd67:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd68:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd69:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd70:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd71:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd72:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd73:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd74:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd75:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd76:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd77:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd78:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd79:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd80:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd81:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd82:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd83:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd84:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd85:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd86:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd87:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd88:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd89:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd90:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd91:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd92:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd93:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd94:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd95:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd96:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd97:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd98:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd99:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd100:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd101:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd102:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd103:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd104:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd105:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd106:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd107:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd108:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd109:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd110:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd111:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd112:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd113:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd114:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd115:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd116:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd117:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd118:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd119:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd120:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd121:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd122:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd123:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd124:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd125:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd126:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd127:
		begin
			r_POPCOUNT <= 4'd7;
			r_INVERSE_POPCOUNT <= 4'd1;
		end
		8'd128:
		begin
			r_POPCOUNT <= 4'd1;
			r_INVERSE_POPCOUNT <= 4'd7;
		end
		8'd129:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd130:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd131:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd132:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd133:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd134:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd135:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd136:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd137:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd138:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd139:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd140:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd141:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd142:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd143:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd144:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd145:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd146:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd147:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd148:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd149:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd150:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd151:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd152:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd153:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd154:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd155:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd156:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd157:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd158:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd159:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd160:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd161:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd162:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd163:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd164:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd165:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd166:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd167:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd168:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd169:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd170:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd171:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd172:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd173:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd174:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd175:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd176:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd177:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd178:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd179:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd180:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd181:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd182:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd183:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd184:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd185:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd186:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd187:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd188:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd189:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd190:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd191:
		begin
			r_POPCOUNT <= 4'd7;
			r_INVERSE_POPCOUNT <= 4'd1;
		end
		8'd192:
		begin
			r_POPCOUNT <= 4'd2;
			r_INVERSE_POPCOUNT <= 4'd6;
		end
		8'd193:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd194:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd195:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd196:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd197:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd198:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd199:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd200:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd201:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd202:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd203:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd204:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd205:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd206:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd207:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd208:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd209:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd210:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd211:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd212:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd213:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd214:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd215:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd216:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd217:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd218:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd219:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd220:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd221:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd222:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd223:
		begin
			r_POPCOUNT <= 4'd7;
			r_INVERSE_POPCOUNT <= 4'd1;
		end
		8'd224:
		begin
			r_POPCOUNT <= 4'd3;
			r_INVERSE_POPCOUNT <= 4'd5;
		end
		8'd225:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd226:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd227:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd228:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd229:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd230:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd231:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd232:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd233:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd234:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd235:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd236:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd237:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd238:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd239:
		begin
			r_POPCOUNT <= 4'd7;
			r_INVERSE_POPCOUNT <= 4'd1;
		end
		8'd240:
		begin
			r_POPCOUNT <= 4'd4;
			r_INVERSE_POPCOUNT <= 4'd4;
		end
		8'd241:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd242:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd243:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd244:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd245:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd246:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd247:
		begin
			r_POPCOUNT <= 4'd7;
			r_INVERSE_POPCOUNT <= 4'd1;
		end
		8'd248:
		begin
			r_POPCOUNT <= 4'd5;
			r_INVERSE_POPCOUNT <= 4'd3;
		end
		8'd249:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd250:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd251:
		begin
			r_POPCOUNT <= 4'd7;
			r_INVERSE_POPCOUNT <= 4'd1;
		end
		8'd252:
		begin
			r_POPCOUNT <= 4'd6;
			r_INVERSE_POPCOUNT <= 4'd2;
		end
		8'd253:
		begin
			r_POPCOUNT <= 4'd7;
			r_INVERSE_POPCOUNT <= 4'd1;
		end
		8'd254:
		begin
			r_POPCOUNT <= 4'd7;
			r_INVERSE_POPCOUNT <= 4'd1;
		end
		8'd255:
		begin
			r_POPCOUNT <= 4'd8;
			r_INVERSE_POPCOUNT <= 4'd0;
		end
	endcase
end
always@(posedge i_CLK)
begin
	if(i_INVERSE == 1'b1)
		o_OUTPUT <= r_INVERSE_POPCOUNT;
	else
		o_OUTPUT <= r_POPCOUNT;
end
endmodule