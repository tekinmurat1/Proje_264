module carry_lookahead_adder
  (
   input [63:0] i_add1,
   input [63:0] i_add2,
   output [64:0]  o_result
   );
     
  wire [64:0]   c;
  wire [64:0]   g;
  wire [64:0]   p;
  wire [64:0]   sum;
  genvar i;
  generate
    for (i=0; i<64; i=i+1) 
      begin
        full_adder full_adder_inst
            ( 
              .a(i_add1[i]),
              .b(i_add2[i]),
              .carry(c[i]),
              .sout(sum[i])
              );
      end
  endgenerate
 
  genvar j;
  generate
    for (j=0; j<64; j=j+1) 
      begin
        assign g[j]   = i_add1[j] & i_add2[j];
        assign p[j]   = i_add1[j] | i_add2[j];
        assign c[j+1] = g[j] | (p[j] & c[j]);
      end
  endgenerate
   
  assign c[0] = 1'b0; 
 
  assign o_result =  sum;   
 
endmodule 