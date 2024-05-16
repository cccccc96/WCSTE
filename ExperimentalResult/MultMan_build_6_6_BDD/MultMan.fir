circuit MultMan :
  module MultCell :
    input clock : Clock
    input reset : Reset
    output io : { flip rstn : UInt<1>, flip en : UInt<1>, flip mult1 : UInt<12>, flip mult2 : UInt<6>, flip mult1_acci : UInt<12>, mult1_o : UInt<12>, mult2_shift : UInt<6>, mult1_acco : UInt<12>, rdy : UInt<1>}

    reg mult2_shift_reg : UInt<6>, clock with :
      reset => (reset, UInt<6>("h0")) @[mult.scala 20:32]
    reg mult1_o_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 21:28]
    reg mult1_acc_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 22:30]
    reg rdy_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[mult.scala 23:24]
    node _T = eq(io.rstn, UInt<1>("h0")) @[mult.scala 25:8]
    when _T : @[mult.scala 25:18]
      mult2_shift_reg <= UInt<1>("h0") @[mult.scala 26:21]
      mult1_o_reg <= UInt<1>("h0") @[mult.scala 27:17]
      mult1_acc_reg <= UInt<1>("h0") @[mult.scala 28:19]
      rdy_reg <= UInt<1>("h0") @[mult.scala 29:13]
    else :
      when io.en : @[mult.scala 30:21]
        rdy_reg <= UInt<1>("h1") @[mult.scala 31:13]
        node _mult2_shift_reg_T = dshr(io.mult2, UInt<1>("h1")) @[mult.scala 32:33]
        mult2_shift_reg <= _mult2_shift_reg_T @[mult.scala 32:21]
        node _mult1_o_reg_T = dshl(io.mult1, UInt<1>("h1")) @[mult.scala 33:29]
        mult1_o_reg <= _mult1_o_reg_T @[mult.scala 33:17]
        node _T_1 = bits(io.mult2, 0, 0) @[mult.scala 34:18]
        when _T_1 : @[mult.scala 34:23]
          node _mult1_acc_reg_T = add(io.mult1_acci, io.mult1) @[mult.scala 35:38]
          node _mult1_acc_reg_T_1 = tail(_mult1_acc_reg_T, 1) @[mult.scala 35:38]
          mult1_acc_reg <= _mult1_acc_reg_T_1 @[mult.scala 35:21]
        else :
          mult1_acc_reg <= io.mult1_acci @[mult.scala 37:21]
      else :
        rdy_reg <= UInt<1>("h0") @[mult.scala 40:13]
        mult2_shift_reg <= UInt<1>("h0") @[mult.scala 41:21]
        mult1_o_reg <= UInt<1>("h0") @[mult.scala 42:17]
        mult1_acc_reg <= UInt<1>("h0") @[mult.scala 43:19]
    io.mult1_o <= mult1_o_reg @[mult.scala 46:14]
    io.mult2_shift <= mult2_shift_reg @[mult.scala 47:18]
    io.mult1_acco <= mult1_acc_reg @[mult.scala 48:17]
    io.rdy <= rdy_reg @[mult.scala 49:10]

  module MultCell_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip rstn : UInt<1>, flip en : UInt<1>, flip mult1 : UInt<12>, flip mult2 : UInt<6>, flip mult1_acci : UInt<12>, mult1_o : UInt<12>, mult2_shift : UInt<6>, mult1_acco : UInt<12>, rdy : UInt<1>}

    reg mult2_shift_reg : UInt<6>, clock with :
      reset => (reset, UInt<6>("h0")) @[mult.scala 20:32]
    reg mult1_o_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 21:28]
    reg mult1_acc_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 22:30]
    reg rdy_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[mult.scala 23:24]
    node _T = eq(io.rstn, UInt<1>("h0")) @[mult.scala 25:8]
    when _T : @[mult.scala 25:18]
      mult2_shift_reg <= UInt<1>("h0") @[mult.scala 26:21]
      mult1_o_reg <= UInt<1>("h0") @[mult.scala 27:17]
      mult1_acc_reg <= UInt<1>("h0") @[mult.scala 28:19]
      rdy_reg <= UInt<1>("h0") @[mult.scala 29:13]
    else :
      when io.en : @[mult.scala 30:21]
        rdy_reg <= UInt<1>("h1") @[mult.scala 31:13]
        node _mult2_shift_reg_T = dshr(io.mult2, UInt<1>("h1")) @[mult.scala 32:33]
        mult2_shift_reg <= _mult2_shift_reg_T @[mult.scala 32:21]
        node _mult1_o_reg_T = dshl(io.mult1, UInt<1>("h1")) @[mult.scala 33:29]
        mult1_o_reg <= _mult1_o_reg_T @[mult.scala 33:17]
        node _T_1 = bits(io.mult2, 0, 0) @[mult.scala 34:18]
        when _T_1 : @[mult.scala 34:23]
          node _mult1_acc_reg_T = add(io.mult1_acci, io.mult1) @[mult.scala 35:38]
          node _mult1_acc_reg_T_1 = tail(_mult1_acc_reg_T, 1) @[mult.scala 35:38]
          mult1_acc_reg <= _mult1_acc_reg_T_1 @[mult.scala 35:21]
        else :
          mult1_acc_reg <= io.mult1_acci @[mult.scala 37:21]
      else :
        rdy_reg <= UInt<1>("h0") @[mult.scala 40:13]
        mult2_shift_reg <= UInt<1>("h0") @[mult.scala 41:21]
        mult1_o_reg <= UInt<1>("h0") @[mult.scala 42:17]
        mult1_acc_reg <= UInt<1>("h0") @[mult.scala 43:19]
    io.mult1_o <= mult1_o_reg @[mult.scala 46:14]
    io.mult2_shift <= mult2_shift_reg @[mult.scala 47:18]
    io.mult1_acco <= mult1_acc_reg @[mult.scala 48:17]
    io.rdy <= rdy_reg @[mult.scala 49:10]

  module MultCell_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip rstn : UInt<1>, flip en : UInt<1>, flip mult1 : UInt<12>, flip mult2 : UInt<6>, flip mult1_acci : UInt<12>, mult1_o : UInt<12>, mult2_shift : UInt<6>, mult1_acco : UInt<12>, rdy : UInt<1>}

    reg mult2_shift_reg : UInt<6>, clock with :
      reset => (reset, UInt<6>("h0")) @[mult.scala 20:32]
    reg mult1_o_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 21:28]
    reg mult1_acc_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 22:30]
    reg rdy_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[mult.scala 23:24]
    node _T = eq(io.rstn, UInt<1>("h0")) @[mult.scala 25:8]
    when _T : @[mult.scala 25:18]
      mult2_shift_reg <= UInt<1>("h0") @[mult.scala 26:21]
      mult1_o_reg <= UInt<1>("h0") @[mult.scala 27:17]
      mult1_acc_reg <= UInt<1>("h0") @[mult.scala 28:19]
      rdy_reg <= UInt<1>("h0") @[mult.scala 29:13]
    else :
      when io.en : @[mult.scala 30:21]
        rdy_reg <= UInt<1>("h1") @[mult.scala 31:13]
        node _mult2_shift_reg_T = dshr(io.mult2, UInt<1>("h1")) @[mult.scala 32:33]
        mult2_shift_reg <= _mult2_shift_reg_T @[mult.scala 32:21]
        node _mult1_o_reg_T = dshl(io.mult1, UInt<1>("h1")) @[mult.scala 33:29]
        mult1_o_reg <= _mult1_o_reg_T @[mult.scala 33:17]
        node _T_1 = bits(io.mult2, 0, 0) @[mult.scala 34:18]
        when _T_1 : @[mult.scala 34:23]
          node _mult1_acc_reg_T = add(io.mult1_acci, io.mult1) @[mult.scala 35:38]
          node _mult1_acc_reg_T_1 = tail(_mult1_acc_reg_T, 1) @[mult.scala 35:38]
          mult1_acc_reg <= _mult1_acc_reg_T_1 @[mult.scala 35:21]
        else :
          mult1_acc_reg <= io.mult1_acci @[mult.scala 37:21]
      else :
        rdy_reg <= UInt<1>("h0") @[mult.scala 40:13]
        mult2_shift_reg <= UInt<1>("h0") @[mult.scala 41:21]
        mult1_o_reg <= UInt<1>("h0") @[mult.scala 42:17]
        mult1_acc_reg <= UInt<1>("h0") @[mult.scala 43:19]
    io.mult1_o <= mult1_o_reg @[mult.scala 46:14]
    io.mult2_shift <= mult2_shift_reg @[mult.scala 47:18]
    io.mult1_acco <= mult1_acc_reg @[mult.scala 48:17]
    io.rdy <= rdy_reg @[mult.scala 49:10]

  module MultCell_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip rstn : UInt<1>, flip en : UInt<1>, flip mult1 : UInt<12>, flip mult2 : UInt<6>, flip mult1_acci : UInt<12>, mult1_o : UInt<12>, mult2_shift : UInt<6>, mult1_acco : UInt<12>, rdy : UInt<1>}

    reg mult2_shift_reg : UInt<6>, clock with :
      reset => (reset, UInt<6>("h0")) @[mult.scala 20:32]
    reg mult1_o_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 21:28]
    reg mult1_acc_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 22:30]
    reg rdy_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[mult.scala 23:24]
    node _T = eq(io.rstn, UInt<1>("h0")) @[mult.scala 25:8]
    when _T : @[mult.scala 25:18]
      mult2_shift_reg <= UInt<1>("h0") @[mult.scala 26:21]
      mult1_o_reg <= UInt<1>("h0") @[mult.scala 27:17]
      mult1_acc_reg <= UInt<1>("h0") @[mult.scala 28:19]
      rdy_reg <= UInt<1>("h0") @[mult.scala 29:13]
    else :
      when io.en : @[mult.scala 30:21]
        rdy_reg <= UInt<1>("h1") @[mult.scala 31:13]
        node _mult2_shift_reg_T = dshr(io.mult2, UInt<1>("h1")) @[mult.scala 32:33]
        mult2_shift_reg <= _mult2_shift_reg_T @[mult.scala 32:21]
        node _mult1_o_reg_T = dshl(io.mult1, UInt<1>("h1")) @[mult.scala 33:29]
        mult1_o_reg <= _mult1_o_reg_T @[mult.scala 33:17]
        node _T_1 = bits(io.mult2, 0, 0) @[mult.scala 34:18]
        when _T_1 : @[mult.scala 34:23]
          node _mult1_acc_reg_T = add(io.mult1_acci, io.mult1) @[mult.scala 35:38]
          node _mult1_acc_reg_T_1 = tail(_mult1_acc_reg_T, 1) @[mult.scala 35:38]
          mult1_acc_reg <= _mult1_acc_reg_T_1 @[mult.scala 35:21]
        else :
          mult1_acc_reg <= io.mult1_acci @[mult.scala 37:21]
      else :
        rdy_reg <= UInt<1>("h0") @[mult.scala 40:13]
        mult2_shift_reg <= UInt<1>("h0") @[mult.scala 41:21]
        mult1_o_reg <= UInt<1>("h0") @[mult.scala 42:17]
        mult1_acc_reg <= UInt<1>("h0") @[mult.scala 43:19]
    io.mult1_o <= mult1_o_reg @[mult.scala 46:14]
    io.mult2_shift <= mult2_shift_reg @[mult.scala 47:18]
    io.mult1_acco <= mult1_acc_reg @[mult.scala 48:17]
    io.rdy <= rdy_reg @[mult.scala 49:10]

  module MultCell_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip rstn : UInt<1>, flip en : UInt<1>, flip mult1 : UInt<12>, flip mult2 : UInt<6>, flip mult1_acci : UInt<12>, mult1_o : UInt<12>, mult2_shift : UInt<6>, mult1_acco : UInt<12>, rdy : UInt<1>}

    reg mult2_shift_reg : UInt<6>, clock with :
      reset => (reset, UInt<6>("h0")) @[mult.scala 20:32]
    reg mult1_o_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 21:28]
    reg mult1_acc_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 22:30]
    reg rdy_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[mult.scala 23:24]
    node _T = eq(io.rstn, UInt<1>("h0")) @[mult.scala 25:8]
    when _T : @[mult.scala 25:18]
      mult2_shift_reg <= UInt<1>("h0") @[mult.scala 26:21]
      mult1_o_reg <= UInt<1>("h0") @[mult.scala 27:17]
      mult1_acc_reg <= UInt<1>("h0") @[mult.scala 28:19]
      rdy_reg <= UInt<1>("h0") @[mult.scala 29:13]
    else :
      when io.en : @[mult.scala 30:21]
        rdy_reg <= UInt<1>("h1") @[mult.scala 31:13]
        node _mult2_shift_reg_T = dshr(io.mult2, UInt<1>("h1")) @[mult.scala 32:33]
        mult2_shift_reg <= _mult2_shift_reg_T @[mult.scala 32:21]
        node _mult1_o_reg_T = dshl(io.mult1, UInt<1>("h1")) @[mult.scala 33:29]
        mult1_o_reg <= _mult1_o_reg_T @[mult.scala 33:17]
        node _T_1 = bits(io.mult2, 0, 0) @[mult.scala 34:18]
        when _T_1 : @[mult.scala 34:23]
          node _mult1_acc_reg_T = add(io.mult1_acci, io.mult1) @[mult.scala 35:38]
          node _mult1_acc_reg_T_1 = tail(_mult1_acc_reg_T, 1) @[mult.scala 35:38]
          mult1_acc_reg <= _mult1_acc_reg_T_1 @[mult.scala 35:21]
        else :
          mult1_acc_reg <= io.mult1_acci @[mult.scala 37:21]
      else :
        rdy_reg <= UInt<1>("h0") @[mult.scala 40:13]
        mult2_shift_reg <= UInt<1>("h0") @[mult.scala 41:21]
        mult1_o_reg <= UInt<1>("h0") @[mult.scala 42:17]
        mult1_acc_reg <= UInt<1>("h0") @[mult.scala 43:19]
    io.mult1_o <= mult1_o_reg @[mult.scala 46:14]
    io.mult2_shift <= mult2_shift_reg @[mult.scala 47:18]
    io.mult1_acco <= mult1_acc_reg @[mult.scala 48:17]
    io.rdy <= rdy_reg @[mult.scala 49:10]

  module MultCell_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip rstn : UInt<1>, flip en : UInt<1>, flip mult1 : UInt<12>, flip mult2 : UInt<6>, flip mult1_acci : UInt<12>, mult1_o : UInt<12>, mult2_shift : UInt<6>, mult1_acco : UInt<12>, rdy : UInt<1>}

    reg mult2_shift_reg : UInt<6>, clock with :
      reset => (reset, UInt<6>("h0")) @[mult.scala 20:32]
    reg mult1_o_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 21:28]
    reg mult1_acc_reg : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[mult.scala 22:30]
    reg rdy_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[mult.scala 23:24]
    node _T = eq(io.rstn, UInt<1>("h0")) @[mult.scala 25:8]
    when _T : @[mult.scala 25:18]
      mult2_shift_reg <= UInt<1>("h0") @[mult.scala 26:21]
      mult1_o_reg <= UInt<1>("h0") @[mult.scala 27:17]
      mult1_acc_reg <= UInt<1>("h0") @[mult.scala 28:19]
      rdy_reg <= UInt<1>("h0") @[mult.scala 29:13]
    else :
      when io.en : @[mult.scala 30:21]
        rdy_reg <= UInt<1>("h1") @[mult.scala 31:13]
        node _mult2_shift_reg_T = dshr(io.mult2, UInt<1>("h1")) @[mult.scala 32:33]
        mult2_shift_reg <= _mult2_shift_reg_T @[mult.scala 32:21]
        node _mult1_o_reg_T = dshl(io.mult1, UInt<1>("h1")) @[mult.scala 33:29]
        mult1_o_reg <= _mult1_o_reg_T @[mult.scala 33:17]
        node _T_1 = bits(io.mult2, 0, 0) @[mult.scala 34:18]
        when _T_1 : @[mult.scala 34:23]
          node _mult1_acc_reg_T = add(io.mult1_acci, io.mult1) @[mult.scala 35:38]
          node _mult1_acc_reg_T_1 = tail(_mult1_acc_reg_T, 1) @[mult.scala 35:38]
          mult1_acc_reg <= _mult1_acc_reg_T_1 @[mult.scala 35:21]
        else :
          mult1_acc_reg <= io.mult1_acci @[mult.scala 37:21]
      else :
        rdy_reg <= UInt<1>("h0") @[mult.scala 40:13]
        mult2_shift_reg <= UInt<1>("h0") @[mult.scala 41:21]
        mult1_o_reg <= UInt<1>("h0") @[mult.scala 42:17]
        mult1_acc_reg <= UInt<1>("h0") @[mult.scala 43:19]
    io.mult1_o <= mult1_o_reg @[mult.scala 46:14]
    io.mult2_shift <= mult2_shift_reg @[mult.scala 47:18]
    io.mult1_acco <= mult1_acc_reg @[mult.scala 48:17]
    io.rdy <= rdy_reg @[mult.scala 49:10]

  module MultMan :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rstn : UInt<1>, flip data_rdy : UInt<1>, flip mult1 : UInt<6>, flip mult2 : UInt<6>, res_rdy : UInt<1>, res : UInt<12>}

    wire mult1_t_0 : UInt<12> @[mult.scala 65:33]
    wire mult1_t_1 : UInt<12> @[mult.scala 65:33]
    wire mult1_t_2 : UInt<12> @[mult.scala 65:33]
    wire mult1_t_3 : UInt<12> @[mult.scala 65:33]
    wire mult1_t_4 : UInt<12> @[mult.scala 65:33]
    wire mult1_t_5 : UInt<12> @[mult.scala 65:33]
    wire mult2_t_0 : UInt<6> @[mult.scala 66:33]
    wire mult2_t_1 : UInt<6> @[mult.scala 66:33]
    wire mult2_t_2 : UInt<6> @[mult.scala 66:33]
    wire mult2_t_3 : UInt<6> @[mult.scala 66:33]
    wire mult2_t_4 : UInt<6> @[mult.scala 66:33]
    wire mult2_t_5 : UInt<6> @[mult.scala 66:33]
    wire mult1_acc_t_0 : UInt<12> @[mult.scala 67:37]
    wire mult1_acc_t_1 : UInt<12> @[mult.scala 67:37]
    wire mult1_acc_t_2 : UInt<12> @[mult.scala 67:37]
    wire mult1_acc_t_3 : UInt<12> @[mult.scala 67:37]
    wire mult1_acc_t_4 : UInt<12> @[mult.scala 67:37]
    wire mult1_acc_t_5 : UInt<12> @[mult.scala 67:37]
    wire rdy_t_0 : UInt<1> @[mult.scala 68:31]
    wire rdy_t_1 : UInt<1> @[mult.scala 68:31]
    wire rdy_t_2 : UInt<1> @[mult.scala 68:31]
    wire rdy_t_3 : UInt<1> @[mult.scala 68:31]
    wire rdy_t_4 : UInt<1> @[mult.scala 68:31]
    wire rdy_t_5 : UInt<1> @[mult.scala 68:31]
    inst u_mult_step0 of MultCell @[mult.scala 70:28]
    u_mult_step0.clock <= clock
    u_mult_step0.reset <= reset
    u_mult_step0.io.rstn <= io.rstn @[mult.scala 71:24]
    u_mult_step0.io.en <= io.data_rdy @[mult.scala 72:22]
    node _u_mult_step0_io_mult1_T = mux(UInt<1>("h0"), UInt<6>("h3f"), UInt<6>("h0")) @[Bitwise.scala 77:12]
    node _u_mult_step0_io_mult1_T_1 = cat(_u_mult_step0_io_mult1_T, io.mult1) @[Cat.scala 33:92]
    u_mult_step0.io.mult1 <= _u_mult_step0_io_mult1_T_1 @[mult.scala 73:25]
    u_mult_step0.io.mult2 <= io.mult2 @[mult.scala 74:25]
    u_mult_step0.io.mult1_acci <= UInt<1>("h0") @[mult.scala 75:30]
    mult1_t_0 <= u_mult_step0.io.mult1_o @[mult.scala 76:14]
    mult2_t_0 <= u_mult_step0.io.mult2_shift @[mult.scala 77:14]
    mult1_acc_t_0 <= u_mult_step0.io.mult1_acco @[mult.scala 78:18]
    rdy_t_0 <= u_mult_step0.io.rdy @[mult.scala 79:12]
    inst u_mult_step of MultCell_1 @[mult.scala 82:29]
    u_mult_step.clock <= clock
    u_mult_step.reset <= reset
    u_mult_step.io.rstn <= io.rstn @[mult.scala 83:25]
    u_mult_step.io.en <= rdy_t_0 @[mult.scala 84:23]
    u_mult_step.io.mult1 <= mult1_t_0 @[mult.scala 85:26]
    u_mult_step.io.mult2 <= mult2_t_0 @[mult.scala 86:26]
    u_mult_step.io.mult1_acci <= mult1_acc_t_0 @[mult.scala 87:31]
    mult1_t_1 <= u_mult_step.io.mult1_o @[mult.scala 88:16]
    mult2_t_1 <= u_mult_step.io.mult2_shift @[mult.scala 89:16]
    mult1_acc_t_1 <= u_mult_step.io.mult1_acco @[mult.scala 90:20]
    rdy_t_1 <= u_mult_step.io.rdy @[mult.scala 91:14]
    inst u_mult_step_1 of MultCell_2 @[mult.scala 82:29]
    u_mult_step_1.clock <= clock
    u_mult_step_1.reset <= reset
    u_mult_step_1.io.rstn <= io.rstn @[mult.scala 83:25]
    u_mult_step_1.io.en <= rdy_t_1 @[mult.scala 84:23]
    u_mult_step_1.io.mult1 <= mult1_t_1 @[mult.scala 85:26]
    u_mult_step_1.io.mult2 <= mult2_t_1 @[mult.scala 86:26]
    u_mult_step_1.io.mult1_acci <= mult1_acc_t_1 @[mult.scala 87:31]
    mult1_t_2 <= u_mult_step_1.io.mult1_o @[mult.scala 88:16]
    mult2_t_2 <= u_mult_step_1.io.mult2_shift @[mult.scala 89:16]
    mult1_acc_t_2 <= u_mult_step_1.io.mult1_acco @[mult.scala 90:20]
    rdy_t_2 <= u_mult_step_1.io.rdy @[mult.scala 91:14]
    inst u_mult_step_2 of MultCell_3 @[mult.scala 82:29]
    u_mult_step_2.clock <= clock
    u_mult_step_2.reset <= reset
    u_mult_step_2.io.rstn <= io.rstn @[mult.scala 83:25]
    u_mult_step_2.io.en <= rdy_t_2 @[mult.scala 84:23]
    u_mult_step_2.io.mult1 <= mult1_t_2 @[mult.scala 85:26]
    u_mult_step_2.io.mult2 <= mult2_t_2 @[mult.scala 86:26]
    u_mult_step_2.io.mult1_acci <= mult1_acc_t_2 @[mult.scala 87:31]
    mult1_t_3 <= u_mult_step_2.io.mult1_o @[mult.scala 88:16]
    mult2_t_3 <= u_mult_step_2.io.mult2_shift @[mult.scala 89:16]
    mult1_acc_t_3 <= u_mult_step_2.io.mult1_acco @[mult.scala 90:20]
    rdy_t_3 <= u_mult_step_2.io.rdy @[mult.scala 91:14]
    inst u_mult_step_3 of MultCell_4 @[mult.scala 82:29]
    u_mult_step_3.clock <= clock
    u_mult_step_3.reset <= reset
    u_mult_step_3.io.rstn <= io.rstn @[mult.scala 83:25]
    u_mult_step_3.io.en <= rdy_t_3 @[mult.scala 84:23]
    u_mult_step_3.io.mult1 <= mult1_t_3 @[mult.scala 85:26]
    u_mult_step_3.io.mult2 <= mult2_t_3 @[mult.scala 86:26]
    u_mult_step_3.io.mult1_acci <= mult1_acc_t_3 @[mult.scala 87:31]
    mult1_t_4 <= u_mult_step_3.io.mult1_o @[mult.scala 88:16]
    mult2_t_4 <= u_mult_step_3.io.mult2_shift @[mult.scala 89:16]
    mult1_acc_t_4 <= u_mult_step_3.io.mult1_acco @[mult.scala 90:20]
    rdy_t_4 <= u_mult_step_3.io.rdy @[mult.scala 91:14]
    inst u_mult_step_4 of MultCell_5 @[mult.scala 82:29]
    u_mult_step_4.clock <= clock
    u_mult_step_4.reset <= reset
    u_mult_step_4.io.rstn <= io.rstn @[mult.scala 83:25]
    u_mult_step_4.io.en <= rdy_t_4 @[mult.scala 84:23]
    u_mult_step_4.io.mult1 <= mult1_t_4 @[mult.scala 85:26]
    u_mult_step_4.io.mult2 <= mult2_t_4 @[mult.scala 86:26]
    u_mult_step_4.io.mult1_acci <= mult1_acc_t_4 @[mult.scala 87:31]
    mult1_t_5 <= u_mult_step_4.io.mult1_o @[mult.scala 88:16]
    mult2_t_5 <= u_mult_step_4.io.mult2_shift @[mult.scala 89:16]
    mult1_acc_t_5 <= u_mult_step_4.io.mult1_acco @[mult.scala 90:20]
    rdy_t_5 <= u_mult_step_4.io.rdy @[mult.scala 91:14]
    io.res_rdy <= rdy_t_5 @[mult.scala 94:14]
    io.res <= mult1_acc_t_5 @[mult.scala 95:10]

