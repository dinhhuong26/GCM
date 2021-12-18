//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2021 08:37:54 AM
// Design Name: 
// Module Name: player
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


module player(
    input [63:0] datain,
    output [63:0] dataout
    );
genvar i;
generate
       for(i =0;i<64; i = i + 1) begin
       assign dataout[(i*16)/64+(i*16)%64] = dataout[i];
       end
endgenerate
endmodule


