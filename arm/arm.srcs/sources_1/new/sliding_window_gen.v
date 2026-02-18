`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 20:14:55
// Design Name: 
// Module Name: sliding_window_gen
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

module sliding_window_gen (
    input  wire       clk,
    input wire rst ,
    input  wire [7:0] pixel_in,
    input  wire       pixel_valid,
    output reg        window_valid,
    output reg [7:0]  p0,p1,p2,p3,p4,p5,p6,p7,p8
);

reg [3:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        p0 <= 0; p1 <= 0; p2 <= 0;
        p3 <= 0; p4 <= 0; p5 <= 0;
        p6 <= 0; p7 <= 0; p8 <= 0;
        window_valid <= 0;
        count <= 0;
    end
    else if (pixel_valid) begin
        p0 <= pixel_in;
        p1 <= p0;  p2 <= p1;
        p3 <= p2;  p4 <= p3;  p5 <= p4;
        p6 <= p5;  p7 <= p6;  p8 <= p7;
        
           if(count < 9)
            count <= count + 1;

        window_valid <= (count >= 8);
    end
    else begin
        window_valid <= 0;
    end
end

endmodule
