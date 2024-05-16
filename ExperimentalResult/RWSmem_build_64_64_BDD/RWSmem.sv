module RWSmem(
  input         clock,
  input         reset,
  input         io_enable,
  input         io_write,
  input  [5:0]  io_addr,
  input  [63:0] io_dataIn,
  output [63:0] io_dataOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [63:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [63:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [63:0] _RAND_59;
  reg [63:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [63:0] _RAND_63;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mem_0; // @[Ram.scala 16:16]
  reg [63:0] mem_1; // @[Ram.scala 16:16]
  reg [63:0] mem_2; // @[Ram.scala 16:16]
  reg [63:0] mem_3; // @[Ram.scala 16:16]
  reg [63:0] mem_4; // @[Ram.scala 16:16]
  reg [63:0] mem_5; // @[Ram.scala 16:16]
  reg [63:0] mem_6; // @[Ram.scala 16:16]
  reg [63:0] mem_7; // @[Ram.scala 16:16]
  reg [63:0] mem_8; // @[Ram.scala 16:16]
  reg [63:0] mem_9; // @[Ram.scala 16:16]
  reg [63:0] mem_10; // @[Ram.scala 16:16]
  reg [63:0] mem_11; // @[Ram.scala 16:16]
  reg [63:0] mem_12; // @[Ram.scala 16:16]
  reg [63:0] mem_13; // @[Ram.scala 16:16]
  reg [63:0] mem_14; // @[Ram.scala 16:16]
  reg [63:0] mem_15; // @[Ram.scala 16:16]
  reg [63:0] mem_16; // @[Ram.scala 16:16]
  reg [63:0] mem_17; // @[Ram.scala 16:16]
  reg [63:0] mem_18; // @[Ram.scala 16:16]
  reg [63:0] mem_19; // @[Ram.scala 16:16]
  reg [63:0] mem_20; // @[Ram.scala 16:16]
  reg [63:0] mem_21; // @[Ram.scala 16:16]
  reg [63:0] mem_22; // @[Ram.scala 16:16]
  reg [63:0] mem_23; // @[Ram.scala 16:16]
  reg [63:0] mem_24; // @[Ram.scala 16:16]
  reg [63:0] mem_25; // @[Ram.scala 16:16]
  reg [63:0] mem_26; // @[Ram.scala 16:16]
  reg [63:0] mem_27; // @[Ram.scala 16:16]
  reg [63:0] mem_28; // @[Ram.scala 16:16]
  reg [63:0] mem_29; // @[Ram.scala 16:16]
  reg [63:0] mem_30; // @[Ram.scala 16:16]
  reg [63:0] mem_31; // @[Ram.scala 16:16]
  reg [63:0] mem_32; // @[Ram.scala 16:16]
  reg [63:0] mem_33; // @[Ram.scala 16:16]
  reg [63:0] mem_34; // @[Ram.scala 16:16]
  reg [63:0] mem_35; // @[Ram.scala 16:16]
  reg [63:0] mem_36; // @[Ram.scala 16:16]
  reg [63:0] mem_37; // @[Ram.scala 16:16]
  reg [63:0] mem_38; // @[Ram.scala 16:16]
  reg [63:0] mem_39; // @[Ram.scala 16:16]
  reg [63:0] mem_40; // @[Ram.scala 16:16]
  reg [63:0] mem_41; // @[Ram.scala 16:16]
  reg [63:0] mem_42; // @[Ram.scala 16:16]
  reg [63:0] mem_43; // @[Ram.scala 16:16]
  reg [63:0] mem_44; // @[Ram.scala 16:16]
  reg [63:0] mem_45; // @[Ram.scala 16:16]
  reg [63:0] mem_46; // @[Ram.scala 16:16]
  reg [63:0] mem_47; // @[Ram.scala 16:16]
  reg [63:0] mem_48; // @[Ram.scala 16:16]
  reg [63:0] mem_49; // @[Ram.scala 16:16]
  reg [63:0] mem_50; // @[Ram.scala 16:16]
  reg [63:0] mem_51; // @[Ram.scala 16:16]
  reg [63:0] mem_52; // @[Ram.scala 16:16]
  reg [63:0] mem_53; // @[Ram.scala 16:16]
  reg [63:0] mem_54; // @[Ram.scala 16:16]
  reg [63:0] mem_55; // @[Ram.scala 16:16]
  reg [63:0] mem_56; // @[Ram.scala 16:16]
  reg [63:0] mem_57; // @[Ram.scala 16:16]
  reg [63:0] mem_58; // @[Ram.scala 16:16]
  reg [63:0] mem_59; // @[Ram.scala 16:16]
  reg [63:0] mem_60; // @[Ram.scala 16:16]
  reg [63:0] mem_61; // @[Ram.scala 16:16]
  reg [63:0] mem_62; // @[Ram.scala 16:16]
  reg [63:0] mem_63; // @[Ram.scala 16:16]
  wire [63:0] _GEN_65 = 6'h1 == io_addr ? mem_1 : mem_0; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_66 = 6'h2 == io_addr ? mem_2 : _GEN_65; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_67 = 6'h3 == io_addr ? mem_3 : _GEN_66; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_68 = 6'h4 == io_addr ? mem_4 : _GEN_67; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_69 = 6'h5 == io_addr ? mem_5 : _GEN_68; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_70 = 6'h6 == io_addr ? mem_6 : _GEN_69; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_71 = 6'h7 == io_addr ? mem_7 : _GEN_70; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_72 = 6'h8 == io_addr ? mem_8 : _GEN_71; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_73 = 6'h9 == io_addr ? mem_9 : _GEN_72; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_74 = 6'ha == io_addr ? mem_10 : _GEN_73; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_75 = 6'hb == io_addr ? mem_11 : _GEN_74; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_76 = 6'hc == io_addr ? mem_12 : _GEN_75; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_77 = 6'hd == io_addr ? mem_13 : _GEN_76; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_78 = 6'he == io_addr ? mem_14 : _GEN_77; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_79 = 6'hf == io_addr ? mem_15 : _GEN_78; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_80 = 6'h10 == io_addr ? mem_16 : _GEN_79; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_81 = 6'h11 == io_addr ? mem_17 : _GEN_80; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_82 = 6'h12 == io_addr ? mem_18 : _GEN_81; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_83 = 6'h13 == io_addr ? mem_19 : _GEN_82; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_84 = 6'h14 == io_addr ? mem_20 : _GEN_83; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_85 = 6'h15 == io_addr ? mem_21 : _GEN_84; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_86 = 6'h16 == io_addr ? mem_22 : _GEN_85; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_87 = 6'h17 == io_addr ? mem_23 : _GEN_86; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_88 = 6'h18 == io_addr ? mem_24 : _GEN_87; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_89 = 6'h19 == io_addr ? mem_25 : _GEN_88; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_90 = 6'h1a == io_addr ? mem_26 : _GEN_89; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_91 = 6'h1b == io_addr ? mem_27 : _GEN_90; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_92 = 6'h1c == io_addr ? mem_28 : _GEN_91; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_93 = 6'h1d == io_addr ? mem_29 : _GEN_92; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_94 = 6'h1e == io_addr ? mem_30 : _GEN_93; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_95 = 6'h1f == io_addr ? mem_31 : _GEN_94; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_96 = 6'h20 == io_addr ? mem_32 : _GEN_95; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_97 = 6'h21 == io_addr ? mem_33 : _GEN_96; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_98 = 6'h22 == io_addr ? mem_34 : _GEN_97; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_99 = 6'h23 == io_addr ? mem_35 : _GEN_98; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_100 = 6'h24 == io_addr ? mem_36 : _GEN_99; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_101 = 6'h25 == io_addr ? mem_37 : _GEN_100; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_102 = 6'h26 == io_addr ? mem_38 : _GEN_101; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_103 = 6'h27 == io_addr ? mem_39 : _GEN_102; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_104 = 6'h28 == io_addr ? mem_40 : _GEN_103; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_105 = 6'h29 == io_addr ? mem_41 : _GEN_104; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_106 = 6'h2a == io_addr ? mem_42 : _GEN_105; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_107 = 6'h2b == io_addr ? mem_43 : _GEN_106; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_108 = 6'h2c == io_addr ? mem_44 : _GEN_107; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_109 = 6'h2d == io_addr ? mem_45 : _GEN_108; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_110 = 6'h2e == io_addr ? mem_46 : _GEN_109; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_111 = 6'h2f == io_addr ? mem_47 : _GEN_110; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_112 = 6'h30 == io_addr ? mem_48 : _GEN_111; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_113 = 6'h31 == io_addr ? mem_49 : _GEN_112; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_114 = 6'h32 == io_addr ? mem_50 : _GEN_113; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_115 = 6'h33 == io_addr ? mem_51 : _GEN_114; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_116 = 6'h34 == io_addr ? mem_52 : _GEN_115; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_117 = 6'h35 == io_addr ? mem_53 : _GEN_116; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_118 = 6'h36 == io_addr ? mem_54 : _GEN_117; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_119 = 6'h37 == io_addr ? mem_55 : _GEN_118; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_120 = 6'h38 == io_addr ? mem_56 : _GEN_119; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_121 = 6'h39 == io_addr ? mem_57 : _GEN_120; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_122 = 6'h3a == io_addr ? mem_58 : _GEN_121; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_123 = 6'h3b == io_addr ? mem_59 : _GEN_122; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_124 = 6'h3c == io_addr ? mem_60 : _GEN_123; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_125 = 6'h3d == io_addr ? mem_61 : _GEN_124; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_126 = 6'h3e == io_addr ? mem_62 : _GEN_125; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_127 = 6'h3f == io_addr ? mem_63 : _GEN_126; // @[Ram.scala 20:{31,31}]
  wire [63:0] _GEN_192 = io_write ? 64'h0 : _GEN_127; // @[Ram.scala 17:14 19:20 20:31]
  assign io_dataOut = io_enable ? _GEN_192 : 64'h0; // @[Ram.scala 17:14 18:19]
  always @(posedge clock) begin
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h0 == io_addr) begin // @[Ram.scala 19:35]
          mem_0 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h1 == io_addr) begin // @[Ram.scala 19:35]
          mem_1 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h2 == io_addr) begin // @[Ram.scala 19:35]
          mem_2 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h3 == io_addr) begin // @[Ram.scala 19:35]
          mem_3 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h4 == io_addr) begin // @[Ram.scala 19:35]
          mem_4 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h5 == io_addr) begin // @[Ram.scala 19:35]
          mem_5 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h6 == io_addr) begin // @[Ram.scala 19:35]
          mem_6 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h7 == io_addr) begin // @[Ram.scala 19:35]
          mem_7 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h8 == io_addr) begin // @[Ram.scala 19:35]
          mem_8 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h9 == io_addr) begin // @[Ram.scala 19:35]
          mem_9 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'ha == io_addr) begin // @[Ram.scala 19:35]
          mem_10 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'hb == io_addr) begin // @[Ram.scala 19:35]
          mem_11 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'hc == io_addr) begin // @[Ram.scala 19:35]
          mem_12 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'hd == io_addr) begin // @[Ram.scala 19:35]
          mem_13 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'he == io_addr) begin // @[Ram.scala 19:35]
          mem_14 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'hf == io_addr) begin // @[Ram.scala 19:35]
          mem_15 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h10 == io_addr) begin // @[Ram.scala 19:35]
          mem_16 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h11 == io_addr) begin // @[Ram.scala 19:35]
          mem_17 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h12 == io_addr) begin // @[Ram.scala 19:35]
          mem_18 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h13 == io_addr) begin // @[Ram.scala 19:35]
          mem_19 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h14 == io_addr) begin // @[Ram.scala 19:35]
          mem_20 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h15 == io_addr) begin // @[Ram.scala 19:35]
          mem_21 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h16 == io_addr) begin // @[Ram.scala 19:35]
          mem_22 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h17 == io_addr) begin // @[Ram.scala 19:35]
          mem_23 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h18 == io_addr) begin // @[Ram.scala 19:35]
          mem_24 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h19 == io_addr) begin // @[Ram.scala 19:35]
          mem_25 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h1a == io_addr) begin // @[Ram.scala 19:35]
          mem_26 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h1b == io_addr) begin // @[Ram.scala 19:35]
          mem_27 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h1c == io_addr) begin // @[Ram.scala 19:35]
          mem_28 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h1d == io_addr) begin // @[Ram.scala 19:35]
          mem_29 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h1e == io_addr) begin // @[Ram.scala 19:35]
          mem_30 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h1f == io_addr) begin // @[Ram.scala 19:35]
          mem_31 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h20 == io_addr) begin // @[Ram.scala 19:35]
          mem_32 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h21 == io_addr) begin // @[Ram.scala 19:35]
          mem_33 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h22 == io_addr) begin // @[Ram.scala 19:35]
          mem_34 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h23 == io_addr) begin // @[Ram.scala 19:35]
          mem_35 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h24 == io_addr) begin // @[Ram.scala 19:35]
          mem_36 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h25 == io_addr) begin // @[Ram.scala 19:35]
          mem_37 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h26 == io_addr) begin // @[Ram.scala 19:35]
          mem_38 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h27 == io_addr) begin // @[Ram.scala 19:35]
          mem_39 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h28 == io_addr) begin // @[Ram.scala 19:35]
          mem_40 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h29 == io_addr) begin // @[Ram.scala 19:35]
          mem_41 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h2a == io_addr) begin // @[Ram.scala 19:35]
          mem_42 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h2b == io_addr) begin // @[Ram.scala 19:35]
          mem_43 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h2c == io_addr) begin // @[Ram.scala 19:35]
          mem_44 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h2d == io_addr) begin // @[Ram.scala 19:35]
          mem_45 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h2e == io_addr) begin // @[Ram.scala 19:35]
          mem_46 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h2f == io_addr) begin // @[Ram.scala 19:35]
          mem_47 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h30 == io_addr) begin // @[Ram.scala 19:35]
          mem_48 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h31 == io_addr) begin // @[Ram.scala 19:35]
          mem_49 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h32 == io_addr) begin // @[Ram.scala 19:35]
          mem_50 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h33 == io_addr) begin // @[Ram.scala 19:35]
          mem_51 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h34 == io_addr) begin // @[Ram.scala 19:35]
          mem_52 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h35 == io_addr) begin // @[Ram.scala 19:35]
          mem_53 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h36 == io_addr) begin // @[Ram.scala 19:35]
          mem_54 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h37 == io_addr) begin // @[Ram.scala 19:35]
          mem_55 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h38 == io_addr) begin // @[Ram.scala 19:35]
          mem_56 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h39 == io_addr) begin // @[Ram.scala 19:35]
          mem_57 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h3a == io_addr) begin // @[Ram.scala 19:35]
          mem_58 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h3b == io_addr) begin // @[Ram.scala 19:35]
          mem_59 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h3c == io_addr) begin // @[Ram.scala 19:35]
          mem_60 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h3d == io_addr) begin // @[Ram.scala 19:35]
          mem_61 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h3e == io_addr) begin // @[Ram.scala 19:35]
          mem_62 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 18:19]
      if (io_write) begin // @[Ram.scala 19:20]
        if (6'h3f == io_addr) begin // @[Ram.scala 19:35]
          mem_63 <= io_dataIn; // @[Ram.scala 19:35]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  mem_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  mem_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  mem_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  mem_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  mem_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  mem_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  mem_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  mem_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  mem_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  mem_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  mem_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  mem_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  mem_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  mem_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  mem_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  mem_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  mem_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  mem_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  mem_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  mem_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  mem_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  mem_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  mem_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  mem_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  mem_24 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  mem_25 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  mem_26 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  mem_27 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  mem_28 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  mem_29 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  mem_30 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  mem_31 = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  mem_32 = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  mem_33 = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  mem_34 = _RAND_34[63:0];
  _RAND_35 = {2{`RANDOM}};
  mem_35 = _RAND_35[63:0];
  _RAND_36 = {2{`RANDOM}};
  mem_36 = _RAND_36[63:0];
  _RAND_37 = {2{`RANDOM}};
  mem_37 = _RAND_37[63:0];
  _RAND_38 = {2{`RANDOM}};
  mem_38 = _RAND_38[63:0];
  _RAND_39 = {2{`RANDOM}};
  mem_39 = _RAND_39[63:0];
  _RAND_40 = {2{`RANDOM}};
  mem_40 = _RAND_40[63:0];
  _RAND_41 = {2{`RANDOM}};
  mem_41 = _RAND_41[63:0];
  _RAND_42 = {2{`RANDOM}};
  mem_42 = _RAND_42[63:0];
  _RAND_43 = {2{`RANDOM}};
  mem_43 = _RAND_43[63:0];
  _RAND_44 = {2{`RANDOM}};
  mem_44 = _RAND_44[63:0];
  _RAND_45 = {2{`RANDOM}};
  mem_45 = _RAND_45[63:0];
  _RAND_46 = {2{`RANDOM}};
  mem_46 = _RAND_46[63:0];
  _RAND_47 = {2{`RANDOM}};
  mem_47 = _RAND_47[63:0];
  _RAND_48 = {2{`RANDOM}};
  mem_48 = _RAND_48[63:0];
  _RAND_49 = {2{`RANDOM}};
  mem_49 = _RAND_49[63:0];
  _RAND_50 = {2{`RANDOM}};
  mem_50 = _RAND_50[63:0];
  _RAND_51 = {2{`RANDOM}};
  mem_51 = _RAND_51[63:0];
  _RAND_52 = {2{`RANDOM}};
  mem_52 = _RAND_52[63:0];
  _RAND_53 = {2{`RANDOM}};
  mem_53 = _RAND_53[63:0];
  _RAND_54 = {2{`RANDOM}};
  mem_54 = _RAND_54[63:0];
  _RAND_55 = {2{`RANDOM}};
  mem_55 = _RAND_55[63:0];
  _RAND_56 = {2{`RANDOM}};
  mem_56 = _RAND_56[63:0];
  _RAND_57 = {2{`RANDOM}};
  mem_57 = _RAND_57[63:0];
  _RAND_58 = {2{`RANDOM}};
  mem_58 = _RAND_58[63:0];
  _RAND_59 = {2{`RANDOM}};
  mem_59 = _RAND_59[63:0];
  _RAND_60 = {2{`RANDOM}};
  mem_60 = _RAND_60[63:0];
  _RAND_61 = {2{`RANDOM}};
  mem_61 = _RAND_61[63:0];
  _RAND_62 = {2{`RANDOM}};
  mem_62 = _RAND_62[63:0];
  _RAND_63 = {2{`RANDOM}};
  mem_63 = _RAND_63[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
