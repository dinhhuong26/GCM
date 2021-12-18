`timescale 1ps/1ps
`include "boxP.v"

module boxP_tb;
wire [99:0] data_out;
reg [99:0] data_in;
reg clk;
reg reset;
always #5 clk = ~clk;
boxP tb(.data_in(data_in),.data_out(data_out),.clk(clk),.reset(reset));
initial begin
    #10 reset = 1'b1;
        data_in = 100'h1245347abfd15e15fdab1c24f;
    #50 reset = 1'b0;
    #200 $finish;
end   
endmodule