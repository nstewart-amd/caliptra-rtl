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

`ifndef SOC_IFC_PKG
`define SOC_IFC_PKG

package soc_ifc_pkg;
    
    parameter SOC_IFC_ADDR_W = 18;
    parameter SOC_IFC_DATA_W = 32;
    parameter SOC_IFC_USER_W = 32;
    
    parameter MBOX_SIZE_KB = 128;
    parameter MBOX_DATA_W = 32;
    parameter MBOX_DEPTH = (MBOX_SIZE_KB * 1024 * 8) / MBOX_DATA_W;
    parameter MBOX_ADDR_W = $clog2(MBOX_DEPTH);

    //memory map
    parameter MBOX_DIR_START_ADDR    = 18'h0_0000;
    parameter MBOX_DIR_END_ADDR      = 18'h1_FFFF;
    parameter MBOX_REG_START_ADDR    = 18'h2_0000;
    parameter MBOX_REG_END_ADDR      = 18'h2_0FFF;
    parameter SHA_REG_START_ADDR     = 18'h2_1000;
    parameter SHA_REG_END_ADDR       = 18'h2_1FFF;
    parameter SOC_IFC_REG_START_ADDR = 18'h3_0000;
    parameter SOC_IFC_REG_END_ADDR   = 18'h3_FFFF;

    //BOOT FSM
    typedef enum logic [1:0] {
        BOOT_IDLE   = 2'b00,
        BOOT_FUSE   = 2'b01,
        BOOT_DONE   = 2'b11
    } boot_fsm_state_e;

    //MAILBOX FSM
    typedef enum logic [2:0] {
        MBOX_IDLE         = 3'b000,
        MBOX_RDY_FOR_CMD  = 3'b001,
        MBOX_RDY_FOR_DLEN = 3'b011,
        MBOX_RDY_FOR_DATA = 3'b010,
        MBOX_EXECUTE_UC   = 3'b110,
        MBOX_EXECUTE_SOC  = 3'b100
    } mbox_fsm_state_e;

    //Any request into soc ifc block
    typedef struct packed {
        logic   [SOC_IFC_ADDR_W-1:0] addr;
        logic   [SOC_IFC_DATA_W-1:0] wdata;
        logic   [SOC_IFC_USER_W-1:0] user;
        logic                        write;
        logic                        soc_req;
    } soc_ifc_req_t;
    //Request specific to soc ifc reg block
    typedef struct packed {
        logic   [SOC_IFC_ADDR_W-1:0] addr;
        logic   [SOC_IFC_DATA_W-1:0] wdata;
        logic                        write;
        logic                        soc_req;
    } soc_ifc_reg_req_t;
    //Request to mbox sram
    typedef struct packed {
        logic cs;
        logic we;
        logic [MBOX_ADDR_W-1:0] addr;
        logic [MBOX_DATA_W-1:0] wdata;
    } mbox_sram_req_t;
    //Response from mbox sram
    typedef struct packed {
        logic [MBOX_DATA_W-1:0] rdata;
    } mbox_sram_resp_t;

endpackage

`endif