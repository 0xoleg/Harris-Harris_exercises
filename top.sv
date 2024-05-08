`include "lsl.sv"

module top (
  input  logic clk,
  output logic out
);

lsl #(.WIDTH(32), .SHIFT(2)) DUT();

endmodule