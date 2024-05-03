module alu(
  input  logic [31:0] a, b,
  input  logic [ 2:0] f,
  output logic [31:0] y,
  output logic cout,
  output logic overflow,
  output logic zero
);

logic [31:0] bb;
logic [31:0] s;
logic [31:0] b_and_b;
logic [31:0] b_or_b;
logic [31:0] b_plus_b;

//always_comb begin
//  if (f[2]) bb = ~b;
//  else      bb =  b;
//end

//always_comb begin
//  if (f[2]) bb = ~b;
//  else      bb =  b;
//  {cout, s} = a + bb + f[2];
//end

always_comb begin
  if (f[2]) bb = ~b;
  else      bb =  b;

  {cout, s} = a + bb + f[2];

  case (f[1:0])
    2'b00 : y = a & bb;
    2'b01 : y = a | bb;
    2'b10 : y =  s;
    default : y = 'x;
  endcase
end

assign overflow = cout;
assign zero     = (y == '0);

endmodule