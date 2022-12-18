`timescale 1ns / 1ps

module ripple_adder_tb(

    );
    
reg clk;
reg [63:0]A;
reg [63:0]B;
wire [63:0]sum;

ripple_adder rpa(clk,A,B,sum);


initial begin
A= 64'd500;
B= 64'd700;
end

endmodule
