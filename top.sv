`include "prefix_adder_32bit.sv"

module top (
  input  logic clk, rst,
  output logic out
);

assign cin = '0;
logic cout;
logic [31:0] a, b, y;

prefix_adder_32bit DUT(cin, a, b, y, cout);
//assign {cout, y} = a + b + cin;

always_ff @(posedge clk or posedge rst) begin
  if ( rst ) begin a <= '0;       b <= '0;       end
  else       begin a <= a + 1'd1; b <= b + 2'd3; end
end

assign out = |y;

endmodule