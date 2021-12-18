module IC (
    input [3:0]ic_in,
    output reg [3:0]ic_out
);
    always @(ic_in) begin
        case(ic_in)
           4'h0: ic_out = 4'h0;
           4'h1: ic_out = 4'h1;
           4'h2: ic_out = 4'h3;
           4'h3: ic_out = 4'h6;
           4'h4: ic_out = 4'h4; 
       endcase
    end
endmodule
    
