module subcell_tb;
 wire  [99:0] state_out;
 reg  [99:0] state_in;
  subcell sc((state_in),(state_out));
  initial begin
      #10 state_in[99:0] = 100'b0100101011101101101110100010001100111000111110011111100101011001010101111000110011000001000011100101;
      #400 $finish;
  end

endmodule
