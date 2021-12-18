module shiftrows (
    input wire [99:0] state_in,
    output wire [99:0] state_out
);
    //row o shifted 0
   assign state_out[99:80] = state_in[99:80];
    // row 1 shifted 1
   assign state_out[79:60] = {state_in[75:60], state_in[79:76]};
    // row 2 shifted 2
   assign state_out[59:40] = {state_in[51:40] , state_in[59:52]};
    // row 3 shifted 3
   assign  state_out[39:20] = {state_in[27:20] , state_in[39:28]};
    // row 4 shifted 4
   assign state_out[19:0] = {state_in[3:0] , state_in[19:4]};
    
    //state_out[99:0] = state_shift[99:0];
endmodule
