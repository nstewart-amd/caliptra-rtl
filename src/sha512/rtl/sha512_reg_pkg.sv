// Generated by PeakRDL-regblock - A free and open-source SystemVerilog generator
//  https://github.com/SystemRDL/PeakRDL-regblock

package sha512_reg_pkg;
    typedef struct packed{
        logic [31:0] next;
    } sha512_reg__SHA512_NAME__NAME__in_t;

    typedef struct packed{
        sha512_reg__SHA512_NAME__NAME__in_t NAME;
    } sha512_reg__SHA512_NAME__in_t;

    typedef struct packed{
        logic [31:0] next;
    } sha512_reg__SHA512_VERSION__VERSION__in_t;

    typedef struct packed{
        sha512_reg__SHA512_VERSION__VERSION__in_t VERSION;
    } sha512_reg__SHA512_VERSION__in_t;

    typedef struct packed{
        logic hwclr;
    } sha512_reg__SHA512_CTRL__LAST__in_t;

    typedef struct packed{
        sha512_reg__SHA512_CTRL__LAST__in_t LAST;
    } sha512_reg__SHA512_CTRL__in_t;

    typedef struct packed{
        logic next;
    } sha512_reg__SHA512_STATUS__READY__in_t;

    typedef struct packed{
        logic next;
    } sha512_reg__SHA512_STATUS__VALID__in_t;

    typedef struct packed{
        sha512_reg__SHA512_STATUS__READY__in_t READY;
        sha512_reg__SHA512_STATUS__VALID__in_t VALID;
    } sha512_reg__SHA512_STATUS__in_t;

    typedef struct packed{
        logic [31:0] next;
        logic we;
        logic swwel;
        logic hwclr;
    } sha512_reg__SHA512_BLOCK__BLOCK__in_t;

    typedef struct packed{
        sha512_reg__SHA512_BLOCK__BLOCK__in_t BLOCK;
    } sha512_reg__SHA512_BLOCK__in_t;

    typedef struct packed{
        logic [31:0] next;
        logic hwclr;
    } sha512_reg__SHA512_DIGEST__DIGEST__in_t;

    typedef struct packed{
        sha512_reg__SHA512_DIGEST__DIGEST__in_t DIGEST;
    } sha512_reg__SHA512_DIGEST__in_t;

    typedef struct packed{
        logic hwclr;
    } kv_read_ctrl_reg__read_en__in_t;

    typedef struct packed{
        kv_read_ctrl_reg__read_en__in_t read_en;
    } __kv_read_ctrl_reg__in_t;

    typedef struct packed{
        logic next;
    } kv_status_reg__READY__in_t;

    typedef struct packed{
        logic hwclr;
        logic hwset;
    } kv_status_reg__VALID__in_t;

    typedef struct packed{
        logic [7:0] next;
    } kv_status_reg__ERROR__in_t;

    typedef struct packed{
        kv_status_reg__READY__in_t READY;
        kv_status_reg__VALID__in_t VALID;
        kv_status_reg__ERROR__in_t ERROR;
    } __kv_status_reg__in_t;

    typedef struct packed{
        logic hwclr;
    } kv_write_ctrl_reg__write_en__in_t;

    typedef struct packed{
        kv_write_ctrl_reg__write_en__in_t write_en;
    } __kv_write_ctrl_reg__in_t;

    typedef struct packed{
        logic hwset;
    } sha512_reg__error_intr_t__error0_sts_enable_528ccada_next_b1018582_resetsignal_939e99d4__in_t;

    typedef struct packed{
        logic hwset;
    } sha512_reg__error_intr_t__error1_sts_enable_938cafef_next_f460eb81_resetsignal_939e99d4__in_t;

    typedef struct packed{
        logic hwset;
    } sha512_reg__error_intr_t__error2_sts_enable_0dacf7a6_next_4b5b9e74_resetsignal_939e99d4__in_t;

    typedef struct packed{
        logic hwset;
    } sha512_reg__error_intr_t__error3_sts_enable_fc3af94b_next_c3125d40_resetsignal_939e99d4__in_t;

    typedef struct packed{
        sha512_reg__error_intr_t__error0_sts_enable_528ccada_next_b1018582_resetsignal_939e99d4__in_t error0_sts;
        sha512_reg__error_intr_t__error1_sts_enable_938cafef_next_f460eb81_resetsignal_939e99d4__in_t error1_sts;
        sha512_reg__error_intr_t__error2_sts_enable_0dacf7a6_next_4b5b9e74_resetsignal_939e99d4__in_t error2_sts;
        sha512_reg__error_intr_t__error3_sts_enable_fc3af94b_next_c3125d40_resetsignal_939e99d4__in_t error3_sts;
    } sha512_reg__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378__in_t;

    typedef struct packed{
        logic hwset;
    } sha512_reg__notif_intr_t__notif_cmd_done_sts_enable_dabe0b8b_next_540fa3b7__in_t;

    typedef struct packed{
        sha512_reg__notif_intr_t__notif_cmd_done_sts_enable_dabe0b8b_next_540fa3b7__in_t notif_cmd_done_sts;
    } sha512_reg__notif_intr_t_notif_cmd_done_sts_1c68637e__in_t;

    typedef struct packed{
        sha512_reg__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378__in_t error_internal_intr_r;
        sha512_reg__notif_intr_t_notif_cmd_done_sts_1c68637e__in_t notif_internal_intr_r;
    } sha512_reg__intr_block_t__in_t;

    typedef struct packed{
        logic reset_b;
        logic error_reset_b;
        sha512_reg__SHA512_NAME__in_t [2-1:0]SHA512_NAME;
        sha512_reg__SHA512_VERSION__in_t [2-1:0]SHA512_VERSION;
        sha512_reg__SHA512_CTRL__in_t SHA512_CTRL;
        sha512_reg__SHA512_STATUS__in_t SHA512_STATUS;
        sha512_reg__SHA512_BLOCK__in_t [32-1:0]SHA512_BLOCK;
        sha512_reg__SHA512_DIGEST__in_t [16-1:0]SHA512_DIGEST;
        __kv_read_ctrl_reg__in_t SHA512_VAULT_RD_CTRL;
        __kv_status_reg__in_t SHA512_VAULT_RD_STATUS;
        __kv_write_ctrl_reg__in_t SHA512_KV_WR_CTRL;
        __kv_status_reg__in_t SHA512_KV_WR_STATUS;
        sha512_reg__intr_block_t__in_t intr_block_rf;
    } sha512_reg__in_t;

    typedef struct packed{
        logic value;
    } sha512_reg__SHA512_CTRL__INIT__out_t;

    typedef struct packed{
        logic value;
    } sha512_reg__SHA512_CTRL__NEXT__out_t;

    typedef struct packed{
        logic [1:0] value;
    } sha512_reg__SHA512_CTRL__MODE__out_t;

    typedef struct packed{
        logic value;
    } sha512_reg__SHA512_CTRL__ZEROIZE__out_t;

    typedef struct packed{
        logic value;
    } sha512_reg__SHA512_CTRL__LAST__out_t;

    typedef struct packed{
        sha512_reg__SHA512_CTRL__INIT__out_t INIT;
        sha512_reg__SHA512_CTRL__NEXT__out_t NEXT;
        sha512_reg__SHA512_CTRL__MODE__out_t MODE;
        sha512_reg__SHA512_CTRL__ZEROIZE__out_t ZEROIZE;
        sha512_reg__SHA512_CTRL__LAST__out_t LAST;
    } sha512_reg__SHA512_CTRL__out_t;

    typedef struct packed{
        logic value;
    } sha512_reg__SHA512_STATUS__READY__out_t;

    typedef struct packed{
        logic value;
    } sha512_reg__SHA512_STATUS__VALID__out_t;

    typedef struct packed{
        sha512_reg__SHA512_STATUS__READY__out_t READY;
        sha512_reg__SHA512_STATUS__VALID__out_t VALID;
    } sha512_reg__SHA512_STATUS__out_t;

    typedef struct packed{
        logic [31:0] value;
    } sha512_reg__SHA512_BLOCK__BLOCK__out_t;

    typedef struct packed{
        sha512_reg__SHA512_BLOCK__BLOCK__out_t BLOCK;
    } sha512_reg__SHA512_BLOCK__out_t;

    typedef struct packed{
        logic value;
    } kv_read_ctrl_reg__read_en__out_t;

    typedef struct packed{
        logic [4:0] value;
    } kv_read_ctrl_reg__read_entry__out_t;

    typedef struct packed{
        logic value;
    } kv_read_ctrl_reg__pcr_hash_extend__out_t;

    typedef struct packed{
        logic [24:0] value;
    } kv_read_ctrl_reg__rsvd__out_t;

    typedef struct packed{
        kv_read_ctrl_reg__read_en__out_t read_en;
        kv_read_ctrl_reg__read_entry__out_t read_entry;
        kv_read_ctrl_reg__pcr_hash_extend__out_t pcr_hash_extend;
        kv_read_ctrl_reg__rsvd__out_t rsvd;
    } __kv_read_ctrl_reg__out_t;

    typedef struct packed{
        logic value;
    } kv_write_ctrl_reg__write_en__out_t;

    typedef struct packed{
        logic [4:0] value;
    } kv_write_ctrl_reg__write_entry__out_t;

    typedef struct packed{
        logic value;
    } kv_write_ctrl_reg__hmac_key_dest_valid__out_t;

    typedef struct packed{
        logic value;
    } kv_write_ctrl_reg__hmac_block_dest_valid__out_t;

    typedef struct packed{
        logic value;
    } kv_write_ctrl_reg__sha_block_dest_valid__out_t;

    typedef struct packed{
        logic value;
    } kv_write_ctrl_reg__ecc_pkey_dest_valid__out_t;

    typedef struct packed{
        logic value;
    } kv_write_ctrl_reg__ecc_seed_dest_valid__out_t;

    typedef struct packed{
        logic value;
    } kv_write_ctrl_reg__ecc_msg_dest_valid__out_t;

    typedef struct packed{
        logic [19:0] value;
    } kv_write_ctrl_reg__rsvd__out_t;

    typedef struct packed{
        kv_write_ctrl_reg__write_en__out_t write_en;
        kv_write_ctrl_reg__write_entry__out_t write_entry;
        kv_write_ctrl_reg__hmac_key_dest_valid__out_t hmac_key_dest_valid;
        kv_write_ctrl_reg__hmac_block_dest_valid__out_t hmac_block_dest_valid;
        kv_write_ctrl_reg__sha_block_dest_valid__out_t sha_block_dest_valid;
        kv_write_ctrl_reg__ecc_pkey_dest_valid__out_t ecc_pkey_dest_valid;
        kv_write_ctrl_reg__ecc_seed_dest_valid__out_t ecc_seed_dest_valid;
        kv_write_ctrl_reg__ecc_msg_dest_valid__out_t ecc_msg_dest_valid;
        kv_write_ctrl_reg__rsvd__out_t rsvd;
    } __kv_write_ctrl_reg__out_t;

    typedef struct packed{
        logic value;
    } sha512_reg__SHA512_GEN_PCR_HASH__FLOW_EN__out_t;

    typedef struct packed{
        sha512_reg__SHA512_GEN_PCR_HASH__FLOW_EN__out_t FLOW_EN;
    } sha512_reg__SHA512_GEN_PCR_HASH__out_t;

    typedef struct packed{
        logic intr;
    } sha512_reg__global_intr_t_agg_sts_dd3dcf0a__out_t;

    typedef struct packed{
        logic intr;
    } sha512_reg__global_intr_t_agg_sts_e6399b4a__out_t;

    typedef struct packed{
        logic intr;
    } sha512_reg__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378__out_t;

    typedef struct packed{
        logic intr;
    } sha512_reg__notif_intr_t_notif_cmd_done_sts_1c68637e__out_t;

    typedef struct packed{
        sha512_reg__global_intr_t_agg_sts_dd3dcf0a__out_t error_global_intr_r;
        sha512_reg__global_intr_t_agg_sts_e6399b4a__out_t notif_global_intr_r;
        sha512_reg__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378__out_t error_internal_intr_r;
        sha512_reg__notif_intr_t_notif_cmd_done_sts_1c68637e__out_t notif_internal_intr_r;
    } sha512_reg__intr_block_t__out_t;

    typedef struct packed{
        sha512_reg__SHA512_CTRL__out_t SHA512_CTRL;
        sha512_reg__SHA512_STATUS__out_t SHA512_STATUS;
        sha512_reg__SHA512_BLOCK__out_t [32-1:0]SHA512_BLOCK;
        __kv_read_ctrl_reg__out_t SHA512_VAULT_RD_CTRL;
        __kv_write_ctrl_reg__out_t SHA512_KV_WR_CTRL;
        sha512_reg__SHA512_GEN_PCR_HASH__out_t SHA512_GEN_PCR_HASH;
        sha512_reg__intr_block_t__out_t intr_block_rf;
    } sha512_reg__out_t;

    localparam SHA512_REG_ADDR_WIDTH = 32'd12;

endpackage