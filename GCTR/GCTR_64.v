`include "Inc.v"
`include "present80.v"
module GCTR_64 (
    input [63:0] data_in,
    input [79:0] key,
    input reset,
    input clk,
    output [63:0] data_out
);
    parameter ICB  = 64'b1010101110101100100011001010011000000000000010101010100110001010;

    reg [63:0] icb_reg0;
    wire [63:0] icb_reg;
    wire [63:0] data_xout;

    
    always @(posedge clk) 
    begin
    if (reset) begin
        icb_reg0 <= ICB;
        end
    else begin
        icb_reg0 <= icb_reg;
        end
    end
    Inc Inc1(.icb_in(icb_reg0), .icb_out(icb_reg));
    present80 PR(.outdata(data_xout), .indata(icb_reg0),.clk(clk), .key(key), .load(reset));
    assign data_out[63:0] = data_in[63:0] ^ data_xout[63:0];
endmodule

