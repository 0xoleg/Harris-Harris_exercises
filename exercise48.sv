module code1(
  input logic clk, a, b, c,
  output logic y
);

logic x;

always_ff @(posedge clk) begin
  x = a & b;
  y = x | c;
end

endmodule


module code2 (
  input logic a, b, c, clk,
  output logic y
);

logic x;

always_ff @(posedge clk) begin
  y = x | c;
  x = a & b;
end

endmodule