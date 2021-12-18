
module addconstan (
    output wire [99:0] state_out,
    input wire [99:0] state_in,
    input wire [3:0] v
);
    reg [3:0] IC[4:0];
    reg [3:0] RC[11:0];
    integer i,j;
    initial
   begin
     IC[4'h0] = 4'h0;
     IC[4'h1] = 4'h1;
     IC[4'h2] = 4'h3;
     IC[4'h3] = 4'h6;
     IC[4'h4] = 4'h4;

     RC[4'h0] = 4'h1;
     RC[4'h1] = 4'h3;
     RC[4'h2] = 4'h7;
     RC[4'h3] = 4'hE;
     RC[4'h4] = 4'hD;
     RC[4'h5] = 4'hB;
     RC[4'h6] = 4'h6;
     RC[4'h7] = 4'hC;
     RC[4'h8] = 4'h9;
     RC[4'h9] = 4'h2;  
     RC[4'hA] = 4'h5;
     RC[4'hB] = 4'hA;
   end
   assign state_out[99:96] = state_in[99:96] ^ RC[v] ^ IC[4'h0];
   assign state_in[95:80] = state_in[95:80];
   assign state_out[79:76] = state_in[79:76] ^ RC[v] ^ IC[4'h1];
   assign state_in[75:60] = state_in[75:60];
   assign state_out[59:56] = state_in[59:56] ^ RC[v] ^ IC[4'h2];
   assign state_in[55:40] = state_in[55:40];
   assign state_out[39:36] = state_in[39:36] ^ RC[v] ^ IC[4'h3];
   assign state_in[35:20] = state_in[35:20];
   assign state_out[19:16] = state_in[19:16] ^ RC[v] ^ IC[4'h4];
   assign state_in[15:0] = state_in[15:0];
endmodule