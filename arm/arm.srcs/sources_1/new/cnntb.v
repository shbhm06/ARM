`timescale 1ns / 1ps

module tb_cnn;

reg clk = 0;
reg rst = 1;
reg start = 0;
reg [7:0] pixel_in = 0;
reg pixel_valid = 0;

wire [23:0] result_out;
wire done;

cnn_top dut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .pixel_in(pixel_in),
    .pixel_valid(pixel_valid),
    .result_out(result_out),
    .done(done)
);


always #5 clk = ~clk;

initial begin
    rst = 1;
    start = 0;
    pixel_valid = 0;
    pixel_in = 0;

    #30 rst = 0;

    #10 start = 1;
    #10 start = 0;

    #10;

    pixel_valid = 1;
    pixel_in = 8'd1;

    repeat(784) begin
        @(posedge clk);
        pixel_in = pixel_in + 1;
    end

    pixel_valid = 0;

    #200 $finish;
end

always @(posedge clk) begin
    $display("Time=%0t | p0=%0d p1=%0d p2=%0d p3=%0d p4=%0d p5=%0d p6=%0d p7=%0d p8=%0d | result=%0d",
        $time,
        dut.win.p0, dut.win.p1, dut.win.p2,
        dut.win.p3, dut.win.p4, dut.win.p5,
        dut.win.p6, dut.win.p7, dut.win.p8,
        result_out
    );
end

endmodule
