`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 19:56:30
// Design Name: 
// Module Name: cnn_controller
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


module cnn_controller(input wire clk , rst , start , output reg done);
reg [1:0] state;
parameter IDLE = 2'b00,
          RUN = 2'b01,
          FINISH = 2'b10;
always @ (posedge clk or posedge rst)
begin
if (rst) 
begin
state <= IDLE;
done <= 1'b0;
end
else begin 
case (state)
IDLE: begin 
      done <= 1'b0;
      if (start)
      state <= RUN;
      end
RUN: begin
     done <= 1'b0;
     state <= FINISH;
end
FINISH: begin
        done <= 1'b1;
        state <= IDLE;
        end
default: begin 
      done <= 1'b0;
      if (start)
      state <= RUN;
      end
   endcase 
  end 
end
endmodule
