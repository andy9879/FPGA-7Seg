`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2024 08:43:56 AM
// Design Name: 
// Module Name: 7-Seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Seg(
    sw,
    seg,
    an,
    clk,
    led
    );
    output [0:7] led;
    input [0:7] sw;
    output [0:6] seg;
    output [0:3] an;
    input clk;
    
    reg [0:7] led;
    
    reg [0:6] seg;
    reg [0:3] an;
    
    reg [0:1] state;
    reg [0:11] clkDivReg;
    
    reg [0:0] clkDiv;
    
    always @(posedge clk) begin
        if(clkDivReg == 8'hFFFF) begin 
            clkDivReg <= 8'h00;
            clkDiv <= ~clkDiv;    
        end
        clkDivReg = clkDivReg + 1;
     end
    
    parameter seg1 = 2'b0;
    parameter seg2 = 2'b1;
    
    always @(posedge clkDiv) begin
        case(state)
             seg1:
                begin
                    an <= 4'b0111;
                    if((sw & 8'h0F) == 8'h00)
                        begin
                            seg <= 7'b0000001;
                        end
                    else if((sw & 8'h0F) == 8'h01)
                        begin
                            seg <= 7'b1001111;
                        end
                   else if((sw & 8'h0F) == 8'h02)
                        begin
                            seg <= 7'b0010010;
                        end
                   else if((sw & 8'h0F) == 8'h03)
                        begin
                            seg <= 7'b0000110;
                        end
                   else if((sw & 8'h0F) == 8'h04)
                        begin
                            seg <= 7'b1001100;
                        end
                   else if((sw & 8'h0F) == 8'h05)
                        begin
                            seg <= 7'b0100100;
                        end
                   else if((sw & 8'h0F) == 8'h06)
                        begin
                            seg <= 7'b0100000;
                        end
                   else if((sw & 8'h0F) == 8'h07)
                        begin
                            seg <= 7'b0001111;
                        end
                   else if((sw & 8'h0F) == 8'h08)
                        begin
                            seg <= 7'b0000000;
                        end
                   else if((sw & 8'h0F) == 8'h09)
                        begin
                            seg <= 7'b0000100;
                        end
                   else if((sw & 8'h0F) == 8'h0a)
                        begin
                            seg <= 7'b0001000;
                        end
                   else if((sw & 8'h0F) == 8'h0b)
                        begin
                            seg <= 7'b1100000;
                        end
                    else if((sw & 8'h0F) == 8'h0c)
                        begin
                            seg <= 7'b0110001;
                        end
                    else if((sw & 8'h0F) == 8'h0d)
                        begin
                            seg <= 7'b1000010;
                        end
                    else if((sw & 8'h0F) == 8'h0e)
                        begin
                            seg <= 7'b0110000;
                        end
                    else if((sw & 8'h0F) == 8'h0f)
                        begin
                            seg <= 7'b0111000;
                        end
                     
                    
                    state = state + 1;
                end
            seg2:
                begin
                    an <= 4'b1011;
                    if((sw & 8'hF0) == 8'h00)
                        begin
                            seg <= 7'b0000001;
                        end
                    else if((sw & 8'hF0) == 8'h10)
                        begin
                            seg <= 7'b1001111;
                        end
                   else if((sw & 8'hF0) == 8'h20)
                        begin
                            seg <= 7'b0010010;
                        end
                   else if((sw & 8'hF0) == 8'h30)
                        begin
                            seg <= 7'b0000110;
                        end
                   else if((sw & 8'hF0) == 8'h40)
                        begin
                            seg <= 7'b1001100;
                        end
                   else if((sw & 8'hF0) == 8'h50)
                        begin
                            seg <= 7'b0100100;
                        end
                   else if((sw & 8'hF0) == 8'h60)
                        begin
                            seg <= 7'b0100000;
                        end
                   else if((sw & 8'hF0) == 8'h70)
                        begin
                            seg <= 7'b0001111;
                        end
                   else if((sw & 8'hF0) == 8'h80)
                        begin
                            seg <= 7'b0000000;
                        end
                   else if((sw & 8'hF0) == 8'h90)
                        begin
                            seg <= 7'b0000100;
                        end
                   else if((sw & 8'hF0) == 8'ha0)
                        begin
                            seg <= 7'b0001000;
                        end
                   else if((sw & 8'hF0) == 8'hb0)
                        begin
                            seg <= 7'b1100000;
                        end
                    else if((sw & 8'hF0) == 8'hc0)
                        begin
                            seg <= 7'b0110001;
                        end
                    else if((sw & 8'hF0) == 8'hd0)
                        begin
                            seg <= 7'b1000010;
                        end
                    else if((sw & 8'hF0) == 8'he0)
                        begin
                            seg <= 7'b0110000;
                        end
                    else if((sw & 8'hF0) == 8'hf0)
                        begin
                            seg <= 7'b0111000;
                        end 
                    state <= 0;
                end
            endcase
    end
endmodule
