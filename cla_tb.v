`timescale 1ns / 1ps



module cla_tb(

    );
    
    reg [63:0] a;
    reg[63:0] b;
    wire[63:0] sum;
    
    
    carry_lookahead_adder ctb(a,b,sum);
    
    
    initial begin
    a = 64'd450;
    b = 64'd600;
    
    end
endmodule
