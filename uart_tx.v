`timescale 1ns / 1ps

module uart_tx (
input            clk,
input [15:0]     baslik,
input [63:0]     sayi1,
input [63:0]     sayi2,
output reg       out,
output reg [7:0] checksum
    );
    
// cesitli parametreler tanim kolayligi icin 
parameter clk_freq = 100000000;  
parameter baud_rate = 115_200;
parameter reset        =   3'b111;      
parameter idle         =   3'b001;
parameter start        =   3'b010;
parameter data_gonder  =   3'b011;
parameter sumcheck     =   3'b100;

reg [2:0]   state       = 3'b001;       //durumlari belirtir   
reg [127:0] data        = 128'b0;       // sum1 ve sum2yi data dabirlestirip oyle gonderiyoruz
reg [6:0]   index       = 7'b0;         // hangi bitte oldugunun kontrolu 128 biti(sayi) 8 bit ile gosteririz
reg [3:0]   start_index = 4'b0;         // baslangic bitlerini gonderirkenki bit kontrolu
reg [2:0]   check_index = 3'b0;         // checksum iletilirkenki bit kontrolu

initial begin
out = 1'b1;                             // idle durumundayken outa surekli  1 gidiyor 
end

always@ (posedge clk)begin
    
    case(state)
        default: begin
            state <= idle;                              // default durum idle durumu
        end
    
        idle: begin
            out   <= 1'b1;                              // cikis yok iken 1 high value
            index <= 7'b0;                              // cikis yok ilk indexte duruyor
            data  <= 128'b0;                            // idle(bosta) durumunda elimizde bir veri de yok
            if(baslik == 16'hBACD)begin                 // baslik kontrolu
                data <= {sayi1,sayi2};                  // gonderecegimiz verileri birlestirdik
                out <= 1'b0;                            // cikis verecegimiz icin durum degisti  1clk boyunca low valueda bekleyecek
                checksum <= (sayi1+sayi2+baslik) % 256; // checksum tanimlama sonrasinda kontrol edecegiz
                state <= start;                         // idle dan starta gectik
            end
        end
        
        
        start: begin
            out <= baslik[start_index];                 //baslik degerini outa yazdirmaya basladik
            
            if(&start_index)begin                       // son bite geldik her sey yazildi simdi data gondermine baslayabiliriz,
                start_index = 4'b0;
                state <= data_gonder;
            end else begin
                start_index = start_index+1;
            end
            
        end
        
        
        data_gonder: begin
            out <= data[index];                         //data yani sum1 ve sum2 degerleri gonderiliyor
            
            if(&index)begin                             //&index durumu olmasi icin indexin tum bitleri 1 olmali 
                index <= 7'b0;
                state <= sumcheck;
            end else begin
                index <= index+1;
            end   
        end
        
        
        sumcheck: begin
            
            out <= checksum[check_index];               // datadan sonra checksumda gonderiliyor ve geri idle durumuna donuluyor.
            
            if(&check_index)begin
                check_index <= 3'b0;
                state <= idle;
            end else begin
                check_index = check_index +1;
            end
        end
    
    endcase
    
    
end



endmodule
