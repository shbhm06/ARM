`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 18:55:01
// Design Name: 
// Module Name: conv_mac
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


module conv_mac (
    input  wire clk,
    input  wire rst,
    input  wire enable,

    input  wire signed [7:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,
    output reg  signed [23:0] conv_sum
);

    wire signed [7:0] k0,k1,k2,k3,k4,k5,k6,k7,k8;

    conv_weights W (
        .k0(k0), .k1(k1), .k2(k2),
        .k3(k3), .k4(k4), .k5(k5),
        .k6(k6), .k7(k7), .k8(k8)
    );

    always @(posedge clk or posedge rst) begin
        if (rst)
            conv_sum <= 24'sd0;
        else if (enable)
            conv_sum <=
                p0*k0 + p1*k1 + p2*k2 +
                p3*k3 + p4*k4 + p5*k5 +
                p6*k6 + p7*k7 + p8*k8;
    end

endmodule

