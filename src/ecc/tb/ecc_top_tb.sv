//======================================================================
//
// ecc_arith_unit_tb.sv
// --------
// 
//
//
// Author: Mojtaba Bisheh-Niasar
//======================================================================

module ecc_top_tb #(
    parameter   TEST_VECTOR_NUM = 5
)
();

  localparam BASE_ADDR        = 32'h00000000;

  localparam ADDR_NAME0       = BASE_ADDR + 32'h00000000;
  localparam ADDR_NAME1       = BASE_ADDR + 32'h00000004;
  localparam ADDR_VERSION0    = BASE_ADDR + 32'h00000008;
  localparam ADDR_VERSION1    = BASE_ADDR + 32'h0000000C;

  localparam ADDR_CTRL        = BASE_ADDR + 32'h00000010;
  localparam KEYGEN           = 2'b01;
  localparam SIGN             = 2'b10;
  localparam VERIFY           = 2'b11;

  localparam ADDR_STATUS      = BASE_ADDR + 32'h00000018;
  localparam STATUS_READY_BIT = 0;
  localparam STATUS_VALID_BIT = 1;

  localparam ADDR_VERIFY      = BASE_ADDR + 32'h00000020;

  localparam ADDR_SEED0       = BASE_ADDR + 32'h00000080;
  localparam ADDR_SEED11      = BASE_ADDR + 32'h000000A8;

  localparam ADDR_MSG0        = BASE_ADDR + 32'h00000100;
  localparam ADDR_MSG11       = BASE_ADDR + 32'h00000128;

  localparam ADDR_PRIVKEY0    = BASE_ADDR + 32'h00000180;
  localparam ADDR_PRIVKEY11   = BASE_ADDR + 32'h000001A8;

  localparam ADDR_PUBKEYX0    = BASE_ADDR + 32'h00000200;
  localparam ADDR_PUBKEYX11   = BASE_ADDR + 32'h00000228;

  localparam ADDR_PUBKEYY0    = BASE_ADDR + 32'h00000280;
  localparam ADDR_PUBKEYY11   = BASE_ADDR + 32'h000002A8;

  localparam ADDR_SIGNR0      = BASE_ADDR + 32'h00000300;
  localparam ADDR_SIGNR11     = BASE_ADDR + 32'h00000328;

  localparam ADDR_SIGNS0      = BASE_ADDR + 32'h00000380;
  localparam ADDR_SIGNS11     = BASE_ADDR + 32'h000003A8;

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

  test_vector_t [TEST_VECTOR_NUM-1:0] test_vectors;
  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter DEBUG           = 0;

  parameter CLK_HALF_PERIOD = 5;
  parameter CLK_PERIOD      = 2 * CLK_HALF_PERIOD;

  parameter REG_SIZE      = 384;
  parameter PRIME         = 384'hfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeffffffff0000000000000000ffffffff;
  parameter ADD_NUM_ADDS  = 1;
  parameter ADD_BASE_SZ   = 384;

  parameter AHB_HTRANS_IDLE     = 0;
  parameter AHB_HTRANS_BUSY     = 1;
  parameter AHB_HTRANS_NONSEQ   = 2;
  parameter AHB_HTRANS_SEQ      = 3;

  parameter AHB_ADDR_WIDTH       = 32;
  parameter AHB_DATA_WIDTH       = 32;

  //----------------------------------------------------------------
  // Register and Wire declarations.
  //----------------------------------------------------------------
  reg [31 : 0]  cycle_ctr;
  reg [31 : 0]  error_ctr;
  reg [31 : 0]  tc_ctr;

  reg           clk_tb;
  reg           reset_n_tb;

  reg [AHB_ADDR_WIDTH-1:0]  haddr_i_tb;
  reg [AHB_DATA_WIDTH-1:0]  hwdata_i_tb;
  reg           hsel_i_tb;
  reg           hwrite_i_tb; 
  reg           hmastlock_i_tb;
  reg           hready_i_tb;
  reg [1:0]     htrans_i_tb;
  reg [3:0]     hprot_i_tb;
  reg [2:0]     hburst_i_tb;
  reg [2:0]     hsize_i_tb;

  wire          hresp_o_tb;
  wire          hreadyout_o_tb;
  wire [AHB_DATA_WIDTH-1:0] hrdata_o_tb;

  //reg [31 : 0]  read_data;
  reg [383: 0]  reg_read_data;

  int                   test_vector_cnt;

  //----------------------------------------------------------------
  // Device Under Test.
  //----------------------------------------------------------------
  ecc_top #(
             .AHB_DATA_WIDTH(32),
             .AHB_ADDR_WIDTH(32)
            )
            dut (
             .clk(clk_tb),
             .reset_n(reset_n_tb),

             .haddr_i(haddr_i_tb),
             .hwdata_i(hwdata_i_tb),
             .hsel_i(hsel_i_tb),
             .hwrite_i(hwrite_i_tb),
             .hmastlock_i(hmastlock_i_tb),
             .hready_i(hready_i_tb),
             .htrans_i(htrans_i_tb),
             .hprot_i(hprot_i_tb),
             .hburst_i(hburst_i_tb),
             .hsize_i(hsize_i_tb),

             .hresp_o(hresp_o_tb),
             .hreadyout_o(hreadyout_o_tb),
             .hrdata_o(hrdata_o_tb)
            );


  //----------------------------------------------------------------
  // clk_gen
  //
  // Always running clock generator process.
  //----------------------------------------------------------------
  always
    begin : clk_gen
      #CLK_HALF_PERIOD;
      clk_tb = !clk_tb;
    end // clk_gen


  //----------------------------------------------------------------
  // sys_monitor()
  //
  // An always running process that creates a cycle counter and
  // conditionally displays information about the DUT.
  //----------------------------------------------------------------
  always
    begin : sys_monitor
      #(CLK_PERIOD);
      cycle_ctr = cycle_ctr + 1;
    end


  //----------------------------------------------------------------
  // reset_dut()
  //
  // Toggle reset to put the DUT into a well known state.
  //----------------------------------------------------------------
  task reset_dut;
    begin
      $display("*** Toggle reset.");
      reset_n_tb = 0;

      #(2 * CLK_PERIOD);

      @(posedge clk_tb);
      reset_n_tb = 1;

      #(2 * CLK_PERIOD);

      @(posedge clk_tb);
      $display("");
    end
  endtask // reset_dut


  //----------------------------------------------------------------
  // display_test_results()
  //
  // Display the accumulated test results.
  //----------------------------------------------------------------
  task display_test_results;
    begin
      if (error_ctr == 0)
        begin
          $display("*** All %02d test cases completed successfully", tc_ctr);
          $display("* TESTCASE PASSED");
        end
      else
        begin
          $display("*** %02d tests completed - %02d test cases did not complete successfully.",
                   tc_ctr, error_ctr);
          $display("* TESTCASE FAILED");
        end
    end
  endtask // display_test_results



  //----------------------------------------------------------------
  // init_sim()
  //
  // Initialize all counters and testbed functionality as well
  // as setting the DUT inputs to defined values.
  //----------------------------------------------------------------
  task init_sim;
    begin
      cycle_ctr = 32'h00000000;
      error_ctr = 32'h00000000;
      tc_ctr    = 32'h00000000;

      clk_tb        = 0;
      reset_n_tb    = 0;

      haddr_i_tb      = 0;
      hwdata_i_tb     = 0;
      hsel_i_tb       = 0;
      hwrite_i_tb     = 0;
      hmastlock_i_tb  = 0;
      hready_i_tb     = 0;
      htrans_i_tb     = AHB_HTRANS_IDLE;
      hprot_i_tb      = 0;
      hburst_i_tb     = 0;
      hsize_i_tb      = 3'b011;
    end
  endtask // init_dut


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
      while (hrdata_o_tb == 0)
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
  task write_single_word(input [31 : 0]  address,
                  input [31 : 0] word);
    begin
      hsel_i_tb       <= 1;
      haddr_i_tb      <= address;
      hwrite_i_tb     <= 1;
      hmastlock_i_tb  <= 0;
      hready_i_tb     <= 1;
      htrans_i_tb     <= AHB_HTRANS_NONSEQ;
      hprot_i_tb      <= 0;
      hburst_i_tb     <= 0;
      hsize_i_tb      <= 3'b010;
      
      @(posedge clk_tb);
      haddr_i_tb      <= 'Z;
      hwdata_i_tb     <= word;
      hwrite_i_tb     <= 0;
      htrans_i_tb     <= AHB_HTRANS_IDLE;
      wait(hreadyout_o_tb == 1'b1);

      @(posedge clk_tb);
      hsel_i_tb       <= 0;
    end
  endtask // write_single_word

  
  //----------------------------------------------------------------
  // write_block()
  //
  // Write the given block to the dut.
  //----------------------------------------------------------------
  task write_block(input [31 : 0] addr, input [383 : 0] block);
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
  // read_word()
  //
  // Read a data word from the given address in the DUT.
  // the word read will be available in the global variable
  // read_data.
  //----------------------------------------------------------------
  task read_single_word(input [31 : 0]  address);
    begin
      hsel_i_tb       <= 1;
      haddr_i_tb      <= address;
      hwrite_i_tb     <= 0;
      hmastlock_i_tb  <= 0;
      hready_i_tb     <= 1;
      htrans_i_tb     <= AHB_HTRANS_NONSEQ;
      hprot_i_tb      <= 0;
      hburst_i_tb     <= 0;
      hsize_i_tb      <= 3'b010;
      
      @(posedge clk_tb);
      hwdata_i_tb     <= 0;
      haddr_i_tb      <= 'Z;
      htrans_i_tb     <= AHB_HTRANS_IDLE;
      wait(hreadyout_o_tb == 1'b1);

      @(posedge clk_tb);
      hsel_i_tb       <= 0;      
    end
  endtask // read_word


  //----------------------------------------------------------------
  // read_block()
  //
  // Read the digest in the dut. The resulting digest will be
  // available in the global variable digest_data.
  //----------------------------------------------------------------
  task read_block(input [31 : 0] addr);
    begin
      read_single_word(addr + 4*11);
      reg_read_data[383 : 352] = hrdata_o_tb;
      read_single_word(addr + 4*10);
      reg_read_data[351 : 320] = hrdata_o_tb;
      read_single_word(addr +  4*9);
      reg_read_data[319 : 288] = hrdata_o_tb;
      read_single_word(addr +  4*8);
      reg_read_data[287 : 256] = hrdata_o_tb;
      read_single_word(addr +  4*7);
      reg_read_data[255 : 224] = hrdata_o_tb;
      read_single_word(addr +  4*6);
      reg_read_data[223 : 192] = hrdata_o_tb;
      read_single_word(addr +  4*5);
      reg_read_data[191 : 160] = hrdata_o_tb;
      read_single_word(addr +  4*4);
      reg_read_data[159 : 128] = hrdata_o_tb;
      read_single_word(addr +  4*3);
      reg_read_data[127 :  96] = hrdata_o_tb;
      read_single_word(addr +  4*2);
      reg_read_data[95  :  64] = hrdata_o_tb;
      read_single_word(addr +  4*1);
      reg_read_data[63  :  32] = hrdata_o_tb;
      read_single_word(addr);
      reg_read_data[31  :   0] = hrdata_o_tb;
    end
  endtask // read_digest

  //----------------------------------------------------------------
  // check_name_version()
  //
  // Read the name and version from the DUT.
  //----------------------------------------------------------------
  task check_name_version;
    reg [31 : 0] name0;
    reg [31 : 0] name1;
    reg [31 : 0] version0;
    reg [31 : 0] version1;
    begin

      read_single_word(ADDR_NAME0);
      name0 = hrdata_o_tb;
      read_single_word(ADDR_NAME1);
      name1 = hrdata_o_tb;
      read_single_word(ADDR_VERSION0);
      version0 = hrdata_o_tb;
      read_single_word(ADDR_VERSION1);
      version1 = hrdata_o_tb;

      $display("DUT name: %c%c%c%c%c%c%c%c",
               name0[15 :  8], name0[7  :  0],
               name0[31 : 24], name0[23 : 16], 
               name1[15 :  8], name1[7  :  0],
               name1[31 : 24], name1[23 : 16]);
      $display("DUT version: %c%c%c%c%c%c%c%c",
               version0[15 :  8], version0[7  :  0],
               version0[31 : 24], version0[23 : 16],
               version1[15 :  8], version1[7  :  0],
               version1[31 : 24], version1[23 : 16]);
    end
  endtask // check_name_version


  //----------------------------------------------------------------
  // trig_ECC()
  //
  // Write the given word to the DUT using the DUT interface.
  //----------------------------------------------------------------
  task trig_ECC(input [2 : 0] cmd);
    begin
      write_single_word(ADDR_CTRL  , cmd);
    end
  endtask // trig_ECC


  //----------------------------------------------------------------
  // ecc_keygen_test()
  //
  // Perform a single point multiplication block test.
  //----------------------------------------------------------------
  task ecc_keygen_test(input [7 : 0]  tc_number,
                       input test_vector_t test_vector);
    reg [31  : 0]   start_time;
    reg [31  : 0]   end_time;
    reg [383 : 0]   privkey;
    affn_point_t    pubkey;
    begin
      wait_ready();

      $display("*** TC %0d keygen test started.", tc_number);
      tc_ctr = tc_ctr + 1;
    
      start_time = cycle_ctr;

      write_block(ADDR_SEED0, test_vector.seed);

      trig_ECC(KEYGEN);
      #(CLK_PERIOD);
      
      wait_ready();

      read_block(ADDR_PRIVKEY0);
      privkey = reg_read_data;

      read_block(ADDR_PUBKEYX0);
      pubkey.x = reg_read_data;

      read_block(ADDR_PUBKEYY0);
      pubkey.y = reg_read_data;
      
      end_time = cycle_ctr - start_time;
      $display("*** keygen test processing time = %01d cycles.", end_time);
      $display("privkey    : 0x%96x", test_vector.privkey);

      if ((privkey == test_vector.privkey) & (pubkey == test_vector.pubkey))
        begin
          $display("*** TC %0d keygen successful.", tc_number);
          $display("");
        end
      else
        begin
          $display("*** ERROR: TC %0d keygen NOT successful.", tc_number);
          $display("Expected_x: 0x%96x", test_vector.pubkey.x);
          $display("Got:        0x%96x", pubkey.x);
          $display("Expected_y: 0x%96x", test_vector.pubkey.y);
          $display("Got:        0x%96x", pubkey.y);
          $display("");

          error_ctr = error_ctr + 1;
        end
    end
  endtask // ecc_keygen_test


  //----------------------------------------------------------------
  // ecc_signing_test()
  //
  // Perform a single signing operation test.
  //----------------------------------------------------------------
  task ecc_signing_test(input [7 : 0]  tc_number,
                        input test_vector_t test_vector);
    reg [31  : 0]   start_time;
    reg [31  : 0]   end_time;
    reg [383 : 0]   R;
    reg [383 : 0]   S;
    
    begin
      wait_ready();

      $display("*** TC %0d signing test started.", tc_number);
      tc_ctr = tc_ctr + 1;

      start_time = cycle_ctr;

      write_block(ADDR_MSG0, test_vector.hashed_msg);
      write_block(ADDR_PRIVKEY0, test_vector.privkey);
      //write_block(ADDR_SEED0, test_vector.k);

      trig_ECC(SIGN);
      #(CLK_PERIOD);

      wait_ready();

      read_block(ADDR_SIGNR0);
      R = reg_read_data;

      read_block(ADDR_SIGNS0);
      S = reg_read_data;
      
      end_time = cycle_ctr - start_time;
      $display("*** signing test processing time = %01d cycles.", end_time);
      $display("privkey    : 0x%96x", test_vector.privkey);

      if (R == test_vector.R & S == test_vector.S)
        begin
          $display("*** TC %0d signing successful.", tc_number);
          $display("");
        end
      else
        begin
          $display("*** ERROR: TC %0d signing NOT successful.", tc_number);
          $display("Expected_R: 0x%96x", test_vector.R);
          $display("Got:        0x%96x", R);
          $display("Expected_S: 0x%96x", test_vector.S);
          $display("Got:        0x%96x", S);
          $display("");

          error_ctr = error_ctr + 1;
        end
    end
  endtask // ecc_signing_test


//----------------------------------------------------------------
  // ecc_verifying_test()
  //
  // Perform a single verifying operation test.
  //----------------------------------------------------------------
  task ecc_verifying_test(input [7 : 0]  tc_number,
                        input test_vector_t test_vector);
    reg [31  : 0]   start_time;
    reg [31  : 0]   end_time;
    reg [31 : 0]    verify_result;
    
    begin
      wait_ready();

      $display("*** TC %0d verifying test started.", tc_number);
      tc_ctr = tc_ctr + 1;

      start_time = cycle_ctr;

      write_block(ADDR_MSG0, test_vector.hashed_msg);
      write_block(ADDR_PUBKEYX0, test_vector.pubkey.x);
      write_block(ADDR_PUBKEYY0, test_vector.pubkey.y);
      write_block(ADDR_SIGNR0, test_vector.R);
      write_block(ADDR_SIGNS0, test_vector.S);

      trig_ECC(VERIFY);
      #(CLK_PERIOD);

      wait_ready();

      read_single_word(ADDR_VERIFY);
      verify_result = hrdata_o_tb;
      
      end_time = cycle_ctr - start_time;
      $display("*** verifying test processing time = %01d cycles.", end_time);
      $display("privkey    : 0x%96x", test_vector.privkey);

      if (verify_result == 1)
        begin
          $display("*** TC %0d verifying successful.", tc_number);
          $display("");
        end
      else
        begin
          $display("*** ERROR: TC %0d verifying NOT successful.", tc_number);
          $display("");

          error_ctr = error_ctr + 1;
        end
    end
  endtask // ecc_verifying_test



  //----------------------------------------------------------------
  // ecc_test()
  //
  //----------------------------------------------------------------
  task ecc_test();
    begin   
      //the first 3-set test vectors work for keygen, 
      // and the last 2-set test vectors work for signing/verifying
      for (int i = 0; i < 3; i++) begin: test_vector_loop
          ecc_keygen_test(i, test_vectors[i]);
      end
      for (int i = 3; i < 5; i++) begin: test_vector_loop
          ecc_signing_test(i, test_vectors[i]);
          ecc_verifying_test(i, test_vectors[i]);
      end
    end
  endtask // ecc_test


  task read_test_vectors(input string fname);
      integer values_per_test_vector;
      integer line_cnt;
      integer fin;
      integer rv;
      r_t val;    // must be the largest width of any possible value
      test_vector_t test_vector;

      // ATTN: Must match the number of fields generated by gen_mm_test_vectors.py script
      values_per_test_vector = 8;
      line_cnt = 0;
      test_vector_cnt = 0;

      fin = $fopen(fname, "r");
      if (fin == 0)
          $error("Can't open file %s", fname);
      while (!$feof(fin)) begin
          rv = $fscanf(fin, "%h\n", val);
          if (rv != 1) begin
              $error("Failed to read a matching string");
              $fclose(fin);
              $finish;
          end
          // ATTN: the number of cases must be equal to 'values_per_test_vector'.
          // ATTN: the order of values must be the same as in gen_mm_test_vectors.py script.
          case (line_cnt % values_per_test_vector)
              0: test_vector.hashed_msg  = val;
              1: test_vector.privkey     = val;
              2: test_vector.pubkey.x    = val;
              3: test_vector.pubkey.y    = val;
              4: test_vector.seed        = val;
              5: test_vector.R           = val;
              6: begin
                 test_vector.S           = val;
                 test_vectors[test_vector_cnt] = test_vector;
              end
              7 : test_vector_cnt++;
          endcase
          
          line_cnt++;
      end
      $fclose(fin);

      $display("Read %0d test vectors from %s", test_vector_cnt, fname);
  endtask

  //----------------------------------------------------------------
  // main
  //
  // The main test functionality.
  //----------------------------------------------------------------
  initial
    begin : main
      
      string fname;

      $display("   -= Testbench for ecc started =-");
      $display("    ==============================");
      $display("");

      fname = "/home/mojtabab/workspace_aha_poc/ws1/Caliptra/src/ecc/tb/test_vectors/ecc_drbg.hex";
      read_test_vectors(fname);

      init_sim();
      reset_dut();
      check_name_version();

      ecc_test();

      display_test_results();
      
      $display("");
      $display("*** ecc simulation done. ***");
      $finish;
    end // main

endmodule // ecc_top_tb