//----------------------------------------------------------------------
// Created with uvmf_gen version 2021.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the HMAC_in signal driving.  It is
//     accessed by the uvm HMAC_in driver through a virtual interface
//     handle in the HMAC_in configuration.  It drives the singals passed
//     in through the port connection named bus of type HMAC_in_if.
//
//     Input signals from the HMAC_in_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within HMAC_in_if based on INITIATOR/RESPONDER and/or
//     ARBITRATION/GRANT status.  
//
//     The output signal connections are as follows:
//        signal_o -> bus.signal
//
//                                                                                           
//      Interface functions and tasks used by UVM components:
//
//             configure:
//                   This function gets configuration attributes from the
//                   UVM driver to set any required BFM configuration
//                   variables such as 'initiator_responder'.                                       
//                                                                                           
//             initiate_and_get_response:
//                   This task is used to perform signaling activity for initiating
//                   a protocol transfer.  The task initiates the transfer, using
//                   input data from the initiator struct.  Then the task captures
//                   response data, placing the data into the response struct.
//                   The response struct is returned to the driver class.
//
//             respond_and_wait_for_next_transfer:
//                   This task is used to complete a current transfer as a responder
//                   and then wait for the initiator to start the next transfer.
//                   The task uses data in the responder struct to drive protocol
//                   signals to complete the transfer.  The task then waits for 
//                   the next transfer.  Once the next transfer begins, data from
//                   the initiator is placed into the initiator struct and sent
//                   to the responder sequence for processing to determine 
//                   what data to respond with.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import HMAC_in_pkg_hdl::*;
`include "src/HMAC_in_macros.svh"

interface HMAC_in_driver_bfm #(
  int AHB_DATA_WIDTH = 32,
  int AHB_ADDR_WIDTH = 32,
  bit BYPASS_HSEL = 0
  )
  (HMAC_in_if bus);
  // The following pragma and additional ones in-lined further below are for running this BFM on Veloce
  // pragma attribute HMAC_in_driver_bfm partition_interface_xif

`ifndef XRTL
// This code is to aid in debugging parameter mismatches between the BFM and its corresponding agent.
// Enable this debug by setting UVM_VERBOSITY to UVM_DEBUG
// Setting UVM_VERBOSITY to UVM_DEBUG causes all BFM's and all agents to display their parameter settings.
// All of the messages from this feature have a UVM messaging id value of "CFG"
// The transcript or run.log can be parsed to ensure BFM parameter settings match its corresponding agents parameter settings.
import uvm_pkg::*;
`include "uvm_macros.svh"
initial begin : bfm_vs_agent_parameter_debug
  `uvm_info("CFG", 
      $psprintf("The BFM at '%m' has the following parameters: AHB_DATA_WIDTH=%x AHB_ADDR_WIDTH=%x BYPASS_HSEL=%x ", AHB_DATA_WIDTH,AHB_ADDR_WIDTH,BYPASS_HSEL),
      UVM_DEBUG)
end
`endif

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clk_i;
  tri rst_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals

  // INITIATOR mode output signals
  tri  hmac_rst_i;
  reg  hmac_rst_o = 'bz;
  tri [AHB_ADDR_WIDTH-1:0] hadrr_i;
  reg [AHB_ADDR_WIDTH-1:0] hadrr_o = 'bz;
  tri [AHB_DATA_WIDTH-1:0] hwdata_i;
  reg [AHB_DATA_WIDTH-1:0] hwdata_o = 'bz;
  tri  hsel_i;
  reg  hsel_o = 'bz;
  tri  hwrite_i;
  reg  hwrite_o = 'bz;
  tri  hmastlock_i;
  reg  hmastlock_o = 'bz;
  tri  hready_i;
  reg  hready_o = 'bz;
  tri [1:0] htrans_i;
  reg [1:0] htrans_o = 'bz;
  tri [3:0] hprot_i;
  reg [3:0] hprot_o = 'bz;
  tri [2:0] hburst_i;
  reg [2:0] hburst_o = 'bz;
  tri [2:0] hsize_i;
  reg [2:0] hsize_o = 'bz;
  tri  transaction_flag_in_monitor_i;
  reg  transaction_flag_in_monitor_o = 'bz;
  tri  op_i;
  reg  op_o = 'bz;
  tri [8:0] test_case_sel_i;
  reg [8:0] test_case_sel_o = 'bz;
  tri  key_len_i;
  reg  key_len_o = 'bz;

  // Bi-directional signals
  

  assign clk_i = bus.clk;
  assign rst_i = bus.rst;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.hmac_rst = (initiator_responder == INITIATOR) ? (hmac_rst_o && rst_i) : 'bz;
  assign hmac_rst_i = bus.hmac_rst;
  assign bus.hadrr = (initiator_responder == INITIATOR) ? hadrr_o : 'bz;
  assign hadrr_i = bus.hadrr;
  assign bus.hwdata = (initiator_responder == INITIATOR) ? hwdata_o : 'bz;
  assign hwdata_i = bus.hwdata;
  assign bus.hsel = (initiator_responder == INITIATOR) ? hsel_o : 'bz;
  assign hsel_i = bus.hsel;
  assign bus.hwrite = (initiator_responder == INITIATOR) ? hwrite_o : 'bz;
  assign hwrite_i = bus.hwrite;
  assign bus.hmastlock = (initiator_responder == INITIATOR) ? hmastlock_o : 'bz;
  assign hmastlock_i = bus.hmastlock;
  assign bus.hready = (initiator_responder == INITIATOR) ? hready_o : 'bz;
  assign hready_i = bus.hready;
  assign bus.htrans = (initiator_responder == INITIATOR) ? htrans_o : 'bz;
  assign htrans_i = bus.htrans;
  assign bus.hprot = (initiator_responder == INITIATOR) ? hprot_o : 'bz;
  assign hprot_i = bus.hprot;
  assign bus.hburst = (initiator_responder == INITIATOR) ? hburst_o : 'bz;
  assign hburst_i = bus.hburst;
  assign bus.hsize = (initiator_responder == INITIATOR) ? hsize_o : 'bz;
  assign hsize_i = bus.hsize;
  assign bus.transaction_flag_in_monitor = (initiator_responder == INITIATOR) ? transaction_flag_in_monitor_o : 'bz;
  assign transaction_flag_in_monitor_i = bus.transaction_flag_in_monitor;
  assign bus.op = (initiator_responder == INITIATOR) ? op_o : 'bz;
  assign op_i = bus.op;
  assign bus.test_case_sel = (initiator_responder == INITIATOR) ? test_case_sel_o : 'bz;
  assign test_case_sel_i = bus.test_case_sel;
  assign bus.key_len = (initiator_responder == INITIATOR) ? key_len_o : 'bz;
  assign key_len_i = bus.key_len;

  // Proxy handle to UVM driver
  HMAC_in_pkg::HMAC_in_driver #(
    .AHB_DATA_WIDTH(AHB_DATA_WIDTH),
    .AHB_ADDR_WIDTH(AHB_ADDR_WIDTH),
    .BYPASS_HSEL(BYPASS_HSEL)
    )  proxy;
  // pragma tbx oneway proxy.my_function_name_in_uvm_driver                 

  // ****************************************************************************
  // **************************************************************************** 
  // Macros that define structs located in HMAC_in_macros.svh
  // ****************************************************************************
  // Struct for passing configuration data from HMAC_in_driver to this BFM
  // ****************************************************************************
  `HMAC_in_CONFIGURATION_STRUCT
  // ****************************************************************************
  // Structs for INITIATOR and RESPONDER data flow
  //*******************************************************************
  // Initiator macro used by HMAC_in_driver and HMAC_in_driver_bfm
  // to communicate initiator driven data to HMAC_in_driver_bfm.           
  `HMAC_in_INITIATOR_STRUCT
    HMAC_in_initiator_s initiator_struct;
  // Responder macro used by HMAC_in_driver and HMAC_in_driver_bfm
  // to communicate Responder driven data to HMAC_in_driver_bfm.
  `HMAC_in_RESPONDER_STRUCT
    HMAC_in_responder_s responder_struct;

  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( negedge rst_i )
     begin
       // RESPONDER mode output signals
       // INITIATOR mode output signals
       hmac_rst_o <= 'b0;
       hadrr_o <= 'bz;
       hwdata_o <= 'bz;
       hsel_o <= 'b0;
       hwrite_o <= 'b0;
       hmastlock_o <= 'b0;
       hready_o <= 'b0;
       htrans_o <= 'b0;
       hprot_o <= 'b0;
       hburst_o <= 'b0;
       hsize_o <= 3'b011;
       transaction_flag_in_monitor_o <= 'b0;
       op_o <= 'bz;
       test_case_sel_o <= 'b0;
       key_len_o <= 'b0;
       // Bi-directional signals
 
     end    
// pragma uvmf custom reset_condition_and_response end

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end

  //******************************************************************
  // The configure() function is used to pass agent configuration
  // variables to the driver BFM.  It is called by the driver within
  // the agent at the beginning of the simulation.  It may be called 
  // during the simulation if agent configuration variables are updated
  // and the driver BFM needs to be aware of the new configuration 
  // variables.
  //

  function void configure(HMAC_in_configuration_s HMAC_in_configuration_arg); // pragma tbx xtf  
    initiator_responder = HMAC_in_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction                                                                             

// pragma uvmf custom initiate_and_get_response begin
// ****************************************************************************
// UVMF_CHANGE_ME
// This task is used by an initator.  The task first initiates a transfer then
// waits for the responder to complete the transfer.
    task initiate_and_get_response( 
       // This argument passes transaction variables used by an initiator
       // to perform the initial part of a protocol transfer.  The values
       // come from a sequence item created in a sequence.
       input HMAC_in_initiator_s HMAC_in_initiator_struct, 
       // This argument is used to send data received from the responder
       // back to the sequence item.  The sequence item is returned to the sequence.
       output HMAC_in_responder_s HMAC_in_responder_struct 
       );// pragma tbx xtf  
       // 
       // Members within the HMAC_in_initiator_struct:
       //   hmac_in_op_transactions op ;
       //   bit key_len ;
       //   bit [8:0] test_case_sel ;
       // Members within the HMAC_in_responder_struct:
       //   hmac_in_op_transactions op ;
       //   bit key_len ;
       //   bit [8:0] test_case_sel ;
       initiator_struct = HMAC_in_initiator_struct;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clk_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available input signals listed.
       //      HMAC_in_responder_struct.xyz = hmac_rst_i;  //     
       //      HMAC_in_responder_struct.xyz = hadrr_i;  //    [AHB_ADDR_WIDTH-1:0] 
       //      HMAC_in_responder_struct.xyz = hwdata_i;  //    [AHB_DATA_WIDTH-1:0] 
       //      HMAC_in_responder_struct.xyz = hsel_i;  //     
       //      HMAC_in_responder_struct.xyz = hwrite_i;  //     
       //      HMAC_in_responder_struct.xyz = hmastlock_i;  //     
       //      HMAC_in_responder_struct.xyz = hready_i;  //     
       //      HMAC_in_responder_struct.xyz = htrans_i;  //    [1:0] 
       //      HMAC_in_responder_struct.xyz = hprot_i;  //    [3:0] 
       //      HMAC_in_responder_struct.xyz = hburst_i;  //    [2:0] 
       //      HMAC_in_responder_struct.xyz = hsize_i;  //    [2:0] 
       //      HMAC_in_responder_struct.xyz = transaction_flag_in_monitor_i;  //     
       //      HMAC_in_responder_struct.xyz = op_i;  //     
       //      HMAC_in_responder_struct.xyz = test_case_sel_i;  //    [8:0] 
       //      HMAC_in_responder_struct.xyz = key_len_i;  //     
       //    How to assign a signal, named xyz, from an initiator struct member.   
       //    All available input signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //      hmac_rst_o <= HMAC_in_initiator_struct.xyz;  //     
       //      hadrr_o <= HMAC_in_initiator_struct.xyz;  //    [AHB_ADDR_WIDTH-1:0] 
       //      hwdata_o <= HMAC_in_initiator_struct.xyz;  //    [AHB_DATA_WIDTH-1:0] 
       //      hsel_o <= HMAC_in_initiator_struct.xyz;  //     
       //      hwrite_o <= HMAC_in_initiator_struct.xyz;  //     
       //      hmastlock_o <= HMAC_in_initiator_struct.xyz;  //     
       //      hready_o <= HMAC_in_initiator_struct.xyz;  //     
       //      htrans_o <= HMAC_in_initiator_struct.xyz;  //    [1:0] 
       //      hprot_o <= HMAC_in_initiator_struct.xyz;  //    [3:0] 
       //      hburst_o <= HMAC_in_initiator_struct.xyz;  //    [2:0] 
       //      hsize_o <= HMAC_in_initiator_struct.xyz;  //    [2:0] 
       //      transaction_flag_in_monitor_o <= HMAC_in_initiator_struct.xyz;  //     
       //      op_o <= HMAC_in_initiator_struct.xyz;  //     
       //      test_case_sel_o <= HMAC_in_initiator_struct.xyz;  //    [8:0] 
       //      key_len_o <= HMAC_in_initiator_struct.xyz;  //     
    // Initiate a transfer using the data received.
    @(posedge clk_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // HMAC_in_responder_struct.
    //responder_struct = HMAC_in_responder_struct;
    case (HMAC_in_initiator_struct.op)

	reset_op: hmac_init(HMAC_in_initiator_struct.op, HMAC_in_initiator_struct.test_case_sel, HMAC_in_initiator_struct.key_len);

	default: single_block_test(HMAC_in_initiator_struct.op, HMAC_in_initiator_struct.test_case_sel, HMAC_in_initiator_struct.key_len);

    endcase
  
   endtask
//--------------------------
//knupadhy: added the following
//--------------------------

// The address map.
  parameter BASE_ADDR        = 32'h10010000;

  parameter ADDR_NAME        = BASE_ADDR + 32'h00000000;
  parameter ADDR_VERSION     = BASE_ADDR + 32'h00000008;

  parameter ADDR_CTRL        = BASE_ADDR + 32'h00000010;
  parameter CTRL_INIT_VALUE  = 8'h01;
  parameter CTRL_NEXT_VALUE  = 8'h02;
  parameter CTRL_MODE_VALUE  = 8'h04;

  parameter ADDR_STATUS      = BASE_ADDR + 32'h00000018;
  parameter STATUS_READY_BIT = 0;
  parameter STATUS_VALID_BIT = 1;

  parameter ADDR_KEY0        = BASE_ADDR + 32'h00000040;
  parameter ADDR_KEY1        = BASE_ADDR + 32'h00000044;
  parameter ADDR_KEY2        = BASE_ADDR + 32'h00000048;
  parameter ADDR_KEY3        = BASE_ADDR + 32'h0000004C;
  parameter ADDR_KEY4        = BASE_ADDR + 32'h00000050;
  parameter ADDR_KEY5        = BASE_ADDR + 32'h00000054;
  parameter ADDR_KEY6        = BASE_ADDR + 32'h00000058;
  parameter ADDR_KEY7        = BASE_ADDR + 32'h0000005C;
  parameter ADDR_KEY8        = BASE_ADDR + 32'h00000060;
  parameter ADDR_KEY9        = BASE_ADDR + 32'h00000064;
  parameter ADDR_KEY10       = BASE_ADDR + 32'h00000068;
  parameter ADDR_KEY11       = BASE_ADDR + 32'h0000006C;

  parameter ADDR_BLOCK0      = BASE_ADDR + 32'h00000080;
  parameter ADDR_BLOCK1      = BASE_ADDR + 32'h00000084;
  parameter ADDR_BLOCK2      = BASE_ADDR + 32'h00000088;
  parameter ADDR_BLOCK3      = BASE_ADDR + 32'h0000008C;
  parameter ADDR_BLOCK4      = BASE_ADDR + 32'h00000090;
  parameter ADDR_BLOCK5      = BASE_ADDR + 32'h00000094;
  parameter ADDR_BLOCK6      = BASE_ADDR + 32'h00000098;
  parameter ADDR_BLOCK7      = BASE_ADDR + 32'h0000009C;
  parameter ADDR_BLOCK8      = BASE_ADDR + 32'h000000a0;
  parameter ADDR_BLOCK9      = BASE_ADDR + 32'h000000a4;
  parameter ADDR_BLOCK10     = BASE_ADDR + 32'h000000a8;
  parameter ADDR_BLOCK11     = BASE_ADDR + 32'h000000aC;
  parameter ADDR_BLOCK12     = BASE_ADDR + 32'h000000b0;
  parameter ADDR_BLOCK13     = BASE_ADDR + 32'h000000b4;
  parameter ADDR_BLOCK14     = BASE_ADDR + 32'h000000b8;
  parameter ADDR_BLOCK15     = BASE_ADDR + 32'h000000bC;
  parameter ADDR_BLOCK16     = BASE_ADDR + 32'h000000c0;
  parameter ADDR_BLOCK17     = BASE_ADDR + 32'h000000c4;
  parameter ADDR_BLOCK18     = BASE_ADDR + 32'h000000c8;
  parameter ADDR_BLOCK19     = BASE_ADDR + 32'h000000cC;
  parameter ADDR_BLOCK20     = BASE_ADDR + 32'h000000d0;
  parameter ADDR_BLOCK21     = BASE_ADDR + 32'h000000d4;
  parameter ADDR_BLOCK22     = BASE_ADDR + 32'h000000d8;
  parameter ADDR_BLOCK23     = BASE_ADDR + 32'h000000dC;
  parameter ADDR_BLOCK24     = BASE_ADDR + 32'h000000e0;
  parameter ADDR_BLOCK25     = BASE_ADDR + 32'h000000e4;
  parameter ADDR_BLOCK26     = BASE_ADDR + 32'h000000e8;
  parameter ADDR_BLOCK27     = BASE_ADDR + 32'h000000eC;
  parameter ADDR_BLOCK28     = BASE_ADDR + 32'h000000f0;
  parameter ADDR_BLOCK29     = BASE_ADDR + 32'h000000f4;
  parameter ADDR_BLOCK30     = BASE_ADDR + 32'h000000f8;
  parameter ADDR_BLOCK31     = BASE_ADDR + 32'h000000fC;

  parameter ADDR_TAG0        =  BASE_ADDR + 32'h00000100;
  parameter ADDR_TAG1        =  BASE_ADDR + 32'h00000104;
  parameter ADDR_TAG2        =  BASE_ADDR + 32'h00000108;
  parameter ADDR_TAG3        =  BASE_ADDR + 32'h0000010C;
  parameter ADDR_TAG4        =  BASE_ADDR + 32'h00000110;
  parameter ADDR_TAG5        =  BASE_ADDR + 32'h00000114;
  parameter ADDR_TAG6        =  BASE_ADDR + 32'h00000118;
  parameter ADDR_TAG7        =  BASE_ADDR + 32'h0000011C;
  parameter ADDR_TAG8        =  BASE_ADDR + 32'h00000120;
  parameter ADDR_TAG9        =  BASE_ADDR + 32'h00000124;
  parameter ADDR_TAG10       =  BASE_ADDR + 32'h00000128;
  parameter ADDR_TAG11       =  BASE_ADDR + 32'h0000012C;

  parameter AHB_HTRANS_IDLE     = 0;
  parameter AHB_HTRANS_BUSY     = 1;
  parameter AHB_HTRANS_NONSEQ   = 2;
  parameter AHB_HTRANS_SEQ      = 3;

  //TODO add cycle ctr later
  reg [63 : 0]  read_data;
  reg [383 : 0] digest_data;


  //--------------------
  //Reset task
  //--------------------
  task do_assert_rst();
    begin
      hmac_rst_o = 0;
      transaction_flag_in_monitor_o = 0;
      repeat (5) @(posedge clk_i);
      hmac_rst_o = 1;
    end
  endtask

  //--------------------
  //Init DUT
  //--------------------
  task hmac_init(input hmac_in_op_transactions op,
                input bit [8:0] test_case_sel,
                input bit key_len);
    $display("%d ***************   Starting Reset", $time);
    op_o = op;
    test_case_sel_o = 0;
    hmac_rst_o <= 1'b0;
    transaction_flag_in_monitor_o = 0;

    hadrr_o     = 'Z;
    hwdata_o    = 'Z;
    hsel_o      = 0;
    hwrite_o    = 0;
    hmastlock_o = 0;
    hready_o    = 0;
    htrans_o    = AHB_HTRANS_IDLE;
    hprot_o     = 0;
    hburst_o    = 0;
    hsize_o     = 3'b011;

    repeat (10) @(posedge clk_i);
    hmac_rst_o <= 1'b1;
    repeat (5) @(posedge clk_i);
    transaction_flag_in_monitor_o = 1;

  $display("%d ***************   Ending Reset", $time);
  endtask

  //--------------------
  //Reset Other signals
  //--------------------
  always @( negedge rst_i )
     begin
       hmac_rst_o <= 'b0;
       hadrr_o <= 'bz;
       hwdata_o <= 'bz;
       hsel_o <= 'b0;
       hwrite_o <= 'b0;
       hmastlock_o <= 'b0;
       hready_o <= 'b0;
       htrans_o <= 'b0;
       hprot_o <= 'b0;
       hburst_o <= 'b0;
       hsize_o <= 3'b011;
     end

  always @( posedge rst_i )
     begin
	hmac_rst_o = 1;
     end

  //--------------------
  //Write given word to DUT using DUT interface
  //--------------------
task write_single_word(input [31 : 0]  address,
                  input [31 : 0] word);
    begin
      hsel_o       = 1;
      hadrr_o      = address;
      hwrite_o    = 1;
      hmastlock_o = 0;
      hready_o    = 1;
      htrans_o    = AHB_HTRANS_NONSEQ;
      hprot_o     = 0;
      hburst_o    = 0;
      hsize_o     = 3'b010;
      @(posedge clk_i); 

      hadrr_o     = 'Z;
      hwdata_o    = word;
      hwrite_o    = 0;
      htrans_o    = AHB_HTRANS_IDLE;
    end
  endtask // write_single_word

  //----------------------------------------------------------------
  // Write the given block to the dut.
  //----------------------------------------------------------------
  task write_block(input [1023 : 0] block);
    begin
      write_single_word(ADDR_BLOCK0, block[1023: 992]);
      write_single_word(ADDR_BLOCK1,  block[991: 960]);
      write_single_word(ADDR_BLOCK2,  block[959: 928]);
      write_single_word(ADDR_BLOCK3,  block[927: 896]);
      write_single_word(ADDR_BLOCK4,  block[895: 864]);
      write_single_word(ADDR_BLOCK5,  block[863: 832]);
      write_single_word(ADDR_BLOCK6,  block[831: 800]);
      write_single_word(ADDR_BLOCK7,  block[799: 768]);
      write_single_word(ADDR_BLOCK8,  block[767: 736]);
      write_single_word(ADDR_BLOCK9,  block[735: 704]);
      write_single_word(ADDR_BLOCK10, block[703: 672]);
      write_single_word(ADDR_BLOCK11, block[671: 640]);
      write_single_word(ADDR_BLOCK12, block[639: 608]);
      write_single_word(ADDR_BLOCK13, block[607: 576]);
      write_single_word(ADDR_BLOCK14, block[575: 544]);
      write_single_word(ADDR_BLOCK15, block[543: 512]);
      write_single_word(ADDR_BLOCK16, block[511: 480]);
      write_single_word(ADDR_BLOCK17, block[479: 448]);
      write_single_word(ADDR_BLOCK18, block[447: 416]);
      write_single_word(ADDR_BLOCK19, block[415: 384]);
      write_single_word(ADDR_BLOCK20, block[383: 352]);
      write_single_word(ADDR_BLOCK21, block[351: 320]);
      write_single_word(ADDR_BLOCK22, block[319: 288]);
      write_single_word(ADDR_BLOCK23, block[287: 256]);
      write_single_word(ADDR_BLOCK24, block[255: 224]);
      write_single_word(ADDR_BLOCK25, block[223: 192]);
      write_single_word(ADDR_BLOCK26, block[191: 160]);
      write_single_word(ADDR_BLOCK27, block[159: 128]);
      write_single_word(ADDR_BLOCK28, block[127: 96 ]);
      write_single_word(ADDR_BLOCK29, block[95 : 64 ]);
      write_single_word(ADDR_BLOCK30, block[63 : 32 ]);
      write_single_word(ADDR_BLOCK31, block[31 : 0  ]);
      
    end
  endtask // write_block

  //----------------------------------------------------------------
  // Write the given key to the dut.
  //----------------------------------------------------------------
  task write_key(input [383 : 0] key);
    begin
      write_single_word(ADDR_KEY0,  key[383: 352]);
      write_single_word(ADDR_KEY1,  key[351: 320]);
      write_single_word(ADDR_KEY2,  key[319: 288]);
      write_single_word(ADDR_KEY3,  key[287: 256]);
      write_single_word(ADDR_KEY4,  key[255: 224]);
      write_single_word(ADDR_KEY5,  key[223: 192]);
      write_single_word(ADDR_KEY6,  key[191: 160]);
      write_single_word(ADDR_KEY7,  key[159: 128]);
      write_single_word(ADDR_KEY8,  key[127: 96 ]);
      write_single_word(ADDR_KEY9,  key[95 : 64 ]);
      write_single_word(ADDR_KEY10, key[63 : 32 ]);
      write_single_word(ADDR_KEY11, key[31 : 0  ]);
    end
  endtask // write_key

  //----------------------------------------------------------------
  // Read a data word from the given address in the DUT.
  // the word read will be available in the global variable
  // read_data.
  //----------------------------------------------------------------
  task read_single_word_driverbfm(input [31 : 0]  address);
    begin
      hsel_o       = 1;
      hadrr_o      = address;
      hwrite_o     = 0;
      hmastlock_o  = 0;
      hready_o     = 1;
      htrans_o     = AHB_HTRANS_NONSEQ;
      hprot_o      = 0;
      hburst_o     = 0;
      hsize_o      = 3'b010;
      @(posedge clk_i);
      
      hwdata_o     = 0;
      //hadrr_o     = 'Z;
      //htrans_o     = AHB_HTRANS_IDLE;
      //read_data = hrdata_i;
    end
  endtask // read_single_word

  //----------------------------------------------------------------
  // Read the digest in the dut. The resulting digest will be
  // available in the global variable digest_data.
  //----------------------------------------------------------------
  task read_digest;
    begin
      read_single_word_driverbfm(ADDR_TAG0);
      //digest_data[383 : 352] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG1);
      //digest_data[351 : 320] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG2);
      //digest_data[319 : 288] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG3);
      //digest_data[287 : 256] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG4);
      //digest_data[255 : 224] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG5);
      //digest_data[223 : 192] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG6);
      //digest_data[191 : 160] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG7);
      //digest_data[159 : 128] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG8);
      //digest_data[127 : 96] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG9);
      //digest_data[95 : 64] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG10);
      //digest_data[63 :  32] = read_data;
      @(posedge clk_i);
      read_single_word_driverbfm(ADDR_TAG11);
      //digest_data[31  :   0] = read_data;
      @(posedge clk_i);
    end
  endtask // read_digest

  //---------------------
  //Wait ready
  //---------------------
  task wait_ready;
  begin
	read_data = 0;
	@(posedge clk_i);
	
	while (read_data == 0)
		read_single_word_driverbfm(ADDR_STATUS); 
  end
  endtask

  //---------------------
  //Single block test 
  //---------------------
  task single_block_test (
			input hmac_in_op_transactions op,
			input bit [8:0] test_case_sel,
			input bit key_len
			);

	reg [383 :0] key;
	reg [1023:0] block;
  reg [383 :0] expected;
  
  int line_skip;
  int cnt_tmp;
  int fd_r;
  
  string line_read;
  string tmp_str1;
  string tmp_str2;
  string file_name;

   begin
	//pass op and selection to monitor
	transaction_flag_in_monitor_o = 1'b0;
	op_o = op;
	test_case_sel_o = test_case_sel;
	key_len_o = key_len;

	//$display(" **HMAC_in_driver_bfm** op value is: ", op);
  //    	$display(" **HMAC_in_driver_bfm** test_case_sel value is: ", test_case_sel);
  //    	$display(" **HMAC_in_driver_bfm** key_len value is: ", key_len);
        
  cnt_tmp = 0;
  file_name = "/home/kupadhyayula/caliptra/ws1/Caliptra/src/hmac/tb/hmac_vectors.txt";
  line_skip = test_case_sel * 5 + 8;
  fd_r = $fopen(file_name, "r");
  if(!fd_r) $display("**HMAC_in_driver_bfm** Cannot open file %s", file_name);

  while (cnt_tmp < line_skip) begin
    cnt_tmp = cnt_tmp + 1;
    $fgets(line_read, fd_r);
  end

  //Get key, block and tag:
  $sscanf(line_read, "%s %s %h", tmp_str1, tmp_str2, key);
  $fgets(line_read, fd_r);
  $sscanf(line_read, "%s %s %h", tmp_str1, tmp_str2, block);
  $fgets(line_read, fd_r);
  $sscanf(line_read, "%s %s %h", tmp_str1, tmp_str2, expected);

  //$display("Key = %h\nBlock = %h\nTag = %h", key, block, expected);

	write_key(key);
	write_block(block);
	write_single_word(ADDR_CTRL, CTRL_INIT_VALUE);
	@(posedge clk_i);
	hsel_o = 0;
	@(posedge clk_i);
	//wait_ready(); --> this looks at hrdata which is part of out interface. Not sure how to bring that signal in here, so jut waiting for 100 clks for now (similar to AES)
	
  //---------wait for ready--------
  //From addr status to ready, DUT takes 2500 ns. The read_single_word_driverbfm has built-in 1 clk wait every time it's called
  //So, executing this loop for 130 clks to get a total of 130*10*2 = 2600ns (buffer of 100ns)
	repeat(130) begin //TODO knupadhy: need to figure out how to poll for status in the in driver bfm (needs hrdata_i input which is connected to out agent not the in agent)
	    @(posedge clk_i);
	    read_single_word_driverbfm(ADDR_STATUS);
  end
	transaction_flag_in_monitor_o = 1'b1;
	@(posedge clk_i);
	transaction_flag_in_monitor_o = 1'b0;
	@(posedge clk_i);
	//-------------------------------

	read_digest();
	

   end
   endtask

//--------------------------
    
// pragma uvmf custom initiate_and_get_response end

// pragma uvmf custom respond_and_wait_for_next_transfer begin
// ****************************************************************************
// The first_transfer variable is used to prevent completing a transfer in the 
// first call to this task.  For the first call to this task, there is not
// current transfer to complete.
bit first_transfer=1;

// UVMF_CHANGE_ME
// This task is used by a responder.  The task first completes the current 
// transfer in progress then waits for the initiator to start the next transfer.
  task respond_and_wait_for_next_transfer( 
       // This argument is used to send data received from the initiator
       // back to the sequence item.  The sequence determines how to respond.
       output HMAC_in_initiator_s HMAC_in_initiator_struct, 
       // This argument passes transaction variables used by a responder
       // to complete a protocol transfer.  The values come from a sequence item.       
       input HMAC_in_responder_s HMAC_in_responder_struct 
       );// pragma tbx xtf   
  // Variables within the HMAC_in_initiator_struct:
  //   hmac_in_op_transactions op ;
  //   bit key_len ;
  //   bit [8:0] test_case_sel ;
  // Variables within the HMAC_in_responder_struct:
  //   hmac_in_op_transactions op ;
  //   bit key_len ;
  //   bit [8:0] test_case_sel ;
        
  @(posedge clk_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the HMAC_in_responder_struct.
    @(posedge clk_i);
    // Reply using data recieved in the transaction handle.
    @(posedge clk_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the HMAC_in_initiator_struct.
    @(posedge clk_i);
    @(posedge clk_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

