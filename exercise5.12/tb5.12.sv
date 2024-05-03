`include "../alu.sv"

module testbench();
parameter N = 32, M=3, IN_SIZE=6;
logic clk, reset;

logic [N-1:0] a;
logic [N-1:0] b;
logic [M-1:0] f;
logic [N-1:0] y,        y_expected;
logic         cout,     cout_expected;
logic         overflow, overflow_expected;
logic         zero,     zero_expected;

logic [2*N - 1 : 0] testinputs   [IN_SIZE-1:0];
logic [  N - 1 : 0] testoutputs0 [IN_SIZE-1:0];
logic [      2 : 0] testoutputs1 [IN_SIZE-1:0];


alu DUT(a, b, f, y, cout, overflow, zero);


initial begin
  clk <= 0;
  forever begin
    #2; clk <= ~clk;
  end
end

initial begin
  reset = 1;
  #3;
  reset = 0;
end

initial begin
  $readmemh("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f(a, b).txt",
            testinputs);
  $readmemh("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f000(y).txt",
            testoutputs0);
  $readmemb("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f000(cout, overflow, zero).txt",
            testoutputs1);
  
  wait (!reset);

  f = 3'b000;
  for (int i = 0; i < $size(testinputs); i+=1) begin
    if (testinputs[i] === 'x) begin
      $finish();
    end

    {a, b}                                            = testinputs[i];
    y_expected                                        = testoutputs0[i];
    {cout_expected, overflow_expected, zero_expected} = testoutputs1[i];

    @(posedge clk);
    #1;
  end

  $readmemh("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f001(y).txt",
            testoutputs0);
  $readmemb("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f001(cout, overflow, zero).txt",
            testoutputs1);
  
  f = 3'b001;
  for (int i = 0; i < $size(testinputs); i+=1) begin
    if (testinputs[i] === 'x) begin
      $finish();
    end

    {a, b}                                            = testinputs[i];
    y_expected                                        = testoutputs0[i];
    {cout_expected, overflow_expected, zero_expected} = testoutputs1[i];

    @(posedge clk);
    #1;
  end

  $readmemh("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f010(y).txt",
            testoutputs0);
  $readmemb("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f010(cout, overflow, zero).txt",
            testoutputs1);
  
  f = 3'b010;
  for (int i = 0; i < $size(testinputs); i+=1) begin
    if (testinputs[i] === 'x) begin
      $finish();
    end

    {a, b}                                            = testinputs[i];
    y_expected                                        = testoutputs0[i];
    {cout_expected, overflow_expected, zero_expected} = testoutputs1[i];

    @(posedge clk);
    #1;
  end

  $readmemh("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f011(y).txt",
            testoutputs0);
  $readmemb("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f011(cout, overflow, zero).txt",
            testoutputs1);

  f = 3'b011;
  for (int i = 0; i < $size(testinputs); i+=1) begin
    if (testinputs[i] === 'x) begin
      $finish();
    end

    {a, b}                                            = testinputs[i];
    y_expected                                        = testoutputs0[i];
    {cout_expected, overflow_expected, zero_expected} = testoutputs1[i];

    @(posedge clk);
    #1;
  end

  $readmemh("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f100(y).txt",
            testoutputs0);
  $readmemb("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f100(cout, overflow, zero).txt",
            testoutputs1);

  f = 3'b100;
  for (int i = 0; i < $size(testinputs); i+=1) begin
    if (testinputs[i] === 'x) begin
      $finish();
    end

    {a, b}                                            = testinputs[i];
    y_expected                                        = testoutputs0[i];
    {cout_expected, overflow_expected, zero_expected} = testoutputs1[i];

    @(posedge clk);
    #1;
  end

  $readmemh("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f101(y).txt",
            testoutputs0);
  $readmemb("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f101(cout, overflow, zero).txt",
            testoutputs1);

  f = 3'b101;
  for (int i = 0; i < $size(testinputs); i+=1) begin
    if (testinputs[i] === 'x) begin
      $finish();
    end

    {a, b}                                            = testinputs[i];
    y_expected                                        = testoutputs0[i];
    {cout_expected, overflow_expected, zero_expected} = testoutputs1[i];

    @(posedge clk);
    #1;
  end

  $readmemh("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f110(y).txt",
            testoutputs0);
  $readmemb("C:/Users/Oleg/Desktop/test/verilog/quartus/Test/exercise5.12/vectors/f110(cout, overflow, zero).txt",
            testoutputs1);

  f = 3'b110;
  for (int i = 0; i < $size(testinputs); i+=1) begin
    if (testinputs[i] === 'x) begin
      $finish();
    end

    {a, b}                                            = testinputs[i];
    y_expected                                        = testoutputs0[i];
    {cout_expected, overflow_expected, zero_expected} = testoutputs1[i];

    @(posedge clk);
    #1;
  end

  $finish();
end

initial begin
  forever begin
    @(posedge clk);
    assert((y === y_expected)               &&
           (cout === cout_expected)         &&
           (overflow === overflow_expected) &&
           (zero === zero_expected)
    ) else $error("f = %b\n", f,
                  "a                 = %b\n", a,
                  "b                 = %b\n", b,
                  "y                 = %b\n", y,
                  "y expected        = %b\n", y_expected,
                  "cout              = %b\n", cout,
                  "cout_expected     = %b\n", cout_expected,
                  "overflow          = %b\n", overflow,
                  "overflow_expected = %b\n", overflow_expected,
                  "zero              = %b\n", zero,
                  "zero_expected     = %b\n\n\n", zero_expected
                  );
  end
end

endmodule