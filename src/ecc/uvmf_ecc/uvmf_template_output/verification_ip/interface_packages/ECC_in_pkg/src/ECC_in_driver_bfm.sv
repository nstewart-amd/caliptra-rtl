//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the ECC_in signal driving.  It is
//     accessed by the uvm ECC_in driver through a virtual interface
//     handle in the ECC_in configuration.  It drives the singals passed
//     in through the port connection named bus of type ECC_in_if.
//
//     Input signals from the ECC_in_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within ECC_in_if based on INITIATOR/RESPONDER and/or
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
import ECC_in_pkg_hdl::*;
`include "src/ECC_in_macros.svh"

interface ECC_in_driver_bfm #(
  int AHB_ADDR_WIDTH = 32,
  int AHB_DATA_WIDTH = 32
  )

  (ECC_in_if bus);
  // The following pragma and additional ones in-lined further below are for running this BFM on Veloce
  // pragma attribute ECC_in_driver_bfm partition_interface_xif

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
      $psprintf("The BFM at '%m' has the following parameters: AHB_ADDR_WIDTH=%x AHB_DATA_WIDTH=%x ", AHB_ADDR_WIDTH,AHB_DATA_WIDTH),
      UVM_DEBUG)
end
`endif

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clk_i;
  tri rst_n_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri [AHB_DATA_WIDTH-1:0] hrdata_i;
  reg [AHB_DATA_WIDTH-1:0] hrdata_o = 'bz;
  tri  hreadyout_i;
  reg  hreadyout_o = 'bz;

  // INITIATOR mode output signals
  tri  ecc_rst_n_i;
  reg  ecc_rst_n_o = 'bz;
  tri [AHB_ADDR_WIDTH-1:0] haddr_i;
  reg [AHB_ADDR_WIDTH-1:0] haddr_o = 'bz;
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
  tri  transaction_flag_out_monitor_i;
  reg  transaction_flag_out_monitor_o = 'bz;
  tri [1:0] op_i;
  reg [1:0] op_o = 'bz;
  tri [7:0] test_case_sel_i;
  reg [7:0] test_case_sel_o = 'bz;

  // Bi-directional signals
  

  assign clk_i = bus.clk;
  assign rst_n_i = bus.rst_n;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign hrdata_i = bus.hrdata;
  assign bus.hrdata = (initiator_responder == RESPONDER) ? hrdata_o : 'bz;
  assign hreadyout_i = bus.hreadyout;
  assign bus.hreadyout = (initiator_responder == RESPONDER) ? hreadyout_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.ecc_rst_n = (initiator_responder == INITIATOR) ? ecc_rst_n_o : 'bz;
  assign ecc_rst_n_i = bus.ecc_rst_n;
  assign bus.haddr = (initiator_responder == INITIATOR) ? haddr_o : 'bz;
  assign haddr_i = bus.haddr;
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
  assign bus.transaction_flag_out_monitor = (initiator_responder == INITIATOR) ? transaction_flag_out_monitor_o : 'bz;
  assign transaction_flag_out_monitor_i = bus.transaction_flag_out_monitor;
  assign bus.op = (initiator_responder == INITIATOR) ? op_o : 'bz;
  assign op_i = bus.op;
  assign bus.test_case_sel = (initiator_responder == INITIATOR) ? test_case_sel_o : 'bz;
  assign test_case_sel_i = bus.test_case_sel;

  // Proxy handle to UVM driver
  ECC_in_pkg::ECC_in_driver #(
    .AHB_ADDR_WIDTH(AHB_ADDR_WIDTH),
    .AHB_DATA_WIDTH(AHB_DATA_WIDTH)
    )
  proxy;
  // pragma tbx oneway proxy.my_function_name_in_uvm_driver                 

  // ****************************************************************************
  // **************************************************************************** 
  // Macros that define structs located in ECC_in_macros.svh
  // ****************************************************************************
  // Struct for passing configuration data from ECC_in_driver to this BFM
  // ****************************************************************************
  `ECC_in_CONFIGURATION_STRUCT
  // ****************************************************************************
  // Structs for INITIATOR and RESPONDER data flow
  //*******************************************************************
  // Initiator macro used by ECC_in_driver and ECC_in_driver_bfm
  // to communicate initiator driven data to ECC_in_driver_bfm.           
  `ECC_in_INITIATOR_STRUCT
    ECC_in_initiator_s initiator_struct;
  // Responder macro used by ECC_in_driver and ECC_in_driver_bfm
  // to communicate Responder driven data to ECC_in_driver_bfm.
  `ECC_in_RESPONDER_STRUCT
    ECC_in_responder_s responder_struct;

  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( negedge rst_n_i )
     begin
       // RESPONDER mode output signals
       hrdata_o <= 'bz;
       hreadyout_o <= 'bz;
       // INITIATOR mode output signals
       ecc_rst_n_o <= 'b0;
       haddr_o <= 'bz;
       hwdata_o <= 'bz;
       hsel_o <= 0;
       hwrite_o <= 0;
       hmastlock_o <= 0;
       hready_o <= 0;
       htrans_o <= 0;
       hprot_o <= 0;
       hburst_o <= 0;
       hsize_o <= 3'b011;

       transaction_flag_out_monitor_o <= '0;
       op_o <= 'bz;
       test_case_sel_o <= 'b0;
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

  function void configure(ECC_in_configuration_s ECC_in_configuration_arg); // pragma tbx xtf  
    initiator_responder = ECC_in_configuration_arg.initiator_responder;
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
       input ECC_in_initiator_s ECC_in_initiator_struct, 
       // This argument is used to send data received from the responder
       // back to the sequence item.  The sequence item is returned to the sequence.
       output ECC_in_responder_s ECC_in_responder_struct 
       );// pragma tbx xtf  
       // 
       // Members within the ECC_in_initiator_struct:
       //   ecc_in_op_transactions op ;
       //   bit [7:0] test_case_sel ;
       // Members within the ECC_in_responder_struct:
       //   ecc_in_op_transactions op ;
       //   bit [7:0] test_case_sel ;
       initiator_struct = ECC_in_initiator_struct;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clk_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals
       //      ECC_in_responder_struct.xyz = hrdata_i;  //    [AHB_DATA_WIDTH-1:0] 
       //      ECC_in_responder_struct.xyz = hreadyout_i;  //     
       //    Initiator inout signals
       //    How to assign a signal from an initiator struct member named xyz.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals
       //      ecc_rst_n_o <= ECC_in_initiator_struct.xyz;  //     
       //      haddr_o <= ECC_in_initiator_struct.xyz;  //    [AHB_ADDR_WIDTH-1:0] 
       //      hwdata_o <= ECC_in_initiator_struct.xyz;  //    [AHB_DATA_WIDTH-1:0] 
       //      hsel_o <= ECC_in_initiator_struct.xyz;  //     
       //      hwrite_o <= ECC_in_initiator_struct.xyz;  //     
       //      hmastlock_o <= ECC_in_initiator_struct.xyz;  //     
       //      hready_o <= ECC_in_initiator_struct.xyz;  //     
       //      htrans_o <= ECC_in_initiator_struct.xyz;  //    [1:0] 
       //      hprot_o <= ECC_in_initiator_struct.xyz;  //    [3:0] 
       //      hburst_o <= ECC_in_initiator_struct.xyz;  //    [2:0] 
       //      hsize_o <= ECC_in_initiator_struct.xyz;  //    [2:0] 
       //      transaction_flag_out_monitor_o <= ECC_in_initiator_struct.xyz;  //     
       //      op_o <= ECC_in_initiator_struct.xyz;  //    [1:0] 
       //      test_case_sel_o <= ECC_in_initiator_struct.xyz;  //    [7:0] 
       //    Initiator inout signals
    // Initiate a transfer using the data received.
    @(posedge clk_i);
    $display("** ECC_in_driver_bfm** : Inside initiate_and_get_response");

    case (ECC_in_initiator_struct.op)
      reset_op  : ecc_init(ECC_in_initiator_struct.op, ECC_in_initiator_struct.test_case_sel);
      default   : ecc_test(ECC_in_initiator_struct.op, ECC_in_initiator_struct.test_case_sel);
    endcase

  endtask   
  
  // --------------------------------------------
  // anjpar added the following
  // --------------------------------------------
  parameter   TEST_VECTOR_NUM = 15;

  parameter BASE_ADDR        = 32'h00000000;

  parameter ADDR_NAME0       = BASE_ADDR + 32'h00000000;
  parameter ADDR_NAME1       = BASE_ADDR + 32'h00000004;
  parameter ADDR_VERSION0    = BASE_ADDR + 32'h00000008;
  parameter ADDR_VERSION1    = BASE_ADDR + 32'h0000000C;

  parameter ADDR_CTRL        = BASE_ADDR + 32'h00000010;
  parameter KEYGEN           = 2'b01;
  parameter SIGN             = 2'b10;
  parameter VERIFY           = 2'b11;

  parameter ADDR_STATUS      = BASE_ADDR + 32'h00000018;
  parameter STATUS_READY_BIT = 0;
  parameter STATUS_VALID_BIT = 1;

  parameter ADDR_VERIFY      = BASE_ADDR + 32'h00000020;

  parameter ADDR_SEED0       = BASE_ADDR + 32'h00000080;
  parameter ADDR_SEED11      = BASE_ADDR + 32'h000000A8;

  parameter ADDR_MSG0        = BASE_ADDR + 32'h00000100;
  parameter ADDR_MSG11       = BASE_ADDR + 32'h00000128;

  parameter ADDR_PRIVKEY0    = BASE_ADDR + 32'h00000180;
  parameter ADDR_PRIVKEY11   = BASE_ADDR + 32'h000001A8;

  parameter ADDR_PUBKEYX0    = BASE_ADDR + 32'h00000200;
  parameter ADDR_PUBKEYX11   = BASE_ADDR + 32'h00000228;

  parameter ADDR_PUBKEYY0    = BASE_ADDR + 32'h00000280;
  parameter ADDR_PUBKEYY11   = BASE_ADDR + 32'h000002A8;

  parameter ADDR_SIGNR0      = BASE_ADDR + 32'h00000300;
  parameter ADDR_SIGNR11     = BASE_ADDR + 32'h00000328;

  parameter ADDR_SIGNS0      = BASE_ADDR + 32'h00000380;
  parameter ADDR_SIGNS11     = BASE_ADDR + 32'h000003A8;

  parameter ADDR_VERIFY_R0   = BASE_ADDR + 32'h00000400;
  parameter ADDR_VERIFY_R11  = BASE_ADDR + 32'h00000428;

  parameter REG_SIZE      = 384;
  parameter PRIME         = 384'hfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeffffffff0000000000000000ffffffff;
  parameter ADD_NUM_ADDS  = 1;
  parameter ADD_BASE_SZ   = 384;


  localparam NOP_CMD        = 3'b000;
  localparam KEYGEN_CMD     = 3'b001;
  localparam SIGN_CMD       = 3'b010;
  localparam VERIFY_CMD     = 3'b100;

  parameter AHB_HTRANS_IDLE     = 0;
  parameter AHB_HTRANS_BUSY     = 1;
  parameter AHB_HTRANS_NONSEQ   = 2;
  parameter AHB_HTRANS_SEQ      = 3;

  parameter           R_WIDTH                   = 384;

  typedef bit         [R_WIDTH-1:0]             r_t;
  typedef bit         [383 : 0]                 operand_t;

  typedef struct packed {
      operand_t   x;
      operand_t   y;
  } affn_point_t;

  typedef struct packed {
      operand_t   X;
      operand_t   Y;
      operand_t   Z;
  } proj_point_t;

  typedef struct packed {
      operand_t     hashed_msg;
      operand_t     privkey;
      affn_point_t  pubkey;
      operand_t     R;
      operand_t     S;
      operand_t     seed;
  } test_vector_t;

  test_vector_t test_vector;

  reg [31 : 0]  cycle_ctr;

  //reg [31 : 0]  read_data;
  reg [383: 0]  reg_read_data;

  //--------------------
  //Reset task
  //--------------------
  task do_assert_rst();
    begin
      ecc_rst_n_o = 0;
      transaction_flag_out_monitor_o = 0;
      repeat (5) @(posedge clk_i);
      ecc_rst_n_o = 1;
    end
  endtask

  //--------------------
  //Init DUT
  //--------------------
  task ecc_init (
    input ecc_in_op_transactions op,
    input bit [8:0] test_case_sel
    );

    $display("%d ***************   Starting Reset", $time);
    op_o = op;
    test_case_sel_o = 0;
    ecc_rst_n_o <= 1'b0;
    transaction_flag_out_monitor_o = 0;
    cycle_ctr = '0;

    haddr_o     = 'Z;
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
    ecc_rst_n_o <= 1'b1;
    repeat (5) @(posedge clk_i);
    transaction_flag_out_monitor_o = 1;

    $display("%d ***************   Ending Reset", $time);
  endtask

  //--------------------
  //Reset Other signals
  //--------------------
  always @(negedge rst_n_i) begin
    ecc_rst_n_o <= 'b0;
    haddr_o <= 'bz;
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

  always @(posedge rst_n_i) begin
	  ecc_rst_n_o = 1;
  end

  //----------------------------------------------------------------
  // sys_monitor()
  //
  // An always running process that creates a cycle counter and
  // conditionally displays information about the DUT.
  //----------------------------------------------------------------
  always
    begin : sys_monitor
      @(posedge clk_i);
      cycle_ctr = cycle_ctr + 1;
    end


  //----------------------------------------------------------------
  // wait_ready()
  //
  // Wait for the ready flag in the dut to be set.
  // (Actually we wait for either ready or valid to be set.)
  //
  // Note: It is the callers responsibility to call the function
  // when the dut is actively processing and will in fact at some
  // point set the flag.
  //----------------------------------------------------------------
    task wait_ready;
      begin
        read_single_word(ADDR_STATUS);
        while (hrdata_i == 0)
          begin
            read_single_word(ADDR_STATUS);
          end
      end
    endtask // wait_ready
  

  //----------------------------------------------------------------
  // write_single_word()
  //
  // Write the given word to the DUT using the DUT interface.
  //----------------------------------------------------------------
  task write_single_word (
    input [31 : 0]  address,
    input [31 : 0] word
    );
    begin
      hsel_o      <= 1;
      haddr_o     <= address;
      hwrite_o    <= 1;
      hmastlock_o <= 0;
      hready_o    <= 1;
      htrans_o    <= AHB_HTRANS_NONSEQ;
      hprot_o     <= 0;
      hburst_o    <= 0;
      hsize_o     <= 3'b010;
      
      @(posedge clk_i); 
      haddr_o     <= 'Z;
      hwdata_o    <= word;
      hwrite_o    <= 0;
      htrans_o    <= AHB_HTRANS_IDLE;
      wait(hreadyout_i == 1'b1);

      @(posedge clk_i);
      hsel_o      <= 0;
    end
  endtask // write_single_word

  //----------------------------------------------------------------
  // write_block()
  //
  // Write the given block to the dut.
  //----------------------------------------------------------------
  task write_block (
    input [31 : 0] addr, 
    input [383 : 0] block
    );
    begin
      write_single_word(addr+4*11, block[383  : 352]);
      write_single_word(addr+4*10, block[351  : 320]);
      write_single_word(addr+4*9,  block[319  : 288]);
      write_single_word(addr+4*8,  block[287  : 256]);
      write_single_word(addr+4*7,  block[255  : 224]);
      write_single_word(addr+4*6,  block[223  : 192]);
      write_single_word(addr+4*5,  block[191  : 160]);
      write_single_word(addr+4*4,  block[159  : 128]);
      write_single_word(addr+4*3,  block[127  :  96]);
      write_single_word(addr+4*2,  block[95   :  64]);
      write_single_word(addr+4*1,  block[63   :  32]);
      write_single_word(addr  ,    block[31   :   0]);
    end
  endtask // write_block

  //----------------------------------------------------------------
  // Read a data word from the given address in the DUT.
  // the word read will be available in the global variable
  // read_data.
  //----------------------------------------------------------------
  task read_single_word (
    input [31 : 0]  address
    );
    begin
      hsel_o       <= 1;    
      haddr_o      <= address;
      hwrite_o     <= 0;
      hmastlock_o  <= 0;
      hready_o     <= 1;
      htrans_o     <= AHB_HTRANS_NONSEQ;
      hprot_o      <= 0;
      hburst_o     <= 0;
      hsize_o      <= 3'b010;
      
      @(posedge clk_i);
      hwdata_o     <= 0;
      haddr_o      <= 'Z;
      htrans_o     <= AHB_HTRANS_IDLE;
      wait(hreadyout_i == 1'b1);

      @(posedge clk_i);
      hsel_o      <= 0;
    end
  endtask // read_single_word
  
  //----------------------------------------------------------------
  // read_block()
  //
  // Read the digest in the dut. The resulting digest will be
  // available in the global variable digest_data.
  //----------------------------------------------------------------
  task read_block (
    input [31 : 0] addr
    );
    begin
      $display("*[DEBUG]* - %0t Read single word", $time);
      read_single_word(addr + 4*11);
      reg_read_data[383 : 352] = hrdata_i;
      $display("*[DEBUG]* - %0t Read word = %h", $time, hrdata_i);
      $display("*[DEBUG]* - %0t Read single word", $time);
      read_single_word(addr + 4*10);
      reg_read_data[351 : 320] = hrdata_i;
      $display("*[DEBUG]* - %0t Read word = %h", $time, hrdata_i);
      read_single_word(addr +  4*9);
      reg_read_data[319 : 288] = hrdata_i;
      read_single_word(addr +  4*8);
      reg_read_data[287 : 256] = hrdata_i;
      read_single_word(addr +  4*7);
      reg_read_data[255 : 224] = hrdata_i;
      read_single_word(addr +  4*6);
      reg_read_data[223 : 192] = hrdata_i;
      read_single_word(addr +  4*5);
      reg_read_data[191 : 160] = hrdata_i;
      read_single_word(addr +  4*4);
      reg_read_data[159 : 128] = hrdata_i;
      read_single_word(addr +  4*3);
      reg_read_data[127 :  96] = hrdata_i;
      read_single_word(addr +  4*2);
      reg_read_data[95  :  64] = hrdata_i;
      read_single_word(addr +  4*1);
      reg_read_data[63  :  32] = hrdata_i;
      read_single_word(addr);
      reg_read_data[31  :   0] = hrdata_i;
    end
  endtask // read_digest

  //----------------------------------------------------------------
  // trig_ECC()
  //----------------------------------------------------------------
  task trig_ECC(input [2 : 0] cmd);
    begin
      write_single_word(ADDR_CTRL  , cmd);
      repeat (10) @(posedge clk_i);
      write_single_word(ADDR_CTRL  , 0);
    end
  endtask // trig_ECC

  //----------------------------------------------------------------
  // ecc_keygen_test()
  //
  // Perform a single point multiplication block test.
  //----------------------------------------------------------------
  task ecc_keygen_test (
    input bit [7:0] test_case_sel, 
    input test_vector_t test_vector
  );
    
    reg [31  : 0]   start_time;
    reg [31  : 0]   end_time;
    reg [383 : 0]   privkey;
    affn_point_t    pubkey;
    
    begin
      wait_ready();

      $display("*** ECC TC %d keygen test started.", test_case_sel);
      
      start_time = cycle_ctr;

      write_block(ADDR_SEED0, test_vector.seed);

      trig_ECC(KEYGEN);
      @(posedge clk_i);

      wait_ready();

      //read_block(ADDR_PRIVKEY0);
      //privkey = reg_read_data;

      transaction_flag_out_monitor_o = 1'b1;
      @(posedge clk_i);
      transaction_flag_out_monitor_o = 1'b0;
      @(posedge clk_i); 

      read_block(ADDR_PRIVKEY0);
      privkey = reg_read_data;

      read_block(ADDR_PUBKEYX0);
      pubkey.x = reg_read_data;

      read_block(ADDR_PUBKEYY0);
      pubkey.y = reg_read_data;

      end_time = cycle_ctr - start_time;

      $display("*** keygen test processing time = %01d cycles.", end_time);
      $display("privkey    : 0x%96x", test_vector.privkey);

      if ((privkey == test_vector.privkey) & (pubkey == test_vector.pubkey)) begin
        $display("*** TC %0d keygen successful.", test_case_sel);
        $display("");
      end
      else begin
        $display("*** ERROR: TC %0d keygen NOT successful.", test_case_sel);
        $display("Expected_x: 0x%96x", test_vector.pubkey.x);
        $display("Got:        0x%96x", pubkey.x);
        $display("Expected_y: 0x%96x", test_vector.pubkey.y);
        $display("Got:        0x%96x", pubkey.y);
        $display("");
      end





    end
  endtask // ecc_keygen_test

  //----------------------------------------------------------------
  // ecc_signing_test()
  //
  // Perform a single signing operation test.
  //----------------------------------------------------------------
  task ecc_signing_test (
    input [7:0]  test_case_sel, 
    input test_vector_t test_vector
  );

    reg [31  : 0]   start_time;
    reg [31  : 0]   end_time;
    reg [383 : 0]   R;
    reg [383 : 0]   S;

    begin
      wait_ready();

      $display("*** ECC TC %0d signing test started.", test_case_sel);
      
      start_time = cycle_ctr;

      write_block(ADDR_MSG0, test_vector.hashed_msg);
      write_block(ADDR_PRIVKEY0, test_vector.privkey);
      //write_block(ADDR_SEED0, test_vector.k);

      trig_ECC(SIGN);
      @(posedge clk_i);

      wait_ready();
      
      transaction_flag_out_monitor_o = 1'b1;
      @(posedge clk_i);
      transaction_flag_out_monitor_o = 1'b0;
      @(posedge clk_i); 
      
      read_block(ADDR_SIGNR0);
      R = reg_read_data;

      read_block(ADDR_SIGNS0);
      S = reg_read_data;

      end_time = cycle_ctr - start_time;
      $display("*** signing test processing time = %01d cycles.", end_time);
      $display("privkey    : 0x%96x", test_vector.privkey);

      if (R == test_vector.R & S == test_vector.S) begin
        $display("*** TC %0d signing successful.", test_case_sel);
        $display("");
      end
      else begin
        $display("*** ERROR: TC %0d signing NOT successful.", test_case_sel);
        $display("Expected_R: 0x%96x", test_vector.R);
        $display("Got:        0x%96x", R);
        $display("Expected_S: 0x%96x", test_vector.S);
        $display("Got:        0x%96x", S);
        $display("");
      end

    end
  endtask // ecc_signing_test

  //----------------------------------------------------------------
  // ecc_verifying_test()
  //
  // Perform a single verifying operation test.
  //----------------------------------------------------------------
  task ecc_verifying_test (
    input [7:0]  test_case_sel, 
    input test_vector_t test_vector
  );
    reg [31  : 0]   start_time;
    reg [31  : 0]   end_time;
    reg [383 : 0]    verify_r;

    begin
      wait_ready();

      $display("*** TC %0d verifying test started.", test_case_sel);

      start_time = cycle_ctr;

      write_block(ADDR_MSG0, test_vector.hashed_msg);
      write_block(ADDR_PUBKEYX0, test_vector.pubkey.x);
      write_block(ADDR_PUBKEYY0, test_vector.pubkey.y);
      write_block(ADDR_SIGNR0, test_vector.R);
      write_block(ADDR_SIGNS0, test_vector.S);

      trig_ECC(VERIFY);
      @(posedge clk_i);

      wait_ready();

      transaction_flag_out_monitor_o = 1'b1;
      @(posedge clk_i);
      transaction_flag_out_monitor_o = 1'b0;
      @(posedge clk_i); 

      read_block(ADDR_VERIFY_R0);
      verify_r = reg_read_data;

      end_time = cycle_ctr - start_time;
      $display("*** verifying test processing time = %01d cycles.", end_time);
      $display("privkey    : 0x%96x", test_vector.privkey);

      if (verify_r == test_vector.R)
      begin
        $display("*** TC %0d verifying successful.", test_case_sel);
        $display("");
      end
      else
      begin
        $display("*** ERROR: TC %0d verifying NOT successful.", test_case_sel);
        $display("Expected_R: 0x%96x", test_vector.R);
        $display("Got:        0x%96x", verify_r);
        $display("");
      end


    end
  endtask // ecc_verifying_test

  //----------------------------------------------------------------
  // ecc_test()
  //
  //----------------------------------------------------------------
  task ecc_test (
    input ecc_in_op_transactions op,
    input [7:0] test_case_sel
  );
    string file_name;

    begin
      // pass op and selection to monitor
      transaction_flag_out_monitor_o = 1'b0;
      op_o = op;
      test_case_sel_o = test_case_sel;
      
      file_name = "/home/anjpar/AHA_Workspaces/caliptra_ws2/Caliptra/src/ecc/tb/test_vectors/ecc_drbg.hex";
      read_test_vectors(file_name, test_case_sel);
      if (op == 2'b01) begin
        $display("ECC KEYGEN TEST");
        $display("---------------------");
        ecc_keygen_test(test_case_sel, test_vector);
      end
      else if (op == 2'b10) begin
        $display("ECC SIGNING TEST");
        $display("---------------------");
        ecc_signing_test(test_case_sel, test_vector);
      end
      else if (op == 2'b11) begin
        $display("ECC VERIFYING TEST");
        $display("------------------");
        ecc_verifying_test(test_case_sel, test_vector);
      end
    end
  endtask // ecc_test

  task read_test_vectors (
    input string fname,
    input int test_case_sel 
  );
    integer values_per_test_vector;
    integer line_cnt;
    integer fin;
    integer rv;
    r_t val;    // must be the largest width of any possible value

    int line_skip;
    int cnt_tmp;
    int fd_r;
    
    string line_read;
    string tmp_str1;
    string tmp_str2;
    
    begin
      cnt_tmp = 0;
      line_skip = test_case_sel * 8 + 1;      

      // ATTN: Must match the number of fields generated by gen_mm_test_vectors.py script
      values_per_test_vector = 8;
      line_cnt = 0;

      fd_r = $fopen(fname, "r");
      if (fd_r == 0)
        $error("Can't open file %s", fname);
  
      while (cnt_tmp < line_skip) begin
        cnt_tmp = cnt_tmp + 1;
        $fgets(line_read, fd_r);
      end

      // Get hashed message, private key, public key x, public key y, k and R
      $sscanf(line_read, "%h", test_vector.hashed_msg);
      $fgets(line_read, fd_r);
      $sscanf(line_read, "%h", test_vector.privkey);
      $fgets(line_read, fd_r);
      $sscanf(line_read, "%h", test_vector.pubkey.x);
      $fgets(line_read, fd_r);
      $sscanf(line_read, "%h", test_vector.pubkey.y);
      $fgets(line_read, fd_r);
      $sscanf(line_read, "%h", test_vector.seed);
      $fgets(line_read, fd_r);
      $sscanf(line_read, "%h", test_vector.R);
      $fgets(line_read, fd_r); 
      $sscanf(line_read, "%h", test_vector.S);

      $fclose(fd_r);

      $display("Read test vector # %d from %s", test_case_sel, fname);
    end
endtask


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
       output ECC_in_initiator_s ECC_in_initiator_struct, 
       // This argument passes transaction variables used by a responder
       // to complete a protocol transfer.  The values come from a sequence item.       
       input ECC_in_responder_s ECC_in_responder_struct 
       );// pragma tbx xtf   
  // Variables within the ECC_in_initiator_struct:
  //   ecc_in_op_transactions op ;
  //   bit [7:0] test_case_sel ;
  // Variables within the ECC_in_responder_struct:
  //   ecc_in_op_transactions op ;
  //   bit [7:0] test_case_sel ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clk_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      ECC_in_responder_struct.xyz = ecc_rst_n_i;  //     
       //      ECC_in_responder_struct.xyz = haddr_i;  //    [AHB_ADDR_WIDTH-1:0] 
       //      ECC_in_responder_struct.xyz = hwdata_i;  //    [AHB_DATA_WIDTH-1:0] 
       //      ECC_in_responder_struct.xyz = hsel_i;  //     
       //      ECC_in_responder_struct.xyz = hwrite_i;  //     
       //      ECC_in_responder_struct.xyz = hmastlock_i;  //     
       //      ECC_in_responder_struct.xyz = hready_i;  //     
       //      ECC_in_responder_struct.xyz = htrans_i;  //    [1:0] 
       //      ECC_in_responder_struct.xyz = hprot_i;  //    [3:0] 
       //      ECC_in_responder_struct.xyz = hburst_i;  //    [2:0] 
       //      ECC_in_responder_struct.xyz = hsize_i;  //    [2:0] 
       //      ECC_in_responder_struct.xyz = transaction_flag_out_monitor_i;  //     
       //      ECC_in_responder_struct.xyz = op_i;  //    [1:0] 
       //      ECC_in_responder_struct.xyz = test_case_sel_i;  //    [7:0] 
       //    Responder inout signals
       //    How to assign a signal, named xyz, from an initiator struct member.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Responder output signals
       //      hrdata_o <= ECC_in_initiator_struct.xyz;  //    [AHB_DATA_WIDTH-1:0] 
       //      hreadyout_o <= ECC_in_initiator_struct.xyz;  //     
       //    Responder inout signals
    
  @(posedge clk_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the ECC_in_responder_struct.
    @(posedge clk_i);
    // Reply using data recieved in the transaction handle.
    @(posedge clk_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the ECC_in_initiator_struct.
    @(posedge clk_i);
    @(posedge clk_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

