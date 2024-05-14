`include "adder_float.sv"

module top (
  input  logic clk,
  output logic out
);

adder_float DUT();

endmodule