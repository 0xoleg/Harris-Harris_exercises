`include "../mul_float.sv"

module testbench();
logic [31:0] a, b, y;

mul_float DUT(a, b, y);

task display_result(
  input  shortreal x0, x1
  );
  begin
    a = $shortrealtobits(x0);
    b = $shortrealtobits(x1);
    #1;
    $display("a = %f\nb = %f\na*b = %f or %b\n", x0, x1, $bitstoshortreal(y), y);
  end
endtask

initial begin
  display_result(1.0, 1.0);
  #2;
  display_result(0.5, 0.25);
  #2;
  display_result(0.5, 0.0625);
  #2
  display_result(0.3, 0.25);
  #2
  display_result(0.3, 0.6);
  #2
  display_result(0.5, 1.0);
  #2
  display_result(19.34, 8.356);
  #2
  display_result(1.0, -0.5);
  #2
  display_result(-1.0, 0.5);
  #2
  display_result(-0.8, 11.7);
  #2
  display_result(1.0, -1.0);
  #2
  display_result(-34.6384, 17.43);
  #2
  display_result(-0.63848, 0.00047);
  #2
  display_result(-11.6, 3.5);
  #2
  $stop();
end

endmodule