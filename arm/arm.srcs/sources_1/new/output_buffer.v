`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 20:27:06
// Design Name: 
// Module Name: output_buffer
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

module output_buffer (
    input  wire             clk,
    input wire              rst,
    input  wire signed [23:0] in,
    output reg  signed [23:0] out
);

    always @(posedge clk or posedge rst) begin
        if(rst)
            out <= 24'sd0;
        else
            out <= in;
    end

endmodule



