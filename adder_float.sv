module adder_float(
  input  logic [31:0] a, b,
  output logic [31:0] y
);

// greater (g) and lower (l) numbers
logic [31: 0] g, l;
logic [30:23] tmp;

always_comb begin
  if (a[30:23] >= b[30:23]) begin g = a; l = b; end
  else                      begin g = b; l = a; end

  tmp = g[30:23] - l[30:23];
  
  l[22:0] = l[22:0] >> tmp;

  y = g[22:0] + l[22:0];
end

endmodule