// Generated by PeakRDL-regblock - A free and open-source SystemVerilog generator
//  https://github.com/SystemRDL/PeakRDL-regblock

package soc_ifc_reg_pkg;
    typedef struct {
        logic [31:0] next;
    } soc_ifc_reg__generic_input_wires__generic_wires__in_t;

    typedef struct {
        soc_ifc_reg__generic_input_wires__generic_wires__in_t generic_wires;
    } soc_ifc_reg__generic_input_wires__in_t;

    typedef struct {
        logic hwclr;
    } soc_ifc_reg__secret_w32__in_t;

    typedef struct {
        soc_ifc_reg__secret_w32__in_t seed;
    } soc_ifc_reg__uds_seed__in_t;

    typedef struct {
        soc_ifc_reg__secret_w32__in_t seed;
    } soc_ifc_reg__field_entropy__in_t;

    typedef struct {
        logic [31:0] next;
        logic wel;
        logic swwe;
        logic hwclr;
    } soc_ifc_reg__key_w32__in_t;

    typedef struct {
        soc_ifc_reg__key_w32__in_t key;
    } soc_ifc_reg__obf_key__in_t;

    typedef struct {
        logic hwclr;
    } soc_ifc_reg__iccm_lock__lock__in_t;

    typedef struct {
        soc_ifc_reg__iccm_lock__lock__in_t lock;
    } soc_ifc_reg__iccm_lock__in_t;

    typedef struct {
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_internal_sts_enable_d33001bb_next_52b75ffa_resetsignal_0d7eaa27__in_t;

    typedef struct {
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_inv_dev_sts_enable_e83f2724_next_8318aff8_resetsignal_0d7eaa27__in_t;

    typedef struct {
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_cmd_fail_sts_enable_d535c05b_next_eee7e362_resetsignal_0d7eaa27__in_t;

    typedef struct {
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_bad_fuse_sts_enable_fceb289f_next_14761353_resetsignal_0d7eaa27__in_t;

    typedef struct {
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_iccm_blocked_sts_enable_4ccfea15_next_86c0a4d2_resetsignal_0d7eaa27__in_t;

    typedef struct {
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_mbox_ecc_unc_sts_enable_18d80a94_next_91af8aa5_resetsignal_0d7eaa27__in_t;

    typedef struct {
        soc_ifc_reg__intr_block_t__error_intr_t__error_internal_sts_enable_d33001bb_next_52b75ffa_resetsignal_0d7eaa27__in_t error_internal_sts;
        soc_ifc_reg__intr_block_t__error_intr_t__error_inv_dev_sts_enable_e83f2724_next_8318aff8_resetsignal_0d7eaa27__in_t error_inv_dev_sts;
        soc_ifc_reg__intr_block_t__error_intr_t__error_cmd_fail_sts_enable_d535c05b_next_eee7e362_resetsignal_0d7eaa27__in_t error_cmd_fail_sts;
        soc_ifc_reg__intr_block_t__error_intr_t__error_bad_fuse_sts_enable_fceb289f_next_14761353_resetsignal_0d7eaa27__in_t error_bad_fuse_sts;
        soc_ifc_reg__intr_block_t__error_intr_t__error_iccm_blocked_sts_enable_4ccfea15_next_86c0a4d2_resetsignal_0d7eaa27__in_t error_iccm_blocked_sts;
        soc_ifc_reg__intr_block_t__error_intr_t__error_mbox_ecc_unc_sts_enable_18d80a94_next_91af8aa5_resetsignal_0d7eaa27__in_t error_mbox_ecc_unc_sts;
    } soc_ifc_reg__intr_block_t__error_intr_t_error_bad_fuse_sts_15c6bdf2_error_cmd_fail_sts_a5f1c4c0_error_iccm_blocked_sts_9be0379b_error_internal_sts_83adab02_error_inv_dev_sts_534a6ab7_error_mbox_ecc_unc_sts_243a4927__in_t;

    typedef struct {
        logic hwset;
    } soc_ifc_reg__intr_block_t__notif_intr_t__notif_cmd_avail_sts_enable_f40f37a0_next_6afe0a88__in_t;

    typedef struct {
        logic hwset;
    } soc_ifc_reg__intr_block_t__notif_intr_t__notif_mbox_ecc_cor_sts_enable_c4f9db68_next_96c01bef__in_t;

    typedef struct {
        soc_ifc_reg__intr_block_t__notif_intr_t__notif_cmd_avail_sts_enable_f40f37a0_next_6afe0a88__in_t notif_cmd_avail_sts;
        soc_ifc_reg__intr_block_t__notif_intr_t__notif_mbox_ecc_cor_sts_enable_c4f9db68_next_96c01bef__in_t notif_mbox_ecc_cor_sts;
    } soc_ifc_reg__intr_block_t__notif_intr_t_notif_cmd_avail_sts_1871606b_notif_mbox_ecc_cor_sts_5c3d26bb__in_t;

    typedef struct {
        soc_ifc_reg__intr_block_t__error_intr_t_error_bad_fuse_sts_15c6bdf2_error_cmd_fail_sts_a5f1c4c0_error_iccm_blocked_sts_9be0379b_error_internal_sts_83adab02_error_inv_dev_sts_534a6ab7_error_mbox_ecc_unc_sts_243a4927__in_t error_internal_intr_r;
        soc_ifc_reg__intr_block_t__notif_intr_t_notif_cmd_avail_sts_1871606b_notif_mbox_ecc_cor_sts_5c3d26bb__in_t notif_internal_intr_r;
    } soc_ifc_reg__intr_block_t__in_t;

    typedef struct {
        logic reset_b;
        logic hard_reset_b;
        logic soc_req;
        soc_ifc_reg__generic_input_wires__in_t generic_input_wires[2];
        soc_ifc_reg__uds_seed__in_t uds_seed[12];
        soc_ifc_reg__field_entropy__in_t field_entropy[32];
        soc_ifc_reg__obf_key__in_t obf_key[8];
        soc_ifc_reg__iccm_lock__in_t iccm_lock;
        soc_ifc_reg__intr_block_t__in_t intr_block_rf;
    } soc_ifc_reg__in_t;

    typedef struct {
        logic value;
    } soc_ifc_reg__FLOW_STATUS__ready_for_fw__out_t;

    typedef struct {
        logic value;
    } soc_ifc_reg__FLOW_STATUS__ready_for_runtime__out_t;

    typedef struct {
        soc_ifc_reg__FLOW_STATUS__ready_for_fw__out_t ready_for_fw;
        soc_ifc_reg__FLOW_STATUS__ready_for_runtime__out_t ready_for_runtime;
    } soc_ifc_reg__FLOW_STATUS__out_t;

    typedef struct {
        logic value;
    } soc_ifc_reg__CLEAR_SECRETS__clear_secrets__out_t;

    typedef struct {
        soc_ifc_reg__CLEAR_SECRETS__clear_secrets__out_t clear_secrets;
    } soc_ifc_reg__CLEAR_SECRETS__out_t;

    typedef struct {
        logic [31:0] value;
    } soc_ifc_reg__generic_output_wires__generic_wires__out_t;

    typedef struct {
        soc_ifc_reg__generic_output_wires__generic_wires__out_t generic_wires;
    } soc_ifc_reg__generic_output_wires__out_t;

    typedef struct {
        logic [31:0] value;
    } soc_ifc_reg__secret_w32__out_t;

    typedef struct {
        soc_ifc_reg__secret_w32__out_t seed;
    } soc_ifc_reg__uds_seed__out_t;

    typedef struct {
        soc_ifc_reg__secret_w32__out_t seed;
    } soc_ifc_reg__field_entropy__out_t;

    typedef struct {
        logic value;
    } soc_ifc_reg__fuse_done__done__out_t;

    typedef struct {
        soc_ifc_reg__fuse_done__done__out_t done;
    } soc_ifc_reg__fuse_done__out_t;

    typedef struct {
        logic [31:0] value;
    } soc_ifc_reg__key_w32__out_t;

    typedef struct {
        soc_ifc_reg__key_w32__out_t key;
    } soc_ifc_reg__obf_key__out_t;

    typedef struct {
        logic value;
    } soc_ifc_reg__iccm_lock__lock__out_t;

    typedef struct {
        soc_ifc_reg__iccm_lock__lock__out_t lock;
    } soc_ifc_reg__iccm_lock__out_t;

    typedef struct {
        logic value;
    } soc_ifc_reg__fw_update_reset__core_rst__out_t;

    typedef struct {
        soc_ifc_reg__fw_update_reset__core_rst__out_t core_rst;
    } soc_ifc_reg__fw_update_reset__out_t;

    typedef struct {
        logic [7:0] value;
    } soc_ifc_reg__fw_update_reset_wait_cycles__wait_cycles__out_t;

    typedef struct {
        soc_ifc_reg__fw_update_reset_wait_cycles__wait_cycles__out_t wait_cycles;
    } soc_ifc_reg__fw_update_reset_wait_cycles__out_t;

    typedef struct {
        logic intr;
    } soc_ifc_reg__intr_block_t__global_intr_t_agg_sts_dd3dcf0a__out_t;

    typedef struct {
        logic intr;
    } soc_ifc_reg__intr_block_t__global_intr_t_agg_sts_e6399b4a__out_t;

    typedef struct {
        logic intr;
    } soc_ifc_reg__intr_block_t__error_intr_t_error_bad_fuse_sts_15c6bdf2_error_cmd_fail_sts_a5f1c4c0_error_iccm_blocked_sts_9be0379b_error_internal_sts_83adab02_error_inv_dev_sts_534a6ab7_error_mbox_ecc_unc_sts_243a4927__out_t;

    typedef struct {
        logic intr;
    } soc_ifc_reg__intr_block_t__notif_intr_t_notif_cmd_avail_sts_1871606b_notif_mbox_ecc_cor_sts_5c3d26bb__out_t;

    typedef struct {
        soc_ifc_reg__intr_block_t__global_intr_t_agg_sts_dd3dcf0a__out_t error_global_intr_r;
        soc_ifc_reg__intr_block_t__global_intr_t_agg_sts_e6399b4a__out_t notif_global_intr_r;
        soc_ifc_reg__intr_block_t__error_intr_t_error_bad_fuse_sts_15c6bdf2_error_cmd_fail_sts_a5f1c4c0_error_iccm_blocked_sts_9be0379b_error_internal_sts_83adab02_error_inv_dev_sts_534a6ab7_error_mbox_ecc_unc_sts_243a4927__out_t error_internal_intr_r;
        soc_ifc_reg__intr_block_t__notif_intr_t_notif_cmd_avail_sts_1871606b_notif_mbox_ecc_cor_sts_5c3d26bb__out_t notif_internal_intr_r;
    } soc_ifc_reg__intr_block_t__out_t;

    typedef struct {
        soc_ifc_reg__FLOW_STATUS__out_t FLOW_STATUS;
        soc_ifc_reg__CLEAR_SECRETS__out_t CLEAR_SECRETS;
        soc_ifc_reg__generic_output_wires__out_t generic_output_wires[2];
        soc_ifc_reg__uds_seed__out_t uds_seed[12];
        soc_ifc_reg__field_entropy__out_t field_entropy[32];
        soc_ifc_reg__fuse_done__out_t fuse_done;
        soc_ifc_reg__obf_key__out_t obf_key[8];
        soc_ifc_reg__iccm_lock__out_t iccm_lock;
        soc_ifc_reg__fw_update_reset__out_t fw_update_reset;
        soc_ifc_reg__fw_update_reset_wait_cycles__out_t fw_update_reset_wait_cycles;
        soc_ifc_reg__intr_block_t__out_t intr_block_rf;
    } soc_ifc_reg__out_t;

    localparam SOC_IFC_REG_ADDR_WIDTH = 32'd12;

endpackage