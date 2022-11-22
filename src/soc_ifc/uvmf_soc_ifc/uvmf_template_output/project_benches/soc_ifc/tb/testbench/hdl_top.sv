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
// Description: This top level module instantiates all synthesizable
//    static content.  This and tb_top.sv are the two top level modules
//    of the simulation.  
//
//    This module instantiates the following:
//        DUT: The Design Under Test
//        Interfaces:  Signal bundles that contain signals connected to DUT
//        Driver BFM's: BFM's that actively drive interface signals
//        Monitor BFM's: BFM's that passively monitor interface signals
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//

module hdl_top;

import soc_ifc_parameters_pkg::*;
import qvip_ahb_lite_slave_params_pkg::*;
import qvip_apb5_slave_params_pkg::*;
import uvmf_base_pkg_hdl::*;

  // pragma attribute hdl_top partition_module_xrtl                                            
  hdl_qvip_ahb_lite_slave 
      #(
        .AHB_LITE_SLAVE_0_ACTIVE(1),
        .UNIQUE_ID("uvm_test_top.environment.qvip_ahb_lite_slave_subenv."),
        .EXT_CLK_RESET(1)
       ) uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl();

  hdl_qvip_apb5_slave 
      #(
        .APB5_MASTER_0_ACTIVE(1),
        .UNIQUE_ID("uvm_test_top.environment.qvip_apb5_slave_subenv."),
        .EXT_CLK_RESET(1)
       ) uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl();

// pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  // tbx clkgen
  initial begin
    clk = 0;
    #0ns;
    forever begin
      clk = ~clk;
      #5ns;
    end
  end
// pragma uvmf custom clock_generator end

// pragma uvmf custom reset_generator begin
  bit dummy, dummy_n;
    default_reset_gen default_reset_gen
    (
        .RESET(dummy),
        .CLK_IN(clk)
    );
    always_comb dummy_n = ~dummy;
// pragma uvmf custom reset_generator end

  // pragma uvmf custom module_item_additional begin
import soc_ifc_pkg::*;
    mbox_sram_req_t  mbox_sram_req;
    mbox_sram_resp_t mbox_sram_resp;

    //SRAM for mbox
    caliptra_sram 
    #(
        .DATA_WIDTH(32),
        .DEPTH('h8000)
    )
    i_mbox_ram
    (
        .clk_i(clk),
        
        .cs_i   (mbox_sram_req.cs   ),
        .we_i   (mbox_sram_req.we   ),
        .addr_i (mbox_sram_req.addr ),
        .wdata_i(mbox_sram_req.wdata),
        
        .rdata_o(mbox_sram_resp.rdata)
    );
  // pragma uvmf custom module_item_additional end

  // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
  // The signal bundle, _if, contains signals to be connected to the DUT.
  // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
  // The driver, driver_bfm, drives transactions onto the bus, _if.
  soc_ifc_ctrl_if  soc_ifc_ctrl_agent_bus(
     // pragma uvmf custom soc_ifc_ctrl_agent_bus_connections begin
     .clk(clk), .dummy(1'b1)
     // pragma uvmf custom soc_ifc_ctrl_agent_bus_connections end
     );
  soc_ifc_status_if  soc_ifc_status_agent_bus(
     // pragma uvmf custom soc_ifc_status_agent_bus_connections begin
     .clk(clk), .dummy(1'b1)
     // pragma uvmf custom soc_ifc_status_agent_bus_connections end
     );
  soc_ifc_ctrl_monitor_bfm  soc_ifc_ctrl_agent_mon_bfm(soc_ifc_ctrl_agent_bus.monitor_port);
  soc_ifc_status_monitor_bfm  soc_ifc_status_agent_mon_bfm(soc_ifc_status_agent_bus.monitor_port);
  soc_ifc_ctrl_driver_bfm  soc_ifc_ctrl_agent_drv_bfm(soc_ifc_ctrl_agent_bus.initiator_port);
  soc_ifc_status_driver_bfm  soc_ifc_status_agent_drv_bfm(soc_ifc_status_agent_bus.responder_port);

  // pragma uvmf custom dut_instantiation begin
  // AHB Clock/reset
  assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.default_clk_gen_CLK     = clk;
  assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.default_reset_gen_RESET = soc_ifc_ctrl_agent_bus.cptra_rst_b;
  assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.default_clk_gen_CLK         = clk;
  assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.default_reset_gen_RESET     = soc_ifc_ctrl_agent_bus.cptra_rst_b;

  // DUT
    soc_ifc_top #(
        .AHB_ADDR_WIDTH(18),
        .AHB_DATA_WIDTH(64),
        .APB_ADDR_WIDTH(18),
        .APB_DATA_WIDTH(32),
        .APB_USER_WIDTH(32)
        )
        dut
        (
        .clk               (clk               ),
        .cptra_pwrgood     (soc_ifc_ctrl_agent_bus.cptra_pwrgood     ),
        .cptra_rst_b       (soc_ifc_ctrl_agent_bus.cptra_rst_b       ),
        .ready_for_fuses   (soc_ifc_status_agent_bus.ready_for_fuses   ),
        .ready_for_fw_push (soc_ifc_status_agent_bus.ready_for_fw_push ),
        .ready_for_runtime (soc_ifc_status_agent_bus.ready_for_runtime ),
        .mailbox_data_avail(soc_ifc_status_agent_bus.mailbox_data_avail),
        .mailbox_flow_done (soc_ifc_status_agent_bus.mailbox_flow_done ),

        .generic_input_wires (soc_ifc_ctrl_agent_bus.generic_input_wires ),
        .generic_output_wires(soc_ifc_status_agent_bus.generic_output_wires),

        //SRAM interface
        .mbox_sram_req(mbox_sram_req),
        .mbox_sram_resp(mbox_sram_resp),

        //APB Interface with SoC
        .paddr_i  (uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PADDR[17:0]),
        .psel_i   (uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PSEL       ),
        .penable_i(uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PENABLE    ),
        .pwrite_i (uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PWRITE     ),
        .pwdata_i (uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PWDATA     ),
        .pauser_i (uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PAUSER     ),
        .pready_o (uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PREADY     ),
        .prdata_o (uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PRDATA     ),
        .pslverr_o(uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PSLVERR    ),
        //AHB Interface with uC

        .haddr_i    (uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HADDR[17:0]),
        .hwdata_i   (uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HWDATA     ),
        .hsel_i     (1'b1                                                                                     ),
        .hwrite_i   (uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HWRITE     ),
        .hready_i   (uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HREADYOUT  ),
        .htrans_i   (uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HTRANS     ),
        .hsize_i    (uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HSIZE      ),
        .hresp_o    (uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HRESP      ),
        .hreadyout_o(uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HREADY     ),
        .hrdata_o   (uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HRDATA     ),
        // uC Interrupts
        .soc_ifc_error_intr(soc_ifc_status_agent_bus.soc_ifc_error_intr),
        .soc_ifc_notif_intr(soc_ifc_status_agent_bus.soc_ifc_notif_intr),
        .sha_error_intr(soc_ifc_status_agent_bus.sha_error_intr),
        .sha_notif_intr(soc_ifc_status_agent_bus.sha_notif_intr),
        //Obfuscated UDS and FE
        .cptra_obf_key(soc_ifc_ctrl_agent_bus.cptra_obf_key),
        .cptra_obf_key_reg(soc_ifc_status_agent_bus.cptra_obf_key_reg),
        .obf_field_entropy(soc_ifc_status_agent_bus.obf_field_entropy),
        .obf_uds_seed(soc_ifc_status_agent_bus.obf_uds_seed),
        .clear_secrets(soc_ifc_ctrl_agent_bus.clear_secrets),
        // ICCM Lock
        .iccm_lock(soc_ifc_status_agent_bus.iccm_lock),
        //uC reset
        .cptra_uc_rst_b (soc_ifc_status_agent_bus.cptra_uc_rst_b) 
    );
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HBURST    = 3'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HPROT     = 7'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HMASTLOCK = 1'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HSEL      = 1'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HNONSEC   = 1'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HAUSER    = 64'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HWUSER    = 64'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HRUSER    = 64'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_mult_HSEL = 16'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HEXCL     = 1'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HMASTER   = 16'b0;
    assign uvm_test_top_environment_qvip_ahb_lite_slave_subenv_qvip_hdl.ahb_lite_slave_0_HEXOKAY   = 1'b0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PWUSER           = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PRUSER           = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PBUSER           = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PWAKEUP          = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PADDRCHK         = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PCTRLCHK         = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PSELxCHK         = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PENABLECHK       = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PWDATACHK        = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PSTRBCHK         = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PWAKEUPCHK       = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PAUSERCHK        = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PWUSERCHK        = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PREADYCHK        = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PRDATACHK        = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PSLVERRCHK       = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PRUSERCHK        = 0;
    assign uvm_test_top_environment_qvip_apb5_slave_subenv_qvip_hdl.apb5_master_0_PBUSERCHK        = 0;
  // pragma uvmf custom dut_instantiation end

  initial begin      // tbx vif_binding_block 
    import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual soc_ifc_ctrl_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , soc_ifc_ctrl_agent_BFM , soc_ifc_ctrl_agent_mon_bfm ); 
    uvm_config_db #( virtual soc_ifc_status_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , soc_ifc_status_agent_BFM , soc_ifc_status_agent_mon_bfm ); 
    uvm_config_db #( virtual soc_ifc_ctrl_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , soc_ifc_ctrl_agent_BFM , soc_ifc_ctrl_agent_drv_bfm  );
    uvm_config_db #( virtual soc_ifc_status_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , soc_ifc_status_agent_BFM , soc_ifc_status_agent_drv_bfm  );
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end
