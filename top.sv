`include "adder_float.sv"

module top (
  input  logic clk,
  input  logic [31:0] a, b,
  output logic [31:0] out
);

mul_float DUT(a, b, out);

endmodule