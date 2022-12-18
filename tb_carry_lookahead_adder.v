`timescale 1ns / 1ps

module tb_carry_lookahead_adder(

    );
reg [63:0] a;
reg [63:0] b; 
wire [63:0] s;

     
carry_lookahead_adder  tb12(a,b,s);


initial begin
a = 64'd400;
b = 64'd320;
end
endmodule
