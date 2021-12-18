


`timescale 1ns/1ps
`include "present80.v"

`define PLAINTEXT0 64'h0000000000000000
`define PLAINTEXT1 64'h834349fd8e99a23b
`define PLAINTEXT2 64'h9281dcb8a883a38c
`define PLAINTEXT3 64'hd392f4ec58356aeb
`define PLAINTEXT4 64'h3e5380018fc28d70

`define KEY0   80'h00000000000000000000
`define KEY1   80'h3014f4d8c37d9cc7e689
`define KEY2   80'h88239f8276ec927c8dec
`define KEY3   80'h610dcecce9a001117102
`define KEY4   80'h01f43bbc9b2001545339


module present80_tb;

   wire [63:0] outdata;
   reg [63:0] indata = 0;
   reg [79:0] key  = 0;
   reg load        = 1'b0;
   reg clk         = 1'b0;
   reg reset       = 1'b0;

   present80 dut(.outdata(outdata),.indata(indata),.key(key),.load(load),.clk(clk));

   // tao xung clock
   always  #5 clk = ~clk;
   // chay cac gia tri khoi tao
   initial
   begin
      #10   load = 1'b1; indata = `PLAINTEXT0; key = `KEY0;
      #50   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT1; key = `KEY0;
      #100   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT2; key = `KEY0;
      #100   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT3; key = `KEY0;
      #100  load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT4; key = `KEY0;
      #10   load = 1'b0;

      #400  load = 1'b1; indata = `PLAINTEXT1; key = `KEY1;
   
      #400  load = 1'b1; indata = `PLAINTEXT1; key = `KEY1;
      #10   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT2; key = `KEY1;
      #10   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT3; key = `KEY1;
      #10   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT4; key = `KEY1;
      #10   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT0; key = `KEY2;
      #10   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT1; key = `KEY2;
      #10   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT2; key = `KEY2;
      #10   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT3; key = `KEY2;
      #10   load = 1'b0;
      #400  load = 1'b1; indata = `PLAINTEXT4; key = `KEY2;
      #10   load = 1'b0;
      #400 $finish;
   end
endmodule

