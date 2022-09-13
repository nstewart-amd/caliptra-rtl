`ifndef KV_DEFINES
`define KV_DEFINES

`include "caliptra_macros.svh"
`include "caliptra_sva.svh"

parameter KV_NUM_DWORDS = 16; //number of dwords per key
parameter KV_NUM_KEYS = 8;
parameter KV_NUM_PCR = 8;
parameter KV_ADDR_W = 32;
parameter KV_DATA_W = 32;

typedef struct packed {
    logic   [KV_ADDR_W-1:0] addr;
    logic   [KV_DATA_W-1:0] wdata;
    logic                   write;
} kv_uc_req_t;

typedef struct packed {
    logic          key_is_pcr;
    logic   [2:0]  key_entry;
    logic   [3:0]  key_offset;
    logic          src_is_pcr;
    logic   [2:0]  src_entry;
    logic   [3:0]  src_offset;
} kv_read_t;

typedef struct packed {
    logic          dest_wr_vld;
    logic          dest_is_pcr;
    logic   [2:0]  dest_addr;
    logic   [3:0]  dest_offset;
    logic   [31:0] dest_data;
    logic   [2:0]  dest_valid;
} kv_write_t;

typedef struct packed {
    logic   [31:0] key_data;
    logic   [31:0] src_data;
} kv_resp_t;

typedef struct packed {
    logic dest_done;
    logic src_done;
    logic key_done;
    logic [1:0] rsvd1;
    logic [2:0] dest_valid;
    logic [2:0] rsvd_dest_sel;
    logic dest_sel_pcr;
    logic [2:0] dest_sel;
    logic dest_sel_en;
    logic [2:0] src_data_size;
    logic src_sel_pcr;
    logic [2:0] src_sel;
    logic src_sel_en;
    logic [2:0] rsvd_key_sel;
    logic key_sel_pcr;
    logic [2:0] key_sel;
    logic key_sel_en;
} kv_reg_t;

typedef enum logic [1:0] {
    DOE_NOP    = 2'b00,
    DOE_UDS    = 2'b01,
    DOE_FE     = 2'b10,
    DOE_RSVD   = 2'b11
} kv_doe_cmd_e;

typedef struct packed {
    logic flow_done;
    logic [2:0] dest_sel;
    kv_doe_cmd_e cmd;
} kv_doe_reg_t;

`endif