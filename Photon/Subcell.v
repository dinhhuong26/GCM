`include "sbox.v"
module subcell (
    input wire [99:0]state_in,
    output wire [99:0]state_out 
);
genvar i;
generate
    for (i = 99; i >= 0; i = i-4)begin
        sbox sb(.datain(state_in[i:i-3]),.dataout(state_out[i:i-3]));
    end
endgenerate
endmodule
