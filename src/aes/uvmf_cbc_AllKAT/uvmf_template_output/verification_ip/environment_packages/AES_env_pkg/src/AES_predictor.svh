//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.1
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   AES_in_agent_ae receives transactions of type  AES_in_transaction #()
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  AES_sb_ap broadcasts transactions of type AES_out_transaction #()
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class AES_predictor #(
  type CONFIG_T
  )
 extends uvm_component;

  // Factory registration of this class
  `uvm_component_param_utils( AES_predictor #(
                              CONFIG_T
                              )
)


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_AES_in_agent_ae #(AES_in_transaction #(), AES_predictor #(
                              .CONFIG_T(CONFIG_T)
                              )
) AES_in_agent_ae;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(AES_out_transaction #()) AES_sb_ap;


  // Transaction variable for predicted values to be sent out AES_sb_ap
  typedef AES_out_transaction #() AES_sb_ap_output_transaction_t;
  AES_sb_ap_output_transaction_t AES_sb_ap_output_transaction;
  // Code for sending output transaction out through AES_sb_ap
  // AES_sb_ap.write(AES_sb_ap_output_transaction);

  // Define transaction handles for debug visibility 
  AES_in_transaction #() AES_in_agent_ae_debug;


  // pragma uvmf custom class_item_additional begin
  reg [1279: 0] expected_all;
  reg [8:0] test_case_sel;

  int block_shift;
  int line_skip;
  int cnt_tmp;
  int fd_r;
  
  string        line_read;
  string        tmp_str1;
  string        tmp_str2;
  string        file_name;
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    `uvm_warning("PREDICTOR_REVIEW", "This predictor has been created either through generation or re-generation with merging.  Remove this warning after the predictor has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    AES_in_agent_ae = new("AES_in_agent_ae", this);
    AES_sb_ap =new("AES_sb_ap", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_AES_in_agent_ae
  // Transactions received through AES_in_agent_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_AES_in_agent_ae(AES_in_transaction #() t);
    // pragma uvmf custom AES_in_agent_ae_predictor begin
    AES_in_agent_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through AES_in_agent_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    AES_sb_ap_output_transaction = AES_sb_ap_output_transaction_t::type_id::create("AES_sb_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    // `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    // `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The AES_predictor::write_AES_in_agent_ae function needs to be completed with DUT prediction model",UVM_NONE)
    // `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)

    $display("**AES_predictor** t.op= %d",t.op);
    $display("**AES_predictor** t.test_case_sel = %d",t.test_case_sel);
    $display("**AES_predictor** t.key_len = %d",t.key_len);
    if (t.op== 2'b00) AES_sb_ap_output_transaction.result = 0;
    else begin
      cnt_tmp = 0;
      block_shift = 0;
      test_case_sel = t.test_case_sel;
      
      // for some reason, $fopen only recognizes the absolute path
      // change it to your path before running!!
      case(t.key_len)
        // 128bit key
        0: begin
          // limit test_case_sel less that 293
          if (test_case_sel > 293) test_case_sel = test_case_sel - 294;
          case(test_case_sel) inside
            [0:6]:    begin
              file_name = "/home/t-stevenlian/AHA_workspaces/aes_vector_v2/Caliptra/src/aes/tb/vectors/CBCGFSbox128.rsp";
              line_skip = test_case_sel * 6 + 11;
              if (t.op== 2'b10) line_skip = line_skip + 44;
            end
            [7:27]:   begin
              file_name = "/home/t-stevenlian/AHA_workspaces/aes_vector_v2/Caliptra/src/aes/tb/vectors/CBCKeySbox128.rsp";
              line_skip = (test_case_sel - 7) * 6 + 11;
              if (t.op== 2'b10) line_skip = line_skip + 128;
            end
            [28:37]:  begin
              file_name = "/home/t-stevenlian/AHA_workspaces/aes_vector_v2/Caliptra/src/aes/tb/vectors/CBCMMT128.rsp";
              line_skip = (test_case_sel - 28) * 6 + 11;
              block_shift = test_case_sel - 28;
              if (t.op== 2'b10) line_skip = line_skip + 62;
            end
            [38:165]: begin
              file_name = "/home/t-stevenlian/AHA_workspaces/aes_vector_v2/Caliptra/src/aes/tb/vectors/CBCVarKey128.rsp";
              line_skip = (test_case_sel - 38) * 6 + 11;
              if (t.op== 2'b10) line_skip = line_skip + 770;
            end
            [166:293]:begin
              file_name = "/home/t-stevenlian/AHA_workspaces/aes_vector_v2/Caliptra/src/aes/tb/vectors/CBCVarTxt128.rsp";
              line_skip = (test_case_sel - 166) * 6 + 11;
              if (t.op== 2'b10) line_skip = line_skip + 770;
            end
          endcase
        end 
        
        // 256bit key
        1: begin
          // limit test_case_sel less that 414, x4 for wider spread
          if (test_case_sel > 414) test_case_sel = (test_case_sel - 415) * 4;
          case(test_case_sel) inside
            [0:4]:    begin
              file_name = "/home/t-stevenlian/AHA_workspaces/aes_vector_v2/Caliptra/src/aes/tb/vectors/CBCGFSbox256.rsp";
              line_skip = test_case_sel * 6 + 11;
              if (t.op== 2'b10) line_skip = line_skip + 32;
            end
            [5:20]:   begin
              file_name = "/home/t-stevenlian/AHA_workspaces/aes_vector_v2/Caliptra/src/aes/tb/vectors/CBCKeySbox256.rsp";
              line_skip = (test_case_sel - 5) * 6 + 11;
              if (t.op== 2'b10) line_skip = line_skip + 98;
            end
            [21:30]:  begin
              file_name = "/home/t-stevenlian/AHA_workspaces/aes_vector_v2/Caliptra/src/aes/tb/vectors/CBCMMT256.rsp";
              line_skip = (test_case_sel - 21) * 6 + 11;
              block_shift = test_case_sel - 21;
              if (t.op== 2'b10) line_skip = line_skip + 62;
            end
            [31:286]: begin
              file_name = "/home/t-stevenlian/AHA_workspaces/aes_vector_v2/Caliptra/src/aes/tb/vectors/CBCVarKey256.rsp";
              line_skip = (test_case_sel - 31) * 6 + 11;
              if (t.op== 2'b10) line_skip = line_skip + 1538;
            end
            [287:414]:begin
              file_name = "/home/t-stevenlian/AHA_workspaces/aes_vector_v2/Caliptra/src/aes/tb/vectors/CBCVarTxt256.rsp";
              line_skip = (test_case_sel - 287) * 6 + 11;
              if (t.op== 2'b10) line_skip = line_skip + 770;
            end
          endcase
        end 
        
      endcase
      
      fd_r = $fopen(file_name,"r");
      if(fd_r) $display("**AES_predictor** file opened successfully!");

      while (cnt_tmp < line_skip) begin
        cnt_tmp = cnt_tmp + 1;
        $fgets(line_read,fd_r);
      end

      // gets expected text
      repeat (3) $fgets(line_read,fd_r);
      $sscanf( line_read, "%s %s %h", tmp_str1, tmp_str2, expected_all);

      // shift the expected text
      expected_all = expected_all << (9 - block_shift) * 128;
      // $display("expected_all = %h", expected_all);

      AES_sb_ap_output_transaction.result = expected_all;
      `uvm_info("PREDICT",{"AES_OUT: ",AES_sb_ap_output_transaction.convert2string()},UVM_MEDIUM);
    end

    // Code for sending output transaction out through AES_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    AES_sb_ap.write(AES_sb_ap_output_transaction);
    // pragma uvmf custom AES_in_agent_ae_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end
