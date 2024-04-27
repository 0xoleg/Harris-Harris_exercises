module exercise44(
  input  logic       clk,
  input  logic [3:0] in,
  output logic       y
);

logic [3:0] a;
logic b, c, d;

always_ff @(posedge clk) begin
  a <= in;
end

always_comb begin
  b = a[3] ^ a[2];
  c = a[1] ^ b;
  d = a[0] ^ c;
end

always_ff @(posedge clk) begin
  y <= d;
end

endmodule