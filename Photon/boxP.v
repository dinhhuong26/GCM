`include "addconstan.v"
`include "subcell.v"
`include "Mixclom.v"
`include "shiftrows.v"
module boxP (
    input wire [99:0] data_in,
    input clk,
    input reset,
    output wire [99:0] data_out
);
   reg [3:0] v = 4'h0;
   wire [99:0] data_wire1, data_wire2, data_wire3, data_wire4;
   reg [99:0] data_reg;

    always @(posedge clk) begin
       if(reset) begin
           data_reg <= data_in; 
       end
       else begin
            data_reg <= data_wire4;
       end
     end
    assign data_out = data_wire4;
    addconstan add (.state_in(data_reg), .state_out(data_wire1), .v(v));
    subcell sub(.state_in(data_wire1), .state_out(data_wire2));
    shiftrows srows(.state_in(data_wire2), .state_out(data_wire3));
    Mixclom mixc(.state_in(data_wire3), .state_out(data_wire4));

    always @(posedge clk) begin
        if(v > 11 || reset) begin
            v <= 4'h0;
        end
        else begin
            v <= v + 1;
        end
    end
endmodule