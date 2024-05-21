module mul_float(
  input  logic [31:0] a, b,
  output logic [31:0] y
);

// greater (g) and lower (l) numbers
logic [31:0] g, l;
logic [ 7:0] g_exponent, l_exponent;
logic [23:0] g_with_implicit_one, l_with_implicit_one;
logic [ 7:0] exps_diff, exps_sum_next;
logic [47:0] mul, mul_next;

// finding lead one in numbers multiplication
logic [47:0] leading_one_found;
logic [ 5:0] leading_one_bit_num [48];

logic y_sign;
logic [5:0] shift;

always_comb begin
  y_sign = a[31] ^ b[31];

  if (a[30:0] >= b[30:0]) begin g = a; l = b; end
  else                    begin g = b; l = a; end

  exps_diff = g[30:23] - l[30:23];

  l_with_implicit_one = {1'b1, l[22:0]} >> exps_diff;
  g_with_implicit_one = {1'b1, g[22:0]};

  mul = g_with_implicit_one * l_with_implicit_one;

  leading_one_found[47] = mul[47];
  leading_one_bit_num[47] = 6'd0;
  for ( int i = 46; i >= 0; i -= 1 ) begin
    if ( leading_one_found[i+1] ) begin
      leading_one_found[i] = 1'b1;
      leading_one_bit_num[i] = leading_one_bit_num[i+1];
    end
    else begin
      leading_one_found[i] = mul[i];
      if ( mul[i] ) begin leading_one_bit_num[i] = i; end
      else          begin leading_one_bit_num[i] = 6'd0; end
    end
  end

  shift = (6'd46 - leading_one_bit_num[0]);
  g_exponent = 2*g[30:23] - shift - 127;
  mul_next = mul << shift;

  y = {y_sign, g_exponent, mul_next[45:23]};
end

endmodule