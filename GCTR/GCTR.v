module GCTR (
    input [138:0] data_in,
    input  reset,
    input [80:0] key,
    input clk,
    output [138:0]data_out
);
parameter n = 139;
parameter ICB  = 64'b1010101110101100100011001010011000000000000010101010100110001010;
reg [63:0] icb_temp;
reg [63:0] icb_reg;
reg [63:0] datax_round;
reg [63:0] data_xout;
reg [63:0] data_yround;     
reg [((n/64)+1)*64 : 0] data_x;
reg [(n-1) : 0] data_outtemp;

// reg [63:0] data_x[(n/64):0];
// reg [63:0] data_dem[(n/64):0];
// reg [63:0] data_ytemp[(n/64):0];
integer round;

always @(*) begin
    if(round < n /64)begin
       datax_round[63:0] <= data_in[(n-1)-round*64 : n -64*(round + 1)];
    end
    else begin
        datax_round [63:0] <= 0 + data_in[(n-1)-(n/64)*6 : 0];
    end
end 
// genvar i;
// generate begin
// for(i =0; i< (n/64); i= i +1)begin
//     data_x[i] = data_in[(n-1)- i*64 : n - 64*(i+1)] ; 
// end
// endgenerate
// assign data_x[(n/64)] = data_in[(n-1)-(n/64)*64 : 0];

//Cap nhat icb
Inc inc(.icb_in(icb_temp), .icb_out(icb_reg));

always @(posedge clk) 
begin
    if (reset == 1) begin
        icb_reg <= ICB;
    end
    else begin
        icb_temp <= icb_reg;
    end
end

always @(posedge clk) begin
    if(reset == 1 || round > (n/64+1)) begin
        round = 0;
    end
    else begin
        round <= round + 1;
    end
end

present80 PR(.outdata(data_xout), .indata(icb_reg),.clk(clk), .key(key), .load(reset));
always @(*) begin
     data_yround[63:0] <= data_xout[63:0] ^ datax_round[63:0];
     data_outtemp[(n-1)-round*64 : n -64*(round +1)] <= data_yround[63:0];
end
 assign data_out[(n-1):0] = data_outtemp[(n-1): 0];


// present80 PR(.outdata(data_dem[round]), .indata(icb_reg),.clk(clk), .key(key), .load(reset));
// always @(*) begin
//     data_ytemp[round] <= data_dem[round] ^ data_x[ound];
// end
// genvar j;
// generate begin
//     for(j=0; j <= n/64; j=j+1)begin
//         data_out[(n-1)- j*64 : n - 64*(j+1)] = data_ytemp[j];
//     end
// endgenerate
endmodule

