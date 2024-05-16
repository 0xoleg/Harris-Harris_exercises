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

// finding lead one in numbers sum
logic [24:0] leading_one_found;
logic [ 4:0] leading_one_bit_num;

always_comb begin
  if (a[30:0] >= b[30:0]) begin g = a; l = b; end
  else                    begin g = b; l = a; end

  exps_diff = g[30:23] - l[30:23];

  l_with_implicit_one = {1'b1, l[22:0]} >> exps_diff;
  g_with_implicit_one = {1'b1, g[22:0]};

  if (g[31] ^ l[31]) sum = g_with_implicit_one - l_with_implicit_one;
  else               sum = g_with_implicit_one + l_with_implicit_one;

  //if ( sum[24] & 1'b1 ) begin
  //  sum_next = sum >> 1;
  //  g_exponent = g[30:23] + 1'b1;
  //  leading_one_found[24] = 1'b1;
  //end
  //else begin
  //  sum_next = sum;
  //  g_exponent = g[30:23];
  //  leading_one_found[24] = 1'b0;
  //end
//
  //for ( int i = 23; i >= 0; i-=1) begin
  //  if ( leading_one_found[i+1] ) begin
  //    leading_one_found[i] = 1'b1;
  //  end
  //  else begin
  //    if ( sum[i] & 1'b1 ) begin
  //      sum_next = sum << (23-i);
  //      g_exponent = g[30:23] - (23-i);
  //      leading_one_found[i] = 1'b1;
  //    end
  //    else begin
  //      leading_one_found[i] = 1'b0;
  //    end
  //  end
  //end
  if ( sum[24] & 1'b1 ) begin
    sum_next = sum >> 1;
    g_exponent = g[30:23] + 1'b1;
    leading_one_found[24] = 1'b1;
    leading_one_bit_num = 4'd24;
  end
  else begin
    sum_next = sum;
    g_exponent = g[30:23];
    leading_one_found[24] = 1'b0;
    leading_one_bit_num = 4'd0;
  end

  for ( int i = 23; i >= 0; i-=1) begin
    if ( leading_one_found[i+1] ) begin
      leading_one_found[i] = 1'b1;
    end
    else begin
      if ( sum[i] & 1'b1 ) begin
        leading_one_found[i] = 1'b1;
        leading_one_bit_num = i;
      end
      else begin
        leading_one_found[i] = 1'b0;
      end
    end
  end

  sum_next = sum << (23-leading_one_bit_num);
  g_exponent = g[30:23] - (23-leading_one_bit_num);

  y = {g[31], g_exponent, sum_next[22:0]};
end

endmodule