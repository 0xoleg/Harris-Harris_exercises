module exercise26(
  input  logic R, S,
  output logic Q, Q1
);

logic Q_prev, Q1_prev;

always_comb begin
  if (R) begin
    if (S) begin
      Q  = 0;
      Q1 = 0;
    end
    else begin
      Q  = 0;
      Q1 = 1;
    end
  end
  else begin
    if (S) begin
      Q  = 1;
      Q1 = 0;
    end
    else begin
      Q  = Q;
      Q1 = Q1;
    end
  end
end

endmodule