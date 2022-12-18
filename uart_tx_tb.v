`timescale 1ns / 1ps

module uart_tx_tb(

    );
    
reg clk;
reg [15:0]baslik;
reg [63:0]sayi1;
reg [63:0]sayi2;
wire out;
wire [7:0] checksum;

uart_tx  tb_uart(clk,    
baslik, 
sayi1,  
sayi2,  
out,    
checksum);

always begin
#2
clk=~clk;
end

initial begin
clk=0;
baslik = 16'b0;
sayi1 = 64'd300;
sayi2 = 64'd600;
#16
baslik = 16'hBACD;

end

endmodule
