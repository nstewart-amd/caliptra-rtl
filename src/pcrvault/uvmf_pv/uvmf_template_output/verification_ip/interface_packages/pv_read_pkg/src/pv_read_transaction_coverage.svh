//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// SPDX-License-Identifier: Apache-2.0
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records pv_read transaction information using
//       a covergroup named pv_read_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
covergroup rd_data(input logic rd_data_bit);
  //option.per_instance = 1;
  value: coverpoint rd_data_bit;
  transition:  coverpoint rd_data_bit {
    bins bin01 = (0 => 1); 
    bins bin10 = (1 => 0);
  }
endgroup

class pv_read_transaction_coverage #(
      string PV_READ_REQUESTOR = "SHA512_BLOCK"
      )
 extends uvm_subscriber #(.T(pv_read_transaction #(
                                            .PV_READ_REQUESTOR(PV_READ_REQUESTOR)
                                            )
));

  `uvm_component_param_utils( pv_read_transaction_coverage #(
                              PV_READ_REQUESTOR
                              )
)

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  rd_data rd_data_bus[PV_DATA_W];
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup pv_read_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    read_entry: coverpoint coverage_trans.read_entry;
    read_offset: coverpoint coverage_trans.read_offset {
      illegal_bins offset_12_15 = {['d12:'d15]};
    }
    error: coverpoint coverage_trans.error {
      ignore_bins error1 = {'d1};
    }
    last: coverpoint coverage_trans.last;
    lastXoffset: cross last, read_offset;
    // pragma uvmf custom covergroup end
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    pv_read_transaction_cg=new;
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    pv_read_transaction_cg.set_inst_name($sformatf("pv_read_transaction_cg_%s",get_full_name()));
  endfunction

  // ****************************************************************************
  // FUNCTION: write (T t)
  // This function is automatically executed when a transaction arrives on the
  // analysis_export.  It copies values from the variables in the transaction 
  // to local variables used to collect functional coverage.  
  //
  virtual function void write (T t);
    `uvm_info("COV","Received transaction",UVM_HIGH);
    coverage_trans = t;

    foreach(rd_data_bus[i]) rd_data_bus[i] = new(coverage_trans.read_data[i]);
    foreach(rd_data_bus[i]) rd_data_bus[i].set_inst_name($sformatf("rd_data_bus[%0d]_%s",i,get_full_name()));

    pv_read_transaction_cg.sample();
    foreach(rd_data_bus[i]) rd_data_bus[i].sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

