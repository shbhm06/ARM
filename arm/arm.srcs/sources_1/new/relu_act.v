`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 19:34:11
// Design Name: 
// Module Name: relu_act
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


module relu_act(input wire signed [23:0] in ,
                output wire signed [23:0] out );
assign out = (in < 0) ? 24'd0 : in;
endmodule
