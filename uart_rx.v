`timescale 1ns / 1ps
module uart_rx(
input               clk,
input               data_in,
output reg          data_out

    );
parameter clk_freq = 100_000_000;  
parameter baud_rate = 115_200;

parameter reset        =   3'b111;      
parameter idle         =   3'b001;
parameter start        =   3'b010;
parameter data_gonder  =   3'b011;
parameter sumcheck     =   3'b100;

reg [2:0]       state          = 3'b001;
reg [15:0]      gelen_baslik   = 16'b0;
reg [127:0]     gelen_data     = 128'b0;
reg [15:0]      gelen_sumcheck = 16'b0;
reg [3:0]       start_index    = 4'b0;

always@ (posedge clk) begin
    
    case(state)
        default: begin
            state <= idle;                              // default durum idle durumu
        end
        idle: begin
            if(data_in == 1'b1)begin
                data_out <= 0;
                state <= idle;
            end else if(data_in==0) begin
                state <= start;
            end
        end
        
        start: begin
            gelen_baslik <= data_in;
            if(&start_index)begin                       // son bite geldik her sey yazildi simdi data gondermine baslayabiliriz,
                start_index = 4'b0;
                state <= data_gonder;
            end else begin
                start_index = start_index +1;
            end
        end        
    
    endcase
end


endmodule
