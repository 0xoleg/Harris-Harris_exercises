module adder_float(
  input  logic [31:0] a, b,
  output logic [31:0] y
);

// greater (g) and lower (l) numbers
logic [31: 0] g, l;
logic [ 7: 0] g_exponent, l_exponent;
logic [23: 0] g_with_implicit_one, l_with_implicit_one;
logic [ 7: 0] exps_diff;
logic [24: 0] sum, sum_next;
logic         g_sign, l_sign;

logic leading_one_found;

always_comb begin
  if (a[30:0] >= b[30:0]) begin g = a; l = b; end
  else                    begin g = b; l = a; end

  exps_diff = g[30:23] - l[30:23];

  l_with_implicit_one = {1'b1, l[22:0]} >> exps_diff;
  g_with_implicit_one = {1'b1, g[22:0]};

  g_sign = g[31];
  l_sign = l[31];
  if (g_sign ^ l_sign) sum = g_with_implicit_one - l_with_implicit_one;
  else                 sum = g_with_implicit_one + l_with_implicit_one;

  leading_one_found = 0;
  sum_next = sum;
  g_exponent = g[30:23]; 
  if (sum[24:23] > 0) begin
    for (int i = 1; i >=0; i-=1) begin
      if ( (sum[24:23] >= 2**i) & !leading_one_found ) begin
        sum_next = sum >> i;
        g_exponent = g[30:23] + i;
        leading_one_found = 1;
      end
    end
  end
  else begin
    for (int i = 22; i != 0; i-=1) begin
      if ( (sum[22:0] >= 2**i) & !leading_one_found) begin
        sum_next = sum << (22-(i-1));
        g_exponent = g[30:23] - (22-(i-1));
        leading_one_found = 1;
      end
    end
  end

  y = {g_sign, g_exponent, sum_next[22:0]};
end

endmodule