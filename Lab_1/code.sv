module mux4to1_32bit
  (
    output logic [31:0] f,
    input  logic [31:0] a, b, c, d,
    input  logic        s0, s1
  );

  logic n_s0, n_s1;
  logic [31:0] f1, f2, f3, f4;

  //Negação das portas de seleção (s1 e s0)
  not g1(n_s0, s0);
  not g2(n_s1, s1);

  // arrays de instâncias de porta
  and g3[31:0] (f1, a, n_s1, n_s0);
  and g4[31:0] (f2, b, n_s1, s0);
  and g5[31:0] (f3, c, s1, n_s0);
  and g6[31:0] (f4, d, s1, s0);

  or  g7[31:0] (f, f1, f2, f3, f4);

endmodule: mux4to1_32bit
