module Neuron(
  input         clock,
  input         reset,
  input  [15:0] io_in_0,
  input  [15:0] io_in_1,
  input  [15:0] io_weights_0,
  input  [15:0] io_weights_1,
  output [15:0] io_out
);
  wire [31:0] _mac_T = $signed(io_in_0) * $signed(io_weights_0); // @[Neuron.scala 18:77]
  wire [31:0] _mac_T_1 = $signed(io_in_1) * $signed(io_weights_1); // @[Neuron.scala 18:77]
  wire [31:0] mac = $signed(_mac_T) + $signed(_mac_T_1); // @[Neuron.scala 18:89]
  wire [9:0] _io_out_T_1 = $signed(mac) <= 32'sh0 ? $signed(10'sh0) : $signed(10'sh100); // @[Neuron.scala 23:48]
  assign io_out = {{6{_io_out_T_1[9]}},_io_out_T_1}; // @[Neuron.scala 19:10]
endmodule
