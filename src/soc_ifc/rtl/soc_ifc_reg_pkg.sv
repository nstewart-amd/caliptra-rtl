// Generated by PeakRDL-regblock - A free and open-source SystemVerilog generator
//  https://github.com/SystemRDL/PeakRDL-regblock

package soc_ifc_reg_pkg;
    typedef struct packed{
        logic next;
    } soc_ifc_reg__CPTRA_FLOW_STATUS__ready_for_fuses__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_FLOW_STATUS__ready_for_fuses__in_t ready_for_fuses;
    } soc_ifc_reg__CPTRA_FLOW_STATUS__in_t;

    typedef struct packed{
        logic next;
        logic we;
    } soc_ifc_reg__CPTRA_RESET_REASON__FW_UPD_RESET__in_t;

    typedef struct packed{
        logic next;
    } soc_ifc_reg__CPTRA_RESET_REASON__WARM_RESET__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_RESET_REASON__FW_UPD_RESET__in_t FW_UPD_RESET;
        soc_ifc_reg__CPTRA_RESET_REASON__WARM_RESET__in_t WARM_RESET;
    } soc_ifc_reg__CPTRA_RESET_REASON__in_t;

    typedef struct packed{
        logic [1:0] next;
    } soc_ifc_reg__CPTRA_SECURITY_STATE__device_lifecycle__in_t;

    typedef struct packed{
        logic next;
    } soc_ifc_reg__CPTRA_SECURITY_STATE__debug_locked__in_t;

    typedef struct packed{
        logic next;
    } soc_ifc_reg__CPTRA_SECURITY_STATE__scan_mode__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_SECURITY_STATE__device_lifecycle__in_t device_lifecycle;
        soc_ifc_reg__CPTRA_SECURITY_STATE__debug_locked__in_t debug_locked;
        soc_ifc_reg__CPTRA_SECURITY_STATE__scan_mode__in_t scan_mode;
    } soc_ifc_reg__CPTRA_SECURITY_STATE__in_t;

    typedef struct packed{
        logic swwel;
    } soc_ifc_reg__CPTRA_VALID_PAUSER__PAUSER__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_VALID_PAUSER__PAUSER__in_t PAUSER;
    } soc_ifc_reg__CPTRA_VALID_PAUSER__in_t;

    typedef struct packed{
        logic swwel;
    } soc_ifc_reg__CPTRA_PAUSER_LOCK__LOCK__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_PAUSER_LOCK__LOCK__in_t LOCK;
    } soc_ifc_reg__CPTRA_PAUSER_LOCK__in_t;

    typedef struct packed{
        logic swwel;
    } soc_ifc_reg__CPTRA_TRNG_VALID_PAUSER__PAUSER__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_TRNG_VALID_PAUSER__PAUSER__in_t PAUSER;
    } soc_ifc_reg__CPTRA_TRNG_VALID_PAUSER__in_t;

    typedef struct packed{
        logic swwel;
    } soc_ifc_reg__CPTRA_TRNG_PAUSER_LOCK__LOCK__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_TRNG_PAUSER_LOCK__LOCK__in_t LOCK;
    } soc_ifc_reg__CPTRA_TRNG_PAUSER_LOCK__in_t;

    typedef struct packed{
        logic swwe;
    } soc_ifc_reg__CPTRA_TRNG_DATA__DATA__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_TRNG_DATA__DATA__in_t DATA;
    } soc_ifc_reg__CPTRA_TRNG_DATA__in_t;

    typedef struct packed{
        logic swwe;
    } soc_ifc_reg__CPTRA_TRNG_STATUS__DATA_WR_DONE__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_TRNG_STATUS__DATA_WR_DONE__in_t DATA_WR_DONE;
    } soc_ifc_reg__CPTRA_TRNG_STATUS__in_t;

    typedef struct packed{
        logic swwe;
    } soc_ifc_reg__CPTRA_FUSE_WR_DONE__done__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_FUSE_WR_DONE__done__in_t done;
    } soc_ifc_reg__CPTRA_FUSE_WR_DONE__in_t;

    typedef struct packed{
        logic next;
        logic we;
    } soc_ifc_reg__CPTRA_BOOTFSM_GO__GO__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_BOOTFSM_GO__GO__in_t GO;
    } soc_ifc_reg__CPTRA_BOOTFSM_GO__in_t;

    typedef struct packed{
        logic [31:0] next;
        logic we;
    } soc_ifc_reg__CPTRA_DBG_MANUF_SERVICE_REG__DATA__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_DBG_MANUF_SERVICE_REG__DATA__in_t DATA;
    } soc_ifc_reg__CPTRA_DBG_MANUF_SERVICE_REG__in_t;

    typedef struct packed{
        logic [31:0] next;
    } soc_ifc_reg__CPTRA_GENERIC_INPUT_WIRES__generic_wires__in_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_GENERIC_INPUT_WIRES__generic_wires__in_t generic_wires;
    } soc_ifc_reg__CPTRA_GENERIC_INPUT_WIRES__in_t;

    typedef struct packed{
        logic swwel;
        logic hwclr;
    } soc_ifc_reg__secret_w32__in_t;

    typedef struct packed{
        soc_ifc_reg__secret_w32__in_t seed;
    } soc_ifc_reg__fuse_uds_seed__in_t;

    typedef struct packed{
        soc_ifc_reg__secret_w32__in_t seed;
    } soc_ifc_reg__fuse_field_entropy__in_t;

    typedef struct packed{
        logic swwel;
    } soc_ifc_reg__Fuse_w32__in_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__in_t hash;
    } soc_ifc_reg__fuse_key_manifest_pk_hash__in_t;

    typedef struct packed{
        logic swwel;
    } soc_ifc_reg__Fuse_w4__in_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w4__in_t mask;
    } soc_ifc_reg__fuse_key_manifest_pk_hash_mask__in_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__in_t hash;
    } soc_ifc_reg__fuse_owner_pk_hash__in_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__in_t svn;
    } soc_ifc_reg__fuse_fmc_key_manifest_svn__in_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__in_t svn;
    } soc_ifc_reg__fuse_runtime_svn__in_t;

    typedef struct packed{
        logic swwel;
    } soc_ifc_reg__Fuse__in_t;

    typedef struct packed{
        soc_ifc_reg__Fuse__in_t dis;
    } soc_ifc_reg__fuse_anti_rollback_disable__in_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__in_t cert;
    } soc_ifc_reg__fuse_idevid_cert_attr__in_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__in_t hsm_id;
    } soc_ifc_reg__fuse_idevid_manuf_hsm_id__in_t;

    typedef struct packed{
        logic swwel;
    } soc_ifc_reg__Fuse_w2__in_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w2__in_t life_cycle;
    } soc_ifc_reg__fuse_life_cycle__in_t;

    typedef struct packed{
        logic [31:0] next;
        logic wel;
        logic swwe;
        logic hwclr;
    } soc_ifc_reg__key_w32__in_t;

    typedef struct packed{
        soc_ifc_reg__key_w32__in_t key;
    } soc_ifc_reg__internal_obf_key__in_t;

    typedef struct packed{
        logic hwclr;
    } soc_ifc_reg__internal_iccm_lock__lock__in_t;

    typedef struct packed{
        soc_ifc_reg__internal_iccm_lock__lock__in_t lock;
    } soc_ifc_reg__internal_iccm_lock__in_t;

    typedef struct packed{
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_internal_sts_enable_d33001bb_next_52b75ffa_resetsignal_f7aac87a__in_t;

    typedef struct packed{
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_inv_dev_sts_enable_e83f2724_next_8318aff8_resetsignal_f7aac87a__in_t;

    typedef struct packed{
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_cmd_fail_sts_enable_d535c05b_next_eee7e362_resetsignal_f7aac87a__in_t;

    typedef struct packed{
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_bad_fuse_sts_enable_fceb289f_next_14761353_resetsignal_f7aac87a__in_t;

    typedef struct packed{
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_iccm_blocked_sts_enable_4ccfea15_next_86c0a4d2_resetsignal_f7aac87a__in_t;

    typedef struct packed{
        logic hwset;
    } soc_ifc_reg__intr_block_t__error_intr_t__error_mbox_ecc_unc_sts_enable_18d80a94_next_91af8aa5_resetsignal_f7aac87a__in_t;

    typedef struct packed{
        soc_ifc_reg__intr_block_t__error_intr_t__error_internal_sts_enable_d33001bb_next_52b75ffa_resetsignal_f7aac87a__in_t error_internal_sts;
        soc_ifc_reg__intr_block_t__error_intr_t__error_inv_dev_sts_enable_e83f2724_next_8318aff8_resetsignal_f7aac87a__in_t error_inv_dev_sts;
        soc_ifc_reg__intr_block_t__error_intr_t__error_cmd_fail_sts_enable_d535c05b_next_eee7e362_resetsignal_f7aac87a__in_t error_cmd_fail_sts;
        soc_ifc_reg__intr_block_t__error_intr_t__error_bad_fuse_sts_enable_fceb289f_next_14761353_resetsignal_f7aac87a__in_t error_bad_fuse_sts;
        soc_ifc_reg__intr_block_t__error_intr_t__error_iccm_blocked_sts_enable_4ccfea15_next_86c0a4d2_resetsignal_f7aac87a__in_t error_iccm_blocked_sts;
        soc_ifc_reg__intr_block_t__error_intr_t__error_mbox_ecc_unc_sts_enable_18d80a94_next_91af8aa5_resetsignal_f7aac87a__in_t error_mbox_ecc_unc_sts;
    } soc_ifc_reg__intr_block_t__error_intr_t_error_bad_fuse_sts_23f67582_error_cmd_fail_sts_b85845f8_error_iccm_blocked_sts_e81e6ad2_error_internal_sts_caad62e2_error_inv_dev_sts_6693e7db_error_mbox_ecc_unc_sts_30bff330__in_t;

    typedef struct packed{
        logic hwset;
    } soc_ifc_reg__intr_block_t__notif_intr_t__notif_cmd_avail_sts_enable_f40f37a0_next_6afe0a88__in_t;

    typedef struct packed{
        logic hwset;
    } soc_ifc_reg__intr_block_t__notif_intr_t__notif_mbox_ecc_cor_sts_enable_c4f9db68_next_96c01bef__in_t;

    typedef struct packed{
        logic hwset;
    } soc_ifc_reg__intr_block_t__notif_intr_t__notif_debug_locked_sts_enable_097fcd5b_next_36fa44d8__in_t;

    typedef struct packed{
        soc_ifc_reg__intr_block_t__notif_intr_t__notif_cmd_avail_sts_enable_f40f37a0_next_6afe0a88__in_t notif_cmd_avail_sts;
        soc_ifc_reg__intr_block_t__notif_intr_t__notif_mbox_ecc_cor_sts_enable_c4f9db68_next_96c01bef__in_t notif_mbox_ecc_cor_sts;
        soc_ifc_reg__intr_block_t__notif_intr_t__notif_debug_locked_sts_enable_097fcd5b_next_36fa44d8__in_t notif_debug_locked_sts;
    } soc_ifc_reg__intr_block_t__notif_intr_t_notif_cmd_avail_sts_1871606b_notif_debug_locked_sts_5f024102_notif_mbox_ecc_cor_sts_5c3d26bb__in_t;

    typedef struct packed{
        soc_ifc_reg__intr_block_t__error_intr_t_error_bad_fuse_sts_23f67582_error_cmd_fail_sts_b85845f8_error_iccm_blocked_sts_e81e6ad2_error_internal_sts_caad62e2_error_inv_dev_sts_6693e7db_error_mbox_ecc_unc_sts_30bff330__in_t error_internal_intr_r;
        soc_ifc_reg__intr_block_t__notif_intr_t_notif_cmd_avail_sts_1871606b_notif_debug_locked_sts_5f024102_notif_mbox_ecc_cor_sts_5c3d26bb__in_t notif_internal_intr_r;
    } soc_ifc_reg__intr_block_t__in_t;

    typedef struct packed{
        logic cptra_rst_b;
        logic cptra_pwrgood;
        logic soc_req;
        soc_ifc_reg__CPTRA_FLOW_STATUS__in_t CPTRA_FLOW_STATUS;
        soc_ifc_reg__CPTRA_RESET_REASON__in_t CPTRA_RESET_REASON;
        soc_ifc_reg__CPTRA_SECURITY_STATE__in_t CPTRA_SECURITY_STATE;
        soc_ifc_reg__CPTRA_VALID_PAUSER__in_t [5-1:0]CPTRA_VALID_PAUSER;
        soc_ifc_reg__CPTRA_PAUSER_LOCK__in_t [5-1:0]CPTRA_PAUSER_LOCK;
        soc_ifc_reg__CPTRA_TRNG_VALID_PAUSER__in_t CPTRA_TRNG_VALID_PAUSER;
        soc_ifc_reg__CPTRA_TRNG_PAUSER_LOCK__in_t CPTRA_TRNG_PAUSER_LOCK;
        soc_ifc_reg__CPTRA_TRNG_DATA__in_t [12-1:0]CPTRA_TRNG_DATA;
        soc_ifc_reg__CPTRA_TRNG_STATUS__in_t CPTRA_TRNG_STATUS;
        soc_ifc_reg__CPTRA_FUSE_WR_DONE__in_t CPTRA_FUSE_WR_DONE;
        soc_ifc_reg__CPTRA_BOOTFSM_GO__in_t CPTRA_BOOTFSM_GO;
        soc_ifc_reg__CPTRA_DBG_MANUF_SERVICE_REG__in_t CPTRA_DBG_MANUF_SERVICE_REG;
        soc_ifc_reg__CPTRA_GENERIC_INPUT_WIRES__in_t [2-1:0]CPTRA_GENERIC_INPUT_WIRES;
        soc_ifc_reg__fuse_uds_seed__in_t [12-1:0]fuse_uds_seed;
        soc_ifc_reg__fuse_field_entropy__in_t [8-1:0]fuse_field_entropy;
        soc_ifc_reg__fuse_key_manifest_pk_hash__in_t [12-1:0]fuse_key_manifest_pk_hash;
        soc_ifc_reg__fuse_key_manifest_pk_hash_mask__in_t fuse_key_manifest_pk_hash_mask;
        soc_ifc_reg__fuse_owner_pk_hash__in_t [12-1:0]fuse_owner_pk_hash;
        soc_ifc_reg__fuse_fmc_key_manifest_svn__in_t fuse_fmc_key_manifest_svn;
        soc_ifc_reg__fuse_runtime_svn__in_t [4-1:0]fuse_runtime_svn;
        soc_ifc_reg__fuse_anti_rollback_disable__in_t fuse_anti_rollback_disable;
        soc_ifc_reg__fuse_idevid_cert_attr__in_t [24-1:0]fuse_idevid_cert_attr;
        soc_ifc_reg__fuse_idevid_manuf_hsm_id__in_t [4-1:0]fuse_idevid_manuf_hsm_id;
        soc_ifc_reg__fuse_life_cycle__in_t fuse_life_cycle;
        soc_ifc_reg__internal_obf_key__in_t [8-1:0]internal_obf_key;
        soc_ifc_reg__internal_iccm_lock__in_t internal_iccm_lock;
        soc_ifc_reg__intr_block_t__in_t intr_block_rf;
    } soc_ifc_reg__in_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__CPTRA_HW_ERROR_ENC__error_code__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_HW_ERROR_ENC__error_code__out_t error_code;
    } soc_ifc_reg__CPTRA_HW_ERROR_ENC__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__CPTRA_FW_ERROR_ENC__error_code__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_FW_ERROR_ENC__error_code__out_t error_code;
    } soc_ifc_reg__CPTRA_FW_ERROR_ENC__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__CPTRA_FW_EXTENDED_ERROR_INFO__error_info__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_FW_EXTENDED_ERROR_INFO__error_info__out_t error_info;
    } soc_ifc_reg__CPTRA_FW_EXTENDED_ERROR_INFO__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__CPTRA_BOOT_STATUS__status__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_BOOT_STATUS__status__out_t status;
    } soc_ifc_reg__CPTRA_BOOT_STATUS__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_FLOW_STATUS__ready_for_fw__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_FLOW_STATUS__ready_for_runtime__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_FLOW_STATUS__ready_for_fuses__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_FLOW_STATUS__mailbox_flow_done__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_FLOW_STATUS__ready_for_fw__out_t ready_for_fw;
        soc_ifc_reg__CPTRA_FLOW_STATUS__ready_for_runtime__out_t ready_for_runtime;
        soc_ifc_reg__CPTRA_FLOW_STATUS__ready_for_fuses__out_t ready_for_fuses;
        soc_ifc_reg__CPTRA_FLOW_STATUS__mailbox_flow_done__out_t mailbox_flow_done;
    } soc_ifc_reg__CPTRA_FLOW_STATUS__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_RESET_REASON__FW_UPD_RESET__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_RESET_REASON__WARM_RESET__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_RESET_REASON__FW_UPD_RESET__out_t FW_UPD_RESET;
        soc_ifc_reg__CPTRA_RESET_REASON__WARM_RESET__out_t WARM_RESET;
    } soc_ifc_reg__CPTRA_RESET_REASON__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__CPTRA_VALID_PAUSER__PAUSER__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_VALID_PAUSER__PAUSER__out_t PAUSER;
    } soc_ifc_reg__CPTRA_VALID_PAUSER__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_PAUSER_LOCK__LOCK__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_PAUSER_LOCK__LOCK__out_t LOCK;
    } soc_ifc_reg__CPTRA_PAUSER_LOCK__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__CPTRA_TRNG_VALID_PAUSER__PAUSER__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_TRNG_VALID_PAUSER__PAUSER__out_t PAUSER;
    } soc_ifc_reg__CPTRA_TRNG_VALID_PAUSER__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_TRNG_PAUSER_LOCK__LOCK__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_TRNG_PAUSER_LOCK__LOCK__out_t LOCK;
    } soc_ifc_reg__CPTRA_TRNG_PAUSER_LOCK__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_TRNG_STATUS__DATA_REQ__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_TRNG_STATUS__DATA_REQ__out_t DATA_REQ;
    } soc_ifc_reg__CPTRA_TRNG_STATUS__out_t;

    typedef struct packed{
        logic value;
        logic swmod;
    } soc_ifc_reg__CPTRA_FUSE_WR_DONE__done__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_FUSE_WR_DONE__done__out_t done;
    } soc_ifc_reg__CPTRA_FUSE_WR_DONE__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_BOOTFSM_GO__GO__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_BOOTFSM_GO__GO__out_t GO;
    } soc_ifc_reg__CPTRA_BOOTFSM_GO__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__CPTRA_DBG_MANUF_SERVICE_REG__DATA__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_DBG_MANUF_SERVICE_REG__DATA__out_t DATA;
    } soc_ifc_reg__CPTRA_DBG_MANUF_SERVICE_REG__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__CPTRA_CLK_GATING_EN__clk_gating_en__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_CLK_GATING_EN__clk_gating_en__out_t clk_gating_en;
    } soc_ifc_reg__CPTRA_CLK_GATING_EN__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__CPTRA_GENERIC_INPUT_WIRES__generic_wires__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_GENERIC_INPUT_WIRES__generic_wires__out_t generic_wires;
    } soc_ifc_reg__CPTRA_GENERIC_INPUT_WIRES__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__CPTRA_GENERIC_OUTPUT_WIRES__generic_wires__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_GENERIC_OUTPUT_WIRES__generic_wires__out_t generic_wires;
    } soc_ifc_reg__CPTRA_GENERIC_OUTPUT_WIRES__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__secret_w32__out_t;

    typedef struct packed{
        soc_ifc_reg__secret_w32__out_t seed;
    } soc_ifc_reg__fuse_uds_seed__out_t;

    typedef struct packed{
        soc_ifc_reg__secret_w32__out_t seed;
    } soc_ifc_reg__fuse_field_entropy__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__Fuse_w32__out_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__out_t hash;
    } soc_ifc_reg__fuse_key_manifest_pk_hash__out_t;

    typedef struct packed{
        logic [3:0] value;
    } soc_ifc_reg__Fuse_w4__out_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w4__out_t mask;
    } soc_ifc_reg__fuse_key_manifest_pk_hash_mask__out_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__out_t hash;
    } soc_ifc_reg__fuse_owner_pk_hash__out_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__out_t svn;
    } soc_ifc_reg__fuse_fmc_key_manifest_svn__out_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__out_t svn;
    } soc_ifc_reg__fuse_runtime_svn__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__Fuse__out_t;

    typedef struct packed{
        soc_ifc_reg__Fuse__out_t dis;
    } soc_ifc_reg__fuse_anti_rollback_disable__out_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__out_t cert;
    } soc_ifc_reg__fuse_idevid_cert_attr__out_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w32__out_t hsm_id;
    } soc_ifc_reg__fuse_idevid_manuf_hsm_id__out_t;

    typedef struct packed{
        logic [1:0] value;
    } soc_ifc_reg__Fuse_w2__out_t;

    typedef struct packed{
        soc_ifc_reg__Fuse_w2__out_t life_cycle;
    } soc_ifc_reg__fuse_life_cycle__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__key_w32__out_t;

    typedef struct packed{
        soc_ifc_reg__key_w32__out_t key;
    } soc_ifc_reg__internal_obf_key__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__internal_iccm_lock__lock__out_t;

    typedef struct packed{
        soc_ifc_reg__internal_iccm_lock__lock__out_t lock;
    } soc_ifc_reg__internal_iccm_lock__out_t;

    typedef struct packed{
        logic value;
    } soc_ifc_reg__internal_fw_update_reset__core_rst__out_t;

    typedef struct packed{
        soc_ifc_reg__internal_fw_update_reset__core_rst__out_t core_rst;
    } soc_ifc_reg__internal_fw_update_reset__out_t;

    typedef struct packed{
        logic [7:0] value;
    } soc_ifc_reg__internal_fw_update_reset_wait_cycles__wait_cycles__out_t;

    typedef struct packed{
        soc_ifc_reg__internal_fw_update_reset_wait_cycles__wait_cycles__out_t wait_cycles;
    } soc_ifc_reg__internal_fw_update_reset_wait_cycles__out_t;

    typedef struct packed{
        logic [31:0] value;
    } soc_ifc_reg__internal_nmi_vector__vec__out_t;

    typedef struct packed{
        soc_ifc_reg__internal_nmi_vector__vec__out_t vec;
    } soc_ifc_reg__internal_nmi_vector__out_t;

    typedef struct packed{
        logic intr;
    } soc_ifc_reg__intr_block_t__global_intr_t_agg_sts_dd3dcf0a__out_t;

    typedef struct packed{
        logic intr;
    } soc_ifc_reg__intr_block_t__global_intr_t_agg_sts_e6399b4a__out_t;

    typedef struct packed{
        logic intr;
    } soc_ifc_reg__intr_block_t__error_intr_t_error_bad_fuse_sts_23f67582_error_cmd_fail_sts_b85845f8_error_iccm_blocked_sts_e81e6ad2_error_internal_sts_caad62e2_error_inv_dev_sts_6693e7db_error_mbox_ecc_unc_sts_30bff330__out_t;

    typedef struct packed{
        logic intr;
    } soc_ifc_reg__intr_block_t__notif_intr_t_notif_cmd_avail_sts_1871606b_notif_debug_locked_sts_5f024102_notif_mbox_ecc_cor_sts_5c3d26bb__out_t;

    typedef struct packed{
        soc_ifc_reg__intr_block_t__global_intr_t_agg_sts_dd3dcf0a__out_t error_global_intr_r;
        soc_ifc_reg__intr_block_t__global_intr_t_agg_sts_e6399b4a__out_t notif_global_intr_r;
        soc_ifc_reg__intr_block_t__error_intr_t_error_bad_fuse_sts_23f67582_error_cmd_fail_sts_b85845f8_error_iccm_blocked_sts_e81e6ad2_error_internal_sts_caad62e2_error_inv_dev_sts_6693e7db_error_mbox_ecc_unc_sts_30bff330__out_t error_internal_intr_r;
        soc_ifc_reg__intr_block_t__notif_intr_t_notif_cmd_avail_sts_1871606b_notif_debug_locked_sts_5f024102_notif_mbox_ecc_cor_sts_5c3d26bb__out_t notif_internal_intr_r;
    } soc_ifc_reg__intr_block_t__out_t;

    typedef struct packed{
        soc_ifc_reg__CPTRA_HW_ERROR_ENC__out_t CPTRA_HW_ERROR_ENC;
        soc_ifc_reg__CPTRA_FW_ERROR_ENC__out_t CPTRA_FW_ERROR_ENC;
        soc_ifc_reg__CPTRA_FW_EXTENDED_ERROR_INFO__out_t [8-1:0]CPTRA_FW_EXTENDED_ERROR_INFO;
        soc_ifc_reg__CPTRA_BOOT_STATUS__out_t CPTRA_BOOT_STATUS;
        soc_ifc_reg__CPTRA_FLOW_STATUS__out_t CPTRA_FLOW_STATUS;
        soc_ifc_reg__CPTRA_RESET_REASON__out_t CPTRA_RESET_REASON;
        soc_ifc_reg__CPTRA_VALID_PAUSER__out_t [5-1:0]CPTRA_VALID_PAUSER;
        soc_ifc_reg__CPTRA_PAUSER_LOCK__out_t [5-1:0]CPTRA_PAUSER_LOCK;
        soc_ifc_reg__CPTRA_TRNG_VALID_PAUSER__out_t CPTRA_TRNG_VALID_PAUSER;
        soc_ifc_reg__CPTRA_TRNG_PAUSER_LOCK__out_t CPTRA_TRNG_PAUSER_LOCK;
        soc_ifc_reg__CPTRA_TRNG_STATUS__out_t CPTRA_TRNG_STATUS;
        soc_ifc_reg__CPTRA_FUSE_WR_DONE__out_t CPTRA_FUSE_WR_DONE;
        soc_ifc_reg__CPTRA_BOOTFSM_GO__out_t CPTRA_BOOTFSM_GO;
        soc_ifc_reg__CPTRA_DBG_MANUF_SERVICE_REG__out_t CPTRA_DBG_MANUF_SERVICE_REG;
        soc_ifc_reg__CPTRA_CLK_GATING_EN__out_t CPTRA_CLK_GATING_EN;
        soc_ifc_reg__CPTRA_GENERIC_INPUT_WIRES__out_t [2-1:0]CPTRA_GENERIC_INPUT_WIRES;
        soc_ifc_reg__CPTRA_GENERIC_OUTPUT_WIRES__out_t [2-1:0]CPTRA_GENERIC_OUTPUT_WIRES;
        soc_ifc_reg__fuse_uds_seed__out_t [12-1:0]fuse_uds_seed;
        soc_ifc_reg__fuse_field_entropy__out_t [8-1:0]fuse_field_entropy;
        soc_ifc_reg__fuse_key_manifest_pk_hash__out_t [12-1:0]fuse_key_manifest_pk_hash;
        soc_ifc_reg__fuse_key_manifest_pk_hash_mask__out_t fuse_key_manifest_pk_hash_mask;
        soc_ifc_reg__fuse_owner_pk_hash__out_t [12-1:0]fuse_owner_pk_hash;
        soc_ifc_reg__fuse_fmc_key_manifest_svn__out_t fuse_fmc_key_manifest_svn;
        soc_ifc_reg__fuse_runtime_svn__out_t [4-1:0]fuse_runtime_svn;
        soc_ifc_reg__fuse_anti_rollback_disable__out_t fuse_anti_rollback_disable;
        soc_ifc_reg__fuse_idevid_cert_attr__out_t [24-1:0]fuse_idevid_cert_attr;
        soc_ifc_reg__fuse_idevid_manuf_hsm_id__out_t [4-1:0]fuse_idevid_manuf_hsm_id;
        soc_ifc_reg__fuse_life_cycle__out_t fuse_life_cycle;
        soc_ifc_reg__internal_obf_key__out_t [8-1:0]internal_obf_key;
        soc_ifc_reg__internal_iccm_lock__out_t internal_iccm_lock;
        soc_ifc_reg__internal_fw_update_reset__out_t internal_fw_update_reset;
        soc_ifc_reg__internal_fw_update_reset_wait_cycles__out_t internal_fw_update_reset_wait_cycles;
        soc_ifc_reg__internal_nmi_vector__out_t internal_nmi_vector;
        soc_ifc_reg__intr_block_t__out_t intr_block_rf;
    } soc_ifc_reg__out_t;

    localparam SOC_IFC_REG_ADDR_WIDTH = 32'd12;

endpackage