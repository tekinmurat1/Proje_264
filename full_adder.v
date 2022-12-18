`timescale 1ns / 1ps

module full_adder(
input a,
input b,
input carry,
output reg sout,
output reg cout
    );
    
    always@* begin
        sout= a^b^carry;
        cout = (a & b) | (b & carry) | (carry & a);
    end
endmodule
