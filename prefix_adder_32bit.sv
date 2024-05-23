module prefix_adder_32bit #(
  parameter SIZE = 16
)(
  input  logic        cin, cout,
  input  logic [SIZE-1:0] a, b,
  output logic [SIZE-1:0] s
);

logic [SIZE  -1 : -1] p;
logic [SIZE  -1 : -1] g;

assign p[-1] = 1'b0;
assign g[-1] = cin;

genvar i, j, k;
generate
  for ( i = 0; i < 16; i += 1 ) begin : pref_adder
    assign p[i:i] = a[i] | b[i];
    assign g[i:i] = a[i] & b[i];
  end
endgenerate

generate
  for ( i = 15; i >=0; i -= 1 ) begin : hui_i
    assign s[i] = (a[i] ^ b[i]) ^ g[i-1:-1];
    
    for ( k = i; k >= 0; k -= 1 ) begin : hui_k
      for ( j = k-1; j >= 0; j -= 1 ) begin : hui_j
        assign p[i:j] = p[i:k] & p[k-1:j];
        assign g[i:j] = g[i:k] | ( p[i:k] & g[k-1:j] );
      end
    end
  end
endgenerate

endmodule