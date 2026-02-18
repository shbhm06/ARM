`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 20:24:45
// Design Name: 
// Module Name: cnn_top
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


module cnn_top (
    input  wire        clk,
    input  wire        rst,
    input  wire        start,
    input  wire [7:0]  pixel_in,
    input  wire        pixel_valid,
    output wire [23:0] result_out,
    output wire        done
);

    wire        window_valid;
    wire [7:0]  p0,p1,p2,p3,p4,p5,p6,p7,p8;
    wire signed [23:0] conv_sum;
    wire signed [23:0] relu_out;

    cnn_controller ctrl (
        .clk(clk),
        .rst(rst),
        .start(start),
        .done(done)
    );

    sliding_window_gen win (
        .clk(clk),
        .rst(rst),
        .pixel_in(pixel_in),
        .pixel_valid(pixel_valid),
        .window_valid(window_valid),
        .p0(p0), .p1(p1), .p2(p2),
        .p3(p3), .p4(p4), .p5(p5),
        .p6(p6), .p7(p7), .p8(p8)
    );

    conv_mac mac (
        .clk(clk),
        .rst(rst),
        .enable(window_valid),
        .p0(p0), .p1(p1), .p2(p2),
        .p3(p3), .p4(p4), .p5(p5),
        .p6(p6), .p7(p7), .p8(p8),
        .conv_sum(conv_sum)
    );

    relu_act relu_inst (
        .in(conv_sum),
        .out(relu_out)
    );

    output_buffer out_buf (
        .clk(clk),
        .rst(rst),
        .in(relu_out),
        .out(result_out)
    );

endmodule

