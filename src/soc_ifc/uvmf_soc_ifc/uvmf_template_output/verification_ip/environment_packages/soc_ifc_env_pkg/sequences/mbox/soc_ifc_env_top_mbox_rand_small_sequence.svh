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
// DESCRIPTION: Sequence to initiate (and respond) to mailbox command
//              "TOP" sequence because it invokes lower level env sequences
//              to facilitate the uC/SoC sides of mailbox command handling
//              and this sequence defines the whole mailbox flow.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class soc_ifc_env_top_mbox_rand_small_sequence #(
      type CONFIG_T
      ) extends soc_ifc_env_top_mbox_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils_begin( soc_ifc_env_top_mbox_rand_small_sequence #( CONFIG_T) )
  `uvm_object_utils_end
  `m_uvm_get_type_name_func    ( soc_ifc_env_top_mbox_rand_small_sequence #( CONFIG_T) )

  extern virtual function create_seqs();
  extern virtual function randomize_seqs();

endclass

function soc_ifc_env_top_mbox_rand_small_sequence::create_seqs();
    uvm_object obj;
    obj = soc_ifc_env_mbox_rand_small_sequence_t::get_type().create_object("soc_ifc_env_mbox_seq");
    if(!$cast(soc_ifc_env_mbox_seq,obj)) `uvm_fatal("SOC_IFC_TOP_MBOX_RAND_SMALL", "soc_ifc_env_top_mbox_rand_small_sequence::create_seqs() - <seq_type>.create_object() failed")
    soc_ifc_env_cptra_handler_seq = soc_ifc_env_cptra_mbox_handler_sequence_t::type_id::create("soc_ifc_env_cptra_handler_seq");
endfunction

function soc_ifc_env_top_mbox_rand_small_sequence::randomize_seqs();
    if(!soc_ifc_env_mbox_seq.randomize() with { mbox_op_rand.dlen < 32'h0000_0200; mbox_resp_expected_dlen < 32'h0000_0080; })
        `uvm_fatal("SOC_IFC_MBOX_TOP", $sformatf("soc_ifc_env_top_mbox_rand_small_sequence::body() - %s randomization failed", soc_ifc_env_mbox_seq.get_type_name()));
    if(!soc_ifc_env_cptra_handler_seq.randomize())
        `uvm_fatal("SOC_IFC_MBOX_TOP", $sformatf("soc_ifc_env_top_mbox_rand_small_sequence::body() - %s randomization failed", soc_ifc_env_cptra_handler_seq.get_type_name()));
endfunction
