`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2026 20:08:45
// Design Name: 
// Module Name: conv_weights
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


module conv_weights (
    output reg signed [7:0] k0,k1,k2,k3,k4,k5,k6,k7,k8
);

    reg [7:0] mem [0:8];

    initial begin
        $readmemh("kernel.mem", mem);

        k0 = mem[0];
        k1 = mem[1];
        k2 = mem[2];
        k3 = mem[3];
        k4 = mem[4];
        k5 = mem[5];
        k6 = mem[6];
        k7 = mem[7];
        k8 = mem[8];
    end

endmodule

