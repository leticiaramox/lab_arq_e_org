`timescale 1ns/1ps

module tb_mux4to1_32bit;
  logic [31:0] a, b, c, d;
  logic        s0, s1;
  logic [31:0] f;

  //instância do multiplexador 4x1 de 32 bits
  mux dut(.f(f), .a(a), .b(b), .c(c), .d(d), .s0(s0), .s1(s1));

  initial begin
    //Valores em hexadecimal para cada entrada do multiplexador
    a = 32'hAAAA_AAAA;
    b = 32'h5555_5555;
    c = 32'hFFFF_0000;
    d = 32'h0000_FFFF;  

    //4 momentos de tempo, cada um com uma combinação diferente de s1 e s0
    $monitor($time, " s1=%b s0=%b | f=%h", s1, s0, f);

    {s1, s0} = 2'b00; #10;
    {s1, s0} = 2'b01; #10;
    {s1, s0} = 2'b10; #10;
    {s1, s0} = 2'b11; #10;

    $stop;
  end

endmodule: tb_mux4to1_32bit
