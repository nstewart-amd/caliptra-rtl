//======================================================================
//
// Updated by Caliptra team to modify data access width
//
// sha256.v
// --------
// Top level wrapper for the SHA-256 hash function providing
// a simple memory like interface with 32 bit data access.
//
//
// Author: Joachim Strombergson
// Copyright (c) 2013, 201, Secworks Sweden AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

module sha256 
            import sha256_reg_pkg::*;
            import sha256_params_pkg::*;
            #(
              parameter ADDR_WIDTH = 32,
              parameter DATA_WIDTH = 32
            )(
              // Clock and reset.
              input wire           clk,
              input wire           reset_n,
              input wire           cptra_pwrgood,

              // Control.
              input wire           cs,
              input wire           we,

              // Data ports.
              input wire  [ADDR_WIDTH-1 : 0] address,
              input wire  [DATA_WIDTH-1 : 0] write_data,
              output wire [DATA_WIDTH-1 : 0] read_data,
              output wire          err,


              // Interrupts
              output wire error_intr,
              output wire notif_intr,
              input  logic debugUnlock_or_scan_mode_switch
             );

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  // `include "sha256_param.sv"

  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg init_reg;
  reg next_reg;
  reg mode_reg;
  reg ready_reg;
  reg zeroize_reg;

  localparam BLOCK_NO = 512 / DATA_WIDTH;
  reg [DATA_WIDTH-1 : 0] block_reg [BLOCK_NO-1 : 0];

  // reg [7 : 0][31 : 0] digest_reg;     ?????
  reg [0 : 7][31 : 0] digest_reg;
  reg                 digest_valid_reg;

  // Interrupts
  sha256_reg__in_t hwif_in;
  sha256_reg__out_t hwif_out;
  logic read_error, write_error;
  
  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  wire              core_ready;
  logic [511 : 0]    core_block;
//  wire [7:0][31:0]  core_digest;        ??????
  wire [0:7][31:0]  core_digest;
  wire              core_digest_valid;

  logic [3:0]       loop_j_reg;
  logic             wntz_busy;         // to regiser
  logic             wntz_mode;         // from registers
  logic             core_init, core_next, core_mode;
  logic             wntz_init, wntz_next;
  logic             wntz_1st_blk, wntz_blk_done;

  typedef enum logic [2:0] {WNTZ_IDLE, WNTZ_1ST, WNTZ_OTHERS} wntz_fsm_t;
  wntz_fsm_t        wntz_fsm;


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------

  always_comb begin
    if (wntz_mode) begin
      core_block = wntz_1st_blk ?
                   {block_reg[00], block_reg[01], block_reg[02], block_reg[03],
                    block_reg[04], block_reg[05], block_reg[06], block_reg[07],
                    block_reg[08], block_reg[09], block_reg[10], block_reg[11],
                    block_reg[12], block_reg[13], block_reg[14], block_reg[15]} : 

                   {block_reg[00], block_reg[01], block_reg[02], block_reg[03],     // I: 16byte
                    block_reg[04], {block_reg[05][31:16], 4'h0, loop_j_reg, digest_reg[0][31:24]}, 
                    {digest_reg[0][23:0], digest_reg[1][31:24]},
                    {digest_reg[1][23:0], digest_reg[2][31:24]},
                    {digest_reg[2][23:0], digest_reg[3][31:24]},
                    {digest_reg[3][23:0], digest_reg[4][31:24]},
                    {digest_reg[4][23:0], digest_reg[5][31:24]},
                    {digest_reg[5][23:0], digest_reg[6][31:24]},
                    {digest_reg[6][23:0], digest_reg[7][31:24]},
                    {digest_reg[7][23:0], 8'h80},                 // 448-bits or 56 bytes
                    {64'h01b8}};                                  // L = 440bits per SHA256 padding
                   

      core_init = wntz_init;
      core_next = wntz_next;
      core_mode = 1'b1;         // always SHA256 for Winternitz
    end else begin
      core_block = {block_reg[00], block_reg[01], block_reg[02], block_reg[03],
                    block_reg[04], block_reg[05], block_reg[06], block_reg[07],
                    block_reg[08], block_reg[09], block_reg[10], block_reg[11],
                    block_reg[12], block_reg[13], block_reg[14], block_reg[15]};
      core_init = init_reg;
      core_next = next_reg;
      core_mode = mode_reg;
    end
  end   // always_comb

  assign err = read_error | write_error;

  //----------------------------------------------------------------
  // core instantiation.
  //----------------------------------------------------------------
  sha256_core core(
                   .clk(clk),
                   .reset_n(reset_n),
                   .zeroize(zeroize_reg),

                   .init_cmd(core_init),
                   .next_cmd(core_next),
                   .mode(core_mode),

                   .block_msg(core_block),

                   .ready(core_ready),

                   .digest(core_digest),    
                   .digest_valid(core_digest_valid)
                  );
  //  .digest(core_digest),        
  //     problem is that digest is a 511:0 vector, but core_digest is a packed array. 
  //     if core_digest is defined as [7:0][31:0], we will have core_digest[7] as MSB. 

  //----------------------------------------------------------------
  assign wntz_busy     = (wntz_fsm != WNTZ_IDLE);
  assign wntz_1st_blk  = (wntz_fsm == WNTZ_1ST);
  assign wntz_blk_done = core_digest_valid & ~digest_valid_reg;
  assign wntz_next     = 1'b0;

  always @ (posedge clk or negedge reset_n)
    begin
      if (!reset_n) begin
        loop_j_reg <= 0;
        wntz_fsm   <= WNTZ_IDLE;
        wntz_init  <= 1'b0;
      end else begin
        case (wntz_fsm)
          WNTZ_IDLE: 
            begin 
              if (wntz_mode && init_reg && (block_reg[5][11:8] <= 14)) begin
                wntz_fsm   <= WNTZ_1ST;
                loop_j_reg <= block_reg[5][11:8];
                wntz_init  <= 1'b1;
              end else begin
                wntz_init  <= 1'b0;
              end
            end 
          WNTZ_1ST:  
            begin
              if (wntz_blk_done && (loop_j_reg < 14)) begin
                wntz_fsm   <= WNTZ_OTHERS;
                loop_j_reg <= loop_j_reg + 1;
                wntz_init  <= 1'b1;
              end else if (wntz_blk_done) begin
                wntz_fsm   <= WNTZ_IDLE;
                loop_j_reg <= 0;
                wntz_init  <= 1'b0;
              end else begin 
                wntz_init  <= 1'b0;
              end
            end
          WNTZ_OTHERS: 
            begin 
              if (wntz_blk_done && (loop_j_reg < 14)) begin
                loop_j_reg <= loop_j_reg + 1;
                wntz_init  <= 1'b1;
              end else if (wntz_blk_done) begin
                wntz_fsm   <= WNTZ_IDLE;
                loop_j_reg <= 0;
                wntz_init  <= 1'b0;
              end else begin
                wntz_init  <= 1'b0;
              end 
            end
          default: 
            wntz_fsm <= WNTZ_IDLE;
        endcase
        
      end
    end

  //----------------------------------------------------------------
  // reg_update
  //
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset. All registers have write enable.
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin : reg_update
      if (!reset_n) begin
        ready_reg        <= '0;
        digest_reg       <= '0;
        digest_valid_reg <= '0;
      end
      else if (zeroize_reg) begin
        ready_reg        <= '0;
        digest_reg       <= '0;
        digest_valid_reg <= '0;
      end
      else begin
        ready_reg        <= core_ready;
        digest_valid_reg <= core_digest_valid;

        if (core_digest_valid & ~digest_valid_reg)
          digest_reg <= core_digest;
      end
    end // reg_update


  //register hw interface
  always_comb begin

    hwif_in.SHA256_NAME[0].NAME.next = SHA256_CORE_NAME0;
    hwif_in.SHA256_NAME[1].NAME.next = SHA256_CORE_NAME1;

    hwif_in.SHA256_VERSION[0].VERSION.next = SHA256_CORE_VERSION0;
    hwif_in.SHA256_VERSION[1].VERSION.next = SHA256_CORE_VERSION1;

    init_reg = hwif_out.SHA256_CTRL.INIT.value;
    next_reg = hwif_out.SHA256_CTRL.NEXT.value;
    mode_reg = hwif_out.SHA256_CTRL.MODE.value;
    zeroize_reg = hwif_out.SHA256_CTRL.ZEROIZE.value || debugUnlock_or_scan_mode_switch;
    wntz_mode = hwif_out.SHA256_CTRL.WNTZ_MODE.value;

    hwif_in.SHA256_STATUS.READY.next = ready_reg;
    hwif_in.SHA256_STATUS.VALID.next = digest_valid_reg;
    hwif_in.SHA256_STATUS.WNTZ_BUSY.next = wntz_busy;

    for (int dword =0; dword < 8; dword++) begin
//      hwif_in.SHA256_DIGEST[dword].DIGEST.next = digest_reg[7-dword];
      hwif_in.SHA256_DIGEST[dword].DIGEST.next = digest_reg[dword];
      hwif_in.SHA256_DIGEST[dword].DIGEST.hwclr = zeroize_reg;
    end

    for (int dword=0; dword< BLOCK_NO; dword++) begin
      block_reg[dword] = hwif_out.SHA256_BLOCK[dword].BLOCK.value;
      hwif_in.SHA256_BLOCK[dword].BLOCK.hwclr = zeroize_reg;
    end

  end

  // Register Block
  sha256_reg i_sha256_reg (
      .clk(clk),
      .rst(1'b0),

      .s_cpuif_req         (cs),
      .s_cpuif_req_is_wr   (we),
      .s_cpuif_addr        (address[SHA256_REG_ADDR_WIDTH-1:0]),
      .s_cpuif_wr_data     (write_data),
      .s_cpuif_wr_biten    ('1),
      .s_cpuif_req_stall_wr( ),
      .s_cpuif_req_stall_rd( ),
      .s_cpuif_rd_ack      ( ),
      .s_cpuif_rd_err      (read_error),
      .s_cpuif_rd_data     (read_data),
      .s_cpuif_wr_ack      ( ),
      .s_cpuif_wr_err      (write_error),

      .hwif_in (hwif_in ),
      .hwif_out(hwif_out)
  );

    //interrupt register hw interface
    assign hwif_in.reset_b = reset_n;
    assign hwif_in.error_reset_b = cptra_pwrgood;
    assign hwif_in.intr_block_rf.notif_internal_intr_r.notif_cmd_done_sts.hwset = core_digest_valid & ~digest_valid_reg;
    assign hwif_in.intr_block_rf.error_internal_intr_r.error0_sts.hwset = 1'b0; // TODO
    assign hwif_in.intr_block_rf.error_internal_intr_r.error1_sts.hwset = 1'b0; // TODO
    assign hwif_in.intr_block_rf.error_internal_intr_r.error2_sts.hwset = 1'b0; // TODO
    assign hwif_in.intr_block_rf.error_internal_intr_r.error3_sts.hwset = 1'b0; // TODO

    assign error_intr = hwif_out.intr_block_rf.error_global_intr_r.intr;
    assign notif_intr = hwif_out.intr_block_rf.notif_global_intr_r.intr;    
endmodule // sha256

//======================================================================
// EOF sha256.v
//======================================================================
