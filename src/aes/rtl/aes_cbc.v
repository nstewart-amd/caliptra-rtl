//==============================================================================
//
// aes_cbc.v
// --------
// The module supports AES_CBC and it is the modified version of aes.v file. 
// In the hierarcy, one level up module is the aes_ctrl_32.sv or aes_ctrl_64.sv  
// This module receives the data from AHB just before decoding it into block, 
// key, and IV.
//
// The "IV XOR Plaintext" operation is just added into the AES first Key XOR path.
// The combinational logical path is ((IV XOR Plaintext) XOR Key). The lower
// hierarcy, aes core, has not been changed. Instead, aes_core_cbc was created.
// The created design differs from the original one only with an XOR operation. 
//
// AES CBC mode is tested with aes_cbc_tb.sv
// 
// 
// Author: Emre Karabulut
//==============================================================================

`default_nettype none

module aes_cbc #(
            parameter ADDR_WIDTH = 32,
            parameter DATA_WIDTH = 32
            )(
           // Clock and reset.
           input wire           clk,
           input wire           reset_n,

           // Control.
           input wire           cs,
           input wire           we,

           // Data ports.
           input wire  [ADDR_WIDTH-1 : 0] address,
           input wire  [DATA_WIDTH-1 : 0] write_data,
           output wire [DATA_WIDTH-1 : 0] read_data
          );

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  `include "aes_param.sv"

  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg init_reg;
  reg init_new;

  reg next_reg;
  reg next_new;

  reg encdec_reg;
  reg keylen_reg;
  reg config_we;

  localparam BLOCK_NO = 128 / DATA_WIDTH;
  localparam KEY_NO   = 256 / DATA_WIDTH;
  localparam IV_NO    = 128 / DATA_WIDTH;

  reg [DATA_WIDTH - 1 : 0] block_reg [0 : BLOCK_NO - 1];
  reg          block_we;

  reg [DATA_WIDTH - 1 : 0] key_reg [0 : KEY_NO - 1];
  reg          key_we;

  reg [DATA_WIDTH - 1 : 0] IV_reg [0 : BLOCK_NO - 1];
  reg          IV_we;

  reg [127 : 0] result_reg;
  reg           valid_reg;
  reg           ready_reg;


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg [DATA_WIDTH - 1  : 0]   tmp_read_data;

  wire           core_encdec;
  wire           core_init;
  wire           core_next;
  wire           core_ready;
  wire [255 : 0] core_key;
  wire           core_keylen;
  wire [127 : 0] core_block;
  wire [127 : 0] core_IV;
  wire [127 : 0] core_result;
  wire           core_valid;


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign read_data = tmp_read_data;

  `ifdef AES_DATA_BUS_64
    assign core_key     = {key_reg[0], key_reg[1], key_reg[2], key_reg[3]};
    assign core_block   = {block_reg[0], block_reg[1]};
    assign core_IV      = {IV_reg[0], IV_reg[1]};
  `else
    assign core_key     = {key_reg[0], key_reg[1], key_reg[2], key_reg[3], key_reg[4], key_reg[5], key_reg[6], key_reg[7]};
    assign core_block   = {block_reg[0], block_reg[1], block_reg[2], block_reg[3]};
    assign core_IV      = {IV_reg[0], IV_reg[1], IV_reg[2], IV_reg[3]};
  `endif

  assign core_init   = init_reg;
  assign core_next   = next_reg;
  assign core_encdec = encdec_reg;
  assign core_keylen = keylen_reg;


  //----------------------------------------------------------------
  // core instantiation.
  //----------------------------------------------------------------
  aes_core_cbc core(
                .clk(clk),
                .reset_n(reset_n),

                .encdec(core_encdec),
                .init(core_init),
                .next(core_next),
                .ready(core_ready),

                .key(core_key),
                .keylen(core_keylen),

                .IV(core_IV),
                .IV_updated(IV_we),

                .block(core_block),
                .result(core_result),
                .result_valid(core_valid)
               );


  //----------------------------------------------------------------
  // reg_update
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset.
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin : reg_update
      integer i;

      if (!reset_n)
        begin
          for (i = 0 ; i < BLOCK_NO ; i = i + 1)
            block_reg[i] <= 0;

          for (i = 0 ; i < IV_NO ; i = i + 1)
            IV_reg[i] <= 0;

          for (i = 0 ; i < KEY_NO ; i = i + 1)
            key_reg[i] <= 0;

          init_reg   <= 1'b0;
          next_reg   <= 1'b0;
          encdec_reg <= 1'b0;
          keylen_reg <= 1'b0;

          result_reg <= 128'h0;
          valid_reg  <= 1'b0;
          ready_reg  <= 1'b0;
        end
      else
        begin
          ready_reg  <= core_ready;
          valid_reg  <= core_valid;
          result_reg <= core_result;
          init_reg   <= init_new;
          next_reg   <= next_new;

          if (config_we)
            begin
              encdec_reg <= write_data[AES_CTRL_ENCDEC_BIT];
              keylen_reg <= write_data[AES_CTRL_KEYLEN_BIT];
            end

          if (key_we)
            `ifdef AES_DATA_BUS_64
              key_reg[address[4 : 3]] <= write_data;
            `else
              key_reg[address[4 : 2]] <= write_data;
            `endif

          if (block_we)
            
            `ifdef AES_DATA_BUS_64
              block_reg[address[3]] <= write_data;
            `else
              block_reg[address[3 : 2]] <= write_data;
            `endif

          if (IV_we)
            
            `ifdef AES_DATA_BUS_64
              IV_reg[address[3]] <= write_data;
            `else
              IV_reg[address[3 : 2]] <= write_data;
            `endif

        end
    end // reg_update


  //----------------------------------------------------------------
  // api
  //
  // The interface command decoding logic.
  //----------------------------------------------------------------
  always @*
    begin : api
      init_new      = 1'b0;
      next_new      = 1'b0;
      config_we     = 1'b0;
      key_we        = 1'b0;
      block_we      = 1'b0;
      IV_we         = 1'b0;
      tmp_read_data = 0;

      if (cs)
        begin
          if (we)
            begin
              if (address == AES_ADDR_CTRL)
                begin
                  init_new = write_data[AES_CTRL_INIT_BIT];
                  next_new = write_data[AES_CTRL_NEXT_BIT];
                end

              if (address == AES_ADDR_CONFIG)
                config_we = 1'b1;

              if ((address >= AES_ADDR_KEY_START) && (address <= AES_ADDR_KEY_END))
                key_we = 1'b1;

              if ((address >= AES_ADDR_BLOCK_START) && (address <= AES_ADDR_BLOCK_END))
                block_we = 1'b1;

              if ((address >= AES_ADDR_IV_START) && (address <= AES_ADDR_IV_END))
                IV_we = 1'b1;
            end // if (we)

          else
            begin
              case (address)
                `ifdef AES_DATA_BUS_64
                  AES_ADDR_NAME0:    tmp_read_data = AES_CORE_NAME;
                  AES_ADDR_VERSION0: tmp_read_data = AES_CORE_VERSION;
                  AES_ADDR_CTRL:     tmp_read_data = {60'h0, keylen_reg, encdec_reg, next_reg, init_reg};
                  AES_ADDR_STATUS:   tmp_read_data = {62'h0, valid_reg, ready_reg};
                `else
                  AES_ADDR_NAME0:    tmp_read_data = AES_CORE_NAME[31 : 0];
                  AES_ADDR_NAME1:    tmp_read_data = AES_CORE_NAME[63 : 32];
                  AES_ADDR_VERSION0: tmp_read_data = AES_CORE_VERSION[31 : 0];
                  AES_ADDR_VERSION1: tmp_read_data = AES_CORE_VERSION[63 : 32];
                  AES_ADDR_CTRL:     tmp_read_data = {28'h0, keylen_reg, encdec_reg, next_reg, init_reg};
                  AES_ADDR_STATUS:   tmp_read_data = {30'h0, valid_reg, ready_reg};
                `endif

                default:
                  begin
                  end
              endcase // case (address)

              if ((address >= AES_ADDR_RESULT_START) && (address <= AES_ADDR_RESULT_END))
                `ifdef AES_DATA_BUS_64
                  tmp_read_data = result_reg[(1 - ((address - AES_ADDR_RESULT_START) >> 3)) * 64 +: 64];
                `else
                  tmp_read_data = result_reg[(3 - ((address - AES_ADDR_RESULT_START) >> 2)) * 32 +: 32];
                `endif
                
            end
        end
    end // addr_decoder
endmodule // aes

//======================================================================
// EOF aes.v
//======================================================================