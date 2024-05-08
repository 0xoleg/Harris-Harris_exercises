module lsl#(
  parameter WIDTH = 2,
  parameter SHIFT = 2
)(
  input  logic [WIDTH-1 : 0] a,
  output logic [WIDTH-1 : 0] y
);

assign y = a << SHIFT;

endmodule