`include "adder_float.sv"

module top (
  input  logic clk,
  input  logic [31:0] a, b,
  output logic [31:0] out
);

adder_float DUT(a, b, out);

endmodule