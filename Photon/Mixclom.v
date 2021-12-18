module Mixclom (
    input wire [99:0] state_in,
    output wire [99:0] state_out
);
reg [3:0] mix[24:0];
//  mix = {4'b0001, 4'b0010, 4'b1001, 4'b1001, 4'b0010
//         4'b0010, 4'b0101, 4'b0011, 4'b1000, 4'b1101
//         4'b1101, 4'b1011, 4'b1010, 4'b1100, 4'b0001
//         4'b0001, 4'b1111, 4'b0010, 4'b0011, 4'b1101
//         4'b1101, 4'b1101, 4'b1000, 4'b0101, 4'b1100};
initial begin
mix[24] = 4'b0001;
mix[23] = 4'b0010;
mix[22] = 4'b1001;
mix[21] = 4'b1001;
mix[20] = 4'b0010;
mix[19] = 4'b0010;
mix[18] = 4'b0101;
mix[17] = 4'b0011;
mix[16] = 4'b1000;
mix[15] = 4'b1101;
mix[14] = 4'b1101;
mix[13] = 4'b1011;
mix[12] = 4'b1010;
mix[11] = 4'b1100;
mix[10] = 4'b0001;
mix[9]  = 4'b0001;
mix[8]  = 4'b1111;
mix[7]  = 4'b0010;
mix[6]  = 4'b0011;
mix[5]  = 4'b1101;
mix[4]  = 4'b1101;
mix[3]  = 4'b1101;
mix[2]  = 4'b1000;
mix[1]  = 4'b0101;
mix[0]  = 4'b1100;
end

function [3:0] modulo;
    input [3:0] a,b;
    begin
        modulo[3] = a[3]*b[3] ^ a[3]*b[0] ^ a[2]*b[1] ^ a[1]*b[2] ^ a[0]*b[3];
        modulo[2] = a[3]*b[3] ^ a[2]*b[0] ^ a[1]*b[1] ^ a[0]*b[2] ^ a[3]*b[2] ^ a[2]*b[3];
        modulo[1] = a[1]*b[0] ^ a[0]*b[1] ^ a[3]*b[2] ^ a[2]*b[3] ^ a[3]*b[1] ^ a[2]*b[2] ^ a[1]*b[3];
        modulo[0] = a[3]*b[1] ^ a[2]*b[2] ^ a[1]*b[3] ^ a[0]*b[0];
    end
endfunction
// hang 1
assign state_out[99:96] = modulo(mix[24], state_in[99:96]) ^ modulo(mix[23], state_in[79:76]) ^ modulo(mix[22], state_in[59:56]) ^ modulo(mix[21], state_in[39:36]) ^ modulo(mix[20], state_in[19:16]);
assign state_out[95:92] = modulo(mix[24], state_in[95:92]) ^ modulo(mix[23], state_in[75:72]) ^ modulo(mix[22], state_in[55:52]) ^ modulo(mix[21], state_in[35:32]) ^ modulo(mix[20], state_in[15:12]);
assign state_out[91:88] = modulo(mix[24], state_in[91:88]) ^ modulo(mix[23], state_in[71:68]) ^ modulo(mix[22], state_in[51:48]) ^ modulo(mix[21], state_in[31:28]) ^ modulo(mix[20], state_in[11:8]);
assign state_out[87:84] = modulo(mix[24], state_in[87:84]) ^ modulo(mix[23], state_in[67:64]) ^ modulo(mix[22], state_in[47:44]) ^ modulo(mix[21], state_in[27:24]) ^ modulo(mix[20], state_in[7:4]);
assign state_out[83:80] = modulo(mix[24], state_in[83:80]) ^ modulo(mix[23], state_in[63:60]) ^ modulo(mix[22], state_in[43:40]) ^ modulo(mix[21], state_in[23:20]) ^ modulo(mix[20], state_in[3:0]);
// hang 2
assign state_out[79:76] = modulo(mix[19], state_in[99:96]) ^ modulo(mix[18], state_in[79:76]) ^ modulo(mix[17], state_in[59:56]) ^ modulo(mix[16], state_in[39:36]) ^ modulo(mix[15], state_in[19:16]);
assign state_out[75:72] = modulo(mix[19], state_in[95:92]) ^ modulo(mix[18], state_in[75:72]) ^ modulo(mix[17], state_in[55:52]) ^ modulo(mix[16], state_in[35:32]) ^ modulo(mix[15], state_in[15:12]);
assign state_out[71:68] = modulo(mix[19], state_in[91:88]) ^ modulo(mix[18], state_in[71:68]) ^ modulo(mix[17], state_in[51:48]) ^ modulo(mix[16], state_in[31:28]) ^ modulo(mix[15], state_in[11:8]);
assign state_out[67:64] = modulo(mix[19], state_in[87:84]) ^ modulo(mix[18], state_in[67:64]) ^ modulo(mix[17], state_in[47:44]) ^ modulo(mix[16], state_in[27:24]) ^ modulo(mix[15], state_in[7:4]);
assign state_out[63:60] = modulo(mix[19], state_in[83:80]) ^ modulo(mix[18], state_in[63:60]) ^ modulo(mix[17], state_in[43:40]) ^ modulo(mix[16], state_in[23:20]) ^ modulo(mix[15], state_in[3:0]);
// hang 3
assign state_out[59:56] = modulo(mix[14], state_in[99:96]) ^ modulo(mix[13], state_in[79:76]) ^ modulo(mix[12], state_in[59:56]) ^ modulo(mix[11], state_in[39:36]) ^ modulo(mix[10], state_in[19:16]);
assign state_out[55:52] = modulo(mix[14], state_in[95:92]) ^ modulo(mix[13], state_in[75:72]) ^ modulo(mix[12], state_in[55:52]) ^ modulo(mix[11], state_in[35:32]) ^ modulo(mix[10], state_in[15:12]);
assign state_out[51:48] = modulo(mix[14], state_in[91:88]) ^ modulo(mix[13], state_in[71:68]) ^ modulo(mix[12], state_in[51:48]) ^ modulo(mix[11], state_in[31:28]) ^ modulo(mix[10], state_in[11:8]);
assign state_out[47:44] = modulo(mix[14], state_in[87:84]) ^ modulo(mix[13], state_in[67:64]) ^ modulo(mix[12], state_in[47:44]) ^ modulo(mix[11], state_in[27:24]) ^ modulo(mix[10], state_in[7:4]);
assign state_out[43:40] = modulo(mix[14], state_in[83:80]) ^ modulo(mix[13], state_in[63:60]) ^ modulo(mix[12], state_in[43:40]) ^ modulo(mix[11], state_in[23:20]) ^ modulo(mix[10], state_in[3:0]);
// hang 4
assign state_out[39:36] = modulo(mix[9], state_in[99:96]) ^ modulo(mix[8], state_in[79:76]) ^ modulo(mix[7], state_in[59:56]) ^ modulo(mix[6], state_in[39:36]) ^ modulo(mix[5], state_in[19:16]);
assign state_out[35:32] = modulo(mix[9], state_in[95:92]) ^ modulo(mix[8], state_in[75:72]) ^ modulo(mix[7], state_in[55:52]) ^ modulo(mix[6], state_in[35:32]) ^ modulo(mix[5], state_in[15:12]);
assign state_out[31:28] = modulo(mix[9], state_in[91:88]) ^ modulo(mix[8], state_in[71:68]) ^ modulo(mix[7], state_in[51:48]) ^ modulo(mix[6], state_in[31:28]) ^ modulo(mix[5], state_in[11:8]);
assign state_out[27:24] = modulo(mix[9], state_in[87:84]) ^ modulo(mix[8], state_in[67:64]) ^ modulo(mix[7], state_in[47:44]) ^ modulo(mix[6], state_in[27:24]) ^ modulo(mix[5], state_in[7:4]);
assign state_out[23:20] = modulo(mix[9], state_in[83:80]) ^ modulo(mix[8], state_in[63:60]) ^ modulo(mix[7], state_in[43:40]) ^ modulo(mix[6], state_in[23:20]) ^ modulo(mix[5], state_in[3:0]);
// hang 5
assign state_out[19:16] = modulo(mix[4], state_in[99:96]) ^ modulo(mix[3], state_in[79:76]) ^ modulo(mix[2], state_in[59:56]) ^ modulo(mix[1], state_in[39:36]) ^ modulo(mix[0], state_in[19:16]);
assign state_out[15:12] = modulo(mix[4], state_in[95:92]) ^ modulo(mix[3], state_in[75:72]) ^ modulo(mix[2], state_in[55:52]) ^ modulo(mix[1], state_in[35:32]) ^ modulo(mix[0], state_in[15:12]);
assign state_out[11:8]  = modulo(mix[4], state_in[91:88]) ^ modulo(mix[3], state_in[71:68]) ^ modulo(mix[2], state_in[51:48]) ^ modulo(mix[1], state_in[31:28]) ^ modulo(mix[0], state_in[11:8]);
assign state_out[7:4]   = modulo(mix[4], state_in[87:84]) ^ modulo(mix[3], state_in[67:64]) ^ modulo(mix[2], state_in[47:44]) ^ modulo(mix[1], state_in[27:24]) ^ modulo(mix[0], state_in[7:4]);
assign state_out[3:0]   = modulo(mix[4], state_in[83:80]) ^ modulo(mix[3], state_in[63:60]) ^ modulo(mix[2], state_in[43:40]) ^ modulo(mix[1], state_in[23:20]) ^ modulo(mix[0], state_in[3:0]);
endmodule
