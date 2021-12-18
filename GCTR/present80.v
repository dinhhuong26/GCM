//`timescale 1ns/1ps

module present80(
	output [63:0] outdata,
	input [63:0] indata,
	input [79:0] key,
	input load,
	input clk
);
// day noi va reg
reg [79:0] keyreg;
reg [63:0] datareg,data_temp;
reg [4:0] round;
wire [63:0] data1,data2,data3;
wire [79:0] key1,key2;

genvar i;
generate 
	for( i =0 ; i < 64; i = i+4) begin
	    sbox sbox1(.datain(data1[i+3:i]),.dataout(data2[i+3:i]));
	end
endgenerate

player player1(.datain(data2),.dataout(data3));

sbox sbox2(.datain(key1[79:76]),.dataout(key2[79:76]));

assign data1 = datareg ^ keyreg[79:16];
// key update
assign key1 = {keyreg[18:0],keyreg[79:19]};
assign key2[14:0] = key1[14:0];
assign key2[19:15] = key1[19:15] ^ round;
assign key2[75:20] = key1[75:20];

always @(posedge clk)
begin
   if (load)
      datareg <= indata;
   else
      datareg <= data3;
end

// Load/reload key into key register
always @(posedge clk)
begin
   if (load)
      keyreg <= key;
   else
      keyreg <= key2;
end

// Round counter
always @(posedge clk )
begin
   if (load)
      round <= 1;
   else
      round <= round + 1;
   // case (round)
   //     5'b00000: data_temp = data1;
   //     default: data_temp= 0;
   // endcase
end
//assign outdata = data_temp;
assign outdata = data1;
endmodule
