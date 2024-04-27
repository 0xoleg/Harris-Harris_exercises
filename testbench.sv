`include "exercise5.9.sv"

module testbench();
logic [31:0] a = 32'b01111111_01111111_11111111_11111111;
logic [31:0] b = 32'b10000000_10000000_00000000_00000001;
logic [ 2:0] f;
logic [31:0] y;

my_alu DUT(a, b, f, y);

initial begin
  #5;
  f = 3'b000;
  $display("a & b = %b", y);
end

endmodule 