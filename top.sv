`include "prefix_adder_32bit.sv"

module top (
  input  logic clk,
  input  logic [31:0] a, b,
  output logic [31:0] out
);

prefix_adder_32bit DUT(a, b, out);

endmodule