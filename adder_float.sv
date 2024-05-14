module adder_float(
  input  logic [31:0] a, b,
  output logic [31:0] y
);

// greater (g) and lower (l) numbers
logic [31: 0] g, l;
logic [30:23] exps_diff;
logic [23: 0] sum;
logic         y_sign;

assign sign_a = a[31];
assign sign_b = b[31];
logic greater_one_found;

always_comb begin
  if (a[30:23] >= b[30:23]) begin g = a; l = b; end
  else                      begin g = b; l = a; end

  exps_diff = g[30:23] - l[30:23];

  l[23:0] = {'1, l[22:0]} >> exps_diff;
  g[23:0] = {'1, g[22:0]};

  {y_sign, sum} = {sign_a, g} + {sign_b, l};

  sum = sum;
  g[30:23] = g[30:23];
  greater_one_found = 0;
  for (int i = 23; i != 0; i-=1) begin
    if ( (sum >= 2**i) & !greater_one_found) begin 
      sum = sum << (23-i);
      g[30:23] = g[30:23] - (23-i);
      greater_one_found = 1;
    end
  end

  y = {y_sign, g[30:23], sum[22:0]};
end

endmodule