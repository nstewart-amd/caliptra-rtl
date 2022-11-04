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
//
//======================================================================
//
// hmac.sv
// ------
// HMAC-384 top-level wrapper with 32 bit data access.
//
//======================================================================
//`include "kv_defines.svh"

module hmac 
       import hmac_param_pkg::*;
       import hmac_reg_pkg::*;
       import kv_defines_pkg::*;      
      #(
        ADDR_WIDTH = 32
      )(
        // Clock and reset.
        input wire           clk,
        input wire           reset_n,
        input wire           cptra_pwrgood,

        // Control.
        input wire           cs,
        input wire           we,

        // Data ports.
        input wire  [ADDR_WIDTH - 1 : 0] address,
        input wire  [31 : 0] write_data,
        output wire [31 : 0] read_data,

        // KV interface
        output kv_read_t [1:0] kv_read,
        output kv_write_t kv_write,
        input kv_resp_t [1:0] kv_resp,

        output wire error_intr,
        output wire notif_intr
      );

  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg init_reg;
  reg init_new;

  reg next_reg;
  reg next_new;
  
  reg ready_reg;
  reg tag_valid_reg;

  reg [31 : 0] key_reg [0 : 11];
  reg          key_we;

  reg [31 : 0] block_reg [0 : 31];
  reg          block_we;


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  wire [383 : 0] core_key;
  wire [1023 : 0] core_block;
  wire           core_ready;
  wire [383 : 0] core_tag;
  wire           core_tag_valid;
  reg [0:11][31:0] tag_reg;
  reg [0:11][31:0] kv_reg;

  hmac_reg__in_t hwif_in;
  hmac_reg__out_t hwif_out;

  //interface with kv client
  logic kv_key_write_en;
  logic [3:0] kv_key_write_offset;
  logic [31:0] kv_key_write_data;
  logic kv_block_write_en;
  logic [4:0] kv_block_write_offset;
  logic [31:0] kv_block_write_data;

  logic dest_keyvault;
  logic kv_key_done;
  logic kv_block_done;
  logic kv_write_done;

  kv_read_ctrl_reg_t kv_key_read_ctrl_reg;
  kv_read_ctrl_reg_t kv_block_read_ctrl_reg;
  kv_write_ctrl_reg_t kv_write_ctrl_reg;
  logic core_tag_we;
  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign core_block = {block_reg[00], block_reg[01], block_reg[02], block_reg[03],
                       block_reg[04], block_reg[05], block_reg[06], block_reg[07],
                       block_reg[08], block_reg[09], block_reg[10], block_reg[11],
                       block_reg[12], block_reg[13], block_reg[14], block_reg[15],
                       block_reg[16], block_reg[17], block_reg[18], block_reg[19],
                       block_reg[20], block_reg[21], block_reg[22], block_reg[23],
                       block_reg[24], block_reg[25], block_reg[26], block_reg[27],
                       block_reg[28], block_reg[29], block_reg[30], block_reg[31]};

  assign core_key = {key_reg[00], key_reg[01], key_reg[02], key_reg[03], key_reg[04], key_reg[05],
                     key_reg[06], key_reg[07], key_reg[08], key_reg[09], key_reg[10], key_reg[11]};

  //rising edge detect on core tag valid
  assign core_tag_we = core_tag_valid & ~tag_valid_reg;

  //----------------------------------------------------------------
  // core instantiation.
  //----------------------------------------------------------------
  hmac_core core(
                 .clk(clk),
                 .reset_n(reset_n),

                 .init_cmd(init_reg),
                 .next_cmd(next_reg),

                 .key(core_key),

                 .block_msg(core_block),

                 .ready(core_ready),
                 .tag(core_tag),
                 .tag_valid(core_tag_valid)
                );


  //----------------------------------------------------------------
  // reg_update
  //
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset. All registers have write enable.
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin : reg_update
      integer ii;

      if (!reset_n)
        begin
          kv_reg        <= '0;
          tag_reg       <= '0;
          tag_valid_reg <= '0;
        end
      else
        begin
          tag_valid_reg <= core_tag_valid;

          //write to sw register
          if (core_tag_we & ~dest_keyvault)
            tag_reg <= core_tag;
          if (core_tag_we & dest_keyvault)
            kv_reg <= core_tag;

        end
    end // reg_update

//HMAC register hardware interfaces
always_comb begin
  //drive resets to register block
  hwif_in.error_reset_b = cptra_pwrgood;
  hwif_in.reset_b = reset_n;
  //drive hardware writeable registers from hmac core
  hwif_in.HMAC384_NAME[0].NAME.next = HMAC_CORE_NAME[31:0];
  hwif_in.HMAC384_NAME[1].NAME.next = HMAC_CORE_NAME[63:32];
  hwif_in.HMAC384_VERSION[0].VERSION.next = HMAC_CORE_VERSION[31:0];
  hwif_in.HMAC384_VERSION[1].VERSION.next = HMAC_CORE_VERSION[63:32];
  hwif_in.HMAC384_STATUS.READY.next = core_ready;
  hwif_in.HMAC384_STATUS.VALID.next = tag_valid_reg;
  for (int dword=0; dword < 12; dword++) begin
    hwif_in.HMAC384_TAG[dword].TAG.next = tag_reg[dword];
  end
  //drive hardware writable registers from key vault
  for (int dword=0; dword < 32; dword++)begin
    hwif_in.HMAC384_BLOCK[dword].BLOCK.we = kv_block_write_en & (kv_block_write_offset == dword);
    hwif_in.HMAC384_BLOCK[dword].BLOCK.next = kv_block_write_data;
  end
  for (int dword=0; dword < 12; dword++)begin
    hwif_in.HMAC384_KEY[dword].KEY.we = kv_key_write_en & (kv_key_write_offset == dword);
    hwif_in.HMAC384_KEY[dword].KEY.next = kv_key_write_data;
  end
  //set done when fsm is done
  hwif_in.HMAC384_KV_RD_KEY_CTRL.read_done.hwset = kv_key_done;
  hwif_in.HMAC384_KV_RD_BLOCK_CTRL.read_done.hwset = kv_block_done;
  hwif_in.HMAC384_KV_WR_CTRL.write_done.hwset = kv_write_done;
  //clear done when new request is made
  hwif_in.HMAC384_KV_RD_KEY_CTRL.read_done.hwclr = kv_key_read_ctrl_reg.read_en;
  hwif_in.HMAC384_KV_RD_BLOCK_CTRL.read_done.hwclr = kv_block_read_ctrl_reg.read_en;
  hwif_in.HMAC384_KV_WR_CTRL.write_done.hwclr = kv_write_ctrl_reg.write_en;
  //clear enable when done
  hwif_in.HMAC384_KV_RD_KEY_CTRL.read_en.hwclr = kv_key_done;
  hwif_in.HMAC384_KV_RD_BLOCK_CTRL.read_en.hwclr = kv_block_done;
  hwif_in.HMAC384_KV_WR_CTRL.write_en.hwclr = kv_write_done;
  //assign hardware readable registers to drive hmac core
  init_reg = hwif_out.HMAC384_CTRL.INIT.value;
  next_reg = hwif_out.HMAC384_CTRL.NEXT.value;
  for (int dword=0; dword < 12; dword++) begin
    key_reg[dword] = hwif_out.HMAC384_KEY[dword].KEY.value;
  end
  for (int dword=0; dword < 32; dword++)begin
    block_reg[dword] = hwif_out.HMAC384_BLOCK[dword].BLOCK.value;
  end
end

//keyvault control reg macros for assigning to struct
`KV_READ_CTRL_REG2STRUCT(kv_key_read_ctrl_reg, HMAC384_KV_RD_KEY_CTRL)
`KV_READ_CTRL_REG2STRUCT(kv_block_read_ctrl_reg, HMAC384_KV_RD_BLOCK_CTRL)
`KV_WRITE_CTRL_REG2STRUCT(kv_write_ctrl_reg, HMAC384_KV_WR_CTRL)

// Register block
hmac_reg i_hmac_reg (
    .clk(clk),
    .rst(1'b0),

    .s_cpuif_req         (cs),
    .s_cpuif_req_is_wr   (we),
    .s_cpuif_addr        (address[HMAC_REG_ADDR_WIDTH-1:0]),
    .s_cpuif_wr_data     (write_data),
    .s_cpuif_req_stall_wr(),
    .s_cpuif_req_stall_rd(),
    .s_cpuif_rd_ack      (),
    .s_cpuif_rd_err      (),
    .s_cpuif_rd_data     (read_data),
    .s_cpuif_wr_ack      (),
    .s_cpuif_wr_err      (),

    .hwif_in (hwif_in),
    .hwif_out(hwif_out)
);

//Interrupts hardware interface
assign hwif_in.intr_block_rf.notif_internal_intr_r.notif_cmd_done_sts.hwset = core_tag_we;
assign hwif_in.intr_block_rf.error_internal_intr_r.error0_sts.hwset = 1'b0; // TODO
assign hwif_in.intr_block_rf.error_internal_intr_r.error1_sts.hwset = 1'b0; // TODO
assign hwif_in.intr_block_rf.error_internal_intr_r.error2_sts.hwset = 1'b0; // TODO
assign hwif_in.intr_block_rf.error_internal_intr_r.error3_sts.hwset = 1'b0; // TODO

assign error_intr = hwif_out.intr_block_rf.error_global_intr_r.intr;
assign notif_intr = hwif_out.intr_block_rf.notif_global_intr_r.intr;

//Read Key
kv_read_client #(
  .DATA_WIDTH(384),
  .PAD(0)
)
hmac_key_kv_read
(
    .clk(clk),
    .rst_b(reset_n),

    //client control register
    .read_ctrl_reg(kv_key_read_ctrl_reg),

    //interface with kv
    .kv_read(kv_read[0]),
    .kv_resp(kv_resp[0]),

    //interface with client
    .write_en(kv_key_write_en),
    .write_offset(kv_key_write_offset),
    .write_data(kv_key_write_data),

    .read_done(kv_key_done)
);

//Read Block
kv_read_client #(
  .DATA_WIDTH(1024),
  .PAD(1)
)
hmac_block_kv_read
(
    .clk(clk),
    .rst_b(reset_n),

    //client control register
    .read_ctrl_reg(kv_block_read_ctrl_reg),

    //interface with kv
    .kv_read(kv_read[1]),
    .kv_resp(kv_resp[1]),

    //interface with client
    .write_en(kv_block_write_en),
    .write_offset(kv_block_write_offset),
    .write_data(kv_block_write_data),

    .read_done(kv_block_done)
);

//Write to keyvault
kv_write_client #(
  .DATA_WIDTH(384)
)
hmac_result_kv_write
(
  .clk(clk),
  .rst_b(reset_n),

  //client control register
  .write_ctrl_reg(kv_write_ctrl_reg),

  //interface with kv
  .kv_write(kv_write),

  //interface with client
  .dest_keyvault(dest_keyvault),
  .dest_data_avail(core_tag_we),
  .dest_data(kv_reg),

  .dest_done(kv_write_done)
);

endmodule // hmac

//======================================================================
// EOF hmac.sv
//======================================================================
