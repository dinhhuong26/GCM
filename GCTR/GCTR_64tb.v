`timescale  1ns/1ps
`include "GCTR_64.v"

`define PLAINTEXT1 64'h834349fd8e99a23b
`define KEY1   80'h3014f4d8c37d9cc7e689

module GCTR_64tb;
   wire [63:0] outdata;
   reg [63:0] indata = 0;
   reg [79:0] key  = 0;
   reg clk         = 1'b0;
   reg reset       = 1'b0;

always #5 clk = ~clk;
GCTR_64 abc(.data_in(indata),.key(key),.reset(reset),.clk(clk),.data_out(outdata));
   initial begin
       #10 reset = 1'b1;
           indata = `PLAINTEXT1;
           key = `KEY1;
        #50 reset = 1'b0;
        #400 $finish;
   end
endmodule
