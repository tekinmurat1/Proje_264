`timescale 1ns / 1ps



module ripple_adder(
input clk,
input [63:0]A,
input [63:0]B,
output [63:0]sum
    );
    wire [63:0]carry;
    

        full_adder fa0(.a(A[0]),   .b(B[0]),   .carry(1'b0),          .cout(carry[0]),   .sout(sum[0]));
        full_adder fa1(.a(A[1]),   .b(B[1]),   .carry(carry[0]),      .cout(carry[1]),   .sout(sum[1]));
        full_adder fa2(.a(A[2]),   .b(B[2]),   .carry(carry[1]),      .cout(carry[2]),   .sout(sum[2]));
        full_adder fa3(.a(A[3]),   .b(B[3]),   .carry(carry[2]),      .cout(carry[3]),   .sout(sum[3]));
        full_adder fa4(.a(A[4]),   .b(B[4]),   .carry(carry[3]),      .cout(carry[4]),   .sout(sum[4]));
        full_adder fa5(.a(A[5]),   .b(B[5]),   .carry(carry[4]),      .cout(carry[5]),   .sout(sum[5]));
        full_adder fa6(.a(A[6]),   .b(B[6]),   .carry(carry[5]),      .cout(carry[6]),   .sout(sum[6]));
        full_adder fa7(.a(A[7]),   .b(B[7]),   .carry(carry[6]),      .cout(carry[7]),   .sout(sum[7]));
        full_adder fa8(.a(A[8]),   .b(B[8]),   .carry(carry[7]),      .cout(carry[8]),   .sout(sum[8]));
        full_adder fa9(.a(A[9]),   .b(B[9]),   .carry(carry[8]),      .cout(carry[9]),   .sout(sum[9]));
        full_adder fa10(.a(A[10]), .b(B[10]),  .carry(carry[9]),      .cout(carry[10]),  .sout(sum[10]));
        full_adder fa11(.a(A[11]), .b(B[11]),  .carry(carry[10]),     .cout(carry[11]),  .sout(sum[11]));
        full_adder fa12(.a(A[12]), .b(B[12]),  .carry(carry[11]),     .cout(carry[12]),  .sout(sum[12]));
        full_adder fa13(.a(A[13]), .b(B[13]),  .carry(carry[12]),     .cout(carry[13]),  .sout(sum[13]));
        full_adder fa14(.a(A[14]), .b(B[14]),  .carry(carry[13]),     .cout(carry[14]),  .sout(sum[14]));
        full_adder fa15(.a(A[15]), .b(B[15]),  .carry(carry[14]),     .cout(carry[15]),  .sout(sum[15]));
        full_adder fa16(.a(A[16]), .b(B[16]),  .carry(carry[15]),     .cout(carry[16]),  .sout(sum[16]));
        full_adder fa17(.a(A[17]), .b(B[17]),  .carry(carry[16]),     .cout(carry[17]),  .sout(sum[17]));
        full_adder fa18(.a(A[18]), .b(B[18]),  .carry(carry[17]),     .cout(carry[18]),  .sout(sum[18]));
        full_adder fa19(.a(A[19]), .b(B[19]),  .carry(carry[18]),     .cout(carry[19]),  .sout(sum[19]));
        full_adder fa20(.a(A[20]), .b(B[20]),  .carry(carry[19]),     .cout(carry[20]),  .sout(sum[20]));
        full_adder fa21(.a(A[21]), .b(B[21]),  .carry(carry[20]),     .cout(carry[21]),  .sout(sum[21]));
        full_adder fa22(.a(A[22]), .b(B[22]),  .carry(carry[21]),     .cout(carry[22]),  .sout(sum[22]));
        full_adder fa23(.a(A[23]), .b(B[23]),  .carry(carry[22]),     .cout(carry[23]),  .sout(sum[23]));
        full_adder fa24(.a(A[24]), .b(B[24]),  .carry(carry[23]),     .cout(carry[24]),  .sout(sum[24]));
        full_adder fa25(.a(A[25]), .b(B[25]),  .carry(carry[24]),     .cout(carry[25]),  .sout(sum[25]));
        full_adder fa26(.a(A[26]), .b(B[26]),  .carry(carry[25]),     .cout(carry[26]),  .sout(sum[26]));
        full_adder fa27(.a(A[27]), .b(B[27]),  .carry(carry[26]),     .cout(carry[27]),  .sout(sum[27]));
        full_adder fa28(.a(A[28]), .b(B[28]),  .carry(carry[27]),     .cout(carry[28]),  .sout(sum[28]));
        full_adder fa29(.a(A[29]), .b(B[29]),  .carry(carry[28]),     .cout(carry[29]),  .sout(sum[29]));
        full_adder fa30(.a(A[30]), .b(B[30]),  .carry(carry[29]),     .cout(carry[30]),  .sout(sum[30]));
        full_adder fa31(.a(A[31]), .b(B[31]),  .carry(carry[30]),     .cout(carry[31]),  .sout(sum[31]));
        full_adder fa32(.a(A[32]), .b(B[32]),  .carry(carry[31]),     .cout(carry[32]),  .sout(sum[32]));
        full_adder fa33(.a(A[33]), .b(B[33]),  .carry(carry[32]),     .cout(carry[33]),  .sout(sum[33]));
        full_adder fa34(.a(A[34]), .b(B[34]),  .carry(carry[33]),     .cout(carry[34]),  .sout(sum[34]));
        full_adder fa35(.a(A[35]), .b(B[35]),  .carry(carry[34]),     .cout(carry[35]),  .sout(sum[35]));
        full_adder fa36(.a(A[36]), .b(B[36]),  .carry(carry[35]),     .cout(carry[36]),  .sout(sum[36]));
        full_adder fa37(.a(A[37]), .b(B[37]),  .carry(carry[36]),     .cout(carry[37]),  .sout(sum[37]));
        full_adder fa38(.a(A[38]), .b(B[38]),  .carry(carry[37]),     .cout(carry[38]),  .sout(sum[38]));
        full_adder fa39(.a(A[39]), .b(B[39]),  .carry(carry[38]),     .cout(carry[39]),  .sout(sum[39]));
        full_adder fa40(.a(A[40]), .b(B[40]),  .carry(carry[39]),     .cout(carry[40]),  .sout(sum[40]));
        full_adder fa41(.a(A[41]), .b(B[41]),  .carry(carry[40]),     .cout(carry[41]),  .sout(sum[41]));
        full_adder fa42(.a(A[42]), .b(B[42]),  .carry(carry[41]),     .cout(carry[42]),  .sout(sum[42]));
        full_adder fa43(.a(A[43]), .b(B[43]),  .carry(carry[42]),     .cout(carry[43]),  .sout(sum[43]));
        full_adder fa44(.a(A[44]), .b(B[44]),  .carry(carry[43]),     .cout(carry[44]),  .sout(sum[44]));
        full_adder fa45(.a(A[45]), .b(B[45]),  .carry(carry[44]),     .cout(carry[45]),  .sout(sum[45]));
        full_adder fa46(.a(A[46]), .b(B[46]),  .carry(carry[45]),     .cout(carry[46]),  .sout(sum[46]));
        full_adder fa47(.a(A[47]), .b(B[47]),  .carry(carry[46]),     .cout(carry[47]),  .sout(sum[47]));
        full_adder fa48(.a(A[48]), .b(B[48]),  .carry(carry[47]),     .cout(carry[48]),  .sout(sum[48]));
        full_adder fa49(.a(A[49]), .b(B[49]),  .carry(carry[48]),     .cout(carry[49]),  .sout(sum[49]));
        full_adder fa50(.a(A[50]), .b(B[50]),  .carry(carry[49]),     .cout(carry[50]),  .sout(sum[50]));
        full_adder fa51(.a(A[51]), .b(B[51]),  .carry(carry[50]),     .cout(carry[51]),  .sout(sum[51]));
        full_adder fa52(.a(A[52]), .b(B[52]),  .carry(carry[51]),     .cout(carry[52]),  .sout(sum[52]));
        full_adder fa53(.a(A[53]), .b(B[53]),  .carry(carry[52]),     .cout(carry[53]),  .sout(sum[53]));
        full_adder fa54(.a(A[54]), .b(B[54]),  .carry(carry[53]),     .cout(carry[54]),  .sout(sum[54]));
        full_adder fa55(.a(A[55]), .b(B[55]),  .carry(carry[54]),     .cout(carry[55]),  .sout(sum[55]));
        full_adder fa56(.a(A[56]), .b(B[56]),  .carry(carry[55]),     .cout(carry[56]),  .sout(sum[56]));
        full_adder fa57(.a(A[57]), .b(B[57]),  .carry(carry[56]),     .cout(carry[57]),  .sout(sum[57]));
        full_adder fa58(.a(A[58]), .b(B[58]),  .carry(carry[57]),     .cout(carry[58]),  .sout(sum[58]));
        full_adder fa59(.a(A[59]), .b(B[59]),  .carry(carry[58]),     .cout(carry[59]),  .sout(sum[59]));
        full_adder fa60(.a(A[60]), .b(B[60]),  .carry(carry[59]),     .cout(carry[60]),  .sout(sum[60]));
        full_adder fa61(.a(A[61]), .b(B[61]),  .carry(carry[60]),     .cout(carry[61]),  .sout(sum[61]));
        full_adder fa62(.a(A[62]), .b(B[62]),  .carry(carry[61]),     .cout(carry[62]),  .sout(sum[62]));
        full_adder fa63(.a(A[63]), .b(B[63]),  .carry(carry[62]),     .cout(carry[63]),  .sout(sum[63])); // fazladan gelen bit yok oyle istenmis

    
endmodule
