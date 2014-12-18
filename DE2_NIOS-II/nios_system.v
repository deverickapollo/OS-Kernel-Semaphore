//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module CPU_jtag_debug_module_arbitrator (
                                          // inputs:
                                           CPU_data_master_address_to_slave,
                                           CPU_data_master_byteenable,
                                           CPU_data_master_debugaccess,
                                           CPU_data_master_read,
                                           CPU_data_master_waitrequest,
                                           CPU_data_master_write,
                                           CPU_data_master_writedata,
                                           CPU_instruction_master_address_to_slave,
                                           CPU_instruction_master_read,
                                           CPU_jtag_debug_module_readdata,
                                           CPU_jtag_debug_module_resetrequest,
                                           clk,
                                           reset_n,

                                          // outputs:
                                           CPU_data_master_granted_CPU_jtag_debug_module,
                                           CPU_data_master_qualified_request_CPU_jtag_debug_module,
                                           CPU_data_master_read_data_valid_CPU_jtag_debug_module,
                                           CPU_data_master_requests_CPU_jtag_debug_module,
                                           CPU_instruction_master_granted_CPU_jtag_debug_module,
                                           CPU_instruction_master_qualified_request_CPU_jtag_debug_module,
                                           CPU_instruction_master_read_data_valid_CPU_jtag_debug_module,
                                           CPU_instruction_master_requests_CPU_jtag_debug_module,
                                           CPU_jtag_debug_module_address,
                                           CPU_jtag_debug_module_begintransfer,
                                           CPU_jtag_debug_module_byteenable,
                                           CPU_jtag_debug_module_chipselect,
                                           CPU_jtag_debug_module_debugaccess,
                                           CPU_jtag_debug_module_readdata_from_sa,
                                           CPU_jtag_debug_module_reset_n,
                                           CPU_jtag_debug_module_resetrequest_from_sa,
                                           CPU_jtag_debug_module_write,
                                           CPU_jtag_debug_module_writedata,
                                           d1_CPU_jtag_debug_module_end_xfer
                                        )
;

  output           CPU_data_master_granted_CPU_jtag_debug_module;
  output           CPU_data_master_qualified_request_CPU_jtag_debug_module;
  output           CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  output           CPU_data_master_requests_CPU_jtag_debug_module;
  output           CPU_instruction_master_granted_CPU_jtag_debug_module;
  output           CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  output           CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  output           CPU_instruction_master_requests_CPU_jtag_debug_module;
  output  [  8: 0] CPU_jtag_debug_module_address;
  output           CPU_jtag_debug_module_begintransfer;
  output  [  3: 0] CPU_jtag_debug_module_byteenable;
  output           CPU_jtag_debug_module_chipselect;
  output           CPU_jtag_debug_module_debugaccess;
  output  [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  output           CPU_jtag_debug_module_reset_n;
  output           CPU_jtag_debug_module_resetrequest_from_sa;
  output           CPU_jtag_debug_module_write;
  output  [ 31: 0] CPU_jtag_debug_module_writedata;
  output           d1_CPU_jtag_debug_module_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_debugaccess;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input            CPU_instruction_master_read;
  input   [ 31: 0] CPU_jtag_debug_module_readdata;
  input            CPU_jtag_debug_module_resetrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_CPU_jtag_debug_module;
  wire             CPU_data_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_data_master_requests_CPU_jtag_debug_module;
  wire             CPU_data_master_saved_grant_CPU_jtag_debug_module;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_CPU_jtag_debug_module;
  wire             CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_instruction_master_requests_CPU_jtag_debug_module;
  wire             CPU_instruction_master_saved_grant_CPU_jtag_debug_module;
  wire    [  8: 0] CPU_jtag_debug_module_address;
  wire             CPU_jtag_debug_module_allgrants;
  wire             CPU_jtag_debug_module_allow_new_arb_cycle;
  wire             CPU_jtag_debug_module_any_bursting_master_saved_grant;
  wire             CPU_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] CPU_jtag_debug_module_arb_addend;
  wire             CPU_jtag_debug_module_arb_counter_enable;
  reg     [  1: 0] CPU_jtag_debug_module_arb_share_counter;
  wire    [  1: 0] CPU_jtag_debug_module_arb_share_counter_next_value;
  wire    [  1: 0] CPU_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] CPU_jtag_debug_module_arb_winner;
  wire             CPU_jtag_debug_module_arbitration_holdoff_internal;
  wire             CPU_jtag_debug_module_beginbursttransfer_internal;
  wire             CPU_jtag_debug_module_begins_xfer;
  wire             CPU_jtag_debug_module_begintransfer;
  wire    [  3: 0] CPU_jtag_debug_module_byteenable;
  wire             CPU_jtag_debug_module_chipselect;
  wire    [  3: 0] CPU_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] CPU_jtag_debug_module_chosen_master_rot_left;
  wire             CPU_jtag_debug_module_debugaccess;
  wire             CPU_jtag_debug_module_end_xfer;
  wire             CPU_jtag_debug_module_firsttransfer;
  wire    [  1: 0] CPU_jtag_debug_module_grant_vector;
  wire             CPU_jtag_debug_module_in_a_read_cycle;
  wire             CPU_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] CPU_jtag_debug_module_master_qreq_vector;
  wire             CPU_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  reg              CPU_jtag_debug_module_reg_firsttransfer;
  wire             CPU_jtag_debug_module_reset_n;
  wire             CPU_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] CPU_jtag_debug_module_saved_chosen_master_vector;
  reg              CPU_jtag_debug_module_slavearbiterlockenable;
  wire             CPU_jtag_debug_module_slavearbiterlockenable2;
  wire             CPU_jtag_debug_module_unreg_firsttransfer;
  wire             CPU_jtag_debug_module_waits_for_read;
  wire             CPU_jtag_debug_module_waits_for_write;
  wire             CPU_jtag_debug_module_write;
  wire    [ 31: 0] CPU_jtag_debug_module_writedata;
  reg              d1_CPU_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_CPU_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module;
  reg              last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module;
  wire    [ 28: 0] shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master;
  wire    [ 27: 0] shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master;
  wire             wait_for_CPU_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~CPU_jtag_debug_module_end_xfer;
    end


  assign CPU_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_CPU_jtag_debug_module | CPU_instruction_master_qualified_request_CPU_jtag_debug_module));
  //assign CPU_jtag_debug_module_readdata_from_sa = CPU_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign CPU_jtag_debug_module_readdata_from_sa = CPU_jtag_debug_module_readdata;

  assign CPU_data_master_requests_CPU_jtag_debug_module = ({CPU_data_master_address_to_slave[28 : 11] , 11'b0} == 29'ha000000) & (CPU_data_master_read | CPU_data_master_write);
  //CPU_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign CPU_jtag_debug_module_arb_share_set_values = 1;

  //CPU_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign CPU_jtag_debug_module_non_bursting_master_requests = CPU_data_master_requests_CPU_jtag_debug_module |
    CPU_instruction_master_requests_CPU_jtag_debug_module |
    CPU_data_master_requests_CPU_jtag_debug_module |
    CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign CPU_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //CPU_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign CPU_jtag_debug_module_arb_share_counter_next_value = CPU_jtag_debug_module_firsttransfer ? (CPU_jtag_debug_module_arb_share_set_values - 1) : |CPU_jtag_debug_module_arb_share_counter ? (CPU_jtag_debug_module_arb_share_counter - 1) : 0;

  //CPU_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign CPU_jtag_debug_module_allgrants = (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector);

  //CPU_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign CPU_jtag_debug_module_end_xfer = ~(CPU_jtag_debug_module_waits_for_read | CPU_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_CPU_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_CPU_jtag_debug_module = CPU_jtag_debug_module_end_xfer & (~CPU_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //CPU_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign CPU_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & CPU_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & ~CPU_jtag_debug_module_non_bursting_master_requests);

  //CPU_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_arb_share_counter <= 0;
      else if (CPU_jtag_debug_module_arb_counter_enable)
          CPU_jtag_debug_module_arb_share_counter <= CPU_jtag_debug_module_arb_share_counter_next_value;
    end


  //CPU_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|CPU_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_CPU_jtag_debug_module) | (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & ~CPU_jtag_debug_module_non_bursting_master_requests))
          CPU_jtag_debug_module_slavearbiterlockenable <= |CPU_jtag_debug_module_arb_share_counter_next_value;
    end


  //CPU/data_master CPU/jtag_debug_module arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = CPU_jtag_debug_module_slavearbiterlockenable & CPU_data_master_continuerequest;

  //CPU_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign CPU_jtag_debug_module_slavearbiterlockenable2 = |CPU_jtag_debug_module_arb_share_counter_next_value;

  //CPU/data_master CPU/jtag_debug_module arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = CPU_jtag_debug_module_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master CPU/jtag_debug_module arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = CPU_jtag_debug_module_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master CPU/jtag_debug_module arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = CPU_jtag_debug_module_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted CPU/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module <= CPU_instruction_master_saved_grant_CPU_jtag_debug_module ? 1 : (CPU_jtag_debug_module_arbitration_holdoff_internal | ~CPU_instruction_master_requests_CPU_jtag_debug_module) ? 0 : last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module & CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign CPU_jtag_debug_module_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_CPU_jtag_debug_module = CPU_data_master_requests_CPU_jtag_debug_module & ~(((~CPU_data_master_waitrequest) & CPU_data_master_write) | CPU_instruction_master_arbiterlock);
  //CPU_jtag_debug_module_writedata mux, which is an e_mux
  assign CPU_jtag_debug_module_writedata = CPU_data_master_writedata;

  assign CPU_instruction_master_requests_CPU_jtag_debug_module = (({CPU_instruction_master_address_to_slave[27 : 11] , 11'b0} == 28'ha000000) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted CPU/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module <= CPU_data_master_saved_grant_CPU_jtag_debug_module ? 1 : (CPU_jtag_debug_module_arbitration_holdoff_internal | ~CPU_data_master_requests_CPU_jtag_debug_module) ? 0 : last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module & CPU_data_master_requests_CPU_jtag_debug_module;

  assign CPU_instruction_master_qualified_request_CPU_jtag_debug_module = CPU_instruction_master_requests_CPU_jtag_debug_module & ~(CPU_data_master_arbiterlock);
  //allow new arb cycle for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_master_qreq_vector[0] = CPU_instruction_master_qualified_request_CPU_jtag_debug_module;

  //CPU/instruction_master grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_instruction_master_granted_CPU_jtag_debug_module = CPU_jtag_debug_module_grant_vector[0];

  //CPU/instruction_master saved-grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_instruction_master_saved_grant_CPU_jtag_debug_module = CPU_jtag_debug_module_arb_winner[0] && CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU/data_master assignment into master qualified-requests vector for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_master_qreq_vector[1] = CPU_data_master_qualified_request_CPU_jtag_debug_module;

  //CPU/data_master grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_data_master_granted_CPU_jtag_debug_module = CPU_jtag_debug_module_grant_vector[1];

  //CPU/data_master saved-grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_data_master_saved_grant_CPU_jtag_debug_module = CPU_jtag_debug_module_arb_winner[1] && CPU_data_master_requests_CPU_jtag_debug_module;

  //CPU/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign CPU_jtag_debug_module_chosen_master_double_vector = {CPU_jtag_debug_module_master_qreq_vector, CPU_jtag_debug_module_master_qreq_vector} & ({~CPU_jtag_debug_module_master_qreq_vector, ~CPU_jtag_debug_module_master_qreq_vector} + CPU_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign CPU_jtag_debug_module_arb_winner = (CPU_jtag_debug_module_allow_new_arb_cycle & | CPU_jtag_debug_module_grant_vector) ? CPU_jtag_debug_module_grant_vector : CPU_jtag_debug_module_saved_chosen_master_vector;

  //saved CPU_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (CPU_jtag_debug_module_allow_new_arb_cycle)
          CPU_jtag_debug_module_saved_chosen_master_vector <= |CPU_jtag_debug_module_grant_vector ? CPU_jtag_debug_module_grant_vector : CPU_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign CPU_jtag_debug_module_grant_vector = {(CPU_jtag_debug_module_chosen_master_double_vector[1] | CPU_jtag_debug_module_chosen_master_double_vector[3]),
    (CPU_jtag_debug_module_chosen_master_double_vector[0] | CPU_jtag_debug_module_chosen_master_double_vector[2])};

  //CPU/jtag_debug_module chosen master rotated left, which is an e_assign
  assign CPU_jtag_debug_module_chosen_master_rot_left = (CPU_jtag_debug_module_arb_winner << 1) ? (CPU_jtag_debug_module_arb_winner << 1) : 1;

  //CPU/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_arb_addend <= 1;
      else if (|CPU_jtag_debug_module_grant_vector)
          CPU_jtag_debug_module_arb_addend <= CPU_jtag_debug_module_end_xfer? CPU_jtag_debug_module_chosen_master_rot_left : CPU_jtag_debug_module_grant_vector;
    end


  assign CPU_jtag_debug_module_begintransfer = CPU_jtag_debug_module_begins_xfer;
  //CPU_jtag_debug_module_reset_n assignment, which is an e_assign
  assign CPU_jtag_debug_module_reset_n = reset_n;

  //assign CPU_jtag_debug_module_resetrequest_from_sa = CPU_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign CPU_jtag_debug_module_resetrequest_from_sa = CPU_jtag_debug_module_resetrequest;

  assign CPU_jtag_debug_module_chipselect = CPU_data_master_granted_CPU_jtag_debug_module | CPU_instruction_master_granted_CPU_jtag_debug_module;
  //CPU_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign CPU_jtag_debug_module_firsttransfer = CPU_jtag_debug_module_begins_xfer ? CPU_jtag_debug_module_unreg_firsttransfer : CPU_jtag_debug_module_reg_firsttransfer;

  //CPU_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign CPU_jtag_debug_module_unreg_firsttransfer = ~(CPU_jtag_debug_module_slavearbiterlockenable & CPU_jtag_debug_module_any_continuerequest);

  //CPU_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (CPU_jtag_debug_module_begins_xfer)
          CPU_jtag_debug_module_reg_firsttransfer <= CPU_jtag_debug_module_unreg_firsttransfer;
    end


  //CPU_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign CPU_jtag_debug_module_beginbursttransfer_internal = CPU_jtag_debug_module_begins_xfer;

  //CPU_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign CPU_jtag_debug_module_arbitration_holdoff_internal = CPU_jtag_debug_module_begins_xfer & CPU_jtag_debug_module_firsttransfer;

  //CPU_jtag_debug_module_write assignment, which is an e_mux
  assign CPU_jtag_debug_module_write = CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_write;

  assign shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master = CPU_data_master_address_to_slave;
  //CPU_jtag_debug_module_address mux, which is an e_mux
  assign CPU_jtag_debug_module_address = (CPU_data_master_granted_CPU_jtag_debug_module)? (shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master >> 2) :
    (shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master >> 2);

  assign shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master = CPU_instruction_master_address_to_slave;
  //d1_CPU_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_CPU_jtag_debug_module_end_xfer <= 1;
      else 
        d1_CPU_jtag_debug_module_end_xfer <= CPU_jtag_debug_module_end_xfer;
    end


  //CPU_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign CPU_jtag_debug_module_waits_for_read = CPU_jtag_debug_module_in_a_read_cycle & CPU_jtag_debug_module_begins_xfer;

  //CPU_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign CPU_jtag_debug_module_in_a_read_cycle = (CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_read) | (CPU_instruction_master_granted_CPU_jtag_debug_module & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = CPU_jtag_debug_module_in_a_read_cycle;

  //CPU_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign CPU_jtag_debug_module_waits_for_write = CPU_jtag_debug_module_in_a_write_cycle & 0;

  //CPU_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign CPU_jtag_debug_module_in_a_write_cycle = CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = CPU_jtag_debug_module_in_a_write_cycle;

  assign wait_for_CPU_jtag_debug_module_counter = 0;
  //CPU_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign CPU_jtag_debug_module_byteenable = (CPU_data_master_granted_CPU_jtag_debug_module)? CPU_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign CPU_jtag_debug_module_debugaccess = (CPU_data_master_granted_CPU_jtag_debug_module)? CPU_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //CPU/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_granted_CPU_jtag_debug_module + CPU_instruction_master_granted_CPU_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_CPU_jtag_debug_module + CPU_instruction_master_saved_grant_CPU_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module CPU_data_master_arbitrator (
                                    // inputs:
                                     CPU_data_master_address,
                                     CPU_data_master_byteenable_SDRAM_s1,
                                     CPU_data_master_byteenable_SRAM_avalon_sram_slave,
                                     CPU_data_master_granted_CPU_jtag_debug_module,
                                     CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave,
                                     CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave,
                                     CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave,
                                     CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave,
                                     CPU_data_master_granted_Interval_timer_s1,
                                     CPU_data_master_granted_JTAG_UART_avalon_jtag_slave,
                                     CPU_data_master_granted_Onchip_memory_s2,
                                     CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave,
                                     CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_granted_SDRAM_s1,
                                     CPU_data_master_granted_SRAM_avalon_sram_slave,
                                     CPU_data_master_granted_Serial_port_avalon_rs232_slave,
                                     CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave,
                                     CPU_data_master_granted_sysid_control_slave,
                                     CPU_data_master_qualified_request_CPU_jtag_debug_module,
                                     CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_Interval_timer_s1,
                                     CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave,
                                     CPU_data_master_qualified_request_Onchip_memory_s2,
                                     CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_SDRAM_s1,
                                     CPU_data_master_qualified_request_SRAM_avalon_sram_slave,
                                     CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave,
                                     CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave,
                                     CPU_data_master_qualified_request_sysid_control_slave,
                                     CPU_data_master_read,
                                     CPU_data_master_read_data_valid_CPU_jtag_debug_module,
                                     CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_Interval_timer_s1,
                                     CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave,
                                     CPU_data_master_read_data_valid_Onchip_memory_s2,
                                     CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_SDRAM_s1,
                                     CPU_data_master_read_data_valid_SDRAM_s1_shift_register,
                                     CPU_data_master_read_data_valid_SRAM_avalon_sram_slave,
                                     CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register,
                                     CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave,
                                     CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave,
                                     CPU_data_master_read_data_valid_sysid_control_slave,
                                     CPU_data_master_requests_CPU_jtag_debug_module,
                                     CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave,
                                     CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave,
                                     CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave,
                                     CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave,
                                     CPU_data_master_requests_Interval_timer_s1,
                                     CPU_data_master_requests_JTAG_UART_avalon_jtag_slave,
                                     CPU_data_master_requests_Onchip_memory_s2,
                                     CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave,
                                     CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave,
                                     CPU_data_master_requests_SDRAM_s1,
                                     CPU_data_master_requests_SRAM_avalon_sram_slave,
                                     CPU_data_master_requests_Serial_port_avalon_rs232_slave,
                                     CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave,
                                     CPU_data_master_requests_sysid_control_slave,
                                     CPU_data_master_write,
                                     CPU_data_master_writedata,
                                     CPU_jtag_debug_module_readdata_from_sa,
                                     Expansion_JP1_avalon_parallel_port_slave_irq_from_sa,
                                     Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa,
                                     Expansion_JP2_avalon_parallel_port_slave_irq_from_sa,
                                     Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa,
                                     Green_LEDs_avalon_parallel_port_slave_readdata_from_sa,
                                     HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa,
                                     HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa,
                                     Interval_timer_s1_irq_from_sa,
                                     Interval_timer_s1_readdata_from_sa,
                                     JTAG_UART_avalon_jtag_slave_irq_from_sa,
                                     JTAG_UART_avalon_jtag_slave_readdata_from_sa,
                                     JTAG_UART_avalon_jtag_slave_waitrequest_from_sa,
                                     Onchip_memory_s2_readdata_from_sa,
                                     Pushbuttons_avalon_parallel_port_slave_irq_from_sa,
                                     Pushbuttons_avalon_parallel_port_slave_readdata_from_sa,
                                     Red_LEDs_avalon_parallel_port_slave_readdata_from_sa,
                                     SDRAM_s1_readdata_from_sa,
                                     SDRAM_s1_waitrequest_from_sa,
                                     SRAM_avalon_sram_slave_readdata_from_sa,
                                     Serial_port_avalon_rs232_slave_irq_from_sa,
                                     Serial_port_avalon_rs232_slave_readdata_from_sa,
                                     Slider_switches_avalon_parallel_port_slave_readdata_from_sa,
                                     clk,
                                     d1_CPU_jtag_debug_module_end_xfer,
                                     d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer,
                                     d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer,
                                     d1_Green_LEDs_avalon_parallel_port_slave_end_xfer,
                                     d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer,
                                     d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer,
                                     d1_Interval_timer_s1_end_xfer,
                                     d1_JTAG_UART_avalon_jtag_slave_end_xfer,
                                     d1_Onchip_memory_s2_end_xfer,
                                     d1_Pushbuttons_avalon_parallel_port_slave_end_xfer,
                                     d1_Red_LEDs_avalon_parallel_port_slave_end_xfer,
                                     d1_SDRAM_s1_end_xfer,
                                     d1_SRAM_avalon_sram_slave_end_xfer,
                                     d1_Serial_port_avalon_rs232_slave_end_xfer,
                                     d1_Slider_switches_avalon_parallel_port_slave_end_xfer,
                                     d1_sysid_control_slave_end_xfer,
                                     registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_Onchip_memory_s2,
                                     registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave,
                                     registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave,
                                     registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave,
                                     reset_n,
                                     sysid_control_slave_readdata_from_sa,

                                    // outputs:
                                     CPU_data_master_address_to_slave,
                                     CPU_data_master_dbs_address,
                                     CPU_data_master_dbs_write_16,
                                     CPU_data_master_irq,
                                     CPU_data_master_no_byte_enables_and_last_term,
                                     CPU_data_master_readdata,
                                     CPU_data_master_waitrequest
                                  )
;

  output  [ 28: 0] CPU_data_master_address_to_slave;
  output  [  1: 0] CPU_data_master_dbs_address;
  output  [ 15: 0] CPU_data_master_dbs_write_16;
  output  [ 31: 0] CPU_data_master_irq;
  output           CPU_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] CPU_data_master_readdata;
  output           CPU_data_master_waitrequest;
  input   [ 28: 0] CPU_data_master_address;
  input   [  1: 0] CPU_data_master_byteenable_SDRAM_s1;
  input   [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave;
  input            CPU_data_master_granted_CPU_jtag_debug_module;
  input            CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave;
  input            CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave;
  input            CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave;
  input            CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave;
  input            CPU_data_master_granted_Interval_timer_s1;
  input            CPU_data_master_granted_JTAG_UART_avalon_jtag_slave;
  input            CPU_data_master_granted_Onchip_memory_s2;
  input            CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave;
  input            CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_granted_SDRAM_s1;
  input            CPU_data_master_granted_SRAM_avalon_sram_slave;
  input            CPU_data_master_granted_Serial_port_avalon_rs232_slave;
  input            CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave;
  input            CPU_data_master_granted_sysid_control_slave;
  input            CPU_data_master_qualified_request_CPU_jtag_debug_module;
  input            CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_Interval_timer_s1;
  input            CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave;
  input            CPU_data_master_qualified_request_Onchip_memory_s2;
  input            CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_SDRAM_s1;
  input            CPU_data_master_qualified_request_SRAM_avalon_sram_slave;
  input            CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave;
  input            CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave;
  input            CPU_data_master_qualified_request_sysid_control_slave;
  input            CPU_data_master_read;
  input            CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  input            CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_Interval_timer_s1;
  input            CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave;
  input            CPU_data_master_read_data_valid_Onchip_memory_s2;
  input            CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_SDRAM_s1;
  input            CPU_data_master_read_data_valid_SDRAM_s1_shift_register;
  input            CPU_data_master_read_data_valid_SRAM_avalon_sram_slave;
  input            CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  input            CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave;
  input            CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave;
  input            CPU_data_master_read_data_valid_sysid_control_slave;
  input            CPU_data_master_requests_CPU_jtag_debug_module;
  input            CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;
  input            CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;
  input            CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;
  input            CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;
  input            CPU_data_master_requests_Interval_timer_s1;
  input            CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;
  input            CPU_data_master_requests_Onchip_memory_s2;
  input            CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;
  input            CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;
  input            CPU_data_master_requests_SDRAM_s1;
  input            CPU_data_master_requests_SRAM_avalon_sram_slave;
  input            CPU_data_master_requests_Serial_port_avalon_rs232_slave;
  input            CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave;
  input            CPU_data_master_requests_sysid_control_slave;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  input            Expansion_JP1_avalon_parallel_port_slave_irq_from_sa;
  input   [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa;
  input            Expansion_JP2_avalon_parallel_port_slave_irq_from_sa;
  input   [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa;
  input   [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  input   [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa;
  input   [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa;
  input            Interval_timer_s1_irq_from_sa;
  input   [ 15: 0] Interval_timer_s1_readdata_from_sa;
  input            JTAG_UART_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata_from_sa;
  input            JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;
  input   [ 31: 0] Onchip_memory_s2_readdata_from_sa;
  input            Pushbuttons_avalon_parallel_port_slave_irq_from_sa;
  input   [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata_from_sa;
  input   [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  input   [ 15: 0] SDRAM_s1_readdata_from_sa;
  input            SDRAM_s1_waitrequest_from_sa;
  input   [ 15: 0] SRAM_avalon_sram_slave_readdata_from_sa;
  input            Serial_port_avalon_rs232_slave_irq_from_sa;
  input   [ 31: 0] Serial_port_avalon_rs232_slave_readdata_from_sa;
  input   [ 31: 0] Slider_switches_avalon_parallel_port_slave_readdata_from_sa;
  input            clk;
  input            d1_CPU_jtag_debug_module_end_xfer;
  input            d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer;
  input            d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer;
  input            d1_Green_LEDs_avalon_parallel_port_slave_end_xfer;
  input            d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
  input            d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
  input            d1_Interval_timer_s1_end_xfer;
  input            d1_JTAG_UART_avalon_jtag_slave_end_xfer;
  input            d1_Onchip_memory_s2_end_xfer;
  input            d1_Pushbuttons_avalon_parallel_port_slave_end_xfer;
  input            d1_Red_LEDs_avalon_parallel_port_slave_end_xfer;
  input            d1_SDRAM_s1_end_xfer;
  input            d1_SRAM_avalon_sram_slave_end_xfer;
  input            d1_Serial_port_avalon_rs232_slave_end_xfer;
  input            d1_Slider_switches_avalon_parallel_port_slave_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_Onchip_memory_s2;
  input            registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  input            registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave;
  input            registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;

  wire    [ 28: 0] CPU_data_master_address_to_slave;
  reg     [  1: 0] CPU_data_master_dbs_address;
  wire    [  1: 0] CPU_data_master_dbs_increment;
  wire    [ 15: 0] CPU_data_master_dbs_write_16;
  wire    [ 31: 0] CPU_data_master_irq;
  reg              CPU_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] CPU_data_master_readdata;
  wire             CPU_data_master_run;
  reg              CPU_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [ 31: 0] p1_registered_CPU_data_master_readdata;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  reg     [ 31: 0] registered_CPU_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_requests_CPU_jtag_debug_module) & (CPU_data_master_granted_CPU_jtag_debug_module | ~CPU_data_master_qualified_request_CPU_jtag_debug_module) & ((~CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_read | (1 & 1 & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave | ~CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave | ~CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave | ~CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave | ~CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign CPU_data_master_run = r_0 & r_1 & r_2 & r_3;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave | ~CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Interval_timer_s1 | ~CPU_data_master_requests_Interval_timer_s1) & ((~CPU_data_master_qualified_request_Interval_timer_s1 | ~CPU_data_master_read | (1 & 1 & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Interval_timer_s1 | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave | ~CPU_data_master_requests_JTAG_UART_avalon_jtag_slave) & ((~CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~JTAG_UART_avalon_jtag_slave_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & ((~CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~JTAG_UART_avalon_jtag_slave_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Onchip_memory_s2 | registered_CPU_data_master_read_data_valid_Onchip_memory_s2 | ~CPU_data_master_requests_Onchip_memory_s2) & ((~CPU_data_master_qualified_request_Onchip_memory_s2 | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Onchip_memory_s2 & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Onchip_memory_s2 | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave | ~CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_read)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave | ~CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_SDRAM_s1 | (CPU_data_master_read_data_valid_SDRAM_s1 & CPU_data_master_dbs_address[1]) | (CPU_data_master_write & !CPU_data_master_byteenable_SDRAM_s1 & CPU_data_master_dbs_address[1]) | ~CPU_data_master_requests_SDRAM_s1) & (CPU_data_master_granted_SDRAM_s1 | ~CPU_data_master_qualified_request_SDRAM_s1) & ((~CPU_data_master_qualified_request_SDRAM_s1 | ~CPU_data_master_read | (CPU_data_master_read_data_valid_SDRAM_s1 & (CPU_data_master_dbs_address[1]) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_SDRAM_s1 | ~CPU_data_master_write | (1 & ~SDRAM_s1_waitrequest_from_sa & (CPU_data_master_dbs_address[1]) & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_SRAM_avalon_sram_slave | (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave & CPU_data_master_dbs_address[1]) | (CPU_data_master_write & !CPU_data_master_byteenable_SRAM_avalon_sram_slave & CPU_data_master_dbs_address[1]) | ~CPU_data_master_requests_SRAM_avalon_sram_slave) & (CPU_data_master_granted_SRAM_avalon_sram_slave | ~CPU_data_master_qualified_request_SRAM_avalon_sram_slave) & ((~CPU_data_master_qualified_request_SRAM_avalon_sram_slave | ~CPU_data_master_read | (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave & (CPU_data_master_dbs_address[1]) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_SRAM_avalon_sram_slave | ~CPU_data_master_write | (1 & (CPU_data_master_dbs_address[1]) & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave | registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave | ~CPU_data_master_requests_Serial_port_avalon_rs232_slave) & ((~CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1;

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = (CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave | registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave | ~CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave) & ((~CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & ((~CPU_data_master_qualified_request_sysid_control_slave | ~CPU_data_master_read | (1 & 1 & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_sysid_control_slave | ~CPU_data_master_write | (1 & CPU_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign CPU_data_master_address_to_slave = {CPU_data_master_address[28 : 27],
    1'b0,
    CPU_data_master_address[25 : 24],
    1'b0,
    CPU_data_master_address[22 : 0]};

  //CPU/data_master readdata mux, which is an e_mux
  assign CPU_data_master_readdata = ({32 {~CPU_data_master_requests_CPU_jtag_debug_module}} | CPU_jtag_debug_module_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave}} | Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave}} | Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave}} | Green_LEDs_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave}} | HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave}} | HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Interval_timer_s1}} | Interval_timer_s1_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_JTAG_UART_avalon_jtag_slave}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_Onchip_memory_s2}} | Onchip_memory_s2_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave}} | Pushbuttons_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave}} | Red_LEDs_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_SDRAM_s1}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_SRAM_avalon_sram_slave}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_Serial_port_avalon_rs232_slave}} | Serial_port_avalon_rs232_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave}} | Slider_switches_avalon_parallel_port_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_sysid_control_slave}} | sysid_control_slave_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_waitrequest <= ~0;
      else 
        CPU_data_master_waitrequest <= ~((~(CPU_data_master_read | CPU_data_master_write))? 0: (CPU_data_master_run & CPU_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign CPU_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    Expansion_JP2_avalon_parallel_port_slave_irq_from_sa,
    Expansion_JP1_avalon_parallel_port_slave_irq_from_sa,
    Serial_port_avalon_rs232_slave_irq_from_sa,
    1'b0,
    JTAG_UART_avalon_jtag_slave_irq_from_sa,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    Pushbuttons_avalon_parallel_port_slave_irq_from_sa,
    Interval_timer_s1_irq_from_sa};

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_CPU_data_master_readdata <= 0;
      else 
        registered_CPU_data_master_readdata <= p1_registered_CPU_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_CPU_data_master_readdata = ({32 {~CPU_data_master_requests_JTAG_UART_avalon_jtag_slave}} | JTAG_UART_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_SDRAM_s1}} | {SDRAM_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~CPU_data_master_requests_SRAM_avalon_sram_slave}} | {SRAM_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0});

  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_no_byte_enables_and_last_term <= 0;
      else 
        CPU_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (CPU_data_master_requests_SDRAM_s1)? (((CPU_data_master_dbs_address == 2'b10) & CPU_data_master_write & !CPU_data_master_byteenable_SDRAM_s1)) :
    (((CPU_data_master_dbs_address == 2'b10) & CPU_data_master_write & !CPU_data_master_byteenable_SRAM_avalon_sram_slave));

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~CPU_data_master_no_byte_enables_and_last_term) & CPU_data_master_requests_SDRAM_s1 & CPU_data_master_write & !CPU_data_master_byteenable_SDRAM_s1)) |
    CPU_data_master_read_data_valid_SDRAM_s1 |
    (CPU_data_master_granted_SDRAM_s1 & CPU_data_master_write & 1 & 1 & ~SDRAM_s1_waitrequest_from_sa) |
    (((~CPU_data_master_no_byte_enables_and_last_term) & CPU_data_master_requests_SRAM_avalon_sram_slave & CPU_data_master_write & !CPU_data_master_byteenable_SRAM_avalon_sram_slave)) |
    CPU_data_master_read_data_valid_SRAM_avalon_sram_slave |
    (CPU_data_master_granted_SRAM_avalon_sram_slave & CPU_data_master_write & 1 & 1);

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (CPU_data_master_requests_SDRAM_s1)? SDRAM_s1_readdata_from_sa :
    SRAM_avalon_sram_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((CPU_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign CPU_data_master_dbs_write_16 = (CPU_data_master_dbs_address[1])? CPU_data_master_writedata[31 : 16] :
    (~(CPU_data_master_dbs_address[1]))? CPU_data_master_writedata[15 : 0] :
    (CPU_data_master_dbs_address[1])? CPU_data_master_writedata[31 : 16] :
    CPU_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign CPU_data_master_dbs_increment = (CPU_data_master_requests_SDRAM_s1)? 2 :
    (CPU_data_master_requests_SRAM_avalon_sram_slave)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = CPU_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = CPU_data_master_dbs_address + CPU_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(CPU_data_master_requests_SDRAM_s1 & ~CPU_data_master_waitrequest)) &
    (~(CPU_data_master_requests_SRAM_avalon_sram_slave & ~CPU_data_master_waitrequest));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          CPU_data_master_dbs_address <= next_dbs_address;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module CPU_instruction_master_arbitrator (
                                           // inputs:
                                            CPU_instruction_master_address,
                                            CPU_instruction_master_granted_CPU_jtag_debug_module,
                                            CPU_instruction_master_granted_Onchip_memory_s1,
                                            CPU_instruction_master_granted_SDRAM_s1,
                                            CPU_instruction_master_granted_SRAM_avalon_sram_slave,
                                            CPU_instruction_master_qualified_request_CPU_jtag_debug_module,
                                            CPU_instruction_master_qualified_request_Onchip_memory_s1,
                                            CPU_instruction_master_qualified_request_SDRAM_s1,
                                            CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave,
                                            CPU_instruction_master_read,
                                            CPU_instruction_master_read_data_valid_CPU_jtag_debug_module,
                                            CPU_instruction_master_read_data_valid_Onchip_memory_s1,
                                            CPU_instruction_master_read_data_valid_SDRAM_s1,
                                            CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register,
                                            CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave,
                                            CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register,
                                            CPU_instruction_master_requests_CPU_jtag_debug_module,
                                            CPU_instruction_master_requests_Onchip_memory_s1,
                                            CPU_instruction_master_requests_SDRAM_s1,
                                            CPU_instruction_master_requests_SRAM_avalon_sram_slave,
                                            CPU_jtag_debug_module_readdata_from_sa,
                                            Onchip_memory_s1_readdata_from_sa,
                                            SDRAM_s1_readdata_from_sa,
                                            SDRAM_s1_waitrequest_from_sa,
                                            SRAM_avalon_sram_slave_readdata_from_sa,
                                            clk,
                                            d1_CPU_jtag_debug_module_end_xfer,
                                            d1_Onchip_memory_s1_end_xfer,
                                            d1_SDRAM_s1_end_xfer,
                                            d1_SRAM_avalon_sram_slave_end_xfer,
                                            reset_n,

                                           // outputs:
                                            CPU_instruction_master_address_to_slave,
                                            CPU_instruction_master_dbs_address,
                                            CPU_instruction_master_readdata,
                                            CPU_instruction_master_waitrequest
                                         )
;

  output  [ 27: 0] CPU_instruction_master_address_to_slave;
  output  [  1: 0] CPU_instruction_master_dbs_address;
  output  [ 31: 0] CPU_instruction_master_readdata;
  output           CPU_instruction_master_waitrequest;
  input   [ 27: 0] CPU_instruction_master_address;
  input            CPU_instruction_master_granted_CPU_jtag_debug_module;
  input            CPU_instruction_master_granted_Onchip_memory_s1;
  input            CPU_instruction_master_granted_SDRAM_s1;
  input            CPU_instruction_master_granted_SRAM_avalon_sram_slave;
  input            CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  input            CPU_instruction_master_qualified_request_Onchip_memory_s1;
  input            CPU_instruction_master_qualified_request_SDRAM_s1;
  input            CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave;
  input            CPU_instruction_master_read;
  input            CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  input            CPU_instruction_master_read_data_valid_Onchip_memory_s1;
  input            CPU_instruction_master_read_data_valid_SDRAM_s1;
  input            CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register;
  input            CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave;
  input            CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  input            CPU_instruction_master_requests_CPU_jtag_debug_module;
  input            CPU_instruction_master_requests_Onchip_memory_s1;
  input            CPU_instruction_master_requests_SDRAM_s1;
  input            CPU_instruction_master_requests_SRAM_avalon_sram_slave;
  input   [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  input   [ 31: 0] Onchip_memory_s1_readdata_from_sa;
  input   [ 15: 0] SDRAM_s1_readdata_from_sa;
  input            SDRAM_s1_waitrequest_from_sa;
  input   [ 15: 0] SRAM_avalon_sram_slave_readdata_from_sa;
  input            clk;
  input            d1_CPU_jtag_debug_module_end_xfer;
  input            d1_Onchip_memory_s1_end_xfer;
  input            d1_SDRAM_s1_end_xfer;
  input            d1_SRAM_avalon_sram_slave_end_xfer;
  input            reset_n;

  reg     [ 27: 0] CPU_instruction_master_address_last_time;
  wire    [ 27: 0] CPU_instruction_master_address_to_slave;
  reg     [  1: 0] CPU_instruction_master_dbs_address;
  wire    [  1: 0] CPU_instruction_master_dbs_increment;
  reg              CPU_instruction_master_read_last_time;
  wire    [ 31: 0] CPU_instruction_master_readdata;
  wire             CPU_instruction_master_run;
  wire             CPU_instruction_master_waitrequest;
  reg              active_and_waiting_last_time;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (CPU_instruction_master_qualified_request_CPU_jtag_debug_module | ~CPU_instruction_master_requests_CPU_jtag_debug_module) & (CPU_instruction_master_granted_CPU_jtag_debug_module | ~CPU_instruction_master_qualified_request_CPU_jtag_debug_module) & ((~CPU_instruction_master_qualified_request_CPU_jtag_debug_module | ~CPU_instruction_master_read | (1 & ~d1_CPU_jtag_debug_module_end_xfer & CPU_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign CPU_instruction_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (CPU_instruction_master_qualified_request_Onchip_memory_s1 | CPU_instruction_master_read_data_valid_Onchip_memory_s1 | ~CPU_instruction_master_requests_Onchip_memory_s1) & ((~CPU_instruction_master_qualified_request_Onchip_memory_s1 | ~CPU_instruction_master_read | (CPU_instruction_master_read_data_valid_Onchip_memory_s1 & CPU_instruction_master_read)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (CPU_instruction_master_qualified_request_SDRAM_s1 | (CPU_instruction_master_read_data_valid_SDRAM_s1 & CPU_instruction_master_dbs_address[1]) | ~CPU_instruction_master_requests_SDRAM_s1) & (CPU_instruction_master_granted_SDRAM_s1 | ~CPU_instruction_master_qualified_request_SDRAM_s1) & ((~CPU_instruction_master_qualified_request_SDRAM_s1 | ~CPU_instruction_master_read | (CPU_instruction_master_read_data_valid_SDRAM_s1 & (CPU_instruction_master_dbs_address[1]) & CPU_instruction_master_read))) & 1 & (CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave | (CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave & CPU_instruction_master_dbs_address[1]) | ~CPU_instruction_master_requests_SRAM_avalon_sram_slave) & (CPU_instruction_master_granted_SRAM_avalon_sram_slave | ~CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave) & ((~CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave | ~CPU_instruction_master_read | (CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave & (CPU_instruction_master_dbs_address[1]) & CPU_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign CPU_instruction_master_address_to_slave = {CPU_instruction_master_address[27],
    1'b0,
    CPU_instruction_master_address[25 : 24],
    1'b0,
    CPU_instruction_master_address[22 : 0]};

  //CPU/instruction_master readdata mux, which is an e_mux
  assign CPU_instruction_master_readdata = ({32 {~CPU_instruction_master_requests_CPU_jtag_debug_module}} | CPU_jtag_debug_module_readdata_from_sa) &
    ({32 {~CPU_instruction_master_requests_Onchip_memory_s1}} | Onchip_memory_s1_readdata_from_sa) &
    ({32 {~CPU_instruction_master_requests_SDRAM_s1}} | {SDRAM_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~CPU_instruction_master_requests_SRAM_avalon_sram_slave}} | {SRAM_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign CPU_instruction_master_waitrequest = ~CPU_instruction_master_run;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (CPU_instruction_master_requests_SDRAM_s1)? SDRAM_s1_readdata_from_sa :
    SRAM_avalon_sram_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((CPU_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign CPU_instruction_master_dbs_increment = (CPU_instruction_master_requests_SDRAM_s1)? 2 :
    (CPU_instruction_master_requests_SRAM_avalon_sram_slave)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = CPU_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = CPU_instruction_master_dbs_address + CPU_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          CPU_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = CPU_instruction_master_read_data_valid_SDRAM_s1 |
    CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //CPU_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_address_last_time <= 0;
      else 
        CPU_instruction_master_address_last_time <= CPU_instruction_master_address;
    end


  //CPU/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= CPU_instruction_master_waitrequest & (CPU_instruction_master_read);
    end


  //CPU_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_instruction_master_address != CPU_instruction_master_address_last_time))
        begin
          $write("%0d ns: CPU_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //CPU_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_last_time <= 0;
      else 
        CPU_instruction_master_read_last_time <= CPU_instruction_master_read;
    end


  //CPU_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_instruction_master_read != CPU_instruction_master_read_last_time))
        begin
          $write("%0d ns: CPU_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Expansion_JP1_avalon_parallel_port_slave_arbitrator (
                                                             // inputs:
                                                              CPU_data_master_address_to_slave,
                                                              CPU_data_master_byteenable,
                                                              CPU_data_master_read,
                                                              CPU_data_master_waitrequest,
                                                              CPU_data_master_write,
                                                              CPU_data_master_writedata,
                                                              Expansion_JP1_avalon_parallel_port_slave_irq,
                                                              Expansion_JP1_avalon_parallel_port_slave_readdata,
                                                              clk,
                                                              reset_n,

                                                             // outputs:
                                                              CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave,
                                                              CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave,
                                                              CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave,
                                                              CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave,
                                                              Expansion_JP1_avalon_parallel_port_slave_address,
                                                              Expansion_JP1_avalon_parallel_port_slave_byteenable,
                                                              Expansion_JP1_avalon_parallel_port_slave_chipselect,
                                                              Expansion_JP1_avalon_parallel_port_slave_irq_from_sa,
                                                              Expansion_JP1_avalon_parallel_port_slave_read,
                                                              Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa,
                                                              Expansion_JP1_avalon_parallel_port_slave_reset,
                                                              Expansion_JP1_avalon_parallel_port_slave_write,
                                                              Expansion_JP1_avalon_parallel_port_slave_writedata,
                                                              d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer,
                                                              registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave
                                                           )
;

  output           CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;
  output  [  1: 0] Expansion_JP1_avalon_parallel_port_slave_address;
  output  [  3: 0] Expansion_JP1_avalon_parallel_port_slave_byteenable;
  output           Expansion_JP1_avalon_parallel_port_slave_chipselect;
  output           Expansion_JP1_avalon_parallel_port_slave_irq_from_sa;
  output           Expansion_JP1_avalon_parallel_port_slave_read;
  output  [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa;
  output           Expansion_JP1_avalon_parallel_port_slave_reset;
  output           Expansion_JP1_avalon_parallel_port_slave_write;
  output  [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_writedata;
  output           d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Expansion_JP1_avalon_parallel_port_slave_irq;
  input   [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Expansion_JP1_avalon_parallel_port_slave;
  wire    [  1: 0] Expansion_JP1_avalon_parallel_port_slave_address;
  wire             Expansion_JP1_avalon_parallel_port_slave_allgrants;
  wire             Expansion_JP1_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Expansion_JP1_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Expansion_JP1_avalon_parallel_port_slave_any_continuerequest;
  wire             Expansion_JP1_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  1: 0] Expansion_JP1_avalon_parallel_port_slave_arb_share_counter;
  wire    [  1: 0] Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  1: 0] Expansion_JP1_avalon_parallel_port_slave_arb_share_set_values;
  wire             Expansion_JP1_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Expansion_JP1_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Expansion_JP1_avalon_parallel_port_slave_byteenable;
  wire             Expansion_JP1_avalon_parallel_port_slave_chipselect;
  wire             Expansion_JP1_avalon_parallel_port_slave_end_xfer;
  wire             Expansion_JP1_avalon_parallel_port_slave_firsttransfer;
  wire             Expansion_JP1_avalon_parallel_port_slave_grant_vector;
  wire             Expansion_JP1_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Expansion_JP1_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Expansion_JP1_avalon_parallel_port_slave_irq_from_sa;
  wire             Expansion_JP1_avalon_parallel_port_slave_master_qreq_vector;
  wire             Expansion_JP1_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Expansion_JP1_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa;
  reg              Expansion_JP1_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Expansion_JP1_avalon_parallel_port_slave_reset;
  reg              Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Expansion_JP1_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Expansion_JP1_avalon_parallel_port_slave_waits_for_read;
  wire             Expansion_JP1_avalon_parallel_port_slave_waits_for_write;
  wire             Expansion_JP1_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_writedata;
  reg              d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Expansion_JP1_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Expansion_JP1_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Expansion_JP1_avalon_parallel_port_slave_end_xfer;
    end


  assign Expansion_JP1_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave));
  //assign Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa = Expansion_JP1_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa = Expansion_JP1_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000060) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register_in;

  //Expansion_JP1_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Expansion_JP1_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;

  //Expansion_JP1_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value = Expansion_JP1_avalon_parallel_port_slave_firsttransfer ? (Expansion_JP1_avalon_parallel_port_slave_arb_share_set_values - 1) : |Expansion_JP1_avalon_parallel_port_slave_arb_share_counter ? (Expansion_JP1_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Expansion_JP1_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_allgrants = |Expansion_JP1_avalon_parallel_port_slave_grant_vector;

  //Expansion_JP1_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_end_xfer = ~(Expansion_JP1_avalon_parallel_port_slave_waits_for_read | Expansion_JP1_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave = Expansion_JP1_avalon_parallel_port_slave_end_xfer & (~Expansion_JP1_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Expansion_JP1_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave & Expansion_JP1_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave & ~Expansion_JP1_avalon_parallel_port_slave_non_bursting_master_requests);

  //Expansion_JP1_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP1_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Expansion_JP1_avalon_parallel_port_slave_arb_counter_enable)
          Expansion_JP1_avalon_parallel_port_slave_arb_share_counter <= Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Expansion_JP1_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Expansion_JP1_avalon_parallel_port_slave & ~Expansion_JP1_avalon_parallel_port_slave_non_bursting_master_requests))
          Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable <= |Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Expansion_JP1/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable2 = |Expansion_JP1_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Expansion_JP1/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Expansion_JP1_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave = CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_read & ~Expansion_JP1_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave_shift_register;

  //Expansion_JP1_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave = CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Expansion_JP1/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Expansion_JP1_avalon_parallel_port_slave = CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;

  //allow new arb cycle for Expansion_JP1/avalon_parallel_port_slave, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Expansion_JP1_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Expansion_JP1_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Expansion_JP1_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_reset = ~reset_n;

  assign Expansion_JP1_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave;
  //Expansion_JP1_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_firsttransfer = Expansion_JP1_avalon_parallel_port_slave_begins_xfer ? Expansion_JP1_avalon_parallel_port_slave_unreg_firsttransfer : Expansion_JP1_avalon_parallel_port_slave_reg_firsttransfer;

  //Expansion_JP1_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_unreg_firsttransfer = ~(Expansion_JP1_avalon_parallel_port_slave_slavearbiterlockenable & Expansion_JP1_avalon_parallel_port_slave_any_continuerequest);

  //Expansion_JP1_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP1_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Expansion_JP1_avalon_parallel_port_slave_begins_xfer)
          Expansion_JP1_avalon_parallel_port_slave_reg_firsttransfer <= Expansion_JP1_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Expansion_JP1_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_beginbursttransfer_internal = Expansion_JP1_avalon_parallel_port_slave_begins_xfer;

  //Expansion_JP1_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_read = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_read;

  //Expansion_JP1_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_write = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Expansion_JP1_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Expansion_JP1_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_address = shifted_address_to_Expansion_JP1_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer <= Expansion_JP1_avalon_parallel_port_slave_end_xfer;
    end


  //Expansion_JP1_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_waits_for_read = Expansion_JP1_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Expansion_JP1_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Expansion_JP1_avalon_parallel_port_slave_in_a_read_cycle;

  //Expansion_JP1_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_waits_for_write = Expansion_JP1_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Expansion_JP1_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Expansion_JP1_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Expansion_JP1_avalon_parallel_port_slave_counter = 0;
  //Expansion_JP1_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Expansion_JP1_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;

  //assign Expansion_JP1_avalon_parallel_port_slave_irq_from_sa = Expansion_JP1_avalon_parallel_port_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Expansion_JP1_avalon_parallel_port_slave_irq_from_sa = Expansion_JP1_avalon_parallel_port_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Expansion_JP1/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Expansion_JP2_avalon_parallel_port_slave_arbitrator (
                                                             // inputs:
                                                              CPU_data_master_address_to_slave,
                                                              CPU_data_master_byteenable,
                                                              CPU_data_master_read,
                                                              CPU_data_master_waitrequest,
                                                              CPU_data_master_write,
                                                              CPU_data_master_writedata,
                                                              Expansion_JP2_avalon_parallel_port_slave_irq,
                                                              Expansion_JP2_avalon_parallel_port_slave_readdata,
                                                              clk,
                                                              reset_n,

                                                             // outputs:
                                                              CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave,
                                                              CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave,
                                                              CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave,
                                                              CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave,
                                                              Expansion_JP2_avalon_parallel_port_slave_address,
                                                              Expansion_JP2_avalon_parallel_port_slave_byteenable,
                                                              Expansion_JP2_avalon_parallel_port_slave_chipselect,
                                                              Expansion_JP2_avalon_parallel_port_slave_irq_from_sa,
                                                              Expansion_JP2_avalon_parallel_port_slave_read,
                                                              Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa,
                                                              Expansion_JP2_avalon_parallel_port_slave_reset,
                                                              Expansion_JP2_avalon_parallel_port_slave_write,
                                                              Expansion_JP2_avalon_parallel_port_slave_writedata,
                                                              d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer,
                                                              registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave
                                                           )
;

  output           CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;
  output  [  1: 0] Expansion_JP2_avalon_parallel_port_slave_address;
  output  [  3: 0] Expansion_JP2_avalon_parallel_port_slave_byteenable;
  output           Expansion_JP2_avalon_parallel_port_slave_chipselect;
  output           Expansion_JP2_avalon_parallel_port_slave_irq_from_sa;
  output           Expansion_JP2_avalon_parallel_port_slave_read;
  output  [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa;
  output           Expansion_JP2_avalon_parallel_port_slave_reset;
  output           Expansion_JP2_avalon_parallel_port_slave_write;
  output  [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_writedata;
  output           d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Expansion_JP2_avalon_parallel_port_slave_irq;
  input   [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Expansion_JP2_avalon_parallel_port_slave;
  wire    [  1: 0] Expansion_JP2_avalon_parallel_port_slave_address;
  wire             Expansion_JP2_avalon_parallel_port_slave_allgrants;
  wire             Expansion_JP2_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Expansion_JP2_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Expansion_JP2_avalon_parallel_port_slave_any_continuerequest;
  wire             Expansion_JP2_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  1: 0] Expansion_JP2_avalon_parallel_port_slave_arb_share_counter;
  wire    [  1: 0] Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  1: 0] Expansion_JP2_avalon_parallel_port_slave_arb_share_set_values;
  wire             Expansion_JP2_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Expansion_JP2_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Expansion_JP2_avalon_parallel_port_slave_byteenable;
  wire             Expansion_JP2_avalon_parallel_port_slave_chipselect;
  wire             Expansion_JP2_avalon_parallel_port_slave_end_xfer;
  wire             Expansion_JP2_avalon_parallel_port_slave_firsttransfer;
  wire             Expansion_JP2_avalon_parallel_port_slave_grant_vector;
  wire             Expansion_JP2_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Expansion_JP2_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Expansion_JP2_avalon_parallel_port_slave_irq_from_sa;
  wire             Expansion_JP2_avalon_parallel_port_slave_master_qreq_vector;
  wire             Expansion_JP2_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Expansion_JP2_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa;
  reg              Expansion_JP2_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Expansion_JP2_avalon_parallel_port_slave_reset;
  reg              Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Expansion_JP2_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Expansion_JP2_avalon_parallel_port_slave_waits_for_read;
  wire             Expansion_JP2_avalon_parallel_port_slave_waits_for_write;
  wire             Expansion_JP2_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_writedata;
  reg              d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Expansion_JP2_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Expansion_JP2_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Expansion_JP2_avalon_parallel_port_slave_end_xfer;
    end


  assign Expansion_JP2_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave));
  //assign Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa = Expansion_JP2_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa = Expansion_JP2_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000070) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register_in;

  //Expansion_JP2_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Expansion_JP2_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;

  //Expansion_JP2_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value = Expansion_JP2_avalon_parallel_port_slave_firsttransfer ? (Expansion_JP2_avalon_parallel_port_slave_arb_share_set_values - 1) : |Expansion_JP2_avalon_parallel_port_slave_arb_share_counter ? (Expansion_JP2_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Expansion_JP2_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_allgrants = |Expansion_JP2_avalon_parallel_port_slave_grant_vector;

  //Expansion_JP2_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_end_xfer = ~(Expansion_JP2_avalon_parallel_port_slave_waits_for_read | Expansion_JP2_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave = Expansion_JP2_avalon_parallel_port_slave_end_xfer & (~Expansion_JP2_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Expansion_JP2_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave & Expansion_JP2_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave & ~Expansion_JP2_avalon_parallel_port_slave_non_bursting_master_requests);

  //Expansion_JP2_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP2_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Expansion_JP2_avalon_parallel_port_slave_arb_counter_enable)
          Expansion_JP2_avalon_parallel_port_slave_arb_share_counter <= Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Expansion_JP2_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Expansion_JP2_avalon_parallel_port_slave & ~Expansion_JP2_avalon_parallel_port_slave_non_bursting_master_requests))
          Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable <= |Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Expansion_JP2/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable2 = |Expansion_JP2_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Expansion_JP2/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Expansion_JP2_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave = CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_read & ~Expansion_JP2_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave_shift_register;

  //Expansion_JP2_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave = CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Expansion_JP2/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Expansion_JP2_avalon_parallel_port_slave = CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;

  //allow new arb cycle for Expansion_JP2/avalon_parallel_port_slave, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Expansion_JP2_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Expansion_JP2_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Expansion_JP2_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_reset = ~reset_n;

  assign Expansion_JP2_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave;
  //Expansion_JP2_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_firsttransfer = Expansion_JP2_avalon_parallel_port_slave_begins_xfer ? Expansion_JP2_avalon_parallel_port_slave_unreg_firsttransfer : Expansion_JP2_avalon_parallel_port_slave_reg_firsttransfer;

  //Expansion_JP2_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_unreg_firsttransfer = ~(Expansion_JP2_avalon_parallel_port_slave_slavearbiterlockenable & Expansion_JP2_avalon_parallel_port_slave_any_continuerequest);

  //Expansion_JP2_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Expansion_JP2_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Expansion_JP2_avalon_parallel_port_slave_begins_xfer)
          Expansion_JP2_avalon_parallel_port_slave_reg_firsttransfer <= Expansion_JP2_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Expansion_JP2_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_beginbursttransfer_internal = Expansion_JP2_avalon_parallel_port_slave_begins_xfer;

  //Expansion_JP2_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_read = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_read;

  //Expansion_JP2_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_write = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Expansion_JP2_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Expansion_JP2_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_address = shifted_address_to_Expansion_JP2_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer <= Expansion_JP2_avalon_parallel_port_slave_end_xfer;
    end


  //Expansion_JP2_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_waits_for_read = Expansion_JP2_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Expansion_JP2_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Expansion_JP2_avalon_parallel_port_slave_in_a_read_cycle;

  //Expansion_JP2_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_waits_for_write = Expansion_JP2_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Expansion_JP2_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Expansion_JP2_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Expansion_JP2_avalon_parallel_port_slave_counter = 0;
  //Expansion_JP2_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Expansion_JP2_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;

  //assign Expansion_JP2_avalon_parallel_port_slave_irq_from_sa = Expansion_JP2_avalon_parallel_port_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Expansion_JP2_avalon_parallel_port_slave_irq_from_sa = Expansion_JP2_avalon_parallel_port_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Expansion_JP2/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Green_LEDs_avalon_parallel_port_slave_arbitrator (
                                                          // inputs:
                                                           CPU_data_master_address_to_slave,
                                                           CPU_data_master_byteenable,
                                                           CPU_data_master_read,
                                                           CPU_data_master_waitrequest,
                                                           CPU_data_master_write,
                                                           CPU_data_master_writedata,
                                                           Green_LEDs_avalon_parallel_port_slave_readdata,
                                                           clk,
                                                           reset_n,

                                                          // outputs:
                                                           CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave,
                                                           CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave,
                                                           CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave,
                                                           CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave,
                                                           Green_LEDs_avalon_parallel_port_slave_address,
                                                           Green_LEDs_avalon_parallel_port_slave_byteenable,
                                                           Green_LEDs_avalon_parallel_port_slave_chipselect,
                                                           Green_LEDs_avalon_parallel_port_slave_read,
                                                           Green_LEDs_avalon_parallel_port_slave_readdata_from_sa,
                                                           Green_LEDs_avalon_parallel_port_slave_reset,
                                                           Green_LEDs_avalon_parallel_port_slave_write,
                                                           Green_LEDs_avalon_parallel_port_slave_writedata,
                                                           d1_Green_LEDs_avalon_parallel_port_slave_end_xfer,
                                                           registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave
                                                        )
;

  output           CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;
  output  [  1: 0] Green_LEDs_avalon_parallel_port_slave_address;
  output  [  3: 0] Green_LEDs_avalon_parallel_port_slave_byteenable;
  output           Green_LEDs_avalon_parallel_port_slave_chipselect;
  output           Green_LEDs_avalon_parallel_port_slave_read;
  output  [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  output           Green_LEDs_avalon_parallel_port_slave_reset;
  output           Green_LEDs_avalon_parallel_port_slave_write;
  output  [ 31: 0] Green_LEDs_avalon_parallel_port_slave_writedata;
  output           d1_Green_LEDs_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Green_LEDs_avalon_parallel_port_slave;
  wire    [  1: 0] Green_LEDs_avalon_parallel_port_slave_address;
  wire             Green_LEDs_avalon_parallel_port_slave_allgrants;
  wire             Green_LEDs_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Green_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Green_LEDs_avalon_parallel_port_slave_any_continuerequest;
  wire             Green_LEDs_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  1: 0] Green_LEDs_avalon_parallel_port_slave_arb_share_counter;
  wire    [  1: 0] Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  1: 0] Green_LEDs_avalon_parallel_port_slave_arb_share_set_values;
  wire             Green_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Green_LEDs_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Green_LEDs_avalon_parallel_port_slave_byteenable;
  wire             Green_LEDs_avalon_parallel_port_slave_chipselect;
  wire             Green_LEDs_avalon_parallel_port_slave_end_xfer;
  wire             Green_LEDs_avalon_parallel_port_slave_firsttransfer;
  wire             Green_LEDs_avalon_parallel_port_slave_grant_vector;
  wire             Green_LEDs_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Green_LEDs_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Green_LEDs_avalon_parallel_port_slave_master_qreq_vector;
  wire             Green_LEDs_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Green_LEDs_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  reg              Green_LEDs_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Green_LEDs_avalon_parallel_port_slave_reset;
  reg              Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Green_LEDs_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Green_LEDs_avalon_parallel_port_slave_waits_for_read;
  wire             Green_LEDs_avalon_parallel_port_slave_waits_for_write;
  wire             Green_LEDs_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Green_LEDs_avalon_parallel_port_slave_writedata;
  reg              d1_Green_LEDs_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Green_LEDs_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Green_LEDs_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Green_LEDs_avalon_parallel_port_slave_end_xfer;
    end


  assign Green_LEDs_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave));
  //assign Green_LEDs_avalon_parallel_port_slave_readdata_from_sa = Green_LEDs_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_readdata_from_sa = Green_LEDs_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000010) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register_in;

  //Green_LEDs_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Green_LEDs_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;

  //Green_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value = Green_LEDs_avalon_parallel_port_slave_firsttransfer ? (Green_LEDs_avalon_parallel_port_slave_arb_share_set_values - 1) : |Green_LEDs_avalon_parallel_port_slave_arb_share_counter ? (Green_LEDs_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Green_LEDs_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_allgrants = |Green_LEDs_avalon_parallel_port_slave_grant_vector;

  //Green_LEDs_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_end_xfer = ~(Green_LEDs_avalon_parallel_port_slave_waits_for_read | Green_LEDs_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave = Green_LEDs_avalon_parallel_port_slave_end_xfer & (~Green_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Green_LEDs_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave & Green_LEDs_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave & ~Green_LEDs_avalon_parallel_port_slave_non_bursting_master_requests);

  //Green_LEDs_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Green_LEDs_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Green_LEDs_avalon_parallel_port_slave_arb_counter_enable)
          Green_LEDs_avalon_parallel_port_slave_arb_share_counter <= Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Green_LEDs_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Green_LEDs_avalon_parallel_port_slave & ~Green_LEDs_avalon_parallel_port_slave_non_bursting_master_requests))
          Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable <= |Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Green_LEDs/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 = |Green_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Green_LEDs/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Green_LEDs_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave = CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_read & ~Green_LEDs_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave_shift_register;

  //Green_LEDs_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave = CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Green_LEDs/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Green_LEDs_avalon_parallel_port_slave = CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;

  //allow new arb cycle for Green_LEDs/avalon_parallel_port_slave, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Green_LEDs_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Green_LEDs_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Green_LEDs_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_reset = ~reset_n;

  assign Green_LEDs_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave;
  //Green_LEDs_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_firsttransfer = Green_LEDs_avalon_parallel_port_slave_begins_xfer ? Green_LEDs_avalon_parallel_port_slave_unreg_firsttransfer : Green_LEDs_avalon_parallel_port_slave_reg_firsttransfer;

  //Green_LEDs_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_unreg_firsttransfer = ~(Green_LEDs_avalon_parallel_port_slave_slavearbiterlockenable & Green_LEDs_avalon_parallel_port_slave_any_continuerequest);

  //Green_LEDs_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Green_LEDs_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Green_LEDs_avalon_parallel_port_slave_begins_xfer)
          Green_LEDs_avalon_parallel_port_slave_reg_firsttransfer <= Green_LEDs_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Green_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal = Green_LEDs_avalon_parallel_port_slave_begins_xfer;

  //Green_LEDs_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_read = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_read;

  //Green_LEDs_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_write = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Green_LEDs_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Green_LEDs_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_address = shifted_address_to_Green_LEDs_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Green_LEDs_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Green_LEDs_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Green_LEDs_avalon_parallel_port_slave_end_xfer <= Green_LEDs_avalon_parallel_port_slave_end_xfer;
    end


  //Green_LEDs_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_waits_for_read = Green_LEDs_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Green_LEDs_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Green_LEDs_avalon_parallel_port_slave_in_a_read_cycle;

  //Green_LEDs_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_waits_for_write = Green_LEDs_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Green_LEDs_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Green_LEDs_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Green_LEDs_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Green_LEDs_avalon_parallel_port_slave_counter = 0;
  //Green_LEDs_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Green_LEDs_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Green_LEDs/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module HEX3_HEX0_avalon_parallel_port_slave_arbitrator (
                                                         // inputs:
                                                          CPU_data_master_address_to_slave,
                                                          CPU_data_master_byteenable,
                                                          CPU_data_master_read,
                                                          CPU_data_master_waitrequest,
                                                          CPU_data_master_write,
                                                          CPU_data_master_writedata,
                                                          HEX3_HEX0_avalon_parallel_port_slave_readdata,
                                                          clk,
                                                          reset_n,

                                                         // outputs:
                                                          CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave,
                                                          CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave,
                                                          CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave,
                                                          CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave,
                                                          HEX3_HEX0_avalon_parallel_port_slave_address,
                                                          HEX3_HEX0_avalon_parallel_port_slave_byteenable,
                                                          HEX3_HEX0_avalon_parallel_port_slave_chipselect,
                                                          HEX3_HEX0_avalon_parallel_port_slave_read,
                                                          HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa,
                                                          HEX3_HEX0_avalon_parallel_port_slave_reset,
                                                          HEX3_HEX0_avalon_parallel_port_slave_write,
                                                          HEX3_HEX0_avalon_parallel_port_slave_writedata,
                                                          d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer,
                                                          registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave
                                                       )
;

  output           CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  output           CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;
  output  [  1: 0] HEX3_HEX0_avalon_parallel_port_slave_address;
  output  [  3: 0] HEX3_HEX0_avalon_parallel_port_slave_byteenable;
  output           HEX3_HEX0_avalon_parallel_port_slave_chipselect;
  output           HEX3_HEX0_avalon_parallel_port_slave_read;
  output  [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa;
  output           HEX3_HEX0_avalon_parallel_port_slave_reset;
  output           HEX3_HEX0_avalon_parallel_port_slave_write;
  output  [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_writedata;
  output           d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_HEX3_HEX0_avalon_parallel_port_slave;
  wire    [  1: 0] HEX3_HEX0_avalon_parallel_port_slave_address;
  wire             HEX3_HEX0_avalon_parallel_port_slave_allgrants;
  wire             HEX3_HEX0_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             HEX3_HEX0_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             HEX3_HEX0_avalon_parallel_port_slave_any_continuerequest;
  wire             HEX3_HEX0_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  1: 0] HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter;
  wire    [  1: 0] HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  1: 0] HEX3_HEX0_avalon_parallel_port_slave_arb_share_set_values;
  wire             HEX3_HEX0_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             HEX3_HEX0_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] HEX3_HEX0_avalon_parallel_port_slave_byteenable;
  wire             HEX3_HEX0_avalon_parallel_port_slave_chipselect;
  wire             HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
  wire             HEX3_HEX0_avalon_parallel_port_slave_firsttransfer;
  wire             HEX3_HEX0_avalon_parallel_port_slave_grant_vector;
  wire             HEX3_HEX0_avalon_parallel_port_slave_in_a_read_cycle;
  wire             HEX3_HEX0_avalon_parallel_port_slave_in_a_write_cycle;
  wire             HEX3_HEX0_avalon_parallel_port_slave_master_qreq_vector;
  wire             HEX3_HEX0_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             HEX3_HEX0_avalon_parallel_port_slave_read;
  wire    [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa;
  reg              HEX3_HEX0_avalon_parallel_port_slave_reg_firsttransfer;
  wire             HEX3_HEX0_avalon_parallel_port_slave_reset;
  reg              HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             HEX3_HEX0_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             HEX3_HEX0_avalon_parallel_port_slave_waits_for_read;
  wire             HEX3_HEX0_avalon_parallel_port_slave_waits_for_write;
  wire             HEX3_HEX0_avalon_parallel_port_slave_write;
  wire    [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_writedata;
  reg              d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_HEX3_HEX0_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_HEX3_HEX0_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
    end


  assign HEX3_HEX0_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave));
  //assign HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa = HEX3_HEX0_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa = HEX3_HEX0_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000020) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave = CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register_in;

  //HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_arb_share_set_values = 1;

  //HEX3_HEX0_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;

  //HEX3_HEX0_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value = HEX3_HEX0_avalon_parallel_port_slave_firsttransfer ? (HEX3_HEX0_avalon_parallel_port_slave_arb_share_set_values - 1) : |HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter ? (HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //HEX3_HEX0_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_allgrants = |HEX3_HEX0_avalon_parallel_port_slave_grant_vector;

  //HEX3_HEX0_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_end_xfer = ~(HEX3_HEX0_avalon_parallel_port_slave_waits_for_read | HEX3_HEX0_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave = HEX3_HEX0_avalon_parallel_port_slave_end_xfer & (~HEX3_HEX0_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave & HEX3_HEX0_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave & ~HEX3_HEX0_avalon_parallel_port_slave_non_bursting_master_requests);

  //HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (HEX3_HEX0_avalon_parallel_port_slave_arb_counter_enable)
          HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter <= HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|HEX3_HEX0_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_HEX3_HEX0_avalon_parallel_port_slave & ~HEX3_HEX0_avalon_parallel_port_slave_non_bursting_master_requests))
          HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable <= |HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master HEX3_HEX0/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable2 = |HEX3_HEX0_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master HEX3_HEX0/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //HEX3_HEX0_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave = CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_read & ~HEX3_HEX0_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave = CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave_shift_register;

  //HEX3_HEX0_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave = CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave;

  //CPU/data_master saved-grant HEX3_HEX0/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_HEX3_HEX0_avalon_parallel_port_slave = CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;

  //allow new arb cycle for HEX3_HEX0/avalon_parallel_port_slave, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign HEX3_HEX0_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign HEX3_HEX0_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~HEX3_HEX0_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_reset = ~reset_n;

  assign HEX3_HEX0_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave;
  //HEX3_HEX0_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_firsttransfer = HEX3_HEX0_avalon_parallel_port_slave_begins_xfer ? HEX3_HEX0_avalon_parallel_port_slave_unreg_firsttransfer : HEX3_HEX0_avalon_parallel_port_slave_reg_firsttransfer;

  //HEX3_HEX0_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_unreg_firsttransfer = ~(HEX3_HEX0_avalon_parallel_port_slave_slavearbiterlockenable & HEX3_HEX0_avalon_parallel_port_slave_any_continuerequest);

  //HEX3_HEX0_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX3_HEX0_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (HEX3_HEX0_avalon_parallel_port_slave_begins_xfer)
          HEX3_HEX0_avalon_parallel_port_slave_reg_firsttransfer <= HEX3_HEX0_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //HEX3_HEX0_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_beginbursttransfer_internal = HEX3_HEX0_avalon_parallel_port_slave_begins_xfer;

  //HEX3_HEX0_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_read = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_read;

  //HEX3_HEX0_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_write = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_HEX3_HEX0_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //HEX3_HEX0_avalon_parallel_port_slave_address mux, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_address = shifted_address_to_HEX3_HEX0_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer <= HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
    end


  //HEX3_HEX0_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_waits_for_read = HEX3_HEX0_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //HEX3_HEX0_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = HEX3_HEX0_avalon_parallel_port_slave_in_a_read_cycle;

  //HEX3_HEX0_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_waits_for_write = HEX3_HEX0_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //HEX3_HEX0_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign HEX3_HEX0_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = HEX3_HEX0_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_HEX3_HEX0_avalon_parallel_port_slave_counter = 0;
  //HEX3_HEX0_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign HEX3_HEX0_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //HEX3_HEX0/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module HEX7_HEX4_avalon_parallel_port_slave_arbitrator (
                                                         // inputs:
                                                          CPU_data_master_address_to_slave,
                                                          CPU_data_master_byteenable,
                                                          CPU_data_master_read,
                                                          CPU_data_master_waitrequest,
                                                          CPU_data_master_write,
                                                          CPU_data_master_writedata,
                                                          HEX7_HEX4_avalon_parallel_port_slave_readdata,
                                                          clk,
                                                          reset_n,

                                                         // outputs:
                                                          CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave,
                                                          CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave,
                                                          CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave,
                                                          CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave,
                                                          HEX7_HEX4_avalon_parallel_port_slave_address,
                                                          HEX7_HEX4_avalon_parallel_port_slave_byteenable,
                                                          HEX7_HEX4_avalon_parallel_port_slave_chipselect,
                                                          HEX7_HEX4_avalon_parallel_port_slave_read,
                                                          HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa,
                                                          HEX7_HEX4_avalon_parallel_port_slave_reset,
                                                          HEX7_HEX4_avalon_parallel_port_slave_write,
                                                          HEX7_HEX4_avalon_parallel_port_slave_writedata,
                                                          d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer,
                                                          registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave
                                                       )
;

  output           CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  output           CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;
  output  [  1: 0] HEX7_HEX4_avalon_parallel_port_slave_address;
  output  [  3: 0] HEX7_HEX4_avalon_parallel_port_slave_byteenable;
  output           HEX7_HEX4_avalon_parallel_port_slave_chipselect;
  output           HEX7_HEX4_avalon_parallel_port_slave_read;
  output  [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa;
  output           HEX7_HEX4_avalon_parallel_port_slave_reset;
  output           HEX7_HEX4_avalon_parallel_port_slave_write;
  output  [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_writedata;
  output           d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_HEX7_HEX4_avalon_parallel_port_slave;
  wire    [  1: 0] HEX7_HEX4_avalon_parallel_port_slave_address;
  wire             HEX7_HEX4_avalon_parallel_port_slave_allgrants;
  wire             HEX7_HEX4_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             HEX7_HEX4_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             HEX7_HEX4_avalon_parallel_port_slave_any_continuerequest;
  wire             HEX7_HEX4_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  1: 0] HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter;
  wire    [  1: 0] HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  1: 0] HEX7_HEX4_avalon_parallel_port_slave_arb_share_set_values;
  wire             HEX7_HEX4_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             HEX7_HEX4_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] HEX7_HEX4_avalon_parallel_port_slave_byteenable;
  wire             HEX7_HEX4_avalon_parallel_port_slave_chipselect;
  wire             HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
  wire             HEX7_HEX4_avalon_parallel_port_slave_firsttransfer;
  wire             HEX7_HEX4_avalon_parallel_port_slave_grant_vector;
  wire             HEX7_HEX4_avalon_parallel_port_slave_in_a_read_cycle;
  wire             HEX7_HEX4_avalon_parallel_port_slave_in_a_write_cycle;
  wire             HEX7_HEX4_avalon_parallel_port_slave_master_qreq_vector;
  wire             HEX7_HEX4_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             HEX7_HEX4_avalon_parallel_port_slave_read;
  wire    [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa;
  reg              HEX7_HEX4_avalon_parallel_port_slave_reg_firsttransfer;
  wire             HEX7_HEX4_avalon_parallel_port_slave_reset;
  reg              HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             HEX7_HEX4_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             HEX7_HEX4_avalon_parallel_port_slave_waits_for_read;
  wire             HEX7_HEX4_avalon_parallel_port_slave_waits_for_write;
  wire             HEX7_HEX4_avalon_parallel_port_slave_write;
  wire    [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_writedata;
  reg              d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_HEX7_HEX4_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_HEX7_HEX4_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
    end


  assign HEX7_HEX4_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave));
  //assign HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa = HEX7_HEX4_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa = HEX7_HEX4_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000030) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave = CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register_in;

  //HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_arb_share_set_values = 1;

  //HEX7_HEX4_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;

  //HEX7_HEX4_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value = HEX7_HEX4_avalon_parallel_port_slave_firsttransfer ? (HEX7_HEX4_avalon_parallel_port_slave_arb_share_set_values - 1) : |HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter ? (HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //HEX7_HEX4_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_allgrants = |HEX7_HEX4_avalon_parallel_port_slave_grant_vector;

  //HEX7_HEX4_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_end_xfer = ~(HEX7_HEX4_avalon_parallel_port_slave_waits_for_read | HEX7_HEX4_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave = HEX7_HEX4_avalon_parallel_port_slave_end_xfer & (~HEX7_HEX4_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave & HEX7_HEX4_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave & ~HEX7_HEX4_avalon_parallel_port_slave_non_bursting_master_requests);

  //HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (HEX7_HEX4_avalon_parallel_port_slave_arb_counter_enable)
          HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter <= HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|HEX7_HEX4_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_HEX7_HEX4_avalon_parallel_port_slave & ~HEX7_HEX4_avalon_parallel_port_slave_non_bursting_master_requests))
          HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable <= |HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master HEX7_HEX4/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable2 = |HEX7_HEX4_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master HEX7_HEX4/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //HEX7_HEX4_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave = CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_read & ~HEX7_HEX4_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave = CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave_shift_register;

  //HEX7_HEX4_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave = CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave;

  //CPU/data_master saved-grant HEX7_HEX4/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_HEX7_HEX4_avalon_parallel_port_slave = CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;

  //allow new arb cycle for HEX7_HEX4/avalon_parallel_port_slave, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign HEX7_HEX4_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign HEX7_HEX4_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~HEX7_HEX4_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_reset = ~reset_n;

  assign HEX7_HEX4_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave;
  //HEX7_HEX4_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_firsttransfer = HEX7_HEX4_avalon_parallel_port_slave_begins_xfer ? HEX7_HEX4_avalon_parallel_port_slave_unreg_firsttransfer : HEX7_HEX4_avalon_parallel_port_slave_reg_firsttransfer;

  //HEX7_HEX4_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_unreg_firsttransfer = ~(HEX7_HEX4_avalon_parallel_port_slave_slavearbiterlockenable & HEX7_HEX4_avalon_parallel_port_slave_any_continuerequest);

  //HEX7_HEX4_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HEX7_HEX4_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (HEX7_HEX4_avalon_parallel_port_slave_begins_xfer)
          HEX7_HEX4_avalon_parallel_port_slave_reg_firsttransfer <= HEX7_HEX4_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //HEX7_HEX4_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_beginbursttransfer_internal = HEX7_HEX4_avalon_parallel_port_slave_begins_xfer;

  //HEX7_HEX4_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_read = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_read;

  //HEX7_HEX4_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_write = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_HEX7_HEX4_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //HEX7_HEX4_avalon_parallel_port_slave_address mux, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_address = shifted_address_to_HEX7_HEX4_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer <= HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
    end


  //HEX7_HEX4_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_waits_for_read = HEX7_HEX4_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //HEX7_HEX4_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = HEX7_HEX4_avalon_parallel_port_slave_in_a_read_cycle;

  //HEX7_HEX4_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_waits_for_write = HEX7_HEX4_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //HEX7_HEX4_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign HEX7_HEX4_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = HEX7_HEX4_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_HEX7_HEX4_avalon_parallel_port_slave_counter = 0;
  //HEX7_HEX4_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign HEX7_HEX4_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //HEX7_HEX4/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Interval_timer_s1_arbitrator (
                                      // inputs:
                                       CPU_data_master_address_to_slave,
                                       CPU_data_master_read,
                                       CPU_data_master_waitrequest,
                                       CPU_data_master_write,
                                       CPU_data_master_writedata,
                                       Interval_timer_s1_irq,
                                       Interval_timer_s1_readdata,
                                       clk,
                                       reset_n,

                                      // outputs:
                                       CPU_data_master_granted_Interval_timer_s1,
                                       CPU_data_master_qualified_request_Interval_timer_s1,
                                       CPU_data_master_read_data_valid_Interval_timer_s1,
                                       CPU_data_master_requests_Interval_timer_s1,
                                       Interval_timer_s1_address,
                                       Interval_timer_s1_chipselect,
                                       Interval_timer_s1_irq_from_sa,
                                       Interval_timer_s1_readdata_from_sa,
                                       Interval_timer_s1_reset_n,
                                       Interval_timer_s1_write_n,
                                       Interval_timer_s1_writedata,
                                       d1_Interval_timer_s1_end_xfer
                                    )
;

  output           CPU_data_master_granted_Interval_timer_s1;
  output           CPU_data_master_qualified_request_Interval_timer_s1;
  output           CPU_data_master_read_data_valid_Interval_timer_s1;
  output           CPU_data_master_requests_Interval_timer_s1;
  output  [  2: 0] Interval_timer_s1_address;
  output           Interval_timer_s1_chipselect;
  output           Interval_timer_s1_irq_from_sa;
  output  [ 15: 0] Interval_timer_s1_readdata_from_sa;
  output           Interval_timer_s1_reset_n;
  output           Interval_timer_s1_write_n;
  output  [ 15: 0] Interval_timer_s1_writedata;
  output           d1_Interval_timer_s1_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Interval_timer_s1_irq;
  input   [ 15: 0] Interval_timer_s1_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Interval_timer_s1;
  wire             CPU_data_master_qualified_request_Interval_timer_s1;
  wire             CPU_data_master_read_data_valid_Interval_timer_s1;
  wire             CPU_data_master_requests_Interval_timer_s1;
  wire             CPU_data_master_saved_grant_Interval_timer_s1;
  wire    [  2: 0] Interval_timer_s1_address;
  wire             Interval_timer_s1_allgrants;
  wire             Interval_timer_s1_allow_new_arb_cycle;
  wire             Interval_timer_s1_any_bursting_master_saved_grant;
  wire             Interval_timer_s1_any_continuerequest;
  wire             Interval_timer_s1_arb_counter_enable;
  reg     [  1: 0] Interval_timer_s1_arb_share_counter;
  wire    [  1: 0] Interval_timer_s1_arb_share_counter_next_value;
  wire    [  1: 0] Interval_timer_s1_arb_share_set_values;
  wire             Interval_timer_s1_beginbursttransfer_internal;
  wire             Interval_timer_s1_begins_xfer;
  wire             Interval_timer_s1_chipselect;
  wire             Interval_timer_s1_end_xfer;
  wire             Interval_timer_s1_firsttransfer;
  wire             Interval_timer_s1_grant_vector;
  wire             Interval_timer_s1_in_a_read_cycle;
  wire             Interval_timer_s1_in_a_write_cycle;
  wire             Interval_timer_s1_irq_from_sa;
  wire             Interval_timer_s1_master_qreq_vector;
  wire             Interval_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] Interval_timer_s1_readdata_from_sa;
  reg              Interval_timer_s1_reg_firsttransfer;
  wire             Interval_timer_s1_reset_n;
  reg              Interval_timer_s1_slavearbiterlockenable;
  wire             Interval_timer_s1_slavearbiterlockenable2;
  wire             Interval_timer_s1_unreg_firsttransfer;
  wire             Interval_timer_s1_waits_for_read;
  wire             Interval_timer_s1_waits_for_write;
  wire             Interval_timer_s1_write_n;
  wire    [ 15: 0] Interval_timer_s1_writedata;
  reg              d1_Interval_timer_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Interval_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_Interval_timer_s1_from_CPU_data_master;
  wire             wait_for_Interval_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Interval_timer_s1_end_xfer;
    end


  assign Interval_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Interval_timer_s1));
  //assign Interval_timer_s1_readdata_from_sa = Interval_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Interval_timer_s1_readdata_from_sa = Interval_timer_s1_readdata;

  assign CPU_data_master_requests_Interval_timer_s1 = ({CPU_data_master_address_to_slave[28 : 5] , 5'b0} == 29'h10002000) & (CPU_data_master_read | CPU_data_master_write);
  //Interval_timer_s1_arb_share_counter set values, which is an e_mux
  assign Interval_timer_s1_arb_share_set_values = 1;

  //Interval_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign Interval_timer_s1_non_bursting_master_requests = CPU_data_master_requests_Interval_timer_s1;

  //Interval_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign Interval_timer_s1_any_bursting_master_saved_grant = 0;

  //Interval_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign Interval_timer_s1_arb_share_counter_next_value = Interval_timer_s1_firsttransfer ? (Interval_timer_s1_arb_share_set_values - 1) : |Interval_timer_s1_arb_share_counter ? (Interval_timer_s1_arb_share_counter - 1) : 0;

  //Interval_timer_s1_allgrants all slave grants, which is an e_mux
  assign Interval_timer_s1_allgrants = |Interval_timer_s1_grant_vector;

  //Interval_timer_s1_end_xfer assignment, which is an e_assign
  assign Interval_timer_s1_end_xfer = ~(Interval_timer_s1_waits_for_read | Interval_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_Interval_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Interval_timer_s1 = Interval_timer_s1_end_xfer & (~Interval_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Interval_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign Interval_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_Interval_timer_s1 & Interval_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_Interval_timer_s1 & ~Interval_timer_s1_non_bursting_master_requests);

  //Interval_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Interval_timer_s1_arb_share_counter <= 0;
      else if (Interval_timer_s1_arb_counter_enable)
          Interval_timer_s1_arb_share_counter <= Interval_timer_s1_arb_share_counter_next_value;
    end


  //Interval_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Interval_timer_s1_slavearbiterlockenable <= 0;
      else if ((|Interval_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_Interval_timer_s1) | (end_xfer_arb_share_counter_term_Interval_timer_s1 & ~Interval_timer_s1_non_bursting_master_requests))
          Interval_timer_s1_slavearbiterlockenable <= |Interval_timer_s1_arb_share_counter_next_value;
    end


  //CPU/data_master Interval_timer/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Interval_timer_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Interval_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Interval_timer_s1_slavearbiterlockenable2 = |Interval_timer_s1_arb_share_counter_next_value;

  //CPU/data_master Interval_timer/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Interval_timer_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Interval_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Interval_timer_s1_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Interval_timer_s1 = CPU_data_master_requests_Interval_timer_s1 & ~(((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //Interval_timer_s1_writedata mux, which is an e_mux
  assign Interval_timer_s1_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Interval_timer_s1 = CPU_data_master_qualified_request_Interval_timer_s1;

  //CPU/data_master saved-grant Interval_timer/s1, which is an e_assign
  assign CPU_data_master_saved_grant_Interval_timer_s1 = CPU_data_master_requests_Interval_timer_s1;

  //allow new arb cycle for Interval_timer/s1, which is an e_assign
  assign Interval_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Interval_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Interval_timer_s1_master_qreq_vector = 1;

  //Interval_timer_s1_reset_n assignment, which is an e_assign
  assign Interval_timer_s1_reset_n = reset_n;

  assign Interval_timer_s1_chipselect = CPU_data_master_granted_Interval_timer_s1;
  //Interval_timer_s1_firsttransfer first transaction, which is an e_assign
  assign Interval_timer_s1_firsttransfer = Interval_timer_s1_begins_xfer ? Interval_timer_s1_unreg_firsttransfer : Interval_timer_s1_reg_firsttransfer;

  //Interval_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign Interval_timer_s1_unreg_firsttransfer = ~(Interval_timer_s1_slavearbiterlockenable & Interval_timer_s1_any_continuerequest);

  //Interval_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Interval_timer_s1_reg_firsttransfer <= 1'b1;
      else if (Interval_timer_s1_begins_xfer)
          Interval_timer_s1_reg_firsttransfer <= Interval_timer_s1_unreg_firsttransfer;
    end


  //Interval_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Interval_timer_s1_beginbursttransfer_internal = Interval_timer_s1_begins_xfer;

  //~Interval_timer_s1_write_n assignment, which is an e_mux
  assign Interval_timer_s1_write_n = ~(CPU_data_master_granted_Interval_timer_s1 & CPU_data_master_write);

  assign shifted_address_to_Interval_timer_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Interval_timer_s1_address mux, which is an e_mux
  assign Interval_timer_s1_address = shifted_address_to_Interval_timer_s1_from_CPU_data_master >> 2;

  //d1_Interval_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Interval_timer_s1_end_xfer <= 1;
      else 
        d1_Interval_timer_s1_end_xfer <= Interval_timer_s1_end_xfer;
    end


  //Interval_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign Interval_timer_s1_waits_for_read = Interval_timer_s1_in_a_read_cycle & Interval_timer_s1_begins_xfer;

  //Interval_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign Interval_timer_s1_in_a_read_cycle = CPU_data_master_granted_Interval_timer_s1 & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Interval_timer_s1_in_a_read_cycle;

  //Interval_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign Interval_timer_s1_waits_for_write = Interval_timer_s1_in_a_write_cycle & 0;

  //Interval_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign Interval_timer_s1_in_a_write_cycle = CPU_data_master_granted_Interval_timer_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Interval_timer_s1_in_a_write_cycle;

  assign wait_for_Interval_timer_s1_counter = 0;
  //assign Interval_timer_s1_irq_from_sa = Interval_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Interval_timer_s1_irq_from_sa = Interval_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Interval_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module JTAG_UART_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 CPU_data_master_address_to_slave,
                                                 CPU_data_master_read,
                                                 CPU_data_master_waitrequest,
                                                 CPU_data_master_write,
                                                 CPU_data_master_writedata,
                                                 JTAG_UART_avalon_jtag_slave_dataavailable,
                                                 JTAG_UART_avalon_jtag_slave_irq,
                                                 JTAG_UART_avalon_jtag_slave_readdata,
                                                 JTAG_UART_avalon_jtag_slave_readyfordata,
                                                 JTAG_UART_avalon_jtag_slave_waitrequest,
                                                 clk,
                                                 reset_n,

                                                // outputs:
                                                 CPU_data_master_granted_JTAG_UART_avalon_jtag_slave,
                                                 CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave,
                                                 CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave,
                                                 CPU_data_master_requests_JTAG_UART_avalon_jtag_slave,
                                                 JTAG_UART_avalon_jtag_slave_address,
                                                 JTAG_UART_avalon_jtag_slave_chipselect,
                                                 JTAG_UART_avalon_jtag_slave_dataavailable_from_sa,
                                                 JTAG_UART_avalon_jtag_slave_irq_from_sa,
                                                 JTAG_UART_avalon_jtag_slave_read_n,
                                                 JTAG_UART_avalon_jtag_slave_readdata_from_sa,
                                                 JTAG_UART_avalon_jtag_slave_readyfordata_from_sa,
                                                 JTAG_UART_avalon_jtag_slave_reset_n,
                                                 JTAG_UART_avalon_jtag_slave_waitrequest_from_sa,
                                                 JTAG_UART_avalon_jtag_slave_write_n,
                                                 JTAG_UART_avalon_jtag_slave_writedata,
                                                 d1_JTAG_UART_avalon_jtag_slave_end_xfer
                                              )
;

  output           CPU_data_master_granted_JTAG_UART_avalon_jtag_slave;
  output           CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave;
  output           CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave;
  output           CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;
  output           JTAG_UART_avalon_jtag_slave_address;
  output           JTAG_UART_avalon_jtag_slave_chipselect;
  output           JTAG_UART_avalon_jtag_slave_dataavailable_from_sa;
  output           JTAG_UART_avalon_jtag_slave_irq_from_sa;
  output           JTAG_UART_avalon_jtag_slave_read_n;
  output  [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata_from_sa;
  output           JTAG_UART_avalon_jtag_slave_readyfordata_from_sa;
  output           JTAG_UART_avalon_jtag_slave_reset_n;
  output           JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;
  output           JTAG_UART_avalon_jtag_slave_write_n;
  output  [ 31: 0] JTAG_UART_avalon_jtag_slave_writedata;
  output           d1_JTAG_UART_avalon_jtag_slave_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            JTAG_UART_avalon_jtag_slave_dataavailable;
  input            JTAG_UART_avalon_jtag_slave_irq;
  input   [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata;
  input            JTAG_UART_avalon_jtag_slave_readyfordata;
  input            JTAG_UART_avalon_jtag_slave_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_saved_grant_JTAG_UART_avalon_jtag_slave;
  wire             JTAG_UART_avalon_jtag_slave_address;
  wire             JTAG_UART_avalon_jtag_slave_allgrants;
  wire             JTAG_UART_avalon_jtag_slave_allow_new_arb_cycle;
  wire             JTAG_UART_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             JTAG_UART_avalon_jtag_slave_any_continuerequest;
  wire             JTAG_UART_avalon_jtag_slave_arb_counter_enable;
  reg     [  1: 0] JTAG_UART_avalon_jtag_slave_arb_share_counter;
  wire    [  1: 0] JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  1: 0] JTAG_UART_avalon_jtag_slave_arb_share_set_values;
  wire             JTAG_UART_avalon_jtag_slave_beginbursttransfer_internal;
  wire             JTAG_UART_avalon_jtag_slave_begins_xfer;
  wire             JTAG_UART_avalon_jtag_slave_chipselect;
  wire             JTAG_UART_avalon_jtag_slave_dataavailable_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_end_xfer;
  wire             JTAG_UART_avalon_jtag_slave_firsttransfer;
  wire             JTAG_UART_avalon_jtag_slave_grant_vector;
  wire             JTAG_UART_avalon_jtag_slave_in_a_read_cycle;
  wire             JTAG_UART_avalon_jtag_slave_in_a_write_cycle;
  wire             JTAG_UART_avalon_jtag_slave_irq_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_master_qreq_vector;
  wire             JTAG_UART_avalon_jtag_slave_non_bursting_master_requests;
  wire             JTAG_UART_avalon_jtag_slave_read_n;
  wire    [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_readyfordata_from_sa;
  reg              JTAG_UART_avalon_jtag_slave_reg_firsttransfer;
  wire             JTAG_UART_avalon_jtag_slave_reset_n;
  reg              JTAG_UART_avalon_jtag_slave_slavearbiterlockenable;
  wire             JTAG_UART_avalon_jtag_slave_slavearbiterlockenable2;
  wire             JTAG_UART_avalon_jtag_slave_unreg_firsttransfer;
  wire             JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_waits_for_read;
  wire             JTAG_UART_avalon_jtag_slave_waits_for_write;
  wire             JTAG_UART_avalon_jtag_slave_write_n;
  wire    [ 31: 0] JTAG_UART_avalon_jtag_slave_writedata;
  reg              d1_JTAG_UART_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_JTAG_UART_avalon_jtag_slave_from_CPU_data_master;
  wire             wait_for_JTAG_UART_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~JTAG_UART_avalon_jtag_slave_end_xfer;
    end


  assign JTAG_UART_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave));
  //assign JTAG_UART_avalon_jtag_slave_readdata_from_sa = JTAG_UART_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_readdata_from_sa = JTAG_UART_avalon_jtag_slave_readdata;

  assign CPU_data_master_requests_JTAG_UART_avalon_jtag_slave = ({CPU_data_master_address_to_slave[28 : 3] , 3'b0} == 29'h10001000) & (CPU_data_master_read | CPU_data_master_write);
  //assign JTAG_UART_avalon_jtag_slave_dataavailable_from_sa = JTAG_UART_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_dataavailable_from_sa = JTAG_UART_avalon_jtag_slave_dataavailable;

  //assign JTAG_UART_avalon_jtag_slave_readyfordata_from_sa = JTAG_UART_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_readyfordata_from_sa = JTAG_UART_avalon_jtag_slave_readyfordata;

  //assign JTAG_UART_avalon_jtag_slave_waitrequest_from_sa = JTAG_UART_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_waitrequest_from_sa = JTAG_UART_avalon_jtag_slave_waitrequest;

  //JTAG_UART_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_arb_share_set_values = 1;

  //JTAG_UART_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_non_bursting_master_requests = CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;

  //JTAG_UART_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value = JTAG_UART_avalon_jtag_slave_firsttransfer ? (JTAG_UART_avalon_jtag_slave_arb_share_set_values - 1) : |JTAG_UART_avalon_jtag_slave_arb_share_counter ? (JTAG_UART_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //JTAG_UART_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_allgrants = |JTAG_UART_avalon_jtag_slave_grant_vector;

  //JTAG_UART_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_end_xfer = ~(JTAG_UART_avalon_jtag_slave_waits_for_read | JTAG_UART_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave = JTAG_UART_avalon_jtag_slave_end_xfer & (~JTAG_UART_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //JTAG_UART_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave & JTAG_UART_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave & ~JTAG_UART_avalon_jtag_slave_non_bursting_master_requests);

  //JTAG_UART_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          JTAG_UART_avalon_jtag_slave_arb_share_counter <= 0;
      else if (JTAG_UART_avalon_jtag_slave_arb_counter_enable)
          JTAG_UART_avalon_jtag_slave_arb_share_counter <= JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //JTAG_UART_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          JTAG_UART_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|JTAG_UART_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_JTAG_UART_avalon_jtag_slave & ~JTAG_UART_avalon_jtag_slave_non_bursting_master_requests))
          JTAG_UART_avalon_jtag_slave_slavearbiterlockenable <= |JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //CPU/data_master JTAG_UART/avalon_jtag_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = JTAG_UART_avalon_jtag_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //JTAG_UART_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_slavearbiterlockenable2 = |JTAG_UART_avalon_jtag_slave_arb_share_counter_next_value;

  //CPU/data_master JTAG_UART/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = JTAG_UART_avalon_jtag_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //JTAG_UART_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave = CPU_data_master_requests_JTAG_UART_avalon_jtag_slave & ~((CPU_data_master_read & (~CPU_data_master_waitrequest)) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //JTAG_UART_avalon_jtag_slave_writedata mux, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_JTAG_UART_avalon_jtag_slave = CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave;

  //CPU/data_master saved-grant JTAG_UART/avalon_jtag_slave, which is an e_assign
  assign CPU_data_master_saved_grant_JTAG_UART_avalon_jtag_slave = CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;

  //allow new arb cycle for JTAG_UART/avalon_jtag_slave, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign JTAG_UART_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign JTAG_UART_avalon_jtag_slave_master_qreq_vector = 1;

  //JTAG_UART_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_reset_n = reset_n;

  assign JTAG_UART_avalon_jtag_slave_chipselect = CPU_data_master_granted_JTAG_UART_avalon_jtag_slave;
  //JTAG_UART_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_firsttransfer = JTAG_UART_avalon_jtag_slave_begins_xfer ? JTAG_UART_avalon_jtag_slave_unreg_firsttransfer : JTAG_UART_avalon_jtag_slave_reg_firsttransfer;

  //JTAG_UART_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_unreg_firsttransfer = ~(JTAG_UART_avalon_jtag_slave_slavearbiterlockenable & JTAG_UART_avalon_jtag_slave_any_continuerequest);

  //JTAG_UART_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          JTAG_UART_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (JTAG_UART_avalon_jtag_slave_begins_xfer)
          JTAG_UART_avalon_jtag_slave_reg_firsttransfer <= JTAG_UART_avalon_jtag_slave_unreg_firsttransfer;
    end


  //JTAG_UART_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_beginbursttransfer_internal = JTAG_UART_avalon_jtag_slave_begins_xfer;

  //~JTAG_UART_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_read_n = ~(CPU_data_master_granted_JTAG_UART_avalon_jtag_slave & CPU_data_master_read);

  //~JTAG_UART_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_write_n = ~(CPU_data_master_granted_JTAG_UART_avalon_jtag_slave & CPU_data_master_write);

  assign shifted_address_to_JTAG_UART_avalon_jtag_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //JTAG_UART_avalon_jtag_slave_address mux, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_address = shifted_address_to_JTAG_UART_avalon_jtag_slave_from_CPU_data_master >> 2;

  //d1_JTAG_UART_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_JTAG_UART_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_JTAG_UART_avalon_jtag_slave_end_xfer <= JTAG_UART_avalon_jtag_slave_end_xfer;
    end


  //JTAG_UART_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_waits_for_read = JTAG_UART_avalon_jtag_slave_in_a_read_cycle & JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;

  //JTAG_UART_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_in_a_read_cycle = CPU_data_master_granted_JTAG_UART_avalon_jtag_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = JTAG_UART_avalon_jtag_slave_in_a_read_cycle;

  //JTAG_UART_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign JTAG_UART_avalon_jtag_slave_waits_for_write = JTAG_UART_avalon_jtag_slave_in_a_write_cycle & JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;

  //JTAG_UART_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_in_a_write_cycle = CPU_data_master_granted_JTAG_UART_avalon_jtag_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = JTAG_UART_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_JTAG_UART_avalon_jtag_slave_counter = 0;
  //assign JTAG_UART_avalon_jtag_slave_irq_from_sa = JTAG_UART_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_UART_avalon_jtag_slave_irq_from_sa = JTAG_UART_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //JTAG_UART/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Onchip_memory_s1_arbitrator (
                                     // inputs:
                                      CPU_instruction_master_address_to_slave,
                                      CPU_instruction_master_read,
                                      Onchip_memory_s1_readdata,
                                      clk,
                                      reset_n,

                                     // outputs:
                                      CPU_instruction_master_granted_Onchip_memory_s1,
                                      CPU_instruction_master_qualified_request_Onchip_memory_s1,
                                      CPU_instruction_master_read_data_valid_Onchip_memory_s1,
                                      CPU_instruction_master_requests_Onchip_memory_s1,
                                      Onchip_memory_s1_address,
                                      Onchip_memory_s1_byteenable,
                                      Onchip_memory_s1_chipselect,
                                      Onchip_memory_s1_clken,
                                      Onchip_memory_s1_readdata_from_sa,
                                      Onchip_memory_s1_reset,
                                      Onchip_memory_s1_write,
                                      Onchip_memory_s1_writedata,
                                      d1_Onchip_memory_s1_end_xfer
                                   )
;

  output           CPU_instruction_master_granted_Onchip_memory_s1;
  output           CPU_instruction_master_qualified_request_Onchip_memory_s1;
  output           CPU_instruction_master_read_data_valid_Onchip_memory_s1;
  output           CPU_instruction_master_requests_Onchip_memory_s1;
  output  [ 10: 0] Onchip_memory_s1_address;
  output  [  3: 0] Onchip_memory_s1_byteenable;
  output           Onchip_memory_s1_chipselect;
  output           Onchip_memory_s1_clken;
  output  [ 31: 0] Onchip_memory_s1_readdata_from_sa;
  output           Onchip_memory_s1_reset;
  output           Onchip_memory_s1_write;
  output  [ 31: 0] Onchip_memory_s1_writedata;
  output           d1_Onchip_memory_s1_end_xfer;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input            CPU_instruction_master_read;
  input   [ 31: 0] Onchip_memory_s1_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_Onchip_memory_s1;
  wire             CPU_instruction_master_qualified_request_Onchip_memory_s1;
  wire             CPU_instruction_master_read_data_valid_Onchip_memory_s1;
  reg              CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register;
  wire             CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register_in;
  wire             CPU_instruction_master_requests_Onchip_memory_s1;
  wire             CPU_instruction_master_saved_grant_Onchip_memory_s1;
  wire    [ 10: 0] Onchip_memory_s1_address;
  wire             Onchip_memory_s1_allgrants;
  wire             Onchip_memory_s1_allow_new_arb_cycle;
  wire             Onchip_memory_s1_any_bursting_master_saved_grant;
  wire             Onchip_memory_s1_any_continuerequest;
  wire             Onchip_memory_s1_arb_counter_enable;
  reg     [  1: 0] Onchip_memory_s1_arb_share_counter;
  wire    [  1: 0] Onchip_memory_s1_arb_share_counter_next_value;
  wire    [  1: 0] Onchip_memory_s1_arb_share_set_values;
  wire             Onchip_memory_s1_beginbursttransfer_internal;
  wire             Onchip_memory_s1_begins_xfer;
  wire    [  3: 0] Onchip_memory_s1_byteenable;
  wire             Onchip_memory_s1_chipselect;
  wire             Onchip_memory_s1_clken;
  wire             Onchip_memory_s1_end_xfer;
  wire             Onchip_memory_s1_firsttransfer;
  wire             Onchip_memory_s1_grant_vector;
  wire             Onchip_memory_s1_in_a_read_cycle;
  wire             Onchip_memory_s1_in_a_write_cycle;
  wire             Onchip_memory_s1_master_qreq_vector;
  wire             Onchip_memory_s1_non_bursting_master_requests;
  wire    [ 31: 0] Onchip_memory_s1_readdata_from_sa;
  reg              Onchip_memory_s1_reg_firsttransfer;
  wire             Onchip_memory_s1_reset;
  reg              Onchip_memory_s1_slavearbiterlockenable;
  wire             Onchip_memory_s1_slavearbiterlockenable2;
  wire             Onchip_memory_s1_unreg_firsttransfer;
  wire             Onchip_memory_s1_waits_for_read;
  wire             Onchip_memory_s1_waits_for_write;
  wire             Onchip_memory_s1_write;
  wire    [ 31: 0] Onchip_memory_s1_writedata;
  reg              d1_Onchip_memory_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Onchip_memory_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register;
  wire    [ 27: 0] shifted_address_to_Onchip_memory_s1_from_CPU_instruction_master;
  wire             wait_for_Onchip_memory_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Onchip_memory_s1_end_xfer;
    end


  assign Onchip_memory_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_instruction_master_qualified_request_Onchip_memory_s1));
  //assign Onchip_memory_s1_readdata_from_sa = Onchip_memory_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Onchip_memory_s1_readdata_from_sa = Onchip_memory_s1_readdata;

  assign CPU_instruction_master_requests_Onchip_memory_s1 = (({CPU_instruction_master_address_to_slave[27 : 13] , 13'b0} == 28'h9000000) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //Onchip_memory_s1_arb_share_counter set values, which is an e_mux
  assign Onchip_memory_s1_arb_share_set_values = 1;

  //Onchip_memory_s1_non_bursting_master_requests mux, which is an e_mux
  assign Onchip_memory_s1_non_bursting_master_requests = CPU_instruction_master_requests_Onchip_memory_s1;

  //Onchip_memory_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign Onchip_memory_s1_any_bursting_master_saved_grant = 0;

  //Onchip_memory_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign Onchip_memory_s1_arb_share_counter_next_value = Onchip_memory_s1_firsttransfer ? (Onchip_memory_s1_arb_share_set_values - 1) : |Onchip_memory_s1_arb_share_counter ? (Onchip_memory_s1_arb_share_counter - 1) : 0;

  //Onchip_memory_s1_allgrants all slave grants, which is an e_mux
  assign Onchip_memory_s1_allgrants = |Onchip_memory_s1_grant_vector;

  //Onchip_memory_s1_end_xfer assignment, which is an e_assign
  assign Onchip_memory_s1_end_xfer = ~(Onchip_memory_s1_waits_for_read | Onchip_memory_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_Onchip_memory_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Onchip_memory_s1 = Onchip_memory_s1_end_xfer & (~Onchip_memory_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Onchip_memory_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign Onchip_memory_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_Onchip_memory_s1 & Onchip_memory_s1_allgrants) | (end_xfer_arb_share_counter_term_Onchip_memory_s1 & ~Onchip_memory_s1_non_bursting_master_requests);

  //Onchip_memory_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_memory_s1_arb_share_counter <= 0;
      else if (Onchip_memory_s1_arb_counter_enable)
          Onchip_memory_s1_arb_share_counter <= Onchip_memory_s1_arb_share_counter_next_value;
    end


  //Onchip_memory_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_memory_s1_slavearbiterlockenable <= 0;
      else if ((|Onchip_memory_s1_master_qreq_vector & end_xfer_arb_share_counter_term_Onchip_memory_s1) | (end_xfer_arb_share_counter_term_Onchip_memory_s1 & ~Onchip_memory_s1_non_bursting_master_requests))
          Onchip_memory_s1_slavearbiterlockenable <= |Onchip_memory_s1_arb_share_counter_next_value;
    end


  //CPU/instruction_master Onchip_memory/s1 arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = Onchip_memory_s1_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //Onchip_memory_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Onchip_memory_s1_slavearbiterlockenable2 = |Onchip_memory_s1_arb_share_counter_next_value;

  //CPU/instruction_master Onchip_memory/s1 arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = Onchip_memory_s1_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //Onchip_memory_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Onchip_memory_s1_any_continuerequest = 1;

  //CPU_instruction_master_continuerequest continued request, which is an e_assign
  assign CPU_instruction_master_continuerequest = 1;

  assign CPU_instruction_master_qualified_request_Onchip_memory_s1 = CPU_instruction_master_requests_Onchip_memory_s1 & ~((CPU_instruction_master_read & ((|CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register))));
  //CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register_in = CPU_instruction_master_granted_Onchip_memory_s1 & CPU_instruction_master_read & ~Onchip_memory_s1_waits_for_read & ~(|CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register);

  //shift register p1 CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register = {CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register, CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register_in};

  //CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register <= 0;
      else 
        CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register <= p1_CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register;
    end


  //local readdatavalid CPU_instruction_master_read_data_valid_Onchip_memory_s1, which is an e_mux
  assign CPU_instruction_master_read_data_valid_Onchip_memory_s1 = CPU_instruction_master_read_data_valid_Onchip_memory_s1_shift_register;

  //mux Onchip_memory_s1_clken, which is an e_mux
  assign Onchip_memory_s1_clken = 1'b1;

  //master is always granted when requested
  assign CPU_instruction_master_granted_Onchip_memory_s1 = CPU_instruction_master_qualified_request_Onchip_memory_s1;

  //CPU/instruction_master saved-grant Onchip_memory/s1, which is an e_assign
  assign CPU_instruction_master_saved_grant_Onchip_memory_s1 = CPU_instruction_master_requests_Onchip_memory_s1;

  //allow new arb cycle for Onchip_memory/s1, which is an e_assign
  assign Onchip_memory_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Onchip_memory_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Onchip_memory_s1_master_qreq_vector = 1;

  //~Onchip_memory_s1_reset assignment, which is an e_assign
  assign Onchip_memory_s1_reset = ~reset_n;

  assign Onchip_memory_s1_chipselect = CPU_instruction_master_granted_Onchip_memory_s1;
  //Onchip_memory_s1_firsttransfer first transaction, which is an e_assign
  assign Onchip_memory_s1_firsttransfer = Onchip_memory_s1_begins_xfer ? Onchip_memory_s1_unreg_firsttransfer : Onchip_memory_s1_reg_firsttransfer;

  //Onchip_memory_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign Onchip_memory_s1_unreg_firsttransfer = ~(Onchip_memory_s1_slavearbiterlockenable & Onchip_memory_s1_any_continuerequest);

  //Onchip_memory_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_memory_s1_reg_firsttransfer <= 1'b1;
      else if (Onchip_memory_s1_begins_xfer)
          Onchip_memory_s1_reg_firsttransfer <= Onchip_memory_s1_unreg_firsttransfer;
    end


  //Onchip_memory_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Onchip_memory_s1_beginbursttransfer_internal = Onchip_memory_s1_begins_xfer;

  //Onchip_memory_s1_write assignment, which is an e_mux
  assign Onchip_memory_s1_write = 0;

  assign shifted_address_to_Onchip_memory_s1_from_CPU_instruction_master = CPU_instruction_master_address_to_slave;
  //Onchip_memory_s1_address mux, which is an e_mux
  assign Onchip_memory_s1_address = shifted_address_to_Onchip_memory_s1_from_CPU_instruction_master >> 2;

  //d1_Onchip_memory_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Onchip_memory_s1_end_xfer <= 1;
      else 
        d1_Onchip_memory_s1_end_xfer <= Onchip_memory_s1_end_xfer;
    end


  //Onchip_memory_s1_waits_for_read in a cycle, which is an e_mux
  assign Onchip_memory_s1_waits_for_read = Onchip_memory_s1_in_a_read_cycle & 0;

  //Onchip_memory_s1_in_a_read_cycle assignment, which is an e_assign
  assign Onchip_memory_s1_in_a_read_cycle = CPU_instruction_master_granted_Onchip_memory_s1 & CPU_instruction_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Onchip_memory_s1_in_a_read_cycle;

  //Onchip_memory_s1_waits_for_write in a cycle, which is an e_mux
  assign Onchip_memory_s1_waits_for_write = Onchip_memory_s1_in_a_write_cycle & 0;

  //Onchip_memory_s1_in_a_write_cycle assignment, which is an e_assign
  assign Onchip_memory_s1_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Onchip_memory_s1_in_a_write_cycle;

  assign wait_for_Onchip_memory_s1_counter = 0;
  //Onchip_memory_s1_byteenable byte enable port mux, which is an e_mux
  assign Onchip_memory_s1_byteenable = -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Onchip_memory/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Onchip_memory_s2_arbitrator (
                                     // inputs:
                                      CPU_data_master_address_to_slave,
                                      CPU_data_master_byteenable,
                                      CPU_data_master_read,
                                      CPU_data_master_waitrequest,
                                      CPU_data_master_write,
                                      CPU_data_master_writedata,
                                      Onchip_memory_s2_readdata,
                                      clk,
                                      reset_n,

                                     // outputs:
                                      CPU_data_master_granted_Onchip_memory_s2,
                                      CPU_data_master_qualified_request_Onchip_memory_s2,
                                      CPU_data_master_read_data_valid_Onchip_memory_s2,
                                      CPU_data_master_requests_Onchip_memory_s2,
                                      Onchip_memory_s2_address,
                                      Onchip_memory_s2_byteenable,
                                      Onchip_memory_s2_chipselect,
                                      Onchip_memory_s2_clken,
                                      Onchip_memory_s2_readdata_from_sa,
                                      Onchip_memory_s2_reset,
                                      Onchip_memory_s2_write,
                                      Onchip_memory_s2_writedata,
                                      d1_Onchip_memory_s2_end_xfer,
                                      registered_CPU_data_master_read_data_valid_Onchip_memory_s2
                                   )
;

  output           CPU_data_master_granted_Onchip_memory_s2;
  output           CPU_data_master_qualified_request_Onchip_memory_s2;
  output           CPU_data_master_read_data_valid_Onchip_memory_s2;
  output           CPU_data_master_requests_Onchip_memory_s2;
  output  [ 10: 0] Onchip_memory_s2_address;
  output  [  3: 0] Onchip_memory_s2_byteenable;
  output           Onchip_memory_s2_chipselect;
  output           Onchip_memory_s2_clken;
  output  [ 31: 0] Onchip_memory_s2_readdata_from_sa;
  output           Onchip_memory_s2_reset;
  output           Onchip_memory_s2_write;
  output  [ 31: 0] Onchip_memory_s2_writedata;
  output           d1_Onchip_memory_s2_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Onchip_memory_s2;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] Onchip_memory_s2_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Onchip_memory_s2;
  wire             CPU_data_master_qualified_request_Onchip_memory_s2;
  wire             CPU_data_master_read_data_valid_Onchip_memory_s2;
  reg              CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register;
  wire             CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register_in;
  wire             CPU_data_master_requests_Onchip_memory_s2;
  wire             CPU_data_master_saved_grant_Onchip_memory_s2;
  wire    [ 10: 0] Onchip_memory_s2_address;
  wire             Onchip_memory_s2_allgrants;
  wire             Onchip_memory_s2_allow_new_arb_cycle;
  wire             Onchip_memory_s2_any_bursting_master_saved_grant;
  wire             Onchip_memory_s2_any_continuerequest;
  wire             Onchip_memory_s2_arb_counter_enable;
  reg     [  1: 0] Onchip_memory_s2_arb_share_counter;
  wire    [  1: 0] Onchip_memory_s2_arb_share_counter_next_value;
  wire    [  1: 0] Onchip_memory_s2_arb_share_set_values;
  wire             Onchip_memory_s2_beginbursttransfer_internal;
  wire             Onchip_memory_s2_begins_xfer;
  wire    [  3: 0] Onchip_memory_s2_byteenable;
  wire             Onchip_memory_s2_chipselect;
  wire             Onchip_memory_s2_clken;
  wire             Onchip_memory_s2_end_xfer;
  wire             Onchip_memory_s2_firsttransfer;
  wire             Onchip_memory_s2_grant_vector;
  wire             Onchip_memory_s2_in_a_read_cycle;
  wire             Onchip_memory_s2_in_a_write_cycle;
  wire             Onchip_memory_s2_master_qreq_vector;
  wire             Onchip_memory_s2_non_bursting_master_requests;
  wire    [ 31: 0] Onchip_memory_s2_readdata_from_sa;
  reg              Onchip_memory_s2_reg_firsttransfer;
  wire             Onchip_memory_s2_reset;
  reg              Onchip_memory_s2_slavearbiterlockenable;
  wire             Onchip_memory_s2_slavearbiterlockenable2;
  wire             Onchip_memory_s2_unreg_firsttransfer;
  wire             Onchip_memory_s2_waits_for_read;
  wire             Onchip_memory_s2_waits_for_write;
  wire             Onchip_memory_s2_write;
  wire    [ 31: 0] Onchip_memory_s2_writedata;
  reg              d1_Onchip_memory_s2_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Onchip_memory_s2;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Onchip_memory_s2;
  wire    [ 28: 0] shifted_address_to_Onchip_memory_s2_from_CPU_data_master;
  wire             wait_for_Onchip_memory_s2_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Onchip_memory_s2_end_xfer;
    end


  assign Onchip_memory_s2_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Onchip_memory_s2));
  //assign Onchip_memory_s2_readdata_from_sa = Onchip_memory_s2_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Onchip_memory_s2_readdata_from_sa = Onchip_memory_s2_readdata;

  assign CPU_data_master_requests_Onchip_memory_s2 = ({CPU_data_master_address_to_slave[28 : 13] , 13'b0} == 29'h9000000) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Onchip_memory_s2 assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Onchip_memory_s2 = CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register_in;

  //Onchip_memory_s2_arb_share_counter set values, which is an e_mux
  assign Onchip_memory_s2_arb_share_set_values = 1;

  //Onchip_memory_s2_non_bursting_master_requests mux, which is an e_mux
  assign Onchip_memory_s2_non_bursting_master_requests = CPU_data_master_requests_Onchip_memory_s2;

  //Onchip_memory_s2_any_bursting_master_saved_grant mux, which is an e_mux
  assign Onchip_memory_s2_any_bursting_master_saved_grant = 0;

  //Onchip_memory_s2_arb_share_counter_next_value assignment, which is an e_assign
  assign Onchip_memory_s2_arb_share_counter_next_value = Onchip_memory_s2_firsttransfer ? (Onchip_memory_s2_arb_share_set_values - 1) : |Onchip_memory_s2_arb_share_counter ? (Onchip_memory_s2_arb_share_counter - 1) : 0;

  //Onchip_memory_s2_allgrants all slave grants, which is an e_mux
  assign Onchip_memory_s2_allgrants = |Onchip_memory_s2_grant_vector;

  //Onchip_memory_s2_end_xfer assignment, which is an e_assign
  assign Onchip_memory_s2_end_xfer = ~(Onchip_memory_s2_waits_for_read | Onchip_memory_s2_waits_for_write);

  //end_xfer_arb_share_counter_term_Onchip_memory_s2 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Onchip_memory_s2 = Onchip_memory_s2_end_xfer & (~Onchip_memory_s2_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Onchip_memory_s2_arb_share_counter arbitration counter enable, which is an e_assign
  assign Onchip_memory_s2_arb_counter_enable = (end_xfer_arb_share_counter_term_Onchip_memory_s2 & Onchip_memory_s2_allgrants) | (end_xfer_arb_share_counter_term_Onchip_memory_s2 & ~Onchip_memory_s2_non_bursting_master_requests);

  //Onchip_memory_s2_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_memory_s2_arb_share_counter <= 0;
      else if (Onchip_memory_s2_arb_counter_enable)
          Onchip_memory_s2_arb_share_counter <= Onchip_memory_s2_arb_share_counter_next_value;
    end


  //Onchip_memory_s2_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_memory_s2_slavearbiterlockenable <= 0;
      else if ((|Onchip_memory_s2_master_qreq_vector & end_xfer_arb_share_counter_term_Onchip_memory_s2) | (end_xfer_arb_share_counter_term_Onchip_memory_s2 & ~Onchip_memory_s2_non_bursting_master_requests))
          Onchip_memory_s2_slavearbiterlockenable <= |Onchip_memory_s2_arb_share_counter_next_value;
    end


  //CPU/data_master Onchip_memory/s2 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Onchip_memory_s2_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Onchip_memory_s2_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Onchip_memory_s2_slavearbiterlockenable2 = |Onchip_memory_s2_arb_share_counter_next_value;

  //CPU/data_master Onchip_memory/s2 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Onchip_memory_s2_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Onchip_memory_s2_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Onchip_memory_s2_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Onchip_memory_s2 = CPU_data_master_requests_Onchip_memory_s2 & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register_in = CPU_data_master_granted_Onchip_memory_s2 & CPU_data_master_read & ~Onchip_memory_s2_waits_for_read & ~(|CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register = {CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register, CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register_in};

  //CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register <= p1_CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Onchip_memory_s2, which is an e_mux
  assign CPU_data_master_read_data_valid_Onchip_memory_s2 = CPU_data_master_read_data_valid_Onchip_memory_s2_shift_register;

  //Onchip_memory_s2_writedata mux, which is an e_mux
  assign Onchip_memory_s2_writedata = CPU_data_master_writedata;

  //mux Onchip_memory_s2_clken, which is an e_mux
  assign Onchip_memory_s2_clken = 1'b1;

  //master is always granted when requested
  assign CPU_data_master_granted_Onchip_memory_s2 = CPU_data_master_qualified_request_Onchip_memory_s2;

  //CPU/data_master saved-grant Onchip_memory/s2, which is an e_assign
  assign CPU_data_master_saved_grant_Onchip_memory_s2 = CPU_data_master_requests_Onchip_memory_s2;

  //allow new arb cycle for Onchip_memory/s2, which is an e_assign
  assign Onchip_memory_s2_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Onchip_memory_s2_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Onchip_memory_s2_master_qreq_vector = 1;

  //~Onchip_memory_s2_reset assignment, which is an e_assign
  assign Onchip_memory_s2_reset = ~reset_n;

  assign Onchip_memory_s2_chipselect = CPU_data_master_granted_Onchip_memory_s2;
  //Onchip_memory_s2_firsttransfer first transaction, which is an e_assign
  assign Onchip_memory_s2_firsttransfer = Onchip_memory_s2_begins_xfer ? Onchip_memory_s2_unreg_firsttransfer : Onchip_memory_s2_reg_firsttransfer;

  //Onchip_memory_s2_unreg_firsttransfer first transaction, which is an e_assign
  assign Onchip_memory_s2_unreg_firsttransfer = ~(Onchip_memory_s2_slavearbiterlockenable & Onchip_memory_s2_any_continuerequest);

  //Onchip_memory_s2_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_memory_s2_reg_firsttransfer <= 1'b1;
      else if (Onchip_memory_s2_begins_xfer)
          Onchip_memory_s2_reg_firsttransfer <= Onchip_memory_s2_unreg_firsttransfer;
    end


  //Onchip_memory_s2_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Onchip_memory_s2_beginbursttransfer_internal = Onchip_memory_s2_begins_xfer;

  //Onchip_memory_s2_write assignment, which is an e_mux
  assign Onchip_memory_s2_write = CPU_data_master_granted_Onchip_memory_s2 & CPU_data_master_write;

  assign shifted_address_to_Onchip_memory_s2_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Onchip_memory_s2_address mux, which is an e_mux
  assign Onchip_memory_s2_address = shifted_address_to_Onchip_memory_s2_from_CPU_data_master >> 2;

  //d1_Onchip_memory_s2_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Onchip_memory_s2_end_xfer <= 1;
      else 
        d1_Onchip_memory_s2_end_xfer <= Onchip_memory_s2_end_xfer;
    end


  //Onchip_memory_s2_waits_for_read in a cycle, which is an e_mux
  assign Onchip_memory_s2_waits_for_read = Onchip_memory_s2_in_a_read_cycle & 0;

  //Onchip_memory_s2_in_a_read_cycle assignment, which is an e_assign
  assign Onchip_memory_s2_in_a_read_cycle = CPU_data_master_granted_Onchip_memory_s2 & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Onchip_memory_s2_in_a_read_cycle;

  //Onchip_memory_s2_waits_for_write in a cycle, which is an e_mux
  assign Onchip_memory_s2_waits_for_write = Onchip_memory_s2_in_a_write_cycle & 0;

  //Onchip_memory_s2_in_a_write_cycle assignment, which is an e_assign
  assign Onchip_memory_s2_in_a_write_cycle = CPU_data_master_granted_Onchip_memory_s2 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Onchip_memory_s2_in_a_write_cycle;

  assign wait_for_Onchip_memory_s2_counter = 0;
  //Onchip_memory_s2_byteenable byte enable port mux, which is an e_mux
  assign Onchip_memory_s2_byteenable = (CPU_data_master_granted_Onchip_memory_s2)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Onchip_memory/s2 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Pushbuttons_avalon_parallel_port_slave_arbitrator (
                                                           // inputs:
                                                            CPU_data_master_address_to_slave,
                                                            CPU_data_master_byteenable,
                                                            CPU_data_master_read,
                                                            CPU_data_master_waitrequest,
                                                            CPU_data_master_write,
                                                            CPU_data_master_writedata,
                                                            Pushbuttons_avalon_parallel_port_slave_irq,
                                                            Pushbuttons_avalon_parallel_port_slave_readdata,
                                                            clk,
                                                            reset_n,

                                                           // outputs:
                                                            CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave,
                                                            CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave,
                                                            CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave,
                                                            CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave,
                                                            Pushbuttons_avalon_parallel_port_slave_address,
                                                            Pushbuttons_avalon_parallel_port_slave_byteenable,
                                                            Pushbuttons_avalon_parallel_port_slave_chipselect,
                                                            Pushbuttons_avalon_parallel_port_slave_irq_from_sa,
                                                            Pushbuttons_avalon_parallel_port_slave_read,
                                                            Pushbuttons_avalon_parallel_port_slave_readdata_from_sa,
                                                            Pushbuttons_avalon_parallel_port_slave_reset,
                                                            Pushbuttons_avalon_parallel_port_slave_write,
                                                            Pushbuttons_avalon_parallel_port_slave_writedata,
                                                            d1_Pushbuttons_avalon_parallel_port_slave_end_xfer,
                                                            registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave
                                                         )
;

  output           CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;
  output  [  1: 0] Pushbuttons_avalon_parallel_port_slave_address;
  output  [  3: 0] Pushbuttons_avalon_parallel_port_slave_byteenable;
  output           Pushbuttons_avalon_parallel_port_slave_chipselect;
  output           Pushbuttons_avalon_parallel_port_slave_irq_from_sa;
  output           Pushbuttons_avalon_parallel_port_slave_read;
  output  [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata_from_sa;
  output           Pushbuttons_avalon_parallel_port_slave_reset;
  output           Pushbuttons_avalon_parallel_port_slave_write;
  output  [ 31: 0] Pushbuttons_avalon_parallel_port_slave_writedata;
  output           d1_Pushbuttons_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Pushbuttons_avalon_parallel_port_slave_irq;
  input   [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Pushbuttons_avalon_parallel_port_slave;
  wire    [  1: 0] Pushbuttons_avalon_parallel_port_slave_address;
  wire             Pushbuttons_avalon_parallel_port_slave_allgrants;
  wire             Pushbuttons_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Pushbuttons_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Pushbuttons_avalon_parallel_port_slave_any_continuerequest;
  wire             Pushbuttons_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  1: 0] Pushbuttons_avalon_parallel_port_slave_arb_share_counter;
  wire    [  1: 0] Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  1: 0] Pushbuttons_avalon_parallel_port_slave_arb_share_set_values;
  wire             Pushbuttons_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Pushbuttons_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Pushbuttons_avalon_parallel_port_slave_byteenable;
  wire             Pushbuttons_avalon_parallel_port_slave_chipselect;
  wire             Pushbuttons_avalon_parallel_port_slave_end_xfer;
  wire             Pushbuttons_avalon_parallel_port_slave_firsttransfer;
  wire             Pushbuttons_avalon_parallel_port_slave_grant_vector;
  wire             Pushbuttons_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Pushbuttons_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Pushbuttons_avalon_parallel_port_slave_irq_from_sa;
  wire             Pushbuttons_avalon_parallel_port_slave_master_qreq_vector;
  wire             Pushbuttons_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Pushbuttons_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata_from_sa;
  reg              Pushbuttons_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Pushbuttons_avalon_parallel_port_slave_reset;
  reg              Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Pushbuttons_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Pushbuttons_avalon_parallel_port_slave_waits_for_read;
  wire             Pushbuttons_avalon_parallel_port_slave_waits_for_write;
  wire             Pushbuttons_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Pushbuttons_avalon_parallel_port_slave_writedata;
  reg              d1_Pushbuttons_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Pushbuttons_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Pushbuttons_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Pushbuttons_avalon_parallel_port_slave_end_xfer;
    end


  assign Pushbuttons_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave));
  //assign Pushbuttons_avalon_parallel_port_slave_readdata_from_sa = Pushbuttons_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_readdata_from_sa = Pushbuttons_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000050) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register_in;

  //Pushbuttons_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Pushbuttons_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;

  //Pushbuttons_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value = Pushbuttons_avalon_parallel_port_slave_firsttransfer ? (Pushbuttons_avalon_parallel_port_slave_arb_share_set_values - 1) : |Pushbuttons_avalon_parallel_port_slave_arb_share_counter ? (Pushbuttons_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Pushbuttons_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_allgrants = |Pushbuttons_avalon_parallel_port_slave_grant_vector;

  //Pushbuttons_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_end_xfer = ~(Pushbuttons_avalon_parallel_port_slave_waits_for_read | Pushbuttons_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave = Pushbuttons_avalon_parallel_port_slave_end_xfer & (~Pushbuttons_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Pushbuttons_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave & Pushbuttons_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave & ~Pushbuttons_avalon_parallel_port_slave_non_bursting_master_requests);

  //Pushbuttons_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pushbuttons_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Pushbuttons_avalon_parallel_port_slave_arb_counter_enable)
          Pushbuttons_avalon_parallel_port_slave_arb_share_counter <= Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Pushbuttons_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Pushbuttons_avalon_parallel_port_slave & ~Pushbuttons_avalon_parallel_port_slave_non_bursting_master_requests))
          Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable <= |Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Pushbuttons/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable2 = |Pushbuttons_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Pushbuttons/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Pushbuttons_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave = CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_read & ~Pushbuttons_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave_shift_register;

  //Pushbuttons_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave = CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Pushbuttons/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Pushbuttons_avalon_parallel_port_slave = CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;

  //allow new arb cycle for Pushbuttons/avalon_parallel_port_slave, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Pushbuttons_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Pushbuttons_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Pushbuttons_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_reset = ~reset_n;

  assign Pushbuttons_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave;
  //Pushbuttons_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_firsttransfer = Pushbuttons_avalon_parallel_port_slave_begins_xfer ? Pushbuttons_avalon_parallel_port_slave_unreg_firsttransfer : Pushbuttons_avalon_parallel_port_slave_reg_firsttransfer;

  //Pushbuttons_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_unreg_firsttransfer = ~(Pushbuttons_avalon_parallel_port_slave_slavearbiterlockenable & Pushbuttons_avalon_parallel_port_slave_any_continuerequest);

  //Pushbuttons_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pushbuttons_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Pushbuttons_avalon_parallel_port_slave_begins_xfer)
          Pushbuttons_avalon_parallel_port_slave_reg_firsttransfer <= Pushbuttons_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Pushbuttons_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_beginbursttransfer_internal = Pushbuttons_avalon_parallel_port_slave_begins_xfer;

  //Pushbuttons_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_read = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_read;

  //Pushbuttons_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_write = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Pushbuttons_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Pushbuttons_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_address = shifted_address_to_Pushbuttons_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Pushbuttons_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Pushbuttons_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Pushbuttons_avalon_parallel_port_slave_end_xfer <= Pushbuttons_avalon_parallel_port_slave_end_xfer;
    end


  //Pushbuttons_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_waits_for_read = Pushbuttons_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Pushbuttons_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Pushbuttons_avalon_parallel_port_slave_in_a_read_cycle;

  //Pushbuttons_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_waits_for_write = Pushbuttons_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Pushbuttons_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Pushbuttons_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Pushbuttons_avalon_parallel_port_slave_counter = 0;
  //Pushbuttons_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Pushbuttons_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;

  //assign Pushbuttons_avalon_parallel_port_slave_irq_from_sa = Pushbuttons_avalon_parallel_port_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Pushbuttons_avalon_parallel_port_slave_irq_from_sa = Pushbuttons_avalon_parallel_port_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Pushbuttons/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Red_LEDs_avalon_parallel_port_slave_arbitrator (
                                                        // inputs:
                                                         CPU_data_master_address_to_slave,
                                                         CPU_data_master_byteenable,
                                                         CPU_data_master_read,
                                                         CPU_data_master_waitrequest,
                                                         CPU_data_master_write,
                                                         CPU_data_master_writedata,
                                                         Red_LEDs_avalon_parallel_port_slave_readdata,
                                                         clk,
                                                         reset_n,

                                                        // outputs:
                                                         CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave,
                                                         CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave,
                                                         CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave,
                                                         CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave,
                                                         Red_LEDs_avalon_parallel_port_slave_address,
                                                         Red_LEDs_avalon_parallel_port_slave_byteenable,
                                                         Red_LEDs_avalon_parallel_port_slave_chipselect,
                                                         Red_LEDs_avalon_parallel_port_slave_read,
                                                         Red_LEDs_avalon_parallel_port_slave_readdata_from_sa,
                                                         Red_LEDs_avalon_parallel_port_slave_reset,
                                                         Red_LEDs_avalon_parallel_port_slave_write,
                                                         Red_LEDs_avalon_parallel_port_slave_writedata,
                                                         d1_Red_LEDs_avalon_parallel_port_slave_end_xfer,
                                                         registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave
                                                      )
;

  output           CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;
  output  [  1: 0] Red_LEDs_avalon_parallel_port_slave_address;
  output  [  3: 0] Red_LEDs_avalon_parallel_port_slave_byteenable;
  output           Red_LEDs_avalon_parallel_port_slave_chipselect;
  output           Red_LEDs_avalon_parallel_port_slave_read;
  output  [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  output           Red_LEDs_avalon_parallel_port_slave_reset;
  output           Red_LEDs_avalon_parallel_port_slave_write;
  output  [ 31: 0] Red_LEDs_avalon_parallel_port_slave_writedata;
  output           d1_Red_LEDs_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Red_LEDs_avalon_parallel_port_slave;
  wire    [  1: 0] Red_LEDs_avalon_parallel_port_slave_address;
  wire             Red_LEDs_avalon_parallel_port_slave_allgrants;
  wire             Red_LEDs_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Red_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Red_LEDs_avalon_parallel_port_slave_any_continuerequest;
  wire             Red_LEDs_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  1: 0] Red_LEDs_avalon_parallel_port_slave_arb_share_counter;
  wire    [  1: 0] Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  1: 0] Red_LEDs_avalon_parallel_port_slave_arb_share_set_values;
  wire             Red_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Red_LEDs_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Red_LEDs_avalon_parallel_port_slave_byteenable;
  wire             Red_LEDs_avalon_parallel_port_slave_chipselect;
  wire             Red_LEDs_avalon_parallel_port_slave_end_xfer;
  wire             Red_LEDs_avalon_parallel_port_slave_firsttransfer;
  wire             Red_LEDs_avalon_parallel_port_slave_grant_vector;
  wire             Red_LEDs_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Red_LEDs_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Red_LEDs_avalon_parallel_port_slave_master_qreq_vector;
  wire             Red_LEDs_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Red_LEDs_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  reg              Red_LEDs_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Red_LEDs_avalon_parallel_port_slave_reset;
  reg              Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Red_LEDs_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Red_LEDs_avalon_parallel_port_slave_waits_for_read;
  wire             Red_LEDs_avalon_parallel_port_slave_waits_for_write;
  wire             Red_LEDs_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Red_LEDs_avalon_parallel_port_slave_writedata;
  reg              d1_Red_LEDs_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Red_LEDs_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Red_LEDs_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Red_LEDs_avalon_parallel_port_slave_end_xfer;
    end


  assign Red_LEDs_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave));
  //assign Red_LEDs_avalon_parallel_port_slave_readdata_from_sa = Red_LEDs_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_readdata_from_sa = Red_LEDs_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000000) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register_in;

  //Red_LEDs_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Red_LEDs_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;

  //Red_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value = Red_LEDs_avalon_parallel_port_slave_firsttransfer ? (Red_LEDs_avalon_parallel_port_slave_arb_share_set_values - 1) : |Red_LEDs_avalon_parallel_port_slave_arb_share_counter ? (Red_LEDs_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Red_LEDs_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_allgrants = |Red_LEDs_avalon_parallel_port_slave_grant_vector;

  //Red_LEDs_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_end_xfer = ~(Red_LEDs_avalon_parallel_port_slave_waits_for_read | Red_LEDs_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave = Red_LEDs_avalon_parallel_port_slave_end_xfer & (~Red_LEDs_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Red_LEDs_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave & Red_LEDs_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave & ~Red_LEDs_avalon_parallel_port_slave_non_bursting_master_requests);

  //Red_LEDs_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Red_LEDs_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Red_LEDs_avalon_parallel_port_slave_arb_counter_enable)
          Red_LEDs_avalon_parallel_port_slave_arb_share_counter <= Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Red_LEDs_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Red_LEDs_avalon_parallel_port_slave & ~Red_LEDs_avalon_parallel_port_slave_non_bursting_master_requests))
          Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable <= |Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Red_LEDs/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 = |Red_LEDs_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Red_LEDs/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Red_LEDs_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave = CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_read & ~Red_LEDs_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave_shift_register;

  //Red_LEDs_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave = CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Red_LEDs/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Red_LEDs_avalon_parallel_port_slave = CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;

  //allow new arb cycle for Red_LEDs/avalon_parallel_port_slave, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Red_LEDs_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Red_LEDs_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Red_LEDs_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_reset = ~reset_n;

  assign Red_LEDs_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave;
  //Red_LEDs_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_firsttransfer = Red_LEDs_avalon_parallel_port_slave_begins_xfer ? Red_LEDs_avalon_parallel_port_slave_unreg_firsttransfer : Red_LEDs_avalon_parallel_port_slave_reg_firsttransfer;

  //Red_LEDs_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_unreg_firsttransfer = ~(Red_LEDs_avalon_parallel_port_slave_slavearbiterlockenable & Red_LEDs_avalon_parallel_port_slave_any_continuerequest);

  //Red_LEDs_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Red_LEDs_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Red_LEDs_avalon_parallel_port_slave_begins_xfer)
          Red_LEDs_avalon_parallel_port_slave_reg_firsttransfer <= Red_LEDs_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Red_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_beginbursttransfer_internal = Red_LEDs_avalon_parallel_port_slave_begins_xfer;

  //Red_LEDs_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_read = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_read;

  //Red_LEDs_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_write = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Red_LEDs_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Red_LEDs_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_address = shifted_address_to_Red_LEDs_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Red_LEDs_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Red_LEDs_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Red_LEDs_avalon_parallel_port_slave_end_xfer <= Red_LEDs_avalon_parallel_port_slave_end_xfer;
    end


  //Red_LEDs_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_waits_for_read = Red_LEDs_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Red_LEDs_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Red_LEDs_avalon_parallel_port_slave_in_a_read_cycle;

  //Red_LEDs_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_waits_for_write = Red_LEDs_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Red_LEDs_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Red_LEDs_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Red_LEDs_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Red_LEDs_avalon_parallel_port_slave_counter = 0;
  //Red_LEDs_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Red_LEDs_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Red_LEDs/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_CPU_data_master_to_SDRAM_s1_module (
                                                         // inputs:
                                                          clear_fifo,
                                                          clk,
                                                          data_in,
                                                          read,
                                                          reset_n,
                                                          sync_reset,
                                                          write,

                                                         // outputs:
                                                          data_out,
                                                          empty,
                                                          fifo_contains_ones_n,
                                                          full
                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_CPU_instruction_master_to_SDRAM_s1_module (
                                                                // inputs:
                                                                 clear_fifo,
                                                                 clk,
                                                                 data_in,
                                                                 read,
                                                                 reset_n,
                                                                 sync_reset,
                                                                 write,

                                                                // outputs:
                                                                 data_out,
                                                                 empty,
                                                                 fifo_contains_ones_n,
                                                                 full
                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SDRAM_s1_arbitrator (
                             // inputs:
                              CPU_data_master_address_to_slave,
                              CPU_data_master_byteenable,
                              CPU_data_master_dbs_address,
                              CPU_data_master_dbs_write_16,
                              CPU_data_master_no_byte_enables_and_last_term,
                              CPU_data_master_read,
                              CPU_data_master_waitrequest,
                              CPU_data_master_write,
                              CPU_instruction_master_address_to_slave,
                              CPU_instruction_master_dbs_address,
                              CPU_instruction_master_read,
                              SDRAM_s1_readdata,
                              SDRAM_s1_readdatavalid,
                              SDRAM_s1_waitrequest,
                              clk,
                              reset_n,

                             // outputs:
                              CPU_data_master_byteenable_SDRAM_s1,
                              CPU_data_master_granted_SDRAM_s1,
                              CPU_data_master_qualified_request_SDRAM_s1,
                              CPU_data_master_read_data_valid_SDRAM_s1,
                              CPU_data_master_read_data_valid_SDRAM_s1_shift_register,
                              CPU_data_master_requests_SDRAM_s1,
                              CPU_instruction_master_granted_SDRAM_s1,
                              CPU_instruction_master_qualified_request_SDRAM_s1,
                              CPU_instruction_master_read_data_valid_SDRAM_s1,
                              CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register,
                              CPU_instruction_master_requests_SDRAM_s1,
                              SDRAM_s1_address,
                              SDRAM_s1_byteenable_n,
                              SDRAM_s1_chipselect,
                              SDRAM_s1_read_n,
                              SDRAM_s1_readdata_from_sa,
                              SDRAM_s1_reset_n,
                              SDRAM_s1_waitrequest_from_sa,
                              SDRAM_s1_write_n,
                              SDRAM_s1_writedata,
                              d1_SDRAM_s1_end_xfer
                           )
;

  output  [  1: 0] CPU_data_master_byteenable_SDRAM_s1;
  output           CPU_data_master_granted_SDRAM_s1;
  output           CPU_data_master_qualified_request_SDRAM_s1;
  output           CPU_data_master_read_data_valid_SDRAM_s1;
  output           CPU_data_master_read_data_valid_SDRAM_s1_shift_register;
  output           CPU_data_master_requests_SDRAM_s1;
  output           CPU_instruction_master_granted_SDRAM_s1;
  output           CPU_instruction_master_qualified_request_SDRAM_s1;
  output           CPU_instruction_master_read_data_valid_SDRAM_s1;
  output           CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register;
  output           CPU_instruction_master_requests_SDRAM_s1;
  output  [ 21: 0] SDRAM_s1_address;
  output  [  1: 0] SDRAM_s1_byteenable_n;
  output           SDRAM_s1_chipselect;
  output           SDRAM_s1_read_n;
  output  [ 15: 0] SDRAM_s1_readdata_from_sa;
  output           SDRAM_s1_reset_n;
  output           SDRAM_s1_waitrequest_from_sa;
  output           SDRAM_s1_write_n;
  output  [ 15: 0] SDRAM_s1_writedata;
  output           d1_SDRAM_s1_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_dbs_address;
  input   [ 15: 0] CPU_data_master_dbs_write_16;
  input            CPU_data_master_no_byte_enables_and_last_term;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input   [  1: 0] CPU_instruction_master_dbs_address;
  input            CPU_instruction_master_read;
  input   [ 15: 0] SDRAM_s1_readdata;
  input            SDRAM_s1_readdatavalid;
  input            SDRAM_s1_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire    [  1: 0] CPU_data_master_byteenable_SDRAM_s1;
  wire    [  1: 0] CPU_data_master_byteenable_SDRAM_s1_segment_0;
  wire    [  1: 0] CPU_data_master_byteenable_SDRAM_s1_segment_1;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_SDRAM_s1;
  wire             CPU_data_master_qualified_request_SDRAM_s1;
  wire             CPU_data_master_rdv_fifo_empty_SDRAM_s1;
  wire             CPU_data_master_rdv_fifo_output_from_SDRAM_s1;
  wire             CPU_data_master_read_data_valid_SDRAM_s1;
  wire             CPU_data_master_read_data_valid_SDRAM_s1_shift_register;
  wire             CPU_data_master_requests_SDRAM_s1;
  wire             CPU_data_master_saved_grant_SDRAM_s1;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_SDRAM_s1;
  wire             CPU_instruction_master_qualified_request_SDRAM_s1;
  wire             CPU_instruction_master_rdv_fifo_empty_SDRAM_s1;
  wire             CPU_instruction_master_rdv_fifo_output_from_SDRAM_s1;
  wire             CPU_instruction_master_read_data_valid_SDRAM_s1;
  wire             CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register;
  wire             CPU_instruction_master_requests_SDRAM_s1;
  wire             CPU_instruction_master_saved_grant_SDRAM_s1;
  wire    [ 21: 0] SDRAM_s1_address;
  wire             SDRAM_s1_allgrants;
  wire             SDRAM_s1_allow_new_arb_cycle;
  wire             SDRAM_s1_any_bursting_master_saved_grant;
  wire             SDRAM_s1_any_continuerequest;
  reg     [  1: 0] SDRAM_s1_arb_addend;
  wire             SDRAM_s1_arb_counter_enable;
  reg     [  1: 0] SDRAM_s1_arb_share_counter;
  wire    [  1: 0] SDRAM_s1_arb_share_counter_next_value;
  wire    [  1: 0] SDRAM_s1_arb_share_set_values;
  wire    [  1: 0] SDRAM_s1_arb_winner;
  wire             SDRAM_s1_arbitration_holdoff_internal;
  wire             SDRAM_s1_beginbursttransfer_internal;
  wire             SDRAM_s1_begins_xfer;
  wire    [  1: 0] SDRAM_s1_byteenable_n;
  wire             SDRAM_s1_chipselect;
  wire    [  3: 0] SDRAM_s1_chosen_master_double_vector;
  wire    [  1: 0] SDRAM_s1_chosen_master_rot_left;
  wire             SDRAM_s1_end_xfer;
  wire             SDRAM_s1_firsttransfer;
  wire    [  1: 0] SDRAM_s1_grant_vector;
  wire             SDRAM_s1_in_a_read_cycle;
  wire             SDRAM_s1_in_a_write_cycle;
  wire    [  1: 0] SDRAM_s1_master_qreq_vector;
  wire             SDRAM_s1_move_on_to_next_transaction;
  wire             SDRAM_s1_non_bursting_master_requests;
  wire             SDRAM_s1_read_n;
  wire    [ 15: 0] SDRAM_s1_readdata_from_sa;
  wire             SDRAM_s1_readdatavalid_from_sa;
  reg              SDRAM_s1_reg_firsttransfer;
  wire             SDRAM_s1_reset_n;
  reg     [  1: 0] SDRAM_s1_saved_chosen_master_vector;
  reg              SDRAM_s1_slavearbiterlockenable;
  wire             SDRAM_s1_slavearbiterlockenable2;
  wire             SDRAM_s1_unreg_firsttransfer;
  wire             SDRAM_s1_waitrequest_from_sa;
  wire             SDRAM_s1_waits_for_read;
  wire             SDRAM_s1_waits_for_write;
  wire             SDRAM_s1_write_n;
  wire    [ 15: 0] SDRAM_s1_writedata;
  reg              d1_SDRAM_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_SDRAM_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_SDRAM_s1;
  reg              last_cycle_CPU_instruction_master_granted_slave_SDRAM_s1;
  wire    [ 28: 0] shifted_address_to_SDRAM_s1_from_CPU_data_master;
  wire    [ 27: 0] shifted_address_to_SDRAM_s1_from_CPU_instruction_master;
  wire             wait_for_SDRAM_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~SDRAM_s1_end_xfer;
    end


  assign SDRAM_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_SDRAM_s1 | CPU_instruction_master_qualified_request_SDRAM_s1));
  //assign SDRAM_s1_readdata_from_sa = SDRAM_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDRAM_s1_readdata_from_sa = SDRAM_s1_readdata;

  assign CPU_data_master_requests_SDRAM_s1 = ({CPU_data_master_address_to_slave[28 : 23] , 23'b0} == 29'h0) & (CPU_data_master_read | CPU_data_master_write);
  //assign SDRAM_s1_waitrequest_from_sa = SDRAM_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDRAM_s1_waitrequest_from_sa = SDRAM_s1_waitrequest;

  //assign SDRAM_s1_readdatavalid_from_sa = SDRAM_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDRAM_s1_readdatavalid_from_sa = SDRAM_s1_readdatavalid;

  //SDRAM_s1_arb_share_counter set values, which is an e_mux
  assign SDRAM_s1_arb_share_set_values = (CPU_data_master_granted_SDRAM_s1)? 2 :
    (CPU_instruction_master_granted_SDRAM_s1)? 2 :
    (CPU_data_master_granted_SDRAM_s1)? 2 :
    (CPU_instruction_master_granted_SDRAM_s1)? 2 :
    1;

  //SDRAM_s1_non_bursting_master_requests mux, which is an e_mux
  assign SDRAM_s1_non_bursting_master_requests = CPU_data_master_requests_SDRAM_s1 |
    CPU_instruction_master_requests_SDRAM_s1 |
    CPU_data_master_requests_SDRAM_s1 |
    CPU_instruction_master_requests_SDRAM_s1;

  //SDRAM_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign SDRAM_s1_any_bursting_master_saved_grant = 0;

  //SDRAM_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign SDRAM_s1_arb_share_counter_next_value = SDRAM_s1_firsttransfer ? (SDRAM_s1_arb_share_set_values - 1) : |SDRAM_s1_arb_share_counter ? (SDRAM_s1_arb_share_counter - 1) : 0;

  //SDRAM_s1_allgrants all slave grants, which is an e_mux
  assign SDRAM_s1_allgrants = (|SDRAM_s1_grant_vector) |
    (|SDRAM_s1_grant_vector) |
    (|SDRAM_s1_grant_vector) |
    (|SDRAM_s1_grant_vector);

  //SDRAM_s1_end_xfer assignment, which is an e_assign
  assign SDRAM_s1_end_xfer = ~(SDRAM_s1_waits_for_read | SDRAM_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_SDRAM_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_SDRAM_s1 = SDRAM_s1_end_xfer & (~SDRAM_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //SDRAM_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign SDRAM_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_SDRAM_s1 & SDRAM_s1_allgrants) | (end_xfer_arb_share_counter_term_SDRAM_s1 & ~SDRAM_s1_non_bursting_master_requests);

  //SDRAM_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_s1_arb_share_counter <= 0;
      else if (SDRAM_s1_arb_counter_enable)
          SDRAM_s1_arb_share_counter <= SDRAM_s1_arb_share_counter_next_value;
    end


  //SDRAM_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_s1_slavearbiterlockenable <= 0;
      else if ((|SDRAM_s1_master_qreq_vector & end_xfer_arb_share_counter_term_SDRAM_s1) | (end_xfer_arb_share_counter_term_SDRAM_s1 & ~SDRAM_s1_non_bursting_master_requests))
          SDRAM_s1_slavearbiterlockenable <= |SDRAM_s1_arb_share_counter_next_value;
    end


  //CPU/data_master SDRAM/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = SDRAM_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //SDRAM_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign SDRAM_s1_slavearbiterlockenable2 = |SDRAM_s1_arb_share_counter_next_value;

  //CPU/data_master SDRAM/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = SDRAM_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master SDRAM/s1 arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = SDRAM_s1_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master SDRAM/s1 arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = SDRAM_s1_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted SDRAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_SDRAM_s1 <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_SDRAM_s1 <= CPU_instruction_master_saved_grant_SDRAM_s1 ? 1 : (SDRAM_s1_arbitration_holdoff_internal | ~CPU_instruction_master_requests_SDRAM_s1) ? 0 : last_cycle_CPU_instruction_master_granted_slave_SDRAM_s1;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_SDRAM_s1 & CPU_instruction_master_requests_SDRAM_s1;

  //SDRAM_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign SDRAM_s1_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_SDRAM_s1 = CPU_data_master_requests_SDRAM_s1 & ~((CPU_data_master_read & (~CPU_data_master_waitrequest | (|CPU_data_master_read_data_valid_SDRAM_s1_shift_register))) | ((~CPU_data_master_waitrequest | CPU_data_master_no_byte_enables_and_last_term | !CPU_data_master_byteenable_SDRAM_s1) & CPU_data_master_write) | CPU_instruction_master_arbiterlock);
  //unique name for SDRAM_s1_move_on_to_next_transaction, which is an e_assign
  assign SDRAM_s1_move_on_to_next_transaction = SDRAM_s1_readdatavalid_from_sa;

  //rdv_fifo_for_CPU_data_master_to_SDRAM_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_CPU_data_master_to_SDRAM_s1_module rdv_fifo_for_CPU_data_master_to_SDRAM_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (CPU_data_master_granted_SDRAM_s1),
      .data_out             (CPU_data_master_rdv_fifo_output_from_SDRAM_s1),
      .empty                (),
      .fifo_contains_ones_n (CPU_data_master_rdv_fifo_empty_SDRAM_s1),
      .full                 (),
      .read                 (SDRAM_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~SDRAM_s1_waits_for_read)
    );

  assign CPU_data_master_read_data_valid_SDRAM_s1_shift_register = ~CPU_data_master_rdv_fifo_empty_SDRAM_s1;
  //local readdatavalid CPU_data_master_read_data_valid_SDRAM_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_SDRAM_s1 = (SDRAM_s1_readdatavalid_from_sa & CPU_data_master_rdv_fifo_output_from_SDRAM_s1) & ~ CPU_data_master_rdv_fifo_empty_SDRAM_s1;

  //SDRAM_s1_writedata mux, which is an e_mux
  assign SDRAM_s1_writedata = CPU_data_master_dbs_write_16;

  assign CPU_instruction_master_requests_SDRAM_s1 = (({CPU_instruction_master_address_to_slave[27 : 23] , 23'b0} == 28'h0) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted SDRAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_SDRAM_s1 <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_SDRAM_s1 <= CPU_data_master_saved_grant_SDRAM_s1 ? 1 : (SDRAM_s1_arbitration_holdoff_internal | ~CPU_data_master_requests_SDRAM_s1) ? 0 : last_cycle_CPU_data_master_granted_slave_SDRAM_s1;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_SDRAM_s1 & CPU_data_master_requests_SDRAM_s1;

  assign CPU_instruction_master_qualified_request_SDRAM_s1 = CPU_instruction_master_requests_SDRAM_s1 & ~((CPU_instruction_master_read & ((|CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register))) | CPU_data_master_arbiterlock);
  //rdv_fifo_for_CPU_instruction_master_to_SDRAM_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_CPU_instruction_master_to_SDRAM_s1_module rdv_fifo_for_CPU_instruction_master_to_SDRAM_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (CPU_instruction_master_granted_SDRAM_s1),
      .data_out             (CPU_instruction_master_rdv_fifo_output_from_SDRAM_s1),
      .empty                (),
      .fifo_contains_ones_n (CPU_instruction_master_rdv_fifo_empty_SDRAM_s1),
      .full                 (),
      .read                 (SDRAM_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~SDRAM_s1_waits_for_read)
    );

  assign CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register = ~CPU_instruction_master_rdv_fifo_empty_SDRAM_s1;
  //local readdatavalid CPU_instruction_master_read_data_valid_SDRAM_s1, which is an e_mux
  assign CPU_instruction_master_read_data_valid_SDRAM_s1 = (SDRAM_s1_readdatavalid_from_sa & CPU_instruction_master_rdv_fifo_output_from_SDRAM_s1) & ~ CPU_instruction_master_rdv_fifo_empty_SDRAM_s1;

  //allow new arb cycle for SDRAM/s1, which is an e_assign
  assign SDRAM_s1_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for SDRAM/s1, which is an e_assign
  assign SDRAM_s1_master_qreq_vector[0] = CPU_instruction_master_qualified_request_SDRAM_s1;

  //CPU/instruction_master grant SDRAM/s1, which is an e_assign
  assign CPU_instruction_master_granted_SDRAM_s1 = SDRAM_s1_grant_vector[0];

  //CPU/instruction_master saved-grant SDRAM/s1, which is an e_assign
  assign CPU_instruction_master_saved_grant_SDRAM_s1 = SDRAM_s1_arb_winner[0] && CPU_instruction_master_requests_SDRAM_s1;

  //CPU/data_master assignment into master qualified-requests vector for SDRAM/s1, which is an e_assign
  assign SDRAM_s1_master_qreq_vector[1] = CPU_data_master_qualified_request_SDRAM_s1;

  //CPU/data_master grant SDRAM/s1, which is an e_assign
  assign CPU_data_master_granted_SDRAM_s1 = SDRAM_s1_grant_vector[1];

  //CPU/data_master saved-grant SDRAM/s1, which is an e_assign
  assign CPU_data_master_saved_grant_SDRAM_s1 = SDRAM_s1_arb_winner[1] && CPU_data_master_requests_SDRAM_s1;

  //SDRAM/s1 chosen-master double-vector, which is an e_assign
  assign SDRAM_s1_chosen_master_double_vector = {SDRAM_s1_master_qreq_vector, SDRAM_s1_master_qreq_vector} & ({~SDRAM_s1_master_qreq_vector, ~SDRAM_s1_master_qreq_vector} + SDRAM_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign SDRAM_s1_arb_winner = (SDRAM_s1_allow_new_arb_cycle & | SDRAM_s1_grant_vector) ? SDRAM_s1_grant_vector : SDRAM_s1_saved_chosen_master_vector;

  //saved SDRAM_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_s1_saved_chosen_master_vector <= 0;
      else if (SDRAM_s1_allow_new_arb_cycle)
          SDRAM_s1_saved_chosen_master_vector <= |SDRAM_s1_grant_vector ? SDRAM_s1_grant_vector : SDRAM_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign SDRAM_s1_grant_vector = {(SDRAM_s1_chosen_master_double_vector[1] | SDRAM_s1_chosen_master_double_vector[3]),
    (SDRAM_s1_chosen_master_double_vector[0] | SDRAM_s1_chosen_master_double_vector[2])};

  //SDRAM/s1 chosen master rotated left, which is an e_assign
  assign SDRAM_s1_chosen_master_rot_left = (SDRAM_s1_arb_winner << 1) ? (SDRAM_s1_arb_winner << 1) : 1;

  //SDRAM/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_s1_arb_addend <= 1;
      else if (|SDRAM_s1_grant_vector)
          SDRAM_s1_arb_addend <= SDRAM_s1_end_xfer? SDRAM_s1_chosen_master_rot_left : SDRAM_s1_grant_vector;
    end


  //SDRAM_s1_reset_n assignment, which is an e_assign
  assign SDRAM_s1_reset_n = reset_n;

  assign SDRAM_s1_chipselect = CPU_data_master_granted_SDRAM_s1 | CPU_instruction_master_granted_SDRAM_s1;
  //SDRAM_s1_firsttransfer first transaction, which is an e_assign
  assign SDRAM_s1_firsttransfer = SDRAM_s1_begins_xfer ? SDRAM_s1_unreg_firsttransfer : SDRAM_s1_reg_firsttransfer;

  //SDRAM_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign SDRAM_s1_unreg_firsttransfer = ~(SDRAM_s1_slavearbiterlockenable & SDRAM_s1_any_continuerequest);

  //SDRAM_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_s1_reg_firsttransfer <= 1'b1;
      else if (SDRAM_s1_begins_xfer)
          SDRAM_s1_reg_firsttransfer <= SDRAM_s1_unreg_firsttransfer;
    end


  //SDRAM_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign SDRAM_s1_beginbursttransfer_internal = SDRAM_s1_begins_xfer;

  //SDRAM_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign SDRAM_s1_arbitration_holdoff_internal = SDRAM_s1_begins_xfer & SDRAM_s1_firsttransfer;

  //~SDRAM_s1_read_n assignment, which is an e_mux
  assign SDRAM_s1_read_n = ~((CPU_data_master_granted_SDRAM_s1 & CPU_data_master_read) | (CPU_instruction_master_granted_SDRAM_s1 & CPU_instruction_master_read));

  //~SDRAM_s1_write_n assignment, which is an e_mux
  assign SDRAM_s1_write_n = ~(CPU_data_master_granted_SDRAM_s1 & CPU_data_master_write);

  assign shifted_address_to_SDRAM_s1_from_CPU_data_master = {CPU_data_master_address_to_slave >> 2,
    CPU_data_master_dbs_address[1],
    {1 {1'b0}}};

  //SDRAM_s1_address mux, which is an e_mux
  assign SDRAM_s1_address = (CPU_data_master_granted_SDRAM_s1)? (shifted_address_to_SDRAM_s1_from_CPU_data_master >> 1) :
    (shifted_address_to_SDRAM_s1_from_CPU_instruction_master >> 1);

  assign shifted_address_to_SDRAM_s1_from_CPU_instruction_master = {CPU_instruction_master_address_to_slave >> 2,
    CPU_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_SDRAM_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_SDRAM_s1_end_xfer <= 1;
      else 
        d1_SDRAM_s1_end_xfer <= SDRAM_s1_end_xfer;
    end


  //SDRAM_s1_waits_for_read in a cycle, which is an e_mux
  assign SDRAM_s1_waits_for_read = SDRAM_s1_in_a_read_cycle & SDRAM_s1_waitrequest_from_sa;

  //SDRAM_s1_in_a_read_cycle assignment, which is an e_assign
  assign SDRAM_s1_in_a_read_cycle = (CPU_data_master_granted_SDRAM_s1 & CPU_data_master_read) | (CPU_instruction_master_granted_SDRAM_s1 & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = SDRAM_s1_in_a_read_cycle;

  //SDRAM_s1_waits_for_write in a cycle, which is an e_mux
  assign SDRAM_s1_waits_for_write = SDRAM_s1_in_a_write_cycle & SDRAM_s1_waitrequest_from_sa;

  //SDRAM_s1_in_a_write_cycle assignment, which is an e_assign
  assign SDRAM_s1_in_a_write_cycle = CPU_data_master_granted_SDRAM_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = SDRAM_s1_in_a_write_cycle;

  assign wait_for_SDRAM_s1_counter = 0;
  //~SDRAM_s1_byteenable_n byte enable port mux, which is an e_mux
  assign SDRAM_s1_byteenable_n = ~((CPU_data_master_granted_SDRAM_s1)? CPU_data_master_byteenable_SDRAM_s1 :
    -1);

  assign {CPU_data_master_byteenable_SDRAM_s1_segment_1,
CPU_data_master_byteenable_SDRAM_s1_segment_0} = CPU_data_master_byteenable;
  assign CPU_data_master_byteenable_SDRAM_s1 = ((CPU_data_master_dbs_address[1] == 0))? CPU_data_master_byteenable_SDRAM_s1_segment_0 :
    CPU_data_master_byteenable_SDRAM_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //SDRAM/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_granted_SDRAM_s1 + CPU_instruction_master_granted_SDRAM_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_SDRAM_s1 + CPU_instruction_master_saved_grant_SDRAM_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_CPU_data_master_to_SRAM_avalon_sram_slave_module (
                                                                       // inputs:
                                                                        clear_fifo,
                                                                        clk,
                                                                        data_in,
                                                                        read,
                                                                        reset_n,
                                                                        sync_reset,
                                                                        write,

                                                                       // outputs:
                                                                        data_out,
                                                                        empty,
                                                                        fifo_contains_ones_n,
                                                                        full
                                                                     )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_CPU_instruction_master_to_SRAM_avalon_sram_slave_module (
                                                                              // inputs:
                                                                               clear_fifo,
                                                                               clk,
                                                                               data_in,
                                                                               read,
                                                                               reset_n,
                                                                               sync_reset,
                                                                               write,

                                                                              // outputs:
                                                                               data_out,
                                                                               empty,
                                                                               fifo_contains_ones_n,
                                                                               full
                                                                            )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SRAM_avalon_sram_slave_arbitrator (
                                           // inputs:
                                            CPU_data_master_address_to_slave,
                                            CPU_data_master_byteenable,
                                            CPU_data_master_dbs_address,
                                            CPU_data_master_dbs_write_16,
                                            CPU_data_master_no_byte_enables_and_last_term,
                                            CPU_data_master_read,
                                            CPU_data_master_waitrequest,
                                            CPU_data_master_write,
                                            CPU_instruction_master_address_to_slave,
                                            CPU_instruction_master_dbs_address,
                                            CPU_instruction_master_read,
                                            SRAM_avalon_sram_slave_readdata,
                                            SRAM_avalon_sram_slave_readdatavalid,
                                            clk,
                                            reset_n,

                                           // outputs:
                                            CPU_data_master_byteenable_SRAM_avalon_sram_slave,
                                            CPU_data_master_granted_SRAM_avalon_sram_slave,
                                            CPU_data_master_qualified_request_SRAM_avalon_sram_slave,
                                            CPU_data_master_read_data_valid_SRAM_avalon_sram_slave,
                                            CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register,
                                            CPU_data_master_requests_SRAM_avalon_sram_slave,
                                            CPU_instruction_master_granted_SRAM_avalon_sram_slave,
                                            CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave,
                                            CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave,
                                            CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register,
                                            CPU_instruction_master_requests_SRAM_avalon_sram_slave,
                                            SRAM_avalon_sram_slave_address,
                                            SRAM_avalon_sram_slave_byteenable,
                                            SRAM_avalon_sram_slave_read,
                                            SRAM_avalon_sram_slave_readdata_from_sa,
                                            SRAM_avalon_sram_slave_reset,
                                            SRAM_avalon_sram_slave_write,
                                            SRAM_avalon_sram_slave_writedata,
                                            d1_SRAM_avalon_sram_slave_end_xfer
                                         )
;

  output  [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave;
  output           CPU_data_master_granted_SRAM_avalon_sram_slave;
  output           CPU_data_master_qualified_request_SRAM_avalon_sram_slave;
  output           CPU_data_master_read_data_valid_SRAM_avalon_sram_slave;
  output           CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  output           CPU_data_master_requests_SRAM_avalon_sram_slave;
  output           CPU_instruction_master_granted_SRAM_avalon_sram_slave;
  output           CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave;
  output           CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave;
  output           CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  output           CPU_instruction_master_requests_SRAM_avalon_sram_slave;
  output  [ 17: 0] SRAM_avalon_sram_slave_address;
  output  [  1: 0] SRAM_avalon_sram_slave_byteenable;
  output           SRAM_avalon_sram_slave_read;
  output  [ 15: 0] SRAM_avalon_sram_slave_readdata_from_sa;
  output           SRAM_avalon_sram_slave_reset;
  output           SRAM_avalon_sram_slave_write;
  output  [ 15: 0] SRAM_avalon_sram_slave_writedata;
  output           d1_SRAM_avalon_sram_slave_end_xfer;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_dbs_address;
  input   [ 15: 0] CPU_data_master_dbs_write_16;
  input            CPU_data_master_no_byte_enables_and_last_term;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input   [  1: 0] CPU_instruction_master_dbs_address;
  input            CPU_instruction_master_read;
  input   [ 15: 0] SRAM_avalon_sram_slave_readdata;
  input            SRAM_avalon_sram_slave_readdatavalid;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire    [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave;
  wire    [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_0;
  wire    [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_1;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_SRAM_avalon_sram_slave;
  wire             CPU_data_master_qualified_request_SRAM_avalon_sram_slave;
  wire             CPU_data_master_rdv_fifo_empty_SRAM_avalon_sram_slave;
  wire             CPU_data_master_rdv_fifo_output_from_SRAM_avalon_sram_slave;
  wire             CPU_data_master_read_data_valid_SRAM_avalon_sram_slave;
  wire             CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  wire             CPU_data_master_requests_SRAM_avalon_sram_slave;
  wire             CPU_data_master_saved_grant_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_rdv_fifo_empty_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_rdv_fifo_output_from_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  wire             CPU_instruction_master_requests_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_saved_grant_SRAM_avalon_sram_slave;
  wire    [ 17: 0] SRAM_avalon_sram_slave_address;
  wire             SRAM_avalon_sram_slave_allgrants;
  wire             SRAM_avalon_sram_slave_allow_new_arb_cycle;
  wire             SRAM_avalon_sram_slave_any_bursting_master_saved_grant;
  wire             SRAM_avalon_sram_slave_any_continuerequest;
  reg     [  1: 0] SRAM_avalon_sram_slave_arb_addend;
  wire             SRAM_avalon_sram_slave_arb_counter_enable;
  reg     [  1: 0] SRAM_avalon_sram_slave_arb_share_counter;
  wire    [  1: 0] SRAM_avalon_sram_slave_arb_share_counter_next_value;
  wire    [  1: 0] SRAM_avalon_sram_slave_arb_share_set_values;
  wire    [  1: 0] SRAM_avalon_sram_slave_arb_winner;
  wire             SRAM_avalon_sram_slave_arbitration_holdoff_internal;
  wire             SRAM_avalon_sram_slave_beginbursttransfer_internal;
  wire             SRAM_avalon_sram_slave_begins_xfer;
  wire    [  1: 0] SRAM_avalon_sram_slave_byteenable;
  wire    [  3: 0] SRAM_avalon_sram_slave_chosen_master_double_vector;
  wire    [  1: 0] SRAM_avalon_sram_slave_chosen_master_rot_left;
  wire             SRAM_avalon_sram_slave_end_xfer;
  wire             SRAM_avalon_sram_slave_firsttransfer;
  wire    [  1: 0] SRAM_avalon_sram_slave_grant_vector;
  wire             SRAM_avalon_sram_slave_in_a_read_cycle;
  wire             SRAM_avalon_sram_slave_in_a_write_cycle;
  wire    [  1: 0] SRAM_avalon_sram_slave_master_qreq_vector;
  wire             SRAM_avalon_sram_slave_move_on_to_next_transaction;
  wire             SRAM_avalon_sram_slave_non_bursting_master_requests;
  wire             SRAM_avalon_sram_slave_read;
  wire    [ 15: 0] SRAM_avalon_sram_slave_readdata_from_sa;
  wire             SRAM_avalon_sram_slave_readdatavalid_from_sa;
  reg              SRAM_avalon_sram_slave_reg_firsttransfer;
  wire             SRAM_avalon_sram_slave_reset;
  reg     [  1: 0] SRAM_avalon_sram_slave_saved_chosen_master_vector;
  reg              SRAM_avalon_sram_slave_slavearbiterlockenable;
  wire             SRAM_avalon_sram_slave_slavearbiterlockenable2;
  wire             SRAM_avalon_sram_slave_unreg_firsttransfer;
  wire             SRAM_avalon_sram_slave_waits_for_read;
  wire             SRAM_avalon_sram_slave_waits_for_write;
  wire             SRAM_avalon_sram_slave_write;
  wire    [ 15: 0] SRAM_avalon_sram_slave_writedata;
  reg              d1_SRAM_avalon_sram_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_SRAM_avalon_sram_slave;
  reg              last_cycle_CPU_instruction_master_granted_slave_SRAM_avalon_sram_slave;
  wire    [ 28: 0] shifted_address_to_SRAM_avalon_sram_slave_from_CPU_data_master;
  wire    [ 27: 0] shifted_address_to_SRAM_avalon_sram_slave_from_CPU_instruction_master;
  wire             wait_for_SRAM_avalon_sram_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~SRAM_avalon_sram_slave_end_xfer;
    end


  assign SRAM_avalon_sram_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_SRAM_avalon_sram_slave | CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave));
  //assign SRAM_avalon_sram_slave_readdata_from_sa = SRAM_avalon_sram_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SRAM_avalon_sram_slave_readdata_from_sa = SRAM_avalon_sram_slave_readdata;

  assign CPU_data_master_requests_SRAM_avalon_sram_slave = ({CPU_data_master_address_to_slave[28 : 19] , 19'b0} == 29'h8000000) & (CPU_data_master_read | CPU_data_master_write);
  //assign SRAM_avalon_sram_slave_readdatavalid_from_sa = SRAM_avalon_sram_slave_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SRAM_avalon_sram_slave_readdatavalid_from_sa = SRAM_avalon_sram_slave_readdatavalid;

  //SRAM_avalon_sram_slave_arb_share_counter set values, which is an e_mux
  assign SRAM_avalon_sram_slave_arb_share_set_values = (CPU_data_master_granted_SRAM_avalon_sram_slave)? 2 :
    (CPU_instruction_master_granted_SRAM_avalon_sram_slave)? 2 :
    (CPU_data_master_granted_SRAM_avalon_sram_slave)? 2 :
    (CPU_instruction_master_granted_SRAM_avalon_sram_slave)? 2 :
    1;

  //SRAM_avalon_sram_slave_non_bursting_master_requests mux, which is an e_mux
  assign SRAM_avalon_sram_slave_non_bursting_master_requests = CPU_data_master_requests_SRAM_avalon_sram_slave |
    CPU_instruction_master_requests_SRAM_avalon_sram_slave |
    CPU_data_master_requests_SRAM_avalon_sram_slave |
    CPU_instruction_master_requests_SRAM_avalon_sram_slave;

  //SRAM_avalon_sram_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign SRAM_avalon_sram_slave_any_bursting_master_saved_grant = 0;

  //SRAM_avalon_sram_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign SRAM_avalon_sram_slave_arb_share_counter_next_value = SRAM_avalon_sram_slave_firsttransfer ? (SRAM_avalon_sram_slave_arb_share_set_values - 1) : |SRAM_avalon_sram_slave_arb_share_counter ? (SRAM_avalon_sram_slave_arb_share_counter - 1) : 0;

  //SRAM_avalon_sram_slave_allgrants all slave grants, which is an e_mux
  assign SRAM_avalon_sram_slave_allgrants = (|SRAM_avalon_sram_slave_grant_vector) |
    (|SRAM_avalon_sram_slave_grant_vector) |
    (|SRAM_avalon_sram_slave_grant_vector) |
    (|SRAM_avalon_sram_slave_grant_vector);

  //SRAM_avalon_sram_slave_end_xfer assignment, which is an e_assign
  assign SRAM_avalon_sram_slave_end_xfer = ~(SRAM_avalon_sram_slave_waits_for_read | SRAM_avalon_sram_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_end_xfer & (~SRAM_avalon_sram_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //SRAM_avalon_sram_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign SRAM_avalon_sram_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave & SRAM_avalon_sram_slave_allgrants) | (end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave & ~SRAM_avalon_sram_slave_non_bursting_master_requests);

  //SRAM_avalon_sram_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SRAM_avalon_sram_slave_arb_share_counter <= 0;
      else if (SRAM_avalon_sram_slave_arb_counter_enable)
          SRAM_avalon_sram_slave_arb_share_counter <= SRAM_avalon_sram_slave_arb_share_counter_next_value;
    end


  //SRAM_avalon_sram_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SRAM_avalon_sram_slave_slavearbiterlockenable <= 0;
      else if ((|SRAM_avalon_sram_slave_master_qreq_vector & end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave) | (end_xfer_arb_share_counter_term_SRAM_avalon_sram_slave & ~SRAM_avalon_sram_slave_non_bursting_master_requests))
          SRAM_avalon_sram_slave_slavearbiterlockenable <= |SRAM_avalon_sram_slave_arb_share_counter_next_value;
    end


  //CPU/data_master SRAM/avalon_sram_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = SRAM_avalon_sram_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //SRAM_avalon_sram_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign SRAM_avalon_sram_slave_slavearbiterlockenable2 = |SRAM_avalon_sram_slave_arb_share_counter_next_value;

  //CPU/data_master SRAM/avalon_sram_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = SRAM_avalon_sram_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master SRAM/avalon_sram_slave arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = SRAM_avalon_sram_slave_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master SRAM/avalon_sram_slave arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = SRAM_avalon_sram_slave_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted SRAM/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_SRAM_avalon_sram_slave <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_SRAM_avalon_sram_slave <= CPU_instruction_master_saved_grant_SRAM_avalon_sram_slave ? 1 : (SRAM_avalon_sram_slave_arbitration_holdoff_internal | ~CPU_instruction_master_requests_SRAM_avalon_sram_slave) ? 0 : last_cycle_CPU_instruction_master_granted_slave_SRAM_avalon_sram_slave;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_SRAM_avalon_sram_slave & CPU_instruction_master_requests_SRAM_avalon_sram_slave;

  //SRAM_avalon_sram_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign SRAM_avalon_sram_slave_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_SRAM_avalon_sram_slave = CPU_data_master_requests_SRAM_avalon_sram_slave & ~((CPU_data_master_read & (~CPU_data_master_waitrequest | (|CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register))) | ((~CPU_data_master_waitrequest | CPU_data_master_no_byte_enables_and_last_term | !CPU_data_master_byteenable_SRAM_avalon_sram_slave) & CPU_data_master_write) | CPU_instruction_master_arbiterlock);
  //unique name for SRAM_avalon_sram_slave_move_on_to_next_transaction, which is an e_assign
  assign SRAM_avalon_sram_slave_move_on_to_next_transaction = SRAM_avalon_sram_slave_readdatavalid_from_sa;

  //rdv_fifo_for_CPU_data_master_to_SRAM_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_CPU_data_master_to_SRAM_avalon_sram_slave_module rdv_fifo_for_CPU_data_master_to_SRAM_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (CPU_data_master_granted_SRAM_avalon_sram_slave),
      .data_out             (CPU_data_master_rdv_fifo_output_from_SRAM_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (CPU_data_master_rdv_fifo_empty_SRAM_avalon_sram_slave),
      .full                 (),
      .read                 (SRAM_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~SRAM_avalon_sram_slave_waits_for_read)
    );

  assign CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register = ~CPU_data_master_rdv_fifo_empty_SRAM_avalon_sram_slave;
  //local readdatavalid CPU_data_master_read_data_valid_SRAM_avalon_sram_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_SRAM_avalon_sram_slave = (SRAM_avalon_sram_slave_readdatavalid_from_sa & CPU_data_master_rdv_fifo_output_from_SRAM_avalon_sram_slave) & ~ CPU_data_master_rdv_fifo_empty_SRAM_avalon_sram_slave;

  //SRAM_avalon_sram_slave_writedata mux, which is an e_mux
  assign SRAM_avalon_sram_slave_writedata = CPU_data_master_dbs_write_16;

  assign CPU_instruction_master_requests_SRAM_avalon_sram_slave = (({CPU_instruction_master_address_to_slave[27 : 19] , 19'b0} == 28'h8000000) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted SRAM/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_SRAM_avalon_sram_slave <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_SRAM_avalon_sram_slave <= CPU_data_master_saved_grant_SRAM_avalon_sram_slave ? 1 : (SRAM_avalon_sram_slave_arbitration_holdoff_internal | ~CPU_data_master_requests_SRAM_avalon_sram_slave) ? 0 : last_cycle_CPU_data_master_granted_slave_SRAM_avalon_sram_slave;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_SRAM_avalon_sram_slave & CPU_data_master_requests_SRAM_avalon_sram_slave;

  assign CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave = CPU_instruction_master_requests_SRAM_avalon_sram_slave & ~((CPU_instruction_master_read & ((|CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register))) | CPU_data_master_arbiterlock);
  //rdv_fifo_for_CPU_instruction_master_to_SRAM_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_CPU_instruction_master_to_SRAM_avalon_sram_slave_module rdv_fifo_for_CPU_instruction_master_to_SRAM_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (CPU_instruction_master_granted_SRAM_avalon_sram_slave),
      .data_out             (CPU_instruction_master_rdv_fifo_output_from_SRAM_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (CPU_instruction_master_rdv_fifo_empty_SRAM_avalon_sram_slave),
      .full                 (),
      .read                 (SRAM_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~SRAM_avalon_sram_slave_waits_for_read)
    );

  assign CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register = ~CPU_instruction_master_rdv_fifo_empty_SRAM_avalon_sram_slave;
  //local readdatavalid CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave, which is an e_mux
  assign CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave = (SRAM_avalon_sram_slave_readdatavalid_from_sa & CPU_instruction_master_rdv_fifo_output_from_SRAM_avalon_sram_slave) & ~ CPU_instruction_master_rdv_fifo_empty_SRAM_avalon_sram_slave;

  //allow new arb cycle for SRAM/avalon_sram_slave, which is an e_assign
  assign SRAM_avalon_sram_slave_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for SRAM/avalon_sram_slave, which is an e_assign
  assign SRAM_avalon_sram_slave_master_qreq_vector[0] = CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave;

  //CPU/instruction_master grant SRAM/avalon_sram_slave, which is an e_assign
  assign CPU_instruction_master_granted_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_grant_vector[0];

  //CPU/instruction_master saved-grant SRAM/avalon_sram_slave, which is an e_assign
  assign CPU_instruction_master_saved_grant_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_arb_winner[0] && CPU_instruction_master_requests_SRAM_avalon_sram_slave;

  //CPU/data_master assignment into master qualified-requests vector for SRAM/avalon_sram_slave, which is an e_assign
  assign SRAM_avalon_sram_slave_master_qreq_vector[1] = CPU_data_master_qualified_request_SRAM_avalon_sram_slave;

  //CPU/data_master grant SRAM/avalon_sram_slave, which is an e_assign
  assign CPU_data_master_granted_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_grant_vector[1];

  //CPU/data_master saved-grant SRAM/avalon_sram_slave, which is an e_assign
  assign CPU_data_master_saved_grant_SRAM_avalon_sram_slave = SRAM_avalon_sram_slave_arb_winner[1] && CPU_data_master_requests_SRAM_avalon_sram_slave;

  //SRAM/avalon_sram_slave chosen-master double-vector, which is an e_assign
  assign SRAM_avalon_sram_slave_chosen_master_double_vector = {SRAM_avalon_sram_slave_master_qreq_vector, SRAM_avalon_sram_slave_master_qreq_vector} & ({~SRAM_avalon_sram_slave_master_qreq_vector, ~SRAM_avalon_sram_slave_master_qreq_vector} + SRAM_avalon_sram_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign SRAM_avalon_sram_slave_arb_winner = (SRAM_avalon_sram_slave_allow_new_arb_cycle & | SRAM_avalon_sram_slave_grant_vector) ? SRAM_avalon_sram_slave_grant_vector : SRAM_avalon_sram_slave_saved_chosen_master_vector;

  //saved SRAM_avalon_sram_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SRAM_avalon_sram_slave_saved_chosen_master_vector <= 0;
      else if (SRAM_avalon_sram_slave_allow_new_arb_cycle)
          SRAM_avalon_sram_slave_saved_chosen_master_vector <= |SRAM_avalon_sram_slave_grant_vector ? SRAM_avalon_sram_slave_grant_vector : SRAM_avalon_sram_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign SRAM_avalon_sram_slave_grant_vector = {(SRAM_avalon_sram_slave_chosen_master_double_vector[1] | SRAM_avalon_sram_slave_chosen_master_double_vector[3]),
    (SRAM_avalon_sram_slave_chosen_master_double_vector[0] | SRAM_avalon_sram_slave_chosen_master_double_vector[2])};

  //SRAM/avalon_sram_slave chosen master rotated left, which is an e_assign
  assign SRAM_avalon_sram_slave_chosen_master_rot_left = (SRAM_avalon_sram_slave_arb_winner << 1) ? (SRAM_avalon_sram_slave_arb_winner << 1) : 1;

  //SRAM/avalon_sram_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SRAM_avalon_sram_slave_arb_addend <= 1;
      else if (|SRAM_avalon_sram_slave_grant_vector)
          SRAM_avalon_sram_slave_arb_addend <= SRAM_avalon_sram_slave_end_xfer? SRAM_avalon_sram_slave_chosen_master_rot_left : SRAM_avalon_sram_slave_grant_vector;
    end


  //~SRAM_avalon_sram_slave_reset assignment, which is an e_assign
  assign SRAM_avalon_sram_slave_reset = ~reset_n;

  //SRAM_avalon_sram_slave_firsttransfer first transaction, which is an e_assign
  assign SRAM_avalon_sram_slave_firsttransfer = SRAM_avalon_sram_slave_begins_xfer ? SRAM_avalon_sram_slave_unreg_firsttransfer : SRAM_avalon_sram_slave_reg_firsttransfer;

  //SRAM_avalon_sram_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign SRAM_avalon_sram_slave_unreg_firsttransfer = ~(SRAM_avalon_sram_slave_slavearbiterlockenable & SRAM_avalon_sram_slave_any_continuerequest);

  //SRAM_avalon_sram_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SRAM_avalon_sram_slave_reg_firsttransfer <= 1'b1;
      else if (SRAM_avalon_sram_slave_begins_xfer)
          SRAM_avalon_sram_slave_reg_firsttransfer <= SRAM_avalon_sram_slave_unreg_firsttransfer;
    end


  //SRAM_avalon_sram_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign SRAM_avalon_sram_slave_beginbursttransfer_internal = SRAM_avalon_sram_slave_begins_xfer;

  //SRAM_avalon_sram_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign SRAM_avalon_sram_slave_arbitration_holdoff_internal = SRAM_avalon_sram_slave_begins_xfer & SRAM_avalon_sram_slave_firsttransfer;

  //SRAM_avalon_sram_slave_read assignment, which is an e_mux
  assign SRAM_avalon_sram_slave_read = (CPU_data_master_granted_SRAM_avalon_sram_slave & CPU_data_master_read) | (CPU_instruction_master_granted_SRAM_avalon_sram_slave & CPU_instruction_master_read);

  //SRAM_avalon_sram_slave_write assignment, which is an e_mux
  assign SRAM_avalon_sram_slave_write = CPU_data_master_granted_SRAM_avalon_sram_slave & CPU_data_master_write;

  assign shifted_address_to_SRAM_avalon_sram_slave_from_CPU_data_master = {CPU_data_master_address_to_slave >> 2,
    CPU_data_master_dbs_address[1],
    {1 {1'b0}}};

  //SRAM_avalon_sram_slave_address mux, which is an e_mux
  assign SRAM_avalon_sram_slave_address = (CPU_data_master_granted_SRAM_avalon_sram_slave)? (shifted_address_to_SRAM_avalon_sram_slave_from_CPU_data_master >> 1) :
    (shifted_address_to_SRAM_avalon_sram_slave_from_CPU_instruction_master >> 1);

  assign shifted_address_to_SRAM_avalon_sram_slave_from_CPU_instruction_master = {CPU_instruction_master_address_to_slave >> 2,
    CPU_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_SRAM_avalon_sram_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_SRAM_avalon_sram_slave_end_xfer <= 1;
      else 
        d1_SRAM_avalon_sram_slave_end_xfer <= SRAM_avalon_sram_slave_end_xfer;
    end


  //SRAM_avalon_sram_slave_waits_for_read in a cycle, which is an e_mux
  assign SRAM_avalon_sram_slave_waits_for_read = SRAM_avalon_sram_slave_in_a_read_cycle & 0;

  //SRAM_avalon_sram_slave_in_a_read_cycle assignment, which is an e_assign
  assign SRAM_avalon_sram_slave_in_a_read_cycle = (CPU_data_master_granted_SRAM_avalon_sram_slave & CPU_data_master_read) | (CPU_instruction_master_granted_SRAM_avalon_sram_slave & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = SRAM_avalon_sram_slave_in_a_read_cycle;

  //SRAM_avalon_sram_slave_waits_for_write in a cycle, which is an e_mux
  assign SRAM_avalon_sram_slave_waits_for_write = SRAM_avalon_sram_slave_in_a_write_cycle & 0;

  //SRAM_avalon_sram_slave_in_a_write_cycle assignment, which is an e_assign
  assign SRAM_avalon_sram_slave_in_a_write_cycle = CPU_data_master_granted_SRAM_avalon_sram_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = SRAM_avalon_sram_slave_in_a_write_cycle;

  assign wait_for_SRAM_avalon_sram_slave_counter = 0;
  //SRAM_avalon_sram_slave_byteenable byte enable port mux, which is an e_mux
  assign SRAM_avalon_sram_slave_byteenable = (CPU_data_master_granted_SRAM_avalon_sram_slave)? CPU_data_master_byteenable_SRAM_avalon_sram_slave :
    -1;

  assign {CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_1,
CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_0} = CPU_data_master_byteenable;
  assign CPU_data_master_byteenable_SRAM_avalon_sram_slave = ((CPU_data_master_dbs_address[1] == 0))? CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_0 :
    CPU_data_master_byteenable_SRAM_avalon_sram_slave_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //SRAM/avalon_sram_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_granted_SRAM_avalon_sram_slave + CPU_instruction_master_granted_SRAM_avalon_sram_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_SRAM_avalon_sram_slave + CPU_instruction_master_saved_grant_SRAM_avalon_sram_slave > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Serial_port_avalon_rs232_slave_arbitrator (
                                                   // inputs:
                                                    CPU_data_master_address_to_slave,
                                                    CPU_data_master_byteenable,
                                                    CPU_data_master_read,
                                                    CPU_data_master_waitrequest,
                                                    CPU_data_master_write,
                                                    CPU_data_master_writedata,
                                                    Serial_port_avalon_rs232_slave_irq,
                                                    Serial_port_avalon_rs232_slave_readdata,
                                                    clk,
                                                    reset_n,

                                                   // outputs:
                                                    CPU_data_master_granted_Serial_port_avalon_rs232_slave,
                                                    CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave,
                                                    CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave,
                                                    CPU_data_master_requests_Serial_port_avalon_rs232_slave,
                                                    Serial_port_avalon_rs232_slave_address,
                                                    Serial_port_avalon_rs232_slave_byteenable,
                                                    Serial_port_avalon_rs232_slave_chipselect,
                                                    Serial_port_avalon_rs232_slave_irq_from_sa,
                                                    Serial_port_avalon_rs232_slave_read,
                                                    Serial_port_avalon_rs232_slave_readdata_from_sa,
                                                    Serial_port_avalon_rs232_slave_reset,
                                                    Serial_port_avalon_rs232_slave_write,
                                                    Serial_port_avalon_rs232_slave_writedata,
                                                    d1_Serial_port_avalon_rs232_slave_end_xfer,
                                                    registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave
                                                 )
;

  output           CPU_data_master_granted_Serial_port_avalon_rs232_slave;
  output           CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave;
  output           CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave;
  output           CPU_data_master_requests_Serial_port_avalon_rs232_slave;
  output           Serial_port_avalon_rs232_slave_address;
  output  [  3: 0] Serial_port_avalon_rs232_slave_byteenable;
  output           Serial_port_avalon_rs232_slave_chipselect;
  output           Serial_port_avalon_rs232_slave_irq_from_sa;
  output           Serial_port_avalon_rs232_slave_read;
  output  [ 31: 0] Serial_port_avalon_rs232_slave_readdata_from_sa;
  output           Serial_port_avalon_rs232_slave_reset;
  output           Serial_port_avalon_rs232_slave_write;
  output  [ 31: 0] Serial_port_avalon_rs232_slave_writedata;
  output           d1_Serial_port_avalon_rs232_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Serial_port_avalon_rs232_slave_irq;
  input   [ 31: 0] Serial_port_avalon_rs232_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Serial_port_avalon_rs232_slave;
  wire             CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave;
  wire             CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave;
  reg              CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register_in;
  wire             CPU_data_master_requests_Serial_port_avalon_rs232_slave;
  wire             CPU_data_master_saved_grant_Serial_port_avalon_rs232_slave;
  wire             Serial_port_avalon_rs232_slave_address;
  wire             Serial_port_avalon_rs232_slave_allgrants;
  wire             Serial_port_avalon_rs232_slave_allow_new_arb_cycle;
  wire             Serial_port_avalon_rs232_slave_any_bursting_master_saved_grant;
  wire             Serial_port_avalon_rs232_slave_any_continuerequest;
  wire             Serial_port_avalon_rs232_slave_arb_counter_enable;
  reg     [  1: 0] Serial_port_avalon_rs232_slave_arb_share_counter;
  wire    [  1: 0] Serial_port_avalon_rs232_slave_arb_share_counter_next_value;
  wire    [  1: 0] Serial_port_avalon_rs232_slave_arb_share_set_values;
  wire             Serial_port_avalon_rs232_slave_beginbursttransfer_internal;
  wire             Serial_port_avalon_rs232_slave_begins_xfer;
  wire    [  3: 0] Serial_port_avalon_rs232_slave_byteenable;
  wire             Serial_port_avalon_rs232_slave_chipselect;
  wire             Serial_port_avalon_rs232_slave_end_xfer;
  wire             Serial_port_avalon_rs232_slave_firsttransfer;
  wire             Serial_port_avalon_rs232_slave_grant_vector;
  wire             Serial_port_avalon_rs232_slave_in_a_read_cycle;
  wire             Serial_port_avalon_rs232_slave_in_a_write_cycle;
  wire             Serial_port_avalon_rs232_slave_irq_from_sa;
  wire             Serial_port_avalon_rs232_slave_master_qreq_vector;
  wire             Serial_port_avalon_rs232_slave_non_bursting_master_requests;
  wire             Serial_port_avalon_rs232_slave_read;
  wire    [ 31: 0] Serial_port_avalon_rs232_slave_readdata_from_sa;
  reg              Serial_port_avalon_rs232_slave_reg_firsttransfer;
  wire             Serial_port_avalon_rs232_slave_reset;
  reg              Serial_port_avalon_rs232_slave_slavearbiterlockenable;
  wire             Serial_port_avalon_rs232_slave_slavearbiterlockenable2;
  wire             Serial_port_avalon_rs232_slave_unreg_firsttransfer;
  wire             Serial_port_avalon_rs232_slave_waits_for_read;
  wire             Serial_port_avalon_rs232_slave_waits_for_write;
  wire             Serial_port_avalon_rs232_slave_write;
  wire    [ 31: 0] Serial_port_avalon_rs232_slave_writedata;
  reg              d1_Serial_port_avalon_rs232_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Serial_port_avalon_rs232_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave;
  wire    [ 28: 0] shifted_address_to_Serial_port_avalon_rs232_slave_from_CPU_data_master;
  wire             wait_for_Serial_port_avalon_rs232_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Serial_port_avalon_rs232_slave_end_xfer;
    end


  assign Serial_port_avalon_rs232_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave));
  //assign Serial_port_avalon_rs232_slave_readdata_from_sa = Serial_port_avalon_rs232_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Serial_port_avalon_rs232_slave_readdata_from_sa = Serial_port_avalon_rs232_slave_readdata;

  assign CPU_data_master_requests_Serial_port_avalon_rs232_slave = ({CPU_data_master_address_to_slave[28 : 3] , 3'b0} == 29'h10001010) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave = CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register_in;

  //Serial_port_avalon_rs232_slave_arb_share_counter set values, which is an e_mux
  assign Serial_port_avalon_rs232_slave_arb_share_set_values = 1;

  //Serial_port_avalon_rs232_slave_non_bursting_master_requests mux, which is an e_mux
  assign Serial_port_avalon_rs232_slave_non_bursting_master_requests = CPU_data_master_requests_Serial_port_avalon_rs232_slave;

  //Serial_port_avalon_rs232_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Serial_port_avalon_rs232_slave_any_bursting_master_saved_grant = 0;

  //Serial_port_avalon_rs232_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Serial_port_avalon_rs232_slave_arb_share_counter_next_value = Serial_port_avalon_rs232_slave_firsttransfer ? (Serial_port_avalon_rs232_slave_arb_share_set_values - 1) : |Serial_port_avalon_rs232_slave_arb_share_counter ? (Serial_port_avalon_rs232_slave_arb_share_counter - 1) : 0;

  //Serial_port_avalon_rs232_slave_allgrants all slave grants, which is an e_mux
  assign Serial_port_avalon_rs232_slave_allgrants = |Serial_port_avalon_rs232_slave_grant_vector;

  //Serial_port_avalon_rs232_slave_end_xfer assignment, which is an e_assign
  assign Serial_port_avalon_rs232_slave_end_xfer = ~(Serial_port_avalon_rs232_slave_waits_for_read | Serial_port_avalon_rs232_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Serial_port_avalon_rs232_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Serial_port_avalon_rs232_slave = Serial_port_avalon_rs232_slave_end_xfer & (~Serial_port_avalon_rs232_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Serial_port_avalon_rs232_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Serial_port_avalon_rs232_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Serial_port_avalon_rs232_slave & Serial_port_avalon_rs232_slave_allgrants) | (end_xfer_arb_share_counter_term_Serial_port_avalon_rs232_slave & ~Serial_port_avalon_rs232_slave_non_bursting_master_requests);

  //Serial_port_avalon_rs232_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Serial_port_avalon_rs232_slave_arb_share_counter <= 0;
      else if (Serial_port_avalon_rs232_slave_arb_counter_enable)
          Serial_port_avalon_rs232_slave_arb_share_counter <= Serial_port_avalon_rs232_slave_arb_share_counter_next_value;
    end


  //Serial_port_avalon_rs232_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Serial_port_avalon_rs232_slave_slavearbiterlockenable <= 0;
      else if ((|Serial_port_avalon_rs232_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Serial_port_avalon_rs232_slave) | (end_xfer_arb_share_counter_term_Serial_port_avalon_rs232_slave & ~Serial_port_avalon_rs232_slave_non_bursting_master_requests))
          Serial_port_avalon_rs232_slave_slavearbiterlockenable <= |Serial_port_avalon_rs232_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Serial_port/avalon_rs232_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Serial_port_avalon_rs232_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Serial_port_avalon_rs232_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Serial_port_avalon_rs232_slave_slavearbiterlockenable2 = |Serial_port_avalon_rs232_slave_arb_share_counter_next_value;

  //CPU/data_master Serial_port/avalon_rs232_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Serial_port_avalon_rs232_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Serial_port_avalon_rs232_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Serial_port_avalon_rs232_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave = CPU_data_master_requests_Serial_port_avalon_rs232_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register_in = CPU_data_master_granted_Serial_port_avalon_rs232_slave & CPU_data_master_read & ~Serial_port_avalon_rs232_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register = {CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register, CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register <= p1_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave = CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave_shift_register;

  //Serial_port_avalon_rs232_slave_writedata mux, which is an e_mux
  assign Serial_port_avalon_rs232_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Serial_port_avalon_rs232_slave = CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave;

  //CPU/data_master saved-grant Serial_port/avalon_rs232_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Serial_port_avalon_rs232_slave = CPU_data_master_requests_Serial_port_avalon_rs232_slave;

  //allow new arb cycle for Serial_port/avalon_rs232_slave, which is an e_assign
  assign Serial_port_avalon_rs232_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Serial_port_avalon_rs232_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Serial_port_avalon_rs232_slave_master_qreq_vector = 1;

  //~Serial_port_avalon_rs232_slave_reset assignment, which is an e_assign
  assign Serial_port_avalon_rs232_slave_reset = ~reset_n;

  assign Serial_port_avalon_rs232_slave_chipselect = CPU_data_master_granted_Serial_port_avalon_rs232_slave;
  //Serial_port_avalon_rs232_slave_firsttransfer first transaction, which is an e_assign
  assign Serial_port_avalon_rs232_slave_firsttransfer = Serial_port_avalon_rs232_slave_begins_xfer ? Serial_port_avalon_rs232_slave_unreg_firsttransfer : Serial_port_avalon_rs232_slave_reg_firsttransfer;

  //Serial_port_avalon_rs232_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Serial_port_avalon_rs232_slave_unreg_firsttransfer = ~(Serial_port_avalon_rs232_slave_slavearbiterlockenable & Serial_port_avalon_rs232_slave_any_continuerequest);

  //Serial_port_avalon_rs232_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Serial_port_avalon_rs232_slave_reg_firsttransfer <= 1'b1;
      else if (Serial_port_avalon_rs232_slave_begins_xfer)
          Serial_port_avalon_rs232_slave_reg_firsttransfer <= Serial_port_avalon_rs232_slave_unreg_firsttransfer;
    end


  //Serial_port_avalon_rs232_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Serial_port_avalon_rs232_slave_beginbursttransfer_internal = Serial_port_avalon_rs232_slave_begins_xfer;

  //Serial_port_avalon_rs232_slave_read assignment, which is an e_mux
  assign Serial_port_avalon_rs232_slave_read = CPU_data_master_granted_Serial_port_avalon_rs232_slave & CPU_data_master_read;

  //Serial_port_avalon_rs232_slave_write assignment, which is an e_mux
  assign Serial_port_avalon_rs232_slave_write = CPU_data_master_granted_Serial_port_avalon_rs232_slave & CPU_data_master_write;

  assign shifted_address_to_Serial_port_avalon_rs232_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Serial_port_avalon_rs232_slave_address mux, which is an e_mux
  assign Serial_port_avalon_rs232_slave_address = shifted_address_to_Serial_port_avalon_rs232_slave_from_CPU_data_master >> 2;

  //d1_Serial_port_avalon_rs232_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Serial_port_avalon_rs232_slave_end_xfer <= 1;
      else 
        d1_Serial_port_avalon_rs232_slave_end_xfer <= Serial_port_avalon_rs232_slave_end_xfer;
    end


  //Serial_port_avalon_rs232_slave_waits_for_read in a cycle, which is an e_mux
  assign Serial_port_avalon_rs232_slave_waits_for_read = Serial_port_avalon_rs232_slave_in_a_read_cycle & 0;

  //Serial_port_avalon_rs232_slave_in_a_read_cycle assignment, which is an e_assign
  assign Serial_port_avalon_rs232_slave_in_a_read_cycle = CPU_data_master_granted_Serial_port_avalon_rs232_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Serial_port_avalon_rs232_slave_in_a_read_cycle;

  //Serial_port_avalon_rs232_slave_waits_for_write in a cycle, which is an e_mux
  assign Serial_port_avalon_rs232_slave_waits_for_write = Serial_port_avalon_rs232_slave_in_a_write_cycle & 0;

  //Serial_port_avalon_rs232_slave_in_a_write_cycle assignment, which is an e_assign
  assign Serial_port_avalon_rs232_slave_in_a_write_cycle = CPU_data_master_granted_Serial_port_avalon_rs232_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Serial_port_avalon_rs232_slave_in_a_write_cycle;

  assign wait_for_Serial_port_avalon_rs232_slave_counter = 0;
  //Serial_port_avalon_rs232_slave_byteenable byte enable port mux, which is an e_mux
  assign Serial_port_avalon_rs232_slave_byteenable = (CPU_data_master_granted_Serial_port_avalon_rs232_slave)? CPU_data_master_byteenable :
    -1;

  //assign Serial_port_avalon_rs232_slave_irq_from_sa = Serial_port_avalon_rs232_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Serial_port_avalon_rs232_slave_irq_from_sa = Serial_port_avalon_rs232_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Serial_port/avalon_rs232_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Slider_switches_avalon_parallel_port_slave_arbitrator (
                                                               // inputs:
                                                                CPU_data_master_address_to_slave,
                                                                CPU_data_master_byteenable,
                                                                CPU_data_master_read,
                                                                CPU_data_master_waitrequest,
                                                                CPU_data_master_write,
                                                                CPU_data_master_writedata,
                                                                Slider_switches_avalon_parallel_port_slave_readdata,
                                                                clk,
                                                                reset_n,

                                                               // outputs:
                                                                CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave,
                                                                CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave,
                                                                CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave,
                                                                CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave,
                                                                Slider_switches_avalon_parallel_port_slave_address,
                                                                Slider_switches_avalon_parallel_port_slave_byteenable,
                                                                Slider_switches_avalon_parallel_port_slave_chipselect,
                                                                Slider_switches_avalon_parallel_port_slave_read,
                                                                Slider_switches_avalon_parallel_port_slave_readdata_from_sa,
                                                                Slider_switches_avalon_parallel_port_slave_reset,
                                                                Slider_switches_avalon_parallel_port_slave_write,
                                                                Slider_switches_avalon_parallel_port_slave_writedata,
                                                                d1_Slider_switches_avalon_parallel_port_slave_end_xfer,
                                                                registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave
                                                             )
;

  output           CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave;
  output           CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave;
  output           CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave;
  output           CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave;
  output  [  1: 0] Slider_switches_avalon_parallel_port_slave_address;
  output  [  3: 0] Slider_switches_avalon_parallel_port_slave_byteenable;
  output           Slider_switches_avalon_parallel_port_slave_chipselect;
  output           Slider_switches_avalon_parallel_port_slave_read;
  output  [ 31: 0] Slider_switches_avalon_parallel_port_slave_readdata_from_sa;
  output           Slider_switches_avalon_parallel_port_slave_reset;
  output           Slider_switches_avalon_parallel_port_slave_write;
  output  [ 31: 0] Slider_switches_avalon_parallel_port_slave_writedata;
  output           d1_Slider_switches_avalon_parallel_port_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] Slider_switches_avalon_parallel_port_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave;
  reg              CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register_in;
  wire             CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave;
  wire             CPU_data_master_saved_grant_Slider_switches_avalon_parallel_port_slave;
  wire    [  1: 0] Slider_switches_avalon_parallel_port_slave_address;
  wire             Slider_switches_avalon_parallel_port_slave_allgrants;
  wire             Slider_switches_avalon_parallel_port_slave_allow_new_arb_cycle;
  wire             Slider_switches_avalon_parallel_port_slave_any_bursting_master_saved_grant;
  wire             Slider_switches_avalon_parallel_port_slave_any_continuerequest;
  wire             Slider_switches_avalon_parallel_port_slave_arb_counter_enable;
  reg     [  1: 0] Slider_switches_avalon_parallel_port_slave_arb_share_counter;
  wire    [  1: 0] Slider_switches_avalon_parallel_port_slave_arb_share_counter_next_value;
  wire    [  1: 0] Slider_switches_avalon_parallel_port_slave_arb_share_set_values;
  wire             Slider_switches_avalon_parallel_port_slave_beginbursttransfer_internal;
  wire             Slider_switches_avalon_parallel_port_slave_begins_xfer;
  wire    [  3: 0] Slider_switches_avalon_parallel_port_slave_byteenable;
  wire             Slider_switches_avalon_parallel_port_slave_chipselect;
  wire             Slider_switches_avalon_parallel_port_slave_end_xfer;
  wire             Slider_switches_avalon_parallel_port_slave_firsttransfer;
  wire             Slider_switches_avalon_parallel_port_slave_grant_vector;
  wire             Slider_switches_avalon_parallel_port_slave_in_a_read_cycle;
  wire             Slider_switches_avalon_parallel_port_slave_in_a_write_cycle;
  wire             Slider_switches_avalon_parallel_port_slave_master_qreq_vector;
  wire             Slider_switches_avalon_parallel_port_slave_non_bursting_master_requests;
  wire             Slider_switches_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Slider_switches_avalon_parallel_port_slave_readdata_from_sa;
  reg              Slider_switches_avalon_parallel_port_slave_reg_firsttransfer;
  wire             Slider_switches_avalon_parallel_port_slave_reset;
  reg              Slider_switches_avalon_parallel_port_slave_slavearbiterlockenable;
  wire             Slider_switches_avalon_parallel_port_slave_slavearbiterlockenable2;
  wire             Slider_switches_avalon_parallel_port_slave_unreg_firsttransfer;
  wire             Slider_switches_avalon_parallel_port_slave_waits_for_read;
  wire             Slider_switches_avalon_parallel_port_slave_waits_for_write;
  wire             Slider_switches_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Slider_switches_avalon_parallel_port_slave_writedata;
  reg              d1_Slider_switches_avalon_parallel_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Slider_switches_avalon_parallel_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave;
  wire    [ 28: 0] shifted_address_to_Slider_switches_avalon_parallel_port_slave_from_CPU_data_master;
  wire             wait_for_Slider_switches_avalon_parallel_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Slider_switches_avalon_parallel_port_slave_end_xfer;
    end


  assign Slider_switches_avalon_parallel_port_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave));
  //assign Slider_switches_avalon_parallel_port_slave_readdata_from_sa = Slider_switches_avalon_parallel_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_readdata_from_sa = Slider_switches_avalon_parallel_port_slave_readdata;

  assign CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave = ({CPU_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10000040) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register_in;

  //Slider_switches_avalon_parallel_port_slave_arb_share_counter set values, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_arb_share_set_values = 1;

  //Slider_switches_avalon_parallel_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_non_bursting_master_requests = CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave;

  //Slider_switches_avalon_parallel_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_any_bursting_master_saved_grant = 0;

  //Slider_switches_avalon_parallel_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_arb_share_counter_next_value = Slider_switches_avalon_parallel_port_slave_firsttransfer ? (Slider_switches_avalon_parallel_port_slave_arb_share_set_values - 1) : |Slider_switches_avalon_parallel_port_slave_arb_share_counter ? (Slider_switches_avalon_parallel_port_slave_arb_share_counter - 1) : 0;

  //Slider_switches_avalon_parallel_port_slave_allgrants all slave grants, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_allgrants = |Slider_switches_avalon_parallel_port_slave_grant_vector;

  //Slider_switches_avalon_parallel_port_slave_end_xfer assignment, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_end_xfer = ~(Slider_switches_avalon_parallel_port_slave_waits_for_read | Slider_switches_avalon_parallel_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Slider_switches_avalon_parallel_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Slider_switches_avalon_parallel_port_slave = Slider_switches_avalon_parallel_port_slave_end_xfer & (~Slider_switches_avalon_parallel_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Slider_switches_avalon_parallel_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Slider_switches_avalon_parallel_port_slave & Slider_switches_avalon_parallel_port_slave_allgrants) | (end_xfer_arb_share_counter_term_Slider_switches_avalon_parallel_port_slave & ~Slider_switches_avalon_parallel_port_slave_non_bursting_master_requests);

  //Slider_switches_avalon_parallel_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Slider_switches_avalon_parallel_port_slave_arb_share_counter <= 0;
      else if (Slider_switches_avalon_parallel_port_slave_arb_counter_enable)
          Slider_switches_avalon_parallel_port_slave_arb_share_counter <= Slider_switches_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //Slider_switches_avalon_parallel_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Slider_switches_avalon_parallel_port_slave_slavearbiterlockenable <= 0;
      else if ((|Slider_switches_avalon_parallel_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Slider_switches_avalon_parallel_port_slave) | (end_xfer_arb_share_counter_term_Slider_switches_avalon_parallel_port_slave & ~Slider_switches_avalon_parallel_port_slave_non_bursting_master_requests))
          Slider_switches_avalon_parallel_port_slave_slavearbiterlockenable <= |Slider_switches_avalon_parallel_port_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Slider_switches/avalon_parallel_port_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Slider_switches_avalon_parallel_port_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Slider_switches_avalon_parallel_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_slavearbiterlockenable2 = |Slider_switches_avalon_parallel_port_slave_arb_share_counter_next_value;

  //CPU/data_master Slider_switches/avalon_parallel_port_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Slider_switches_avalon_parallel_port_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Slider_switches_avalon_parallel_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave = CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register_in = CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave & CPU_data_master_read & ~Slider_switches_avalon_parallel_port_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register = {CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register, CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register <= p1_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave = CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave_shift_register;

  //Slider_switches_avalon_parallel_port_slave_writedata mux, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave = CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave;

  //CPU/data_master saved-grant Slider_switches/avalon_parallel_port_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Slider_switches_avalon_parallel_port_slave = CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave;

  //allow new arb cycle for Slider_switches/avalon_parallel_port_slave, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Slider_switches_avalon_parallel_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Slider_switches_avalon_parallel_port_slave_master_qreq_vector = 1;

  //~Slider_switches_avalon_parallel_port_slave_reset assignment, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_reset = ~reset_n;

  assign Slider_switches_avalon_parallel_port_slave_chipselect = CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave;
  //Slider_switches_avalon_parallel_port_slave_firsttransfer first transaction, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_firsttransfer = Slider_switches_avalon_parallel_port_slave_begins_xfer ? Slider_switches_avalon_parallel_port_slave_unreg_firsttransfer : Slider_switches_avalon_parallel_port_slave_reg_firsttransfer;

  //Slider_switches_avalon_parallel_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_unreg_firsttransfer = ~(Slider_switches_avalon_parallel_port_slave_slavearbiterlockenable & Slider_switches_avalon_parallel_port_slave_any_continuerequest);

  //Slider_switches_avalon_parallel_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Slider_switches_avalon_parallel_port_slave_reg_firsttransfer <= 1'b1;
      else if (Slider_switches_avalon_parallel_port_slave_begins_xfer)
          Slider_switches_avalon_parallel_port_slave_reg_firsttransfer <= Slider_switches_avalon_parallel_port_slave_unreg_firsttransfer;
    end


  //Slider_switches_avalon_parallel_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_beginbursttransfer_internal = Slider_switches_avalon_parallel_port_slave_begins_xfer;

  //Slider_switches_avalon_parallel_port_slave_read assignment, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_read = CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave & CPU_data_master_read;

  //Slider_switches_avalon_parallel_port_slave_write assignment, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_write = CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave & CPU_data_master_write;

  assign shifted_address_to_Slider_switches_avalon_parallel_port_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Slider_switches_avalon_parallel_port_slave_address mux, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_address = shifted_address_to_Slider_switches_avalon_parallel_port_slave_from_CPU_data_master >> 2;

  //d1_Slider_switches_avalon_parallel_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Slider_switches_avalon_parallel_port_slave_end_xfer <= 1;
      else 
        d1_Slider_switches_avalon_parallel_port_slave_end_xfer <= Slider_switches_avalon_parallel_port_slave_end_xfer;
    end


  //Slider_switches_avalon_parallel_port_slave_waits_for_read in a cycle, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_waits_for_read = Slider_switches_avalon_parallel_port_slave_in_a_read_cycle & 0;

  //Slider_switches_avalon_parallel_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_in_a_read_cycle = CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Slider_switches_avalon_parallel_port_slave_in_a_read_cycle;

  //Slider_switches_avalon_parallel_port_slave_waits_for_write in a cycle, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_waits_for_write = Slider_switches_avalon_parallel_port_slave_in_a_write_cycle & 0;

  //Slider_switches_avalon_parallel_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign Slider_switches_avalon_parallel_port_slave_in_a_write_cycle = CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Slider_switches_avalon_parallel_port_slave_in_a_write_cycle;

  assign wait_for_Slider_switches_avalon_parallel_port_slave_counter = 0;
  //Slider_switches_avalon_parallel_port_slave_byteenable byte enable port mux, which is an e_mux
  assign Slider_switches_avalon_parallel_port_slave_byteenable = (CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Slider_switches/avalon_parallel_port_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         CPU_data_master_address_to_slave,
                                         CPU_data_master_read,
                                         CPU_data_master_write,
                                         clk,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         CPU_data_master_granted_sysid_control_slave,
                                         CPU_data_master_qualified_request_sysid_control_slave,
                                         CPU_data_master_read_data_valid_sysid_control_slave,
                                         CPU_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           CPU_data_master_granted_sysid_control_slave;
  output           CPU_data_master_qualified_request_sysid_control_slave;
  output           CPU_data_master_read_data_valid_sysid_control_slave;
  output           CPU_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input   [ 28: 0] CPU_data_master_address_to_slave;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input            clk;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_sysid_control_slave;
  wire             CPU_data_master_qualified_request_sysid_control_slave;
  wire             CPU_data_master_read_data_valid_sysid_control_slave;
  wire             CPU_data_master_requests_sysid_control_slave;
  wire             CPU_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_sysid_control_slave_from_CPU_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  1: 0] sysid_control_slave_arb_share_counter;
  wire    [  1: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign CPU_data_master_requests_sysid_control_slave = (({CPU_data_master_address_to_slave[28 : 3] , 3'b0} == 29'h10002020) & (CPU_data_master_read | CPU_data_master_write)) & CPU_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = CPU_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //CPU/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //CPU/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_sysid_control_slave = CPU_data_master_requests_sysid_control_slave;
  //master is always granted when requested
  assign CPU_data_master_granted_sysid_control_slave = CPU_data_master_qualified_request_sysid_control_slave;

  //CPU/data_master saved-grant sysid/control_slave, which is an e_assign
  assign CPU_data_master_saved_grant_sysid_control_slave = CPU_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_CPU_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = CPU_data_master_granted_sysid_control_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = CPU_data_master_granted_sysid_control_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_system_reset_clk_domain_synch_module (
                                                   // inputs:
                                                    clk,
                                                    data_in,
                                                    reset_n,

                                                   // outputs:
                                                    data_out
                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_system (
                     // 1) global signals:
                      clk,
                      reset_n,

                     // the_Expansion_JP1
                      GPIO_0_to_and_from_the_Expansion_JP1,

                     // the_Expansion_JP2
                      GPIO_1_to_and_from_the_Expansion_JP2,

                     // the_Green_LEDs
                      LEDG_from_the_Green_LEDs,

                     // the_HEX3_HEX0
                      HEX0_from_the_HEX3_HEX0,
                      HEX1_from_the_HEX3_HEX0,
                      HEX2_from_the_HEX3_HEX0,
                      HEX3_from_the_HEX3_HEX0,

                     // the_HEX7_HEX4
                      HEX4_from_the_HEX7_HEX4,
                      HEX5_from_the_HEX7_HEX4,
                      HEX6_from_the_HEX7_HEX4,
                      HEX7_from_the_HEX7_HEX4,

                     // the_Pushbuttons
                      KEY_to_the_Pushbuttons,

                     // the_Red_LEDs
                      LEDR_from_the_Red_LEDs,

                     // the_SDRAM
                      zs_addr_from_the_SDRAM,
                      zs_ba_from_the_SDRAM,
                      zs_cas_n_from_the_SDRAM,
                      zs_cke_from_the_SDRAM,
                      zs_cs_n_from_the_SDRAM,
                      zs_dq_to_and_from_the_SDRAM,
                      zs_dqm_from_the_SDRAM,
                      zs_ras_n_from_the_SDRAM,
                      zs_we_n_from_the_SDRAM,

                     // the_SRAM
                      SRAM_ADDR_from_the_SRAM,
                      SRAM_CE_N_from_the_SRAM,
                      SRAM_DQ_to_and_from_the_SRAM,
                      SRAM_LB_N_from_the_SRAM,
                      SRAM_OE_N_from_the_SRAM,
                      SRAM_UB_N_from_the_SRAM,
                      SRAM_WE_N_from_the_SRAM,

                     // the_Serial_port
                      UART_RXD_to_the_Serial_port,
                      UART_TXD_from_the_Serial_port,

                     // the_Slider_switches
                      SW_to_the_Slider_switches
                   )
;

  inout   [ 31: 0] GPIO_0_to_and_from_the_Expansion_JP1;
  inout   [ 31: 0] GPIO_1_to_and_from_the_Expansion_JP2;
  output  [  6: 0] HEX0_from_the_HEX3_HEX0;
  output  [  6: 0] HEX1_from_the_HEX3_HEX0;
  output  [  6: 0] HEX2_from_the_HEX3_HEX0;
  output  [  6: 0] HEX3_from_the_HEX3_HEX0;
  output  [  6: 0] HEX4_from_the_HEX7_HEX4;
  output  [  6: 0] HEX5_from_the_HEX7_HEX4;
  output  [  6: 0] HEX6_from_the_HEX7_HEX4;
  output  [  6: 0] HEX7_from_the_HEX7_HEX4;
  output  [  8: 0] LEDG_from_the_Green_LEDs;
  output  [ 17: 0] LEDR_from_the_Red_LEDs;
  output  [ 17: 0] SRAM_ADDR_from_the_SRAM;
  output           SRAM_CE_N_from_the_SRAM;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_SRAM;
  output           SRAM_LB_N_from_the_SRAM;
  output           SRAM_OE_N_from_the_SRAM;
  output           SRAM_UB_N_from_the_SRAM;
  output           SRAM_WE_N_from_the_SRAM;
  output           UART_TXD_from_the_Serial_port;
  output  [ 11: 0] zs_addr_from_the_SDRAM;
  output  [  1: 0] zs_ba_from_the_SDRAM;
  output           zs_cas_n_from_the_SDRAM;
  output           zs_cke_from_the_SDRAM;
  output           zs_cs_n_from_the_SDRAM;
  inout   [ 15: 0] zs_dq_to_and_from_the_SDRAM;
  output  [  1: 0] zs_dqm_from_the_SDRAM;
  output           zs_ras_n_from_the_SDRAM;
  output           zs_we_n_from_the_SDRAM;
  input   [  3: 0] KEY_to_the_Pushbuttons;
  input   [ 17: 0] SW_to_the_Slider_switches;
  input            UART_RXD_to_the_Serial_port;
  input            clk;
  input            reset_n;

  wire    [ 28: 0] CPU_data_master_address;
  wire    [ 28: 0] CPU_data_master_address_to_slave;
  wire    [  3: 0] CPU_data_master_byteenable;
  wire    [  1: 0] CPU_data_master_byteenable_SDRAM_s1;
  wire    [  1: 0] CPU_data_master_byteenable_SRAM_avalon_sram_slave;
  wire    [  1: 0] CPU_data_master_dbs_address;
  wire    [ 15: 0] CPU_data_master_dbs_write_16;
  wire             CPU_data_master_debugaccess;
  wire             CPU_data_master_granted_CPU_jtag_debug_module;
  wire             CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_Interval_timer_s1;
  wire             CPU_data_master_granted_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_granted_Onchip_memory_s2;
  wire             CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_SDRAM_s1;
  wire             CPU_data_master_granted_SRAM_avalon_sram_slave;
  wire             CPU_data_master_granted_Serial_port_avalon_rs232_slave;
  wire             CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave;
  wire             CPU_data_master_granted_sysid_control_slave;
  wire    [ 31: 0] CPU_data_master_irq;
  wire             CPU_data_master_no_byte_enables_and_last_term;
  wire             CPU_data_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Interval_timer_s1;
  wire             CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_qualified_request_Onchip_memory_s2;
  wire             CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_SDRAM_s1;
  wire             CPU_data_master_qualified_request_SRAM_avalon_sram_slave;
  wire             CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave;
  wire             CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave;
  wire             CPU_data_master_qualified_request_sysid_control_slave;
  wire             CPU_data_master_read;
  wire             CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Interval_timer_s1;
  wire             CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_read_data_valid_Onchip_memory_s2;
  wire             CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_SDRAM_s1;
  wire             CPU_data_master_read_data_valid_SDRAM_s1_shift_register;
  wire             CPU_data_master_read_data_valid_SRAM_avalon_sram_slave;
  wire             CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave;
  wire             CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave;
  wire             CPU_data_master_read_data_valid_sysid_control_slave;
  wire    [ 31: 0] CPU_data_master_readdata;
  wire             CPU_data_master_requests_CPU_jtag_debug_module;
  wire             CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_Interval_timer_s1;
  wire             CPU_data_master_requests_JTAG_UART_avalon_jtag_slave;
  wire             CPU_data_master_requests_Onchip_memory_s2;
  wire             CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_SDRAM_s1;
  wire             CPU_data_master_requests_SRAM_avalon_sram_slave;
  wire             CPU_data_master_requests_Serial_port_avalon_rs232_slave;
  wire             CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave;
  wire             CPU_data_master_requests_sysid_control_slave;
  wire             CPU_data_master_waitrequest;
  wire             CPU_data_master_write;
  wire    [ 31: 0] CPU_data_master_writedata;
  wire    [ 27: 0] CPU_instruction_master_address;
  wire    [ 27: 0] CPU_instruction_master_address_to_slave;
  wire    [  1: 0] CPU_instruction_master_dbs_address;
  wire             CPU_instruction_master_granted_CPU_jtag_debug_module;
  wire             CPU_instruction_master_granted_Onchip_memory_s1;
  wire             CPU_instruction_master_granted_SDRAM_s1;
  wire             CPU_instruction_master_granted_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_instruction_master_qualified_request_Onchip_memory_s1;
  wire             CPU_instruction_master_qualified_request_SDRAM_s1;
  wire             CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_read;
  wire             CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_instruction_master_read_data_valid_Onchip_memory_s1;
  wire             CPU_instruction_master_read_data_valid_SDRAM_s1;
  wire             CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register;
  wire             CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register;
  wire    [ 31: 0] CPU_instruction_master_readdata;
  wire             CPU_instruction_master_requests_CPU_jtag_debug_module;
  wire             CPU_instruction_master_requests_Onchip_memory_s1;
  wire             CPU_instruction_master_requests_SDRAM_s1;
  wire             CPU_instruction_master_requests_SRAM_avalon_sram_slave;
  wire             CPU_instruction_master_waitrequest;
  wire    [  8: 0] CPU_jtag_debug_module_address;
  wire             CPU_jtag_debug_module_begintransfer;
  wire    [  3: 0] CPU_jtag_debug_module_byteenable;
  wire             CPU_jtag_debug_module_chipselect;
  wire             CPU_jtag_debug_module_debugaccess;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  wire             CPU_jtag_debug_module_reset_n;
  wire             CPU_jtag_debug_module_resetrequest;
  wire             CPU_jtag_debug_module_resetrequest_from_sa;
  wire             CPU_jtag_debug_module_write;
  wire    [ 31: 0] CPU_jtag_debug_module_writedata;
  wire    [  1: 0] Expansion_JP1_avalon_parallel_port_slave_address;
  wire    [  3: 0] Expansion_JP1_avalon_parallel_port_slave_byteenable;
  wire             Expansion_JP1_avalon_parallel_port_slave_chipselect;
  wire             Expansion_JP1_avalon_parallel_port_slave_irq;
  wire             Expansion_JP1_avalon_parallel_port_slave_irq_from_sa;
  wire             Expansion_JP1_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa;
  wire             Expansion_JP1_avalon_parallel_port_slave_reset;
  wire             Expansion_JP1_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Expansion_JP1_avalon_parallel_port_slave_writedata;
  wire    [  1: 0] Expansion_JP2_avalon_parallel_port_slave_address;
  wire    [  3: 0] Expansion_JP2_avalon_parallel_port_slave_byteenable;
  wire             Expansion_JP2_avalon_parallel_port_slave_chipselect;
  wire             Expansion_JP2_avalon_parallel_port_slave_irq;
  wire             Expansion_JP2_avalon_parallel_port_slave_irq_from_sa;
  wire             Expansion_JP2_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa;
  wire             Expansion_JP2_avalon_parallel_port_slave_reset;
  wire             Expansion_JP2_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Expansion_JP2_avalon_parallel_port_slave_writedata;
  wire    [ 31: 0] GPIO_0_to_and_from_the_Expansion_JP1;
  wire    [ 31: 0] GPIO_1_to_and_from_the_Expansion_JP2;
  wire    [  1: 0] Green_LEDs_avalon_parallel_port_slave_address;
  wire    [  3: 0] Green_LEDs_avalon_parallel_port_slave_byteenable;
  wire             Green_LEDs_avalon_parallel_port_slave_chipselect;
  wire             Green_LEDs_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Green_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  wire             Green_LEDs_avalon_parallel_port_slave_reset;
  wire             Green_LEDs_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Green_LEDs_avalon_parallel_port_slave_writedata;
  wire    [  6: 0] HEX0_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX1_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX2_from_the_HEX3_HEX0;
  wire    [  1: 0] HEX3_HEX0_avalon_parallel_port_slave_address;
  wire    [  3: 0] HEX3_HEX0_avalon_parallel_port_slave_byteenable;
  wire             HEX3_HEX0_avalon_parallel_port_slave_chipselect;
  wire             HEX3_HEX0_avalon_parallel_port_slave_read;
  wire    [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa;
  wire             HEX3_HEX0_avalon_parallel_port_slave_reset;
  wire             HEX3_HEX0_avalon_parallel_port_slave_write;
  wire    [ 31: 0] HEX3_HEX0_avalon_parallel_port_slave_writedata;
  wire    [  6: 0] HEX3_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX4_from_the_HEX7_HEX4;
  wire    [  6: 0] HEX5_from_the_HEX7_HEX4;
  wire    [  6: 0] HEX6_from_the_HEX7_HEX4;
  wire    [  1: 0] HEX7_HEX4_avalon_parallel_port_slave_address;
  wire    [  3: 0] HEX7_HEX4_avalon_parallel_port_slave_byteenable;
  wire             HEX7_HEX4_avalon_parallel_port_slave_chipselect;
  wire             HEX7_HEX4_avalon_parallel_port_slave_read;
  wire    [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa;
  wire             HEX7_HEX4_avalon_parallel_port_slave_reset;
  wire             HEX7_HEX4_avalon_parallel_port_slave_write;
  wire    [ 31: 0] HEX7_HEX4_avalon_parallel_port_slave_writedata;
  wire    [  6: 0] HEX7_from_the_HEX7_HEX4;
  wire    [  2: 0] Interval_timer_s1_address;
  wire             Interval_timer_s1_chipselect;
  wire             Interval_timer_s1_irq;
  wire             Interval_timer_s1_irq_from_sa;
  wire    [ 15: 0] Interval_timer_s1_readdata;
  wire    [ 15: 0] Interval_timer_s1_readdata_from_sa;
  wire             Interval_timer_s1_reset_n;
  wire             Interval_timer_s1_write_n;
  wire    [ 15: 0] Interval_timer_s1_writedata;
  wire             JTAG_UART_avalon_jtag_slave_address;
  wire             JTAG_UART_avalon_jtag_slave_chipselect;
  wire             JTAG_UART_avalon_jtag_slave_dataavailable;
  wire             JTAG_UART_avalon_jtag_slave_dataavailable_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_irq;
  wire             JTAG_UART_avalon_jtag_slave_irq_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_read_n;
  wire    [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata;
  wire    [ 31: 0] JTAG_UART_avalon_jtag_slave_readdata_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_readyfordata;
  wire             JTAG_UART_avalon_jtag_slave_readyfordata_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_reset_n;
  wire             JTAG_UART_avalon_jtag_slave_waitrequest;
  wire             JTAG_UART_avalon_jtag_slave_waitrequest_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_write_n;
  wire    [ 31: 0] JTAG_UART_avalon_jtag_slave_writedata;
  wire    [  8: 0] LEDG_from_the_Green_LEDs;
  wire    [ 17: 0] LEDR_from_the_Red_LEDs;
  wire    [ 10: 0] Onchip_memory_s1_address;
  wire    [  3: 0] Onchip_memory_s1_byteenable;
  wire             Onchip_memory_s1_chipselect;
  wire             Onchip_memory_s1_clken;
  wire    [ 31: 0] Onchip_memory_s1_readdata;
  wire    [ 31: 0] Onchip_memory_s1_readdata_from_sa;
  wire             Onchip_memory_s1_reset;
  wire             Onchip_memory_s1_write;
  wire    [ 31: 0] Onchip_memory_s1_writedata;
  wire    [ 10: 0] Onchip_memory_s2_address;
  wire    [  3: 0] Onchip_memory_s2_byteenable;
  wire             Onchip_memory_s2_chipselect;
  wire             Onchip_memory_s2_clken;
  wire    [ 31: 0] Onchip_memory_s2_readdata;
  wire    [ 31: 0] Onchip_memory_s2_readdata_from_sa;
  wire             Onchip_memory_s2_reset;
  wire             Onchip_memory_s2_write;
  wire    [ 31: 0] Onchip_memory_s2_writedata;
  wire    [  1: 0] Pushbuttons_avalon_parallel_port_slave_address;
  wire    [  3: 0] Pushbuttons_avalon_parallel_port_slave_byteenable;
  wire             Pushbuttons_avalon_parallel_port_slave_chipselect;
  wire             Pushbuttons_avalon_parallel_port_slave_irq;
  wire             Pushbuttons_avalon_parallel_port_slave_irq_from_sa;
  wire             Pushbuttons_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Pushbuttons_avalon_parallel_port_slave_readdata_from_sa;
  wire             Pushbuttons_avalon_parallel_port_slave_reset;
  wire             Pushbuttons_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Pushbuttons_avalon_parallel_port_slave_writedata;
  wire    [  1: 0] Red_LEDs_avalon_parallel_port_slave_address;
  wire    [  3: 0] Red_LEDs_avalon_parallel_port_slave_byteenable;
  wire             Red_LEDs_avalon_parallel_port_slave_chipselect;
  wire             Red_LEDs_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Red_LEDs_avalon_parallel_port_slave_readdata_from_sa;
  wire             Red_LEDs_avalon_parallel_port_slave_reset;
  wire             Red_LEDs_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Red_LEDs_avalon_parallel_port_slave_writedata;
  wire    [ 21: 0] SDRAM_s1_address;
  wire    [  1: 0] SDRAM_s1_byteenable_n;
  wire             SDRAM_s1_chipselect;
  wire             SDRAM_s1_read_n;
  wire    [ 15: 0] SDRAM_s1_readdata;
  wire    [ 15: 0] SDRAM_s1_readdata_from_sa;
  wire             SDRAM_s1_readdatavalid;
  wire             SDRAM_s1_reset_n;
  wire             SDRAM_s1_waitrequest;
  wire             SDRAM_s1_waitrequest_from_sa;
  wire             SDRAM_s1_write_n;
  wire    [ 15: 0] SDRAM_s1_writedata;
  wire    [ 17: 0] SRAM_ADDR_from_the_SRAM;
  wire             SRAM_CE_N_from_the_SRAM;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_SRAM;
  wire             SRAM_LB_N_from_the_SRAM;
  wire             SRAM_OE_N_from_the_SRAM;
  wire             SRAM_UB_N_from_the_SRAM;
  wire             SRAM_WE_N_from_the_SRAM;
  wire    [ 17: 0] SRAM_avalon_sram_slave_address;
  wire    [  1: 0] SRAM_avalon_sram_slave_byteenable;
  wire             SRAM_avalon_sram_slave_read;
  wire    [ 15: 0] SRAM_avalon_sram_slave_readdata;
  wire    [ 15: 0] SRAM_avalon_sram_slave_readdata_from_sa;
  wire             SRAM_avalon_sram_slave_readdatavalid;
  wire             SRAM_avalon_sram_slave_reset;
  wire             SRAM_avalon_sram_slave_write;
  wire    [ 15: 0] SRAM_avalon_sram_slave_writedata;
  wire             Serial_port_avalon_rs232_slave_address;
  wire    [  3: 0] Serial_port_avalon_rs232_slave_byteenable;
  wire             Serial_port_avalon_rs232_slave_chipselect;
  wire             Serial_port_avalon_rs232_slave_irq;
  wire             Serial_port_avalon_rs232_slave_irq_from_sa;
  wire             Serial_port_avalon_rs232_slave_read;
  wire    [ 31: 0] Serial_port_avalon_rs232_slave_readdata;
  wire    [ 31: 0] Serial_port_avalon_rs232_slave_readdata_from_sa;
  wire             Serial_port_avalon_rs232_slave_reset;
  wire             Serial_port_avalon_rs232_slave_write;
  wire    [ 31: 0] Serial_port_avalon_rs232_slave_writedata;
  wire    [  1: 0] Slider_switches_avalon_parallel_port_slave_address;
  wire    [  3: 0] Slider_switches_avalon_parallel_port_slave_byteenable;
  wire             Slider_switches_avalon_parallel_port_slave_chipselect;
  wire             Slider_switches_avalon_parallel_port_slave_read;
  wire    [ 31: 0] Slider_switches_avalon_parallel_port_slave_readdata;
  wire    [ 31: 0] Slider_switches_avalon_parallel_port_slave_readdata_from_sa;
  wire             Slider_switches_avalon_parallel_port_slave_reset;
  wire             Slider_switches_avalon_parallel_port_slave_write;
  wire    [ 31: 0] Slider_switches_avalon_parallel_port_slave_writedata;
  wire             UART_TXD_from_the_Serial_port;
  wire             clk_reset_n;
  wire             d1_CPU_jtag_debug_module_end_xfer;
  wire             d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer;
  wire             d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer;
  wire             d1_Green_LEDs_avalon_parallel_port_slave_end_xfer;
  wire             d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer;
  wire             d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer;
  wire             d1_Interval_timer_s1_end_xfer;
  wire             d1_JTAG_UART_avalon_jtag_slave_end_xfer;
  wire             d1_Onchip_memory_s1_end_xfer;
  wire             d1_Onchip_memory_s2_end_xfer;
  wire             d1_Pushbuttons_avalon_parallel_port_slave_end_xfer;
  wire             d1_Red_LEDs_avalon_parallel_port_slave_end_xfer;
  wire             d1_SDRAM_s1_end_xfer;
  wire             d1_SRAM_avalon_sram_slave_end_xfer;
  wire             d1_Serial_port_avalon_rs232_slave_end_xfer;
  wire             d1_Slider_switches_avalon_parallel_port_slave_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_Onchip_memory_s2;
  wire             registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave;
  wire             registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave;
  wire             registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave;
  wire             reset_n_sources;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [ 11: 0] zs_addr_from_the_SDRAM;
  wire    [  1: 0] zs_ba_from_the_SDRAM;
  wire             zs_cas_n_from_the_SDRAM;
  wire             zs_cke_from_the_SDRAM;
  wire             zs_cs_n_from_the_SDRAM;
  wire    [ 15: 0] zs_dq_to_and_from_the_SDRAM;
  wire    [  1: 0] zs_dqm_from_the_SDRAM;
  wire             zs_ras_n_from_the_SDRAM;
  wire             zs_we_n_from_the_SDRAM;
  CPU_jtag_debug_module_arbitrator the_CPU_jtag_debug_module
    (
      .CPU_data_master_address_to_slave                               (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                     (CPU_data_master_byteenable),
      .CPU_data_master_debugaccess                                    (CPU_data_master_debugaccess),
      .CPU_data_master_granted_CPU_jtag_debug_module                  (CPU_data_master_granted_CPU_jtag_debug_module),
      .CPU_data_master_qualified_request_CPU_jtag_debug_module        (CPU_data_master_qualified_request_CPU_jtag_debug_module),
      .CPU_data_master_read                                           (CPU_data_master_read),
      .CPU_data_master_read_data_valid_CPU_jtag_debug_module          (CPU_data_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_data_master_requests_CPU_jtag_debug_module                 (CPU_data_master_requests_CPU_jtag_debug_module),
      .CPU_data_master_waitrequest                                    (CPU_data_master_waitrequest),
      .CPU_data_master_write                                          (CPU_data_master_write),
      .CPU_data_master_writedata                                      (CPU_data_master_writedata),
      .CPU_instruction_master_address_to_slave                        (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_granted_CPU_jtag_debug_module           (CPU_instruction_master_granted_CPU_jtag_debug_module),
      .CPU_instruction_master_qualified_request_CPU_jtag_debug_module (CPU_instruction_master_qualified_request_CPU_jtag_debug_module),
      .CPU_instruction_master_read                                    (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_CPU_jtag_debug_module   (CPU_instruction_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_instruction_master_requests_CPU_jtag_debug_module          (CPU_instruction_master_requests_CPU_jtag_debug_module),
      .CPU_jtag_debug_module_address                                  (CPU_jtag_debug_module_address),
      .CPU_jtag_debug_module_begintransfer                            (CPU_jtag_debug_module_begintransfer),
      .CPU_jtag_debug_module_byteenable                               (CPU_jtag_debug_module_byteenable),
      .CPU_jtag_debug_module_chipselect                               (CPU_jtag_debug_module_chipselect),
      .CPU_jtag_debug_module_debugaccess                              (CPU_jtag_debug_module_debugaccess),
      .CPU_jtag_debug_module_readdata                                 (CPU_jtag_debug_module_readdata),
      .CPU_jtag_debug_module_readdata_from_sa                         (CPU_jtag_debug_module_readdata_from_sa),
      .CPU_jtag_debug_module_reset_n                                  (CPU_jtag_debug_module_reset_n),
      .CPU_jtag_debug_module_resetrequest                             (CPU_jtag_debug_module_resetrequest),
      .CPU_jtag_debug_module_resetrequest_from_sa                     (CPU_jtag_debug_module_resetrequest_from_sa),
      .CPU_jtag_debug_module_write                                    (CPU_jtag_debug_module_write),
      .CPU_jtag_debug_module_writedata                                (CPU_jtag_debug_module_writedata),
      .clk                                                            (clk),
      .d1_CPU_jtag_debug_module_end_xfer                              (d1_CPU_jtag_debug_module_end_xfer),
      .reset_n                                                        (clk_reset_n)
    );

  CPU_data_master_arbitrator the_CPU_data_master
    (
      .CPU_data_master_address                                                               (CPU_data_master_address),
      .CPU_data_master_address_to_slave                                                      (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable_SDRAM_s1                                                   (CPU_data_master_byteenable_SDRAM_s1),
      .CPU_data_master_byteenable_SRAM_avalon_sram_slave                                     (CPU_data_master_byteenable_SRAM_avalon_sram_slave),
      .CPU_data_master_dbs_address                                                           (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_16                                                          (CPU_data_master_dbs_write_16),
      .CPU_data_master_granted_CPU_jtag_debug_module                                         (CPU_data_master_granted_CPU_jtag_debug_module),
      .CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave                      (CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave                      (CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave                         (CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave                          (CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave                          (CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_granted_Interval_timer_s1                                             (CPU_data_master_granted_Interval_timer_s1),
      .CPU_data_master_granted_JTAG_UART_avalon_jtag_slave                                   (CPU_data_master_granted_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_granted_Onchip_memory_s2                                              (CPU_data_master_granted_Onchip_memory_s2),
      .CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave                        (CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave                           (CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_granted_SDRAM_s1                                                      (CPU_data_master_granted_SDRAM_s1),
      .CPU_data_master_granted_SRAM_avalon_sram_slave                                        (CPU_data_master_granted_SRAM_avalon_sram_slave),
      .CPU_data_master_granted_Serial_port_avalon_rs232_slave                                (CPU_data_master_granted_Serial_port_avalon_rs232_slave),
      .CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave                    (CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave),
      .CPU_data_master_granted_sysid_control_slave                                           (CPU_data_master_granted_sysid_control_slave),
      .CPU_data_master_irq                                                                   (CPU_data_master_irq),
      .CPU_data_master_no_byte_enables_and_last_term                                         (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_CPU_jtag_debug_module                               (CPU_data_master_qualified_request_CPU_jtag_debug_module),
      .CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave            (CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave            (CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave               (CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave                (CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave                (CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Interval_timer_s1                                   (CPU_data_master_qualified_request_Interval_timer_s1),
      .CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave                         (CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_qualified_request_Onchip_memory_s2                                    (CPU_data_master_qualified_request_Onchip_memory_s2),
      .CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave              (CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave                 (CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_SDRAM_s1                                            (CPU_data_master_qualified_request_SDRAM_s1),
      .CPU_data_master_qualified_request_SRAM_avalon_sram_slave                              (CPU_data_master_qualified_request_SRAM_avalon_sram_slave),
      .CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave                      (CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave),
      .CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_sysid_control_slave                                 (CPU_data_master_qualified_request_sysid_control_slave),
      .CPU_data_master_read                                                                  (CPU_data_master_read),
      .CPU_data_master_read_data_valid_CPU_jtag_debug_module                                 (CPU_data_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave              (CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave              (CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave                 (CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave                  (CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave                  (CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_Interval_timer_s1                                     (CPU_data_master_read_data_valid_Interval_timer_s1),
      .CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave                           (CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_read_data_valid_Onchip_memory_s2                                      (CPU_data_master_read_data_valid_Onchip_memory_s2),
      .CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave                (CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave                   (CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_SDRAM_s1                                              (CPU_data_master_read_data_valid_SDRAM_s1),
      .CPU_data_master_read_data_valid_SDRAM_s1_shift_register                               (CPU_data_master_read_data_valid_SDRAM_s1_shift_register),
      .CPU_data_master_read_data_valid_SRAM_avalon_sram_slave                                (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave),
      .CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register                 (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register),
      .CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave                        (CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave),
      .CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave),
      .CPU_data_master_read_data_valid_sysid_control_slave                                   (CPU_data_master_read_data_valid_sysid_control_slave),
      .CPU_data_master_readdata                                                              (CPU_data_master_readdata),
      .CPU_data_master_requests_CPU_jtag_debug_module                                        (CPU_data_master_requests_CPU_jtag_debug_module),
      .CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave                     (CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave                     (CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave                        (CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave                         (CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave                         (CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_requests_Interval_timer_s1                                            (CPU_data_master_requests_Interval_timer_s1),
      .CPU_data_master_requests_JTAG_UART_avalon_jtag_slave                                  (CPU_data_master_requests_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_requests_Onchip_memory_s2                                             (CPU_data_master_requests_Onchip_memory_s2),
      .CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave                       (CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave                          (CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_requests_SDRAM_s1                                                     (CPU_data_master_requests_SDRAM_s1),
      .CPU_data_master_requests_SRAM_avalon_sram_slave                                       (CPU_data_master_requests_SRAM_avalon_sram_slave),
      .CPU_data_master_requests_Serial_port_avalon_rs232_slave                               (CPU_data_master_requests_Serial_port_avalon_rs232_slave),
      .CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave                   (CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave),
      .CPU_data_master_requests_sysid_control_slave                                          (CPU_data_master_requests_sysid_control_slave),
      .CPU_data_master_waitrequest                                                           (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                                 (CPU_data_master_write),
      .CPU_data_master_writedata                                                             (CPU_data_master_writedata),
      .CPU_jtag_debug_module_readdata_from_sa                                                (CPU_jtag_debug_module_readdata_from_sa),
      .Expansion_JP1_avalon_parallel_port_slave_irq_from_sa                                  (Expansion_JP1_avalon_parallel_port_slave_irq_from_sa),
      .Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa                             (Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa),
      .Expansion_JP2_avalon_parallel_port_slave_irq_from_sa                                  (Expansion_JP2_avalon_parallel_port_slave_irq_from_sa),
      .Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa                             (Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa),
      .Green_LEDs_avalon_parallel_port_slave_readdata_from_sa                                (Green_LEDs_avalon_parallel_port_slave_readdata_from_sa),
      .HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa                                 (HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa),
      .HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa                                 (HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa),
      .Interval_timer_s1_irq_from_sa                                                         (Interval_timer_s1_irq_from_sa),
      .Interval_timer_s1_readdata_from_sa                                                    (Interval_timer_s1_readdata_from_sa),
      .JTAG_UART_avalon_jtag_slave_irq_from_sa                                               (JTAG_UART_avalon_jtag_slave_irq_from_sa),
      .JTAG_UART_avalon_jtag_slave_readdata_from_sa                                          (JTAG_UART_avalon_jtag_slave_readdata_from_sa),
      .JTAG_UART_avalon_jtag_slave_waitrequest_from_sa                                       (JTAG_UART_avalon_jtag_slave_waitrequest_from_sa),
      .Onchip_memory_s2_readdata_from_sa                                                     (Onchip_memory_s2_readdata_from_sa),
      .Pushbuttons_avalon_parallel_port_slave_irq_from_sa                                    (Pushbuttons_avalon_parallel_port_slave_irq_from_sa),
      .Pushbuttons_avalon_parallel_port_slave_readdata_from_sa                               (Pushbuttons_avalon_parallel_port_slave_readdata_from_sa),
      .Red_LEDs_avalon_parallel_port_slave_readdata_from_sa                                  (Red_LEDs_avalon_parallel_port_slave_readdata_from_sa),
      .SDRAM_s1_readdata_from_sa                                                             (SDRAM_s1_readdata_from_sa),
      .SDRAM_s1_waitrequest_from_sa                                                          (SDRAM_s1_waitrequest_from_sa),
      .SRAM_avalon_sram_slave_readdata_from_sa                                               (SRAM_avalon_sram_slave_readdata_from_sa),
      .Serial_port_avalon_rs232_slave_irq_from_sa                                            (Serial_port_avalon_rs232_slave_irq_from_sa),
      .Serial_port_avalon_rs232_slave_readdata_from_sa                                       (Serial_port_avalon_rs232_slave_readdata_from_sa),
      .Slider_switches_avalon_parallel_port_slave_readdata_from_sa                           (Slider_switches_avalon_parallel_port_slave_readdata_from_sa),
      .clk                                                                                   (clk),
      .d1_CPU_jtag_debug_module_end_xfer                                                     (d1_CPU_jtag_debug_module_end_xfer),
      .d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer                                  (d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer),
      .d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer                                  (d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer),
      .d1_Green_LEDs_avalon_parallel_port_slave_end_xfer                                     (d1_Green_LEDs_avalon_parallel_port_slave_end_xfer),
      .d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer                                      (d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer),
      .d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer                                      (d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer),
      .d1_Interval_timer_s1_end_xfer                                                         (d1_Interval_timer_s1_end_xfer),
      .d1_JTAG_UART_avalon_jtag_slave_end_xfer                                               (d1_JTAG_UART_avalon_jtag_slave_end_xfer),
      .d1_Onchip_memory_s2_end_xfer                                                          (d1_Onchip_memory_s2_end_xfer),
      .d1_Pushbuttons_avalon_parallel_port_slave_end_xfer                                    (d1_Pushbuttons_avalon_parallel_port_slave_end_xfer),
      .d1_Red_LEDs_avalon_parallel_port_slave_end_xfer                                       (d1_Red_LEDs_avalon_parallel_port_slave_end_xfer),
      .d1_SDRAM_s1_end_xfer                                                                  (d1_SDRAM_s1_end_xfer),
      .d1_SRAM_avalon_sram_slave_end_xfer                                                    (d1_SRAM_avalon_sram_slave_end_xfer),
      .d1_Serial_port_avalon_rs232_slave_end_xfer                                            (d1_Serial_port_avalon_rs232_slave_end_xfer),
      .d1_Slider_switches_avalon_parallel_port_slave_end_xfer                                (d1_Slider_switches_avalon_parallel_port_slave_end_xfer),
      .d1_sysid_control_slave_end_xfer                                                       (d1_sysid_control_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave   (registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave   (registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave      (registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave       (registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave       (registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_Onchip_memory_s2                           (registered_CPU_data_master_read_data_valid_Onchip_memory_s2),
      .registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave     (registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave        (registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave),
      .registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave             (registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave),
      .registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave),
      .reset_n                                                                               (clk_reset_n),
      .sysid_control_slave_readdata_from_sa                                                  (sysid_control_slave_readdata_from_sa)
    );

  CPU_instruction_master_arbitrator the_CPU_instruction_master
    (
      .CPU_instruction_master_address                                               (CPU_instruction_master_address),
      .CPU_instruction_master_address_to_slave                                      (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_dbs_address                                           (CPU_instruction_master_dbs_address),
      .CPU_instruction_master_granted_CPU_jtag_debug_module                         (CPU_instruction_master_granted_CPU_jtag_debug_module),
      .CPU_instruction_master_granted_Onchip_memory_s1                              (CPU_instruction_master_granted_Onchip_memory_s1),
      .CPU_instruction_master_granted_SDRAM_s1                                      (CPU_instruction_master_granted_SDRAM_s1),
      .CPU_instruction_master_granted_SRAM_avalon_sram_slave                        (CPU_instruction_master_granted_SRAM_avalon_sram_slave),
      .CPU_instruction_master_qualified_request_CPU_jtag_debug_module               (CPU_instruction_master_qualified_request_CPU_jtag_debug_module),
      .CPU_instruction_master_qualified_request_Onchip_memory_s1                    (CPU_instruction_master_qualified_request_Onchip_memory_s1),
      .CPU_instruction_master_qualified_request_SDRAM_s1                            (CPU_instruction_master_qualified_request_SDRAM_s1),
      .CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave              (CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave),
      .CPU_instruction_master_read                                                  (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_CPU_jtag_debug_module                 (CPU_instruction_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_instruction_master_read_data_valid_Onchip_memory_s1                      (CPU_instruction_master_read_data_valid_Onchip_memory_s1),
      .CPU_instruction_master_read_data_valid_SDRAM_s1                              (CPU_instruction_master_read_data_valid_SDRAM_s1),
      .CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register               (CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register),
      .CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave                (CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave),
      .CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register (CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register),
      .CPU_instruction_master_readdata                                              (CPU_instruction_master_readdata),
      .CPU_instruction_master_requests_CPU_jtag_debug_module                        (CPU_instruction_master_requests_CPU_jtag_debug_module),
      .CPU_instruction_master_requests_Onchip_memory_s1                             (CPU_instruction_master_requests_Onchip_memory_s1),
      .CPU_instruction_master_requests_SDRAM_s1                                     (CPU_instruction_master_requests_SDRAM_s1),
      .CPU_instruction_master_requests_SRAM_avalon_sram_slave                       (CPU_instruction_master_requests_SRAM_avalon_sram_slave),
      .CPU_instruction_master_waitrequest                                           (CPU_instruction_master_waitrequest),
      .CPU_jtag_debug_module_readdata_from_sa                                       (CPU_jtag_debug_module_readdata_from_sa),
      .Onchip_memory_s1_readdata_from_sa                                            (Onchip_memory_s1_readdata_from_sa),
      .SDRAM_s1_readdata_from_sa                                                    (SDRAM_s1_readdata_from_sa),
      .SDRAM_s1_waitrequest_from_sa                                                 (SDRAM_s1_waitrequest_from_sa),
      .SRAM_avalon_sram_slave_readdata_from_sa                                      (SRAM_avalon_sram_slave_readdata_from_sa),
      .clk                                                                          (clk),
      .d1_CPU_jtag_debug_module_end_xfer                                            (d1_CPU_jtag_debug_module_end_xfer),
      .d1_Onchip_memory_s1_end_xfer                                                 (d1_Onchip_memory_s1_end_xfer),
      .d1_SDRAM_s1_end_xfer                                                         (d1_SDRAM_s1_end_xfer),
      .d1_SRAM_avalon_sram_slave_end_xfer                                           (d1_SRAM_avalon_sram_slave_end_xfer),
      .reset_n                                                                      (clk_reset_n)
    );

  CPU the_CPU
    (
      .clk                                   (clk),
      .d_address                             (CPU_data_master_address),
      .d_byteenable                          (CPU_data_master_byteenable),
      .d_irq                                 (CPU_data_master_irq),
      .d_read                                (CPU_data_master_read),
      .d_readdata                            (CPU_data_master_readdata),
      .d_waitrequest                         (CPU_data_master_waitrequest),
      .d_write                               (CPU_data_master_write),
      .d_writedata                           (CPU_data_master_writedata),
      .i_address                             (CPU_instruction_master_address),
      .i_read                                (CPU_instruction_master_read),
      .i_readdata                            (CPU_instruction_master_readdata),
      .i_waitrequest                         (CPU_instruction_master_waitrequest),
      .jtag_debug_module_address             (CPU_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (CPU_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (CPU_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (CPU_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (CPU_data_master_debugaccess),
      .jtag_debug_module_readdata            (CPU_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (CPU_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (CPU_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (CPU_jtag_debug_module_write),
      .jtag_debug_module_writedata           (CPU_jtag_debug_module_writedata),
      .reset_n                               (CPU_jtag_debug_module_reset_n)
    );

  Expansion_JP1_avalon_parallel_port_slave_arbitrator the_Expansion_JP1_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                    (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                          (CPU_data_master_byteenable),
      .CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave                    (CPU_data_master_granted_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_read                                                                (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave                   (CPU_data_master_requests_Expansion_JP1_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                         (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                               (CPU_data_master_write),
      .CPU_data_master_writedata                                                           (CPU_data_master_writedata),
      .Expansion_JP1_avalon_parallel_port_slave_address                                    (Expansion_JP1_avalon_parallel_port_slave_address),
      .Expansion_JP1_avalon_parallel_port_slave_byteenable                                 (Expansion_JP1_avalon_parallel_port_slave_byteenable),
      .Expansion_JP1_avalon_parallel_port_slave_chipselect                                 (Expansion_JP1_avalon_parallel_port_slave_chipselect),
      .Expansion_JP1_avalon_parallel_port_slave_irq                                        (Expansion_JP1_avalon_parallel_port_slave_irq),
      .Expansion_JP1_avalon_parallel_port_slave_irq_from_sa                                (Expansion_JP1_avalon_parallel_port_slave_irq_from_sa),
      .Expansion_JP1_avalon_parallel_port_slave_read                                       (Expansion_JP1_avalon_parallel_port_slave_read),
      .Expansion_JP1_avalon_parallel_port_slave_readdata                                   (Expansion_JP1_avalon_parallel_port_slave_readdata),
      .Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa                           (Expansion_JP1_avalon_parallel_port_slave_readdata_from_sa),
      .Expansion_JP1_avalon_parallel_port_slave_reset                                      (Expansion_JP1_avalon_parallel_port_slave_reset),
      .Expansion_JP1_avalon_parallel_port_slave_write                                      (Expansion_JP1_avalon_parallel_port_slave_write),
      .Expansion_JP1_avalon_parallel_port_slave_writedata                                  (Expansion_JP1_avalon_parallel_port_slave_writedata),
      .clk                                                                                 (clk),
      .d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer                                (d1_Expansion_JP1_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Expansion_JP1_avalon_parallel_port_slave),
      .reset_n                                                                             (clk_reset_n)
    );

  Expansion_JP1 the_Expansion_JP1
    (
      .GPIO_0     (GPIO_0_to_and_from_the_Expansion_JP1),
      .address    (Expansion_JP1_avalon_parallel_port_slave_address),
      .byteenable (Expansion_JP1_avalon_parallel_port_slave_byteenable),
      .chipselect (Expansion_JP1_avalon_parallel_port_slave_chipselect),
      .clk        (clk),
      .irq        (Expansion_JP1_avalon_parallel_port_slave_irq),
      .read       (Expansion_JP1_avalon_parallel_port_slave_read),
      .readdata   (Expansion_JP1_avalon_parallel_port_slave_readdata),
      .reset      (Expansion_JP1_avalon_parallel_port_slave_reset),
      .write      (Expansion_JP1_avalon_parallel_port_slave_write),
      .writedata  (Expansion_JP1_avalon_parallel_port_slave_writedata)
    );

  Expansion_JP2_avalon_parallel_port_slave_arbitrator the_Expansion_JP2_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                    (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                          (CPU_data_master_byteenable),
      .CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave                    (CPU_data_master_granted_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_read                                                                (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave                   (CPU_data_master_requests_Expansion_JP2_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                         (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                               (CPU_data_master_write),
      .CPU_data_master_writedata                                                           (CPU_data_master_writedata),
      .Expansion_JP2_avalon_parallel_port_slave_address                                    (Expansion_JP2_avalon_parallel_port_slave_address),
      .Expansion_JP2_avalon_parallel_port_slave_byteenable                                 (Expansion_JP2_avalon_parallel_port_slave_byteenable),
      .Expansion_JP2_avalon_parallel_port_slave_chipselect                                 (Expansion_JP2_avalon_parallel_port_slave_chipselect),
      .Expansion_JP2_avalon_parallel_port_slave_irq                                        (Expansion_JP2_avalon_parallel_port_slave_irq),
      .Expansion_JP2_avalon_parallel_port_slave_irq_from_sa                                (Expansion_JP2_avalon_parallel_port_slave_irq_from_sa),
      .Expansion_JP2_avalon_parallel_port_slave_read                                       (Expansion_JP2_avalon_parallel_port_slave_read),
      .Expansion_JP2_avalon_parallel_port_slave_readdata                                   (Expansion_JP2_avalon_parallel_port_slave_readdata),
      .Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa                           (Expansion_JP2_avalon_parallel_port_slave_readdata_from_sa),
      .Expansion_JP2_avalon_parallel_port_slave_reset                                      (Expansion_JP2_avalon_parallel_port_slave_reset),
      .Expansion_JP2_avalon_parallel_port_slave_write                                      (Expansion_JP2_avalon_parallel_port_slave_write),
      .Expansion_JP2_avalon_parallel_port_slave_writedata                                  (Expansion_JP2_avalon_parallel_port_slave_writedata),
      .clk                                                                                 (clk),
      .d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer                                (d1_Expansion_JP2_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Expansion_JP2_avalon_parallel_port_slave),
      .reset_n                                                                             (clk_reset_n)
    );

  Expansion_JP2 the_Expansion_JP2
    (
      .GPIO_1     (GPIO_1_to_and_from_the_Expansion_JP2),
      .address    (Expansion_JP2_avalon_parallel_port_slave_address),
      .byteenable (Expansion_JP2_avalon_parallel_port_slave_byteenable),
      .chipselect (Expansion_JP2_avalon_parallel_port_slave_chipselect),
      .clk        (clk),
      .irq        (Expansion_JP2_avalon_parallel_port_slave_irq),
      .read       (Expansion_JP2_avalon_parallel_port_slave_read),
      .readdata   (Expansion_JP2_avalon_parallel_port_slave_readdata),
      .reset      (Expansion_JP2_avalon_parallel_port_slave_reset),
      .write      (Expansion_JP2_avalon_parallel_port_slave_write),
      .writedata  (Expansion_JP2_avalon_parallel_port_slave_writedata)
    );

  Green_LEDs_avalon_parallel_port_slave_arbitrator the_Green_LEDs_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                 (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                       (CPU_data_master_byteenable),
      .CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave                    (CPU_data_master_granted_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_read                                                             (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave                   (CPU_data_master_requests_Green_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                      (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                            (CPU_data_master_write),
      .CPU_data_master_writedata                                                        (CPU_data_master_writedata),
      .Green_LEDs_avalon_parallel_port_slave_address                                    (Green_LEDs_avalon_parallel_port_slave_address),
      .Green_LEDs_avalon_parallel_port_slave_byteenable                                 (Green_LEDs_avalon_parallel_port_slave_byteenable),
      .Green_LEDs_avalon_parallel_port_slave_chipselect                                 (Green_LEDs_avalon_parallel_port_slave_chipselect),
      .Green_LEDs_avalon_parallel_port_slave_read                                       (Green_LEDs_avalon_parallel_port_slave_read),
      .Green_LEDs_avalon_parallel_port_slave_readdata                                   (Green_LEDs_avalon_parallel_port_slave_readdata),
      .Green_LEDs_avalon_parallel_port_slave_readdata_from_sa                           (Green_LEDs_avalon_parallel_port_slave_readdata_from_sa),
      .Green_LEDs_avalon_parallel_port_slave_reset                                      (Green_LEDs_avalon_parallel_port_slave_reset),
      .Green_LEDs_avalon_parallel_port_slave_write                                      (Green_LEDs_avalon_parallel_port_slave_write),
      .Green_LEDs_avalon_parallel_port_slave_writedata                                  (Green_LEDs_avalon_parallel_port_slave_writedata),
      .clk                                                                              (clk),
      .d1_Green_LEDs_avalon_parallel_port_slave_end_xfer                                (d1_Green_LEDs_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Green_LEDs_avalon_parallel_port_slave),
      .reset_n                                                                          (clk_reset_n)
    );

  Green_LEDs the_Green_LEDs
    (
      .LEDG       (LEDG_from_the_Green_LEDs),
      .address    (Green_LEDs_avalon_parallel_port_slave_address),
      .byteenable (Green_LEDs_avalon_parallel_port_slave_byteenable),
      .chipselect (Green_LEDs_avalon_parallel_port_slave_chipselect),
      .clk        (clk),
      .read       (Green_LEDs_avalon_parallel_port_slave_read),
      .readdata   (Green_LEDs_avalon_parallel_port_slave_readdata),
      .reset      (Green_LEDs_avalon_parallel_port_slave_reset),
      .write      (Green_LEDs_avalon_parallel_port_slave_write),
      .writedata  (Green_LEDs_avalon_parallel_port_slave_writedata)
    );

  HEX3_HEX0_avalon_parallel_port_slave_arbitrator the_HEX3_HEX0_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                      (CPU_data_master_byteenable),
      .CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave                    (CPU_data_master_granted_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave          (CPU_data_master_qualified_request_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_read                                                            (CPU_data_master_read),
      .CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave                   (CPU_data_master_requests_HEX3_HEX0_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                     (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                           (CPU_data_master_write),
      .CPU_data_master_writedata                                                       (CPU_data_master_writedata),
      .HEX3_HEX0_avalon_parallel_port_slave_address                                    (HEX3_HEX0_avalon_parallel_port_slave_address),
      .HEX3_HEX0_avalon_parallel_port_slave_byteenable                                 (HEX3_HEX0_avalon_parallel_port_slave_byteenable),
      .HEX3_HEX0_avalon_parallel_port_slave_chipselect                                 (HEX3_HEX0_avalon_parallel_port_slave_chipselect),
      .HEX3_HEX0_avalon_parallel_port_slave_read                                       (HEX3_HEX0_avalon_parallel_port_slave_read),
      .HEX3_HEX0_avalon_parallel_port_slave_readdata                                   (HEX3_HEX0_avalon_parallel_port_slave_readdata),
      .HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa                           (HEX3_HEX0_avalon_parallel_port_slave_readdata_from_sa),
      .HEX3_HEX0_avalon_parallel_port_slave_reset                                      (HEX3_HEX0_avalon_parallel_port_slave_reset),
      .HEX3_HEX0_avalon_parallel_port_slave_write                                      (HEX3_HEX0_avalon_parallel_port_slave_write),
      .HEX3_HEX0_avalon_parallel_port_slave_writedata                                  (HEX3_HEX0_avalon_parallel_port_slave_writedata),
      .clk                                                                             (clk),
      .d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer                                (d1_HEX3_HEX0_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_HEX3_HEX0_avalon_parallel_port_slave),
      .reset_n                                                                         (clk_reset_n)
    );

  HEX3_HEX0 the_HEX3_HEX0
    (
      .HEX0       (HEX0_from_the_HEX3_HEX0),
      .HEX1       (HEX1_from_the_HEX3_HEX0),
      .HEX2       (HEX2_from_the_HEX3_HEX0),
      .HEX3       (HEX3_from_the_HEX3_HEX0),
      .address    (HEX3_HEX0_avalon_parallel_port_slave_address),
      .byteenable (HEX3_HEX0_avalon_parallel_port_slave_byteenable),
      .chipselect (HEX3_HEX0_avalon_parallel_port_slave_chipselect),
      .clk        (clk),
      .read       (HEX3_HEX0_avalon_parallel_port_slave_read),
      .readdata   (HEX3_HEX0_avalon_parallel_port_slave_readdata),
      .reset      (HEX3_HEX0_avalon_parallel_port_slave_reset),
      .write      (HEX3_HEX0_avalon_parallel_port_slave_write),
      .writedata  (HEX3_HEX0_avalon_parallel_port_slave_writedata)
    );

  HEX7_HEX4_avalon_parallel_port_slave_arbitrator the_HEX7_HEX4_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                      (CPU_data_master_byteenable),
      .CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave                    (CPU_data_master_granted_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave          (CPU_data_master_qualified_request_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_read                                                            (CPU_data_master_read),
      .CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave                   (CPU_data_master_requests_HEX7_HEX4_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                     (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                           (CPU_data_master_write),
      .CPU_data_master_writedata                                                       (CPU_data_master_writedata),
      .HEX7_HEX4_avalon_parallel_port_slave_address                                    (HEX7_HEX4_avalon_parallel_port_slave_address),
      .HEX7_HEX4_avalon_parallel_port_slave_byteenable                                 (HEX7_HEX4_avalon_parallel_port_slave_byteenable),
      .HEX7_HEX4_avalon_parallel_port_slave_chipselect                                 (HEX7_HEX4_avalon_parallel_port_slave_chipselect),
      .HEX7_HEX4_avalon_parallel_port_slave_read                                       (HEX7_HEX4_avalon_parallel_port_slave_read),
      .HEX7_HEX4_avalon_parallel_port_slave_readdata                                   (HEX7_HEX4_avalon_parallel_port_slave_readdata),
      .HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa                           (HEX7_HEX4_avalon_parallel_port_slave_readdata_from_sa),
      .HEX7_HEX4_avalon_parallel_port_slave_reset                                      (HEX7_HEX4_avalon_parallel_port_slave_reset),
      .HEX7_HEX4_avalon_parallel_port_slave_write                                      (HEX7_HEX4_avalon_parallel_port_slave_write),
      .HEX7_HEX4_avalon_parallel_port_slave_writedata                                  (HEX7_HEX4_avalon_parallel_port_slave_writedata),
      .clk                                                                             (clk),
      .d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer                                (d1_HEX7_HEX4_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_HEX7_HEX4_avalon_parallel_port_slave),
      .reset_n                                                                         (clk_reset_n)
    );

  HEX7_HEX4 the_HEX7_HEX4
    (
      .HEX4       (HEX4_from_the_HEX7_HEX4),
      .HEX5       (HEX5_from_the_HEX7_HEX4),
      .HEX6       (HEX6_from_the_HEX7_HEX4),
      .HEX7       (HEX7_from_the_HEX7_HEX4),
      .address    (HEX7_HEX4_avalon_parallel_port_slave_address),
      .byteenable (HEX7_HEX4_avalon_parallel_port_slave_byteenable),
      .chipselect (HEX7_HEX4_avalon_parallel_port_slave_chipselect),
      .clk        (clk),
      .read       (HEX7_HEX4_avalon_parallel_port_slave_read),
      .readdata   (HEX7_HEX4_avalon_parallel_port_slave_readdata),
      .reset      (HEX7_HEX4_avalon_parallel_port_slave_reset),
      .write      (HEX7_HEX4_avalon_parallel_port_slave_write),
      .writedata  (HEX7_HEX4_avalon_parallel_port_slave_writedata)
    );

  Interval_timer_s1_arbitrator the_Interval_timer_s1
    (
      .CPU_data_master_address_to_slave                    (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_Interval_timer_s1           (CPU_data_master_granted_Interval_timer_s1),
      .CPU_data_master_qualified_request_Interval_timer_s1 (CPU_data_master_qualified_request_Interval_timer_s1),
      .CPU_data_master_read                                (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Interval_timer_s1   (CPU_data_master_read_data_valid_Interval_timer_s1),
      .CPU_data_master_requests_Interval_timer_s1          (CPU_data_master_requests_Interval_timer_s1),
      .CPU_data_master_waitrequest                         (CPU_data_master_waitrequest),
      .CPU_data_master_write                               (CPU_data_master_write),
      .CPU_data_master_writedata                           (CPU_data_master_writedata),
      .Interval_timer_s1_address                           (Interval_timer_s1_address),
      .Interval_timer_s1_chipselect                        (Interval_timer_s1_chipselect),
      .Interval_timer_s1_irq                               (Interval_timer_s1_irq),
      .Interval_timer_s1_irq_from_sa                       (Interval_timer_s1_irq_from_sa),
      .Interval_timer_s1_readdata                          (Interval_timer_s1_readdata),
      .Interval_timer_s1_readdata_from_sa                  (Interval_timer_s1_readdata_from_sa),
      .Interval_timer_s1_reset_n                           (Interval_timer_s1_reset_n),
      .Interval_timer_s1_write_n                           (Interval_timer_s1_write_n),
      .Interval_timer_s1_writedata                         (Interval_timer_s1_writedata),
      .clk                                                 (clk),
      .d1_Interval_timer_s1_end_xfer                       (d1_Interval_timer_s1_end_xfer),
      .reset_n                                             (clk_reset_n)
    );

  Interval_timer the_Interval_timer
    (
      .address    (Interval_timer_s1_address),
      .chipselect (Interval_timer_s1_chipselect),
      .clk        (clk),
      .irq        (Interval_timer_s1_irq),
      .readdata   (Interval_timer_s1_readdata),
      .reset_n    (Interval_timer_s1_reset_n),
      .write_n    (Interval_timer_s1_write_n),
      .writedata  (Interval_timer_s1_writedata)
    );

  JTAG_UART_avalon_jtag_slave_arbitrator the_JTAG_UART_avalon_jtag_slave
    (
      .CPU_data_master_address_to_slave                              (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_JTAG_UART_avalon_jtag_slave           (CPU_data_master_granted_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave (CPU_data_master_qualified_request_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_read                                          (CPU_data_master_read),
      .CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave   (CPU_data_master_read_data_valid_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_requests_JTAG_UART_avalon_jtag_slave          (CPU_data_master_requests_JTAG_UART_avalon_jtag_slave),
      .CPU_data_master_waitrequest                                   (CPU_data_master_waitrequest),
      .CPU_data_master_write                                         (CPU_data_master_write),
      .CPU_data_master_writedata                                     (CPU_data_master_writedata),
      .JTAG_UART_avalon_jtag_slave_address                           (JTAG_UART_avalon_jtag_slave_address),
      .JTAG_UART_avalon_jtag_slave_chipselect                        (JTAG_UART_avalon_jtag_slave_chipselect),
      .JTAG_UART_avalon_jtag_slave_dataavailable                     (JTAG_UART_avalon_jtag_slave_dataavailable),
      .JTAG_UART_avalon_jtag_slave_dataavailable_from_sa             (JTAG_UART_avalon_jtag_slave_dataavailable_from_sa),
      .JTAG_UART_avalon_jtag_slave_irq                               (JTAG_UART_avalon_jtag_slave_irq),
      .JTAG_UART_avalon_jtag_slave_irq_from_sa                       (JTAG_UART_avalon_jtag_slave_irq_from_sa),
      .JTAG_UART_avalon_jtag_slave_read_n                            (JTAG_UART_avalon_jtag_slave_read_n),
      .JTAG_UART_avalon_jtag_slave_readdata                          (JTAG_UART_avalon_jtag_slave_readdata),
      .JTAG_UART_avalon_jtag_slave_readdata_from_sa                  (JTAG_UART_avalon_jtag_slave_readdata_from_sa),
      .JTAG_UART_avalon_jtag_slave_readyfordata                      (JTAG_UART_avalon_jtag_slave_readyfordata),
      .JTAG_UART_avalon_jtag_slave_readyfordata_from_sa              (JTAG_UART_avalon_jtag_slave_readyfordata_from_sa),
      .JTAG_UART_avalon_jtag_slave_reset_n                           (JTAG_UART_avalon_jtag_slave_reset_n),
      .JTAG_UART_avalon_jtag_slave_waitrequest                       (JTAG_UART_avalon_jtag_slave_waitrequest),
      .JTAG_UART_avalon_jtag_slave_waitrequest_from_sa               (JTAG_UART_avalon_jtag_slave_waitrequest_from_sa),
      .JTAG_UART_avalon_jtag_slave_write_n                           (JTAG_UART_avalon_jtag_slave_write_n),
      .JTAG_UART_avalon_jtag_slave_writedata                         (JTAG_UART_avalon_jtag_slave_writedata),
      .clk                                                           (clk),
      .d1_JTAG_UART_avalon_jtag_slave_end_xfer                       (d1_JTAG_UART_avalon_jtag_slave_end_xfer),
      .reset_n                                                       (clk_reset_n)
    );

  JTAG_UART the_JTAG_UART
    (
      .av_address     (JTAG_UART_avalon_jtag_slave_address),
      .av_chipselect  (JTAG_UART_avalon_jtag_slave_chipselect),
      .av_irq         (JTAG_UART_avalon_jtag_slave_irq),
      .av_read_n      (JTAG_UART_avalon_jtag_slave_read_n),
      .av_readdata    (JTAG_UART_avalon_jtag_slave_readdata),
      .av_waitrequest (JTAG_UART_avalon_jtag_slave_waitrequest),
      .av_write_n     (JTAG_UART_avalon_jtag_slave_write_n),
      .av_writedata   (JTAG_UART_avalon_jtag_slave_writedata),
      .clk            (clk),
      .dataavailable  (JTAG_UART_avalon_jtag_slave_dataavailable),
      .readyfordata   (JTAG_UART_avalon_jtag_slave_readyfordata),
      .rst_n          (JTAG_UART_avalon_jtag_slave_reset_n)
    );

  Onchip_memory_s1_arbitrator the_Onchip_memory_s1
    (
      .CPU_instruction_master_address_to_slave                   (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_granted_Onchip_memory_s1           (CPU_instruction_master_granted_Onchip_memory_s1),
      .CPU_instruction_master_qualified_request_Onchip_memory_s1 (CPU_instruction_master_qualified_request_Onchip_memory_s1),
      .CPU_instruction_master_read                               (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_Onchip_memory_s1   (CPU_instruction_master_read_data_valid_Onchip_memory_s1),
      .CPU_instruction_master_requests_Onchip_memory_s1          (CPU_instruction_master_requests_Onchip_memory_s1),
      .Onchip_memory_s1_address                                  (Onchip_memory_s1_address),
      .Onchip_memory_s1_byteenable                               (Onchip_memory_s1_byteenable),
      .Onchip_memory_s1_chipselect                               (Onchip_memory_s1_chipselect),
      .Onchip_memory_s1_clken                                    (Onchip_memory_s1_clken),
      .Onchip_memory_s1_readdata                                 (Onchip_memory_s1_readdata),
      .Onchip_memory_s1_readdata_from_sa                         (Onchip_memory_s1_readdata_from_sa),
      .Onchip_memory_s1_reset                                    (Onchip_memory_s1_reset),
      .Onchip_memory_s1_write                                    (Onchip_memory_s1_write),
      .Onchip_memory_s1_writedata                                (Onchip_memory_s1_writedata),
      .clk                                                       (clk),
      .d1_Onchip_memory_s1_end_xfer                              (d1_Onchip_memory_s1_end_xfer),
      .reset_n                                                   (clk_reset_n)
    );

  Onchip_memory_s2_arbitrator the_Onchip_memory_s2
    (
      .CPU_data_master_address_to_slave                            (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                  (CPU_data_master_byteenable),
      .CPU_data_master_granted_Onchip_memory_s2                    (CPU_data_master_granted_Onchip_memory_s2),
      .CPU_data_master_qualified_request_Onchip_memory_s2          (CPU_data_master_qualified_request_Onchip_memory_s2),
      .CPU_data_master_read                                        (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Onchip_memory_s2            (CPU_data_master_read_data_valid_Onchip_memory_s2),
      .CPU_data_master_requests_Onchip_memory_s2                   (CPU_data_master_requests_Onchip_memory_s2),
      .CPU_data_master_waitrequest                                 (CPU_data_master_waitrequest),
      .CPU_data_master_write                                       (CPU_data_master_write),
      .CPU_data_master_writedata                                   (CPU_data_master_writedata),
      .Onchip_memory_s2_address                                    (Onchip_memory_s2_address),
      .Onchip_memory_s2_byteenable                                 (Onchip_memory_s2_byteenable),
      .Onchip_memory_s2_chipselect                                 (Onchip_memory_s2_chipselect),
      .Onchip_memory_s2_clken                                      (Onchip_memory_s2_clken),
      .Onchip_memory_s2_readdata                                   (Onchip_memory_s2_readdata),
      .Onchip_memory_s2_readdata_from_sa                           (Onchip_memory_s2_readdata_from_sa),
      .Onchip_memory_s2_reset                                      (Onchip_memory_s2_reset),
      .Onchip_memory_s2_write                                      (Onchip_memory_s2_write),
      .Onchip_memory_s2_writedata                                  (Onchip_memory_s2_writedata),
      .clk                                                         (clk),
      .d1_Onchip_memory_s2_end_xfer                                (d1_Onchip_memory_s2_end_xfer),
      .registered_CPU_data_master_read_data_valid_Onchip_memory_s2 (registered_CPU_data_master_read_data_valid_Onchip_memory_s2),
      .reset_n                                                     (clk_reset_n)
    );

  Onchip_memory the_Onchip_memory
    (
      .address     (Onchip_memory_s1_address),
      .address2    (Onchip_memory_s2_address),
      .byteenable  (Onchip_memory_s1_byteenable),
      .byteenable2 (Onchip_memory_s2_byteenable),
      .chipselect  (Onchip_memory_s1_chipselect),
      .chipselect2 (Onchip_memory_s2_chipselect),
      .clk         (clk),
      .clk2        (clk),
      .clken       (Onchip_memory_s1_clken),
      .clken2      (Onchip_memory_s2_clken),
      .readdata    (Onchip_memory_s1_readdata),
      .readdata2   (Onchip_memory_s2_readdata),
      .reset       (Onchip_memory_s1_reset),
      .reset2      (Onchip_memory_s2_reset),
      .write       (Onchip_memory_s1_write),
      .write2      (Onchip_memory_s2_write),
      .writedata   (Onchip_memory_s1_writedata),
      .writedata2  (Onchip_memory_s2_writedata)
    );

  Pushbuttons_avalon_parallel_port_slave_arbitrator the_Pushbuttons_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                  (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                        (CPU_data_master_byteenable),
      .CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave                    (CPU_data_master_granted_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_read                                                              (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave                   (CPU_data_master_requests_Pushbuttons_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                       (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                             (CPU_data_master_write),
      .CPU_data_master_writedata                                                         (CPU_data_master_writedata),
      .Pushbuttons_avalon_parallel_port_slave_address                                    (Pushbuttons_avalon_parallel_port_slave_address),
      .Pushbuttons_avalon_parallel_port_slave_byteenable                                 (Pushbuttons_avalon_parallel_port_slave_byteenable),
      .Pushbuttons_avalon_parallel_port_slave_chipselect                                 (Pushbuttons_avalon_parallel_port_slave_chipselect),
      .Pushbuttons_avalon_parallel_port_slave_irq                                        (Pushbuttons_avalon_parallel_port_slave_irq),
      .Pushbuttons_avalon_parallel_port_slave_irq_from_sa                                (Pushbuttons_avalon_parallel_port_slave_irq_from_sa),
      .Pushbuttons_avalon_parallel_port_slave_read                                       (Pushbuttons_avalon_parallel_port_slave_read),
      .Pushbuttons_avalon_parallel_port_slave_readdata                                   (Pushbuttons_avalon_parallel_port_slave_readdata),
      .Pushbuttons_avalon_parallel_port_slave_readdata_from_sa                           (Pushbuttons_avalon_parallel_port_slave_readdata_from_sa),
      .Pushbuttons_avalon_parallel_port_slave_reset                                      (Pushbuttons_avalon_parallel_port_slave_reset),
      .Pushbuttons_avalon_parallel_port_slave_write                                      (Pushbuttons_avalon_parallel_port_slave_write),
      .Pushbuttons_avalon_parallel_port_slave_writedata                                  (Pushbuttons_avalon_parallel_port_slave_writedata),
      .clk                                                                               (clk),
      .d1_Pushbuttons_avalon_parallel_port_slave_end_xfer                                (d1_Pushbuttons_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Pushbuttons_avalon_parallel_port_slave),
      .reset_n                                                                           (clk_reset_n)
    );

  Pushbuttons the_Pushbuttons
    (
      .KEY        (KEY_to_the_Pushbuttons),
      .address    (Pushbuttons_avalon_parallel_port_slave_address),
      .byteenable (Pushbuttons_avalon_parallel_port_slave_byteenable),
      .chipselect (Pushbuttons_avalon_parallel_port_slave_chipselect),
      .clk        (clk),
      .irq        (Pushbuttons_avalon_parallel_port_slave_irq),
      .read       (Pushbuttons_avalon_parallel_port_slave_read),
      .readdata   (Pushbuttons_avalon_parallel_port_slave_readdata),
      .reset      (Pushbuttons_avalon_parallel_port_slave_reset),
      .write      (Pushbuttons_avalon_parallel_port_slave_write),
      .writedata  (Pushbuttons_avalon_parallel_port_slave_writedata)
    );

  Red_LEDs_avalon_parallel_port_slave_arbitrator the_Red_LEDs_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                               (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                     (CPU_data_master_byteenable),
      .CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave                    (CPU_data_master_granted_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_read                                                           (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave                   (CPU_data_master_requests_Red_LEDs_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                    (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                          (CPU_data_master_write),
      .CPU_data_master_writedata                                                      (CPU_data_master_writedata),
      .Red_LEDs_avalon_parallel_port_slave_address                                    (Red_LEDs_avalon_parallel_port_slave_address),
      .Red_LEDs_avalon_parallel_port_slave_byteenable                                 (Red_LEDs_avalon_parallel_port_slave_byteenable),
      .Red_LEDs_avalon_parallel_port_slave_chipselect                                 (Red_LEDs_avalon_parallel_port_slave_chipselect),
      .Red_LEDs_avalon_parallel_port_slave_read                                       (Red_LEDs_avalon_parallel_port_slave_read),
      .Red_LEDs_avalon_parallel_port_slave_readdata                                   (Red_LEDs_avalon_parallel_port_slave_readdata),
      .Red_LEDs_avalon_parallel_port_slave_readdata_from_sa                           (Red_LEDs_avalon_parallel_port_slave_readdata_from_sa),
      .Red_LEDs_avalon_parallel_port_slave_reset                                      (Red_LEDs_avalon_parallel_port_slave_reset),
      .Red_LEDs_avalon_parallel_port_slave_write                                      (Red_LEDs_avalon_parallel_port_slave_write),
      .Red_LEDs_avalon_parallel_port_slave_writedata                                  (Red_LEDs_avalon_parallel_port_slave_writedata),
      .clk                                                                            (clk),
      .d1_Red_LEDs_avalon_parallel_port_slave_end_xfer                                (d1_Red_LEDs_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Red_LEDs_avalon_parallel_port_slave),
      .reset_n                                                                        (clk_reset_n)
    );

  Red_LEDs the_Red_LEDs
    (
      .LEDR       (LEDR_from_the_Red_LEDs),
      .address    (Red_LEDs_avalon_parallel_port_slave_address),
      .byteenable (Red_LEDs_avalon_parallel_port_slave_byteenable),
      .chipselect (Red_LEDs_avalon_parallel_port_slave_chipselect),
      .clk        (clk),
      .read       (Red_LEDs_avalon_parallel_port_slave_read),
      .readdata   (Red_LEDs_avalon_parallel_port_slave_readdata),
      .reset      (Red_LEDs_avalon_parallel_port_slave_reset),
      .write      (Red_LEDs_avalon_parallel_port_slave_write),
      .writedata  (Red_LEDs_avalon_parallel_port_slave_writedata)
    );

  SDRAM_s1_arbitrator the_SDRAM_s1
    (
      .CPU_data_master_address_to_slave                               (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                     (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_SDRAM_s1                            (CPU_data_master_byteenable_SDRAM_s1),
      .CPU_data_master_dbs_address                                    (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_16                                   (CPU_data_master_dbs_write_16),
      .CPU_data_master_granted_SDRAM_s1                               (CPU_data_master_granted_SDRAM_s1),
      .CPU_data_master_no_byte_enables_and_last_term                  (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_SDRAM_s1                     (CPU_data_master_qualified_request_SDRAM_s1),
      .CPU_data_master_read                                           (CPU_data_master_read),
      .CPU_data_master_read_data_valid_SDRAM_s1                       (CPU_data_master_read_data_valid_SDRAM_s1),
      .CPU_data_master_read_data_valid_SDRAM_s1_shift_register        (CPU_data_master_read_data_valid_SDRAM_s1_shift_register),
      .CPU_data_master_requests_SDRAM_s1                              (CPU_data_master_requests_SDRAM_s1),
      .CPU_data_master_waitrequest                                    (CPU_data_master_waitrequest),
      .CPU_data_master_write                                          (CPU_data_master_write),
      .CPU_instruction_master_address_to_slave                        (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_dbs_address                             (CPU_instruction_master_dbs_address),
      .CPU_instruction_master_granted_SDRAM_s1                        (CPU_instruction_master_granted_SDRAM_s1),
      .CPU_instruction_master_qualified_request_SDRAM_s1              (CPU_instruction_master_qualified_request_SDRAM_s1),
      .CPU_instruction_master_read                                    (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_SDRAM_s1                (CPU_instruction_master_read_data_valid_SDRAM_s1),
      .CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register (CPU_instruction_master_read_data_valid_SDRAM_s1_shift_register),
      .CPU_instruction_master_requests_SDRAM_s1                       (CPU_instruction_master_requests_SDRAM_s1),
      .SDRAM_s1_address                                               (SDRAM_s1_address),
      .SDRAM_s1_byteenable_n                                          (SDRAM_s1_byteenable_n),
      .SDRAM_s1_chipselect                                            (SDRAM_s1_chipselect),
      .SDRAM_s1_read_n                                                (SDRAM_s1_read_n),
      .SDRAM_s1_readdata                                              (SDRAM_s1_readdata),
      .SDRAM_s1_readdata_from_sa                                      (SDRAM_s1_readdata_from_sa),
      .SDRAM_s1_readdatavalid                                         (SDRAM_s1_readdatavalid),
      .SDRAM_s1_reset_n                                               (SDRAM_s1_reset_n),
      .SDRAM_s1_waitrequest                                           (SDRAM_s1_waitrequest),
      .SDRAM_s1_waitrequest_from_sa                                   (SDRAM_s1_waitrequest_from_sa),
      .SDRAM_s1_write_n                                               (SDRAM_s1_write_n),
      .SDRAM_s1_writedata                                             (SDRAM_s1_writedata),
      .clk                                                            (clk),
      .d1_SDRAM_s1_end_xfer                                           (d1_SDRAM_s1_end_xfer),
      .reset_n                                                        (clk_reset_n)
    );

  SDRAM the_SDRAM
    (
      .az_addr        (SDRAM_s1_address),
      .az_be_n        (SDRAM_s1_byteenable_n),
      .az_cs          (SDRAM_s1_chipselect),
      .az_data        (SDRAM_s1_writedata),
      .az_rd_n        (SDRAM_s1_read_n),
      .az_wr_n        (SDRAM_s1_write_n),
      .clk            (clk),
      .reset_n        (SDRAM_s1_reset_n),
      .za_data        (SDRAM_s1_readdata),
      .za_valid       (SDRAM_s1_readdatavalid),
      .za_waitrequest (SDRAM_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_SDRAM),
      .zs_ba          (zs_ba_from_the_SDRAM),
      .zs_cas_n       (zs_cas_n_from_the_SDRAM),
      .zs_cke         (zs_cke_from_the_SDRAM),
      .zs_cs_n        (zs_cs_n_from_the_SDRAM),
      .zs_dq          (zs_dq_to_and_from_the_SDRAM),
      .zs_dqm         (zs_dqm_from_the_SDRAM),
      .zs_ras_n       (zs_ras_n_from_the_SDRAM),
      .zs_we_n        (zs_we_n_from_the_SDRAM)
    );

  SRAM_avalon_sram_slave_arbitrator the_SRAM_avalon_sram_slave
    (
      .CPU_data_master_address_to_slave                                             (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                   (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_SRAM_avalon_sram_slave                            (CPU_data_master_byteenable_SRAM_avalon_sram_slave),
      .CPU_data_master_dbs_address                                                  (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_16                                                 (CPU_data_master_dbs_write_16),
      .CPU_data_master_granted_SRAM_avalon_sram_slave                               (CPU_data_master_granted_SRAM_avalon_sram_slave),
      .CPU_data_master_no_byte_enables_and_last_term                                (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_SRAM_avalon_sram_slave                     (CPU_data_master_qualified_request_SRAM_avalon_sram_slave),
      .CPU_data_master_read                                                         (CPU_data_master_read),
      .CPU_data_master_read_data_valid_SRAM_avalon_sram_slave                       (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave),
      .CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register        (CPU_data_master_read_data_valid_SRAM_avalon_sram_slave_shift_register),
      .CPU_data_master_requests_SRAM_avalon_sram_slave                              (CPU_data_master_requests_SRAM_avalon_sram_slave),
      .CPU_data_master_waitrequest                                                  (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                        (CPU_data_master_write),
      .CPU_instruction_master_address_to_slave                                      (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_dbs_address                                           (CPU_instruction_master_dbs_address),
      .CPU_instruction_master_granted_SRAM_avalon_sram_slave                        (CPU_instruction_master_granted_SRAM_avalon_sram_slave),
      .CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave              (CPU_instruction_master_qualified_request_SRAM_avalon_sram_slave),
      .CPU_instruction_master_read                                                  (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave                (CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave),
      .CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register (CPU_instruction_master_read_data_valid_SRAM_avalon_sram_slave_shift_register),
      .CPU_instruction_master_requests_SRAM_avalon_sram_slave                       (CPU_instruction_master_requests_SRAM_avalon_sram_slave),
      .SRAM_avalon_sram_slave_address                                               (SRAM_avalon_sram_slave_address),
      .SRAM_avalon_sram_slave_byteenable                                            (SRAM_avalon_sram_slave_byteenable),
      .SRAM_avalon_sram_slave_read                                                  (SRAM_avalon_sram_slave_read),
      .SRAM_avalon_sram_slave_readdata                                              (SRAM_avalon_sram_slave_readdata),
      .SRAM_avalon_sram_slave_readdata_from_sa                                      (SRAM_avalon_sram_slave_readdata_from_sa),
      .SRAM_avalon_sram_slave_readdatavalid                                         (SRAM_avalon_sram_slave_readdatavalid),
      .SRAM_avalon_sram_slave_reset                                                 (SRAM_avalon_sram_slave_reset),
      .SRAM_avalon_sram_slave_write                                                 (SRAM_avalon_sram_slave_write),
      .SRAM_avalon_sram_slave_writedata                                             (SRAM_avalon_sram_slave_writedata),
      .clk                                                                          (clk),
      .d1_SRAM_avalon_sram_slave_end_xfer                                           (d1_SRAM_avalon_sram_slave_end_xfer),
      .reset_n                                                                      (clk_reset_n)
    );

  SRAM the_SRAM
    (
      .SRAM_ADDR     (SRAM_ADDR_from_the_SRAM),
      .SRAM_CE_N     (SRAM_CE_N_from_the_SRAM),
      .SRAM_DQ       (SRAM_DQ_to_and_from_the_SRAM),
      .SRAM_LB_N     (SRAM_LB_N_from_the_SRAM),
      .SRAM_OE_N     (SRAM_OE_N_from_the_SRAM),
      .SRAM_UB_N     (SRAM_UB_N_from_the_SRAM),
      .SRAM_WE_N     (SRAM_WE_N_from_the_SRAM),
      .address       (SRAM_avalon_sram_slave_address),
      .byteenable    (SRAM_avalon_sram_slave_byteenable),
      .clk           (clk),
      .read          (SRAM_avalon_sram_slave_read),
      .readdata      (SRAM_avalon_sram_slave_readdata),
      .readdatavalid (SRAM_avalon_sram_slave_readdatavalid),
      .reset         (SRAM_avalon_sram_slave_reset),
      .write         (SRAM_avalon_sram_slave_write),
      .writedata     (SRAM_avalon_sram_slave_writedata)
    );

  Serial_port_avalon_rs232_slave_arbitrator the_Serial_port_avalon_rs232_slave
    (
      .CPU_data_master_address_to_slave                                          (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                (CPU_data_master_byteenable),
      .CPU_data_master_granted_Serial_port_avalon_rs232_slave                    (CPU_data_master_granted_Serial_port_avalon_rs232_slave),
      .CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave          (CPU_data_master_qualified_request_Serial_port_avalon_rs232_slave),
      .CPU_data_master_read                                                      (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave            (CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave),
      .CPU_data_master_requests_Serial_port_avalon_rs232_slave                   (CPU_data_master_requests_Serial_port_avalon_rs232_slave),
      .CPU_data_master_waitrequest                                               (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                     (CPU_data_master_write),
      .CPU_data_master_writedata                                                 (CPU_data_master_writedata),
      .Serial_port_avalon_rs232_slave_address                                    (Serial_port_avalon_rs232_slave_address),
      .Serial_port_avalon_rs232_slave_byteenable                                 (Serial_port_avalon_rs232_slave_byteenable),
      .Serial_port_avalon_rs232_slave_chipselect                                 (Serial_port_avalon_rs232_slave_chipselect),
      .Serial_port_avalon_rs232_slave_irq                                        (Serial_port_avalon_rs232_slave_irq),
      .Serial_port_avalon_rs232_slave_irq_from_sa                                (Serial_port_avalon_rs232_slave_irq_from_sa),
      .Serial_port_avalon_rs232_slave_read                                       (Serial_port_avalon_rs232_slave_read),
      .Serial_port_avalon_rs232_slave_readdata                                   (Serial_port_avalon_rs232_slave_readdata),
      .Serial_port_avalon_rs232_slave_readdata_from_sa                           (Serial_port_avalon_rs232_slave_readdata_from_sa),
      .Serial_port_avalon_rs232_slave_reset                                      (Serial_port_avalon_rs232_slave_reset),
      .Serial_port_avalon_rs232_slave_write                                      (Serial_port_avalon_rs232_slave_write),
      .Serial_port_avalon_rs232_slave_writedata                                  (Serial_port_avalon_rs232_slave_writedata),
      .clk                                                                       (clk),
      .d1_Serial_port_avalon_rs232_slave_end_xfer                                (d1_Serial_port_avalon_rs232_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave (registered_CPU_data_master_read_data_valid_Serial_port_avalon_rs232_slave),
      .reset_n                                                                   (clk_reset_n)
    );

  Serial_port the_Serial_port
    (
      .UART_RXD   (UART_RXD_to_the_Serial_port),
      .UART_TXD   (UART_TXD_from_the_Serial_port),
      .address    (Serial_port_avalon_rs232_slave_address),
      .byteenable (Serial_port_avalon_rs232_slave_byteenable),
      .chipselect (Serial_port_avalon_rs232_slave_chipselect),
      .clk        (clk),
      .irq        (Serial_port_avalon_rs232_slave_irq),
      .read       (Serial_port_avalon_rs232_slave_read),
      .readdata   (Serial_port_avalon_rs232_slave_readdata),
      .reset      (Serial_port_avalon_rs232_slave_reset),
      .write      (Serial_port_avalon_rs232_slave_write),
      .writedata  (Serial_port_avalon_rs232_slave_writedata)
    );

  Slider_switches_avalon_parallel_port_slave_arbitrator the_Slider_switches_avalon_parallel_port_slave
    (
      .CPU_data_master_address_to_slave                                                      (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                            (CPU_data_master_byteenable),
      .CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave                    (CPU_data_master_granted_Slider_switches_avalon_parallel_port_slave),
      .CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave          (CPU_data_master_qualified_request_Slider_switches_avalon_parallel_port_slave),
      .CPU_data_master_read                                                                  (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave            (CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave),
      .CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave                   (CPU_data_master_requests_Slider_switches_avalon_parallel_port_slave),
      .CPU_data_master_waitrequest                                                           (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                                 (CPU_data_master_write),
      .CPU_data_master_writedata                                                             (CPU_data_master_writedata),
      .Slider_switches_avalon_parallel_port_slave_address                                    (Slider_switches_avalon_parallel_port_slave_address),
      .Slider_switches_avalon_parallel_port_slave_byteenable                                 (Slider_switches_avalon_parallel_port_slave_byteenable),
      .Slider_switches_avalon_parallel_port_slave_chipselect                                 (Slider_switches_avalon_parallel_port_slave_chipselect),
      .Slider_switches_avalon_parallel_port_slave_read                                       (Slider_switches_avalon_parallel_port_slave_read),
      .Slider_switches_avalon_parallel_port_slave_readdata                                   (Slider_switches_avalon_parallel_port_slave_readdata),
      .Slider_switches_avalon_parallel_port_slave_readdata_from_sa                           (Slider_switches_avalon_parallel_port_slave_readdata_from_sa),
      .Slider_switches_avalon_parallel_port_slave_reset                                      (Slider_switches_avalon_parallel_port_slave_reset),
      .Slider_switches_avalon_parallel_port_slave_write                                      (Slider_switches_avalon_parallel_port_slave_write),
      .Slider_switches_avalon_parallel_port_slave_writedata                                  (Slider_switches_avalon_parallel_port_slave_writedata),
      .clk                                                                                   (clk),
      .d1_Slider_switches_avalon_parallel_port_slave_end_xfer                                (d1_Slider_switches_avalon_parallel_port_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave (registered_CPU_data_master_read_data_valid_Slider_switches_avalon_parallel_port_slave),
      .reset_n                                                                               (clk_reset_n)
    );

  Slider_switches the_Slider_switches
    (
      .SW         (SW_to_the_Slider_switches),
      .address    (Slider_switches_avalon_parallel_port_slave_address),
      .byteenable (Slider_switches_avalon_parallel_port_slave_byteenable),
      .chipselect (Slider_switches_avalon_parallel_port_slave_chipselect),
      .clk        (clk),
      .read       (Slider_switches_avalon_parallel_port_slave_read),
      .readdata   (Slider_switches_avalon_parallel_port_slave_readdata),
      .reset      (Slider_switches_avalon_parallel_port_slave_reset),
      .write      (Slider_switches_avalon_parallel_port_slave_write),
      .writedata  (Slider_switches_avalon_parallel_port_slave_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .CPU_data_master_address_to_slave                      (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_sysid_control_slave           (CPU_data_master_granted_sysid_control_slave),
      .CPU_data_master_qualified_request_sysid_control_slave (CPU_data_master_qualified_request_sysid_control_slave),
      .CPU_data_master_read                                  (CPU_data_master_read),
      .CPU_data_master_read_data_valid_sysid_control_slave   (CPU_data_master_read_data_valid_sysid_control_slave),
      .CPU_data_master_requests_sysid_control_slave          (CPU_data_master_requests_sysid_control_slave),
      .CPU_data_master_write                                 (CPU_data_master_write),
      .clk                                                   (clk),
      .d1_sysid_control_slave_end_xfer                       (d1_sysid_control_slave_end_xfer),
      .reset_n                                               (clk_reset_n),
      .sysid_control_slave_address                           (sysid_control_slave_address),
      .sysid_control_slave_readdata                          (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                  (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                           (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_system_reset_clk_domain_synch_module nios_system_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    CPU_jtag_debug_module_resetrequest_from_sa |
    CPU_jtag_debug_module_resetrequest_from_sa);

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "d:/altera/11.0/quartus/eda/sim_lib/altera_mf.v"
`include "d:/altera/11.0/quartus/eda/sim_lib/220model.v"
`include "d:/altera/11.0/quartus/eda/sim_lib/sgate.v"
`include "Serial_port.v"
`include "Expansion_JP2.v"
`include "Pushbuttons.v"
`include "HEX3_HEX0.v"
`include "Red_LEDs.v"
`include "Expansion_JP1.v"
`include "Green_LEDs.v"
`include "SRAM.v"
`include "Slider_switches.v"
`include "HEX7_HEX4.v"
`include "sysid.v"
`include "Interval_timer.v"
`include "Onchip_memory.v"
`include "JTAG_UART.v"
`include "CPU_test_bench.v"
`include "CPU_oci_test_bench.v"
`include "CPU_jtag_debug_module_tck.v"
`include "CPU_jtag_debug_module_sysclk.v"
`include "CPU_jtag_debug_module_wrapper.v"
`include "CPU.v"
`include "SDRAM.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [ 31: 0] GPIO_0_to_and_from_the_Expansion_JP1;
  wire    [ 31: 0] GPIO_1_to_and_from_the_Expansion_JP2;
  wire    [  6: 0] HEX0_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX1_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX2_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX3_from_the_HEX3_HEX0;
  wire    [  6: 0] HEX4_from_the_HEX7_HEX4;
  wire    [  6: 0] HEX5_from_the_HEX7_HEX4;
  wire    [  6: 0] HEX6_from_the_HEX7_HEX4;
  wire    [  6: 0] HEX7_from_the_HEX7_HEX4;
  wire             JTAG_UART_avalon_jtag_slave_dataavailable_from_sa;
  wire             JTAG_UART_avalon_jtag_slave_readyfordata_from_sa;
  wire    [  3: 0] KEY_to_the_Pushbuttons;
  wire    [  8: 0] LEDG_from_the_Green_LEDs;
  wire    [ 17: 0] LEDR_from_the_Red_LEDs;
  wire    [ 17: 0] SRAM_ADDR_from_the_SRAM;
  wire             SRAM_CE_N_from_the_SRAM;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_SRAM;
  wire             SRAM_LB_N_from_the_SRAM;
  wire             SRAM_OE_N_from_the_SRAM;
  wire             SRAM_UB_N_from_the_SRAM;
  wire             SRAM_WE_N_from_the_SRAM;
  wire    [ 17: 0] SW_to_the_Slider_switches;
  wire             UART_RXD_to_the_Serial_port;
  wire             UART_TXD_from_the_Serial_port;
  reg              clk;
  reg              reset_n;
  wire             sysid_control_slave_clock;
  wire    [ 11: 0] zs_addr_from_the_SDRAM;
  wire    [  1: 0] zs_ba_from_the_SDRAM;
  wire             zs_cas_n_from_the_SDRAM;
  wire             zs_cke_from_the_SDRAM;
  wire             zs_cs_n_from_the_SDRAM;
  wire    [ 15: 0] zs_dq_to_and_from_the_SDRAM;
  wire    [  1: 0] zs_dqm_from_the_SDRAM;
  wire             zs_ras_n_from_the_SDRAM;
  wire             zs_we_n_from_the_SDRAM;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  nios_system DUT
    (
      .GPIO_0_to_and_from_the_Expansion_JP1 (GPIO_0_to_and_from_the_Expansion_JP1),
      .GPIO_1_to_and_from_the_Expansion_JP2 (GPIO_1_to_and_from_the_Expansion_JP2),
      .HEX0_from_the_HEX3_HEX0              (HEX0_from_the_HEX3_HEX0),
      .HEX1_from_the_HEX3_HEX0              (HEX1_from_the_HEX3_HEX0),
      .HEX2_from_the_HEX3_HEX0              (HEX2_from_the_HEX3_HEX0),
      .HEX3_from_the_HEX3_HEX0              (HEX3_from_the_HEX3_HEX0),
      .HEX4_from_the_HEX7_HEX4              (HEX4_from_the_HEX7_HEX4),
      .HEX5_from_the_HEX7_HEX4              (HEX5_from_the_HEX7_HEX4),
      .HEX6_from_the_HEX7_HEX4              (HEX6_from_the_HEX7_HEX4),
      .HEX7_from_the_HEX7_HEX4              (HEX7_from_the_HEX7_HEX4),
      .KEY_to_the_Pushbuttons               (KEY_to_the_Pushbuttons),
      .LEDG_from_the_Green_LEDs             (LEDG_from_the_Green_LEDs),
      .LEDR_from_the_Red_LEDs               (LEDR_from_the_Red_LEDs),
      .SRAM_ADDR_from_the_SRAM              (SRAM_ADDR_from_the_SRAM),
      .SRAM_CE_N_from_the_SRAM              (SRAM_CE_N_from_the_SRAM),
      .SRAM_DQ_to_and_from_the_SRAM         (SRAM_DQ_to_and_from_the_SRAM),
      .SRAM_LB_N_from_the_SRAM              (SRAM_LB_N_from_the_SRAM),
      .SRAM_OE_N_from_the_SRAM              (SRAM_OE_N_from_the_SRAM),
      .SRAM_UB_N_from_the_SRAM              (SRAM_UB_N_from_the_SRAM),
      .SRAM_WE_N_from_the_SRAM              (SRAM_WE_N_from_the_SRAM),
      .SW_to_the_Slider_switches            (SW_to_the_Slider_switches),
      .UART_RXD_to_the_Serial_port          (UART_RXD_to_the_Serial_port),
      .UART_TXD_from_the_Serial_port        (UART_TXD_from_the_Serial_port),
      .clk                                  (clk),
      .reset_n                              (reset_n),
      .zs_addr_from_the_SDRAM               (zs_addr_from_the_SDRAM),
      .zs_ba_from_the_SDRAM                 (zs_ba_from_the_SDRAM),
      .zs_cas_n_from_the_SDRAM              (zs_cas_n_from_the_SDRAM),
      .zs_cke_from_the_SDRAM                (zs_cke_from_the_SDRAM),
      .zs_cs_n_from_the_SDRAM               (zs_cs_n_from_the_SDRAM),
      .zs_dq_to_and_from_the_SDRAM          (zs_dq_to_and_from_the_SDRAM),
      .zs_dqm_from_the_SDRAM                (zs_dqm_from_the_SDRAM),
      .zs_ras_n_from_the_SDRAM              (zs_ras_n_from_the_SDRAM),
      .zs_we_n_from_the_SDRAM               (zs_we_n_from_the_SDRAM)
    );

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on