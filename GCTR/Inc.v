module Inc (
    input [63:0] icb_in,
    output [63:0] icb_out
);
reg [31:0] icb_temp ;
assign icb_out[63:32] = icb_in[63:32] ;
always @(*) begin
    if(icb_in +1 >= 2**32)begin
          icb_temp [31:0] = icb_in[31:0] + 1;
    end
    else begin
          icb_temp [31:0] = icb_in [31:1] + 1;
    end
end
assign icb_out[31:0] = icb_temp [31:0];
endmodule

