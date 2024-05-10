module FullAdder(
  input   io_a,
  input   io_b,
  input   io_cin,
  output  io_sum,
  output  io_cout
);
  wire  a_xor_b = io_a ^ io_b; // @[FullAdder.scala 16:22]
  wire  a_and_b = io_a & io_b; // @[FullAdder.scala 19:22]
  wire  b_and_cin = io_b & io_cin; // @[FullAdder.scala 20:24]
  wire  a_and_cin = io_a & io_cin; // @[FullAdder.scala 21:24]
  assign io_sum = a_xor_b ^ io_cin; // @[FullAdder.scala 17:21]
  assign io_cout = a_and_b | b_and_cin | a_and_cin; // @[FullAdder.scala 22:34]
endmodule
module Adder(
  input        clock,
  input        reset,
  input  [3:0] io_A,
  input  [3:0] io_B,
  input        io_Cin,
  output [3:0] io_Sum,
  output       io_Cout
);
  wire  FullAdder_io_a; // @[Adder.scala 19:35]
  wire  FullAdder_io_b; // @[Adder.scala 19:35]
  wire  FullAdder_io_cin; // @[Adder.scala 19:35]
  wire  FullAdder_io_sum; // @[Adder.scala 19:35]
  wire  FullAdder_io_cout; // @[Adder.scala 19:35]
  wire  FullAdder_1_io_a; // @[Adder.scala 19:35]
  wire  FullAdder_1_io_b; // @[Adder.scala 19:35]
  wire  FullAdder_1_io_cin; // @[Adder.scala 19:35]
  wire  FullAdder_1_io_sum; // @[Adder.scala 19:35]
  wire  FullAdder_1_io_cout; // @[Adder.scala 19:35]
  wire  FullAdder_2_io_a; // @[Adder.scala 19:35]
  wire  FullAdder_2_io_b; // @[Adder.scala 19:35]
  wire  FullAdder_2_io_cin; // @[Adder.scala 19:35]
  wire  FullAdder_2_io_sum; // @[Adder.scala 19:35]
  wire  FullAdder_2_io_cout; // @[Adder.scala 19:35]
  wire  FullAdder_3_io_a; // @[Adder.scala 19:35]
  wire  FullAdder_3_io_b; // @[Adder.scala 19:35]
  wire  FullAdder_3_io_cin; // @[Adder.scala 19:35]
  wire  FullAdder_3_io_sum; // @[Adder.scala 19:35]
  wire  FullAdder_3_io_cout; // @[Adder.scala 19:35]
  wire  sum_0 = FullAdder_io_sum; // @[Adder.scala 32:26]
  wire  sum_1 = FullAdder_1_io_sum; // @[Adder.scala 32:26]
  wire  sum_2 = FullAdder_2_io_sum; // @[Adder.scala 32:26]
  wire  sum_3 = FullAdder_3_io_sum; // @[Adder.scala 32:26]
  wire [1:0] io_Sum_lo = {sum_1,sum_0}; // @[Adder.scala 34:17]
  wire [1:0] io_Sum_hi = {sum_3,sum_2}; // @[Adder.scala 34:17]
  FullAdder FullAdder ( // @[Adder.scala 19:35]
    .io_a(FullAdder_io_a),
    .io_b(FullAdder_io_b),
    .io_cin(FullAdder_io_cin),
    .io_sum(FullAdder_io_sum),
    .io_cout(FullAdder_io_cout)
  );
  FullAdder FullAdder_1 ( // @[Adder.scala 19:35]
    .io_a(FullAdder_1_io_a),
    .io_b(FullAdder_1_io_b),
    .io_cin(FullAdder_1_io_cin),
    .io_sum(FullAdder_1_io_sum),
    .io_cout(FullAdder_1_io_cout)
  );
  FullAdder FullAdder_2 ( // @[Adder.scala 19:35]
    .io_a(FullAdder_2_io_a),
    .io_b(FullAdder_2_io_b),
    .io_cin(FullAdder_2_io_cin),
    .io_sum(FullAdder_2_io_sum),
    .io_cout(FullAdder_2_io_cout)
  );
  FullAdder FullAdder_3 ( // @[Adder.scala 19:35]
    .io_a(FullAdder_3_io_a),
    .io_b(FullAdder_3_io_b),
    .io_cin(FullAdder_3_io_cin),
    .io_sum(FullAdder_3_io_sum),
    .io_cout(FullAdder_3_io_cout)
  );
  assign io_Sum = {io_Sum_hi,io_Sum_lo}; // @[Adder.scala 34:17]
  assign io_Cout = FullAdder_3_io_cout; // @[Adder.scala 20:19 31:16]
  assign FullAdder_io_a = io_A[0]; // @[Adder.scala 28:21]
  assign FullAdder_io_b = io_B[0]; // @[Adder.scala 29:21]
  assign FullAdder_io_cin = io_Cin; // @[Adder.scala 20:19 24:12]
  assign FullAdder_1_io_a = io_A[1]; // @[Adder.scala 28:21]
  assign FullAdder_1_io_b = io_B[1]; // @[Adder.scala 29:21]
  assign FullAdder_1_io_cin = FullAdder_io_cout; // @[Adder.scala 20:19 31:16]
  assign FullAdder_2_io_a = io_A[2]; // @[Adder.scala 28:21]
  assign FullAdder_2_io_b = io_B[2]; // @[Adder.scala 29:21]
  assign FullAdder_2_io_cin = FullAdder_1_io_cout; // @[Adder.scala 20:19 31:16]
  assign FullAdder_3_io_a = io_A[3]; // @[Adder.scala 28:21]
  assign FullAdder_3_io_b = io_B[3]; // @[Adder.scala 29:21]
  assign FullAdder_3_io_cin = FullAdder_2_io_cout; // @[Adder.scala 20:19 31:16]
endmodule
