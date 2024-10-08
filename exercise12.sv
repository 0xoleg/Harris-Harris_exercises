module exercise12 (
  input  logic [7:0] a,
  output logic [7:0] y
);

always_comb begin
  casez (a)
  8'b1???_????: y = 8'b1000_0000;
  8'b01??_????: y = 8'b0100_0000;
  8'b001?_????: y = 8'b0010_0000;
  8'b0001_????: y = 8'b0001_0000;
  8'b0000_1???: y = 8'b0000_1000;
  8'b0000_01??: y = 8'b0000_0100;
  8'b0000_001?: y = 8'b0000_0010;
  8'b0000_0001: y = 8'b0000_0001;
  default: y = 8'b0000_0000;
  endcase
end

endmodule