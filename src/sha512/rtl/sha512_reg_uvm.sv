
// This file was autogenerated by PeakRDL-uvm
package sha512_reg_uvm;
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    
    // Reg - sha512_reg::SHA512_NAME
    class sha512_reg__SHA512_NAME extends uvm_reg;
        rand uvm_reg_field NAME;

        function new(string name = "sha512_reg__SHA512_NAME");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.NAME = new("NAME");
            this.NAME.configure(this, 32, 0, "RO", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : sha512_reg__SHA512_NAME

    // Reg - sha512_reg::SHA512_VERSION
    class sha512_reg__SHA512_VERSION extends uvm_reg;
        rand uvm_reg_field VERSION;

        function new(string name = "sha512_reg__SHA512_VERSION");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.VERSION = new("VERSION");
            this.VERSION.configure(this, 32, 0, "RO", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : sha512_reg__SHA512_VERSION

    // Reg - sha512_reg::SHA512_CTRL
    class sha512_reg__SHA512_CTRL extends uvm_reg;
        rand uvm_reg_field INIT;
        rand uvm_reg_field NEXT;
        rand uvm_reg_field MODE;

        function new(string name = "sha512_reg__SHA512_CTRL");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.INIT = new("INIT");
            this.INIT.configure(this, 1, 0, "WO", 0, 'h0, 1, 1, 0);
            this.NEXT = new("NEXT");
            this.NEXT.configure(this, 1, 1, "WO", 0, 'h0, 1, 1, 0);
            this.MODE = new("MODE");
            this.MODE.configure(this, 2, 2, "WO", 0, 'h3, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__SHA512_CTRL

    // Reg - sha512_reg::SHA512_STATUS
    class sha512_reg__SHA512_STATUS extends uvm_reg;
        rand uvm_reg_field READY;
        rand uvm_reg_field VALID;

        function new(string name = "sha512_reg__SHA512_STATUS");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.READY = new("READY");
            this.READY.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
            this.VALID = new("VALID");
            this.VALID.configure(this, 1, 1, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__SHA512_STATUS

    // Reg - sha512_reg::SHA512_BLOCK
    class sha512_reg__SHA512_BLOCK extends uvm_reg;
        rand uvm_reg_field BLOCK;

        function new(string name = "sha512_reg__SHA512_BLOCK");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.BLOCK = new("BLOCK");
            this.BLOCK.configure(this, 32, 0, "WO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__SHA512_BLOCK

    // Reg - sha512_reg::SHA512_DIGEST
    class sha512_reg__SHA512_DIGEST extends uvm_reg;
        rand uvm_reg_field DIGEST;

        function new(string name = "sha512_reg__SHA512_DIGEST");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.DIGEST = new("DIGEST");
            this.DIGEST.configure(this, 32, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__SHA512_DIGEST

    // Reg - kv_read_ctrl_reg
    class kv_read_ctrl_reg extends uvm_reg;
        rand uvm_reg_field read_en;
        rand uvm_reg_field read_entry;
        rand uvm_reg_field entry_is_pcr;
        rand uvm_reg_field entry_data_size;
        rand uvm_reg_field rsvd;
        rand uvm_reg_field read_done;

        function new(string name = "kv_read_ctrl_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.read_en = new("read_en");
            this.read_en.configure(this, 1, 0, "RW", 1, 'h0, 1, 1, 0);
            this.read_entry = new("read_entry");
            this.read_entry.configure(this, 3, 1, "RW", 0, 'h0, 1, 1, 0);
            this.entry_is_pcr = new("entry_is_pcr");
            this.entry_is_pcr.configure(this, 1, 4, "RW", 0, 'h0, 1, 1, 0);
            this.entry_data_size = new("entry_data_size");
            this.entry_data_size.configure(this, 5, 5, "RW", 0, 'h0, 1, 1, 0);
            this.rsvd = new("rsvd");
            this.rsvd.configure(this, 21, 10, "RW", 0, 'h0, 1, 1, 0);
            this.read_done = new("read_done");
            this.read_done.configure(this, 1, 31, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : kv_read_ctrl_reg

    // Reg - kv_write_ctrl_reg
    class kv_write_ctrl_reg extends uvm_reg;
        rand uvm_reg_field write_en;
        rand uvm_reg_field write_entry;
        rand uvm_reg_field entry_is_pcr;
        rand uvm_reg_field hmac_key_dest_valid;
        rand uvm_reg_field hmac_block_dest_valid;
        rand uvm_reg_field sha_block_dest_valid;
        rand uvm_reg_field ecc_pkey_dest_valid;
        rand uvm_reg_field ecc_seed_dest_valid;
        rand uvm_reg_field ecc_msg_dest_valid;
        rand uvm_reg_field rsvd;
        rand uvm_reg_field write_done;

        function new(string name = "kv_write_ctrl_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.write_en = new("write_en");
            this.write_en.configure(this, 1, 0, "RW", 1, 'h0, 1, 1, 0);
            this.write_entry = new("write_entry");
            this.write_entry.configure(this, 3, 1, "RW", 0, 'h0, 1, 1, 0);
            this.entry_is_pcr = new("entry_is_pcr");
            this.entry_is_pcr.configure(this, 1, 4, "RW", 0, 'h0, 1, 1, 0);
            this.hmac_key_dest_valid = new("hmac_key_dest_valid");
            this.hmac_key_dest_valid.configure(this, 1, 5, "RW", 0, 'h0, 1, 1, 0);
            this.hmac_block_dest_valid = new("hmac_block_dest_valid");
            this.hmac_block_dest_valid.configure(this, 1, 6, "RW", 0, 'h0, 1, 1, 0);
            this.sha_block_dest_valid = new("sha_block_dest_valid");
            this.sha_block_dest_valid.configure(this, 1, 7, "RW", 0, 'h0, 1, 1, 0);
            this.ecc_pkey_dest_valid = new("ecc_pkey_dest_valid");
            this.ecc_pkey_dest_valid.configure(this, 1, 8, "RW", 0, 'h0, 1, 1, 0);
            this.ecc_seed_dest_valid = new("ecc_seed_dest_valid");
            this.ecc_seed_dest_valid.configure(this, 1, 9, "RW", 0, 'h0, 1, 1, 0);
            this.ecc_msg_dest_valid = new("ecc_msg_dest_valid");
            this.ecc_msg_dest_valid.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
            this.rsvd = new("rsvd");
            this.rsvd.configure(this, 20, 11, "RW", 0, 'h0, 1, 1, 0);
            this.write_done = new("write_done");
            this.write_done.configure(this, 1, 31, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : kv_write_ctrl_reg

    // Reg - sha512_reg::global_intr_en_t
    class sha512_reg__global_intr_en_t extends uvm_reg;
        rand uvm_reg_field error_en;
        rand uvm_reg_field notif_en;

        function new(string name = "sha512_reg__global_intr_en_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.error_en = new("error_en");
            this.error_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
            this.notif_en = new("notif_en");
            this.notif_en.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__global_intr_en_t

    // Reg - sha512_reg::error_intr_en_t
    class sha512_reg__error_intr_en_t extends uvm_reg;
        rand uvm_reg_field error0_en;
        rand uvm_reg_field error1_en;
        rand uvm_reg_field error2_en;
        rand uvm_reg_field error3_en;

        function new(string name = "sha512_reg__error_intr_en_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.error0_en = new("error0_en");
            this.error0_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
            this.error1_en = new("error1_en");
            this.error1_en.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
            this.error2_en = new("error2_en");
            this.error2_en.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
            this.error3_en = new("error3_en");
            this.error3_en.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__error_intr_en_t

    // Reg - sha512_reg::notif_intr_en_t
    class sha512_reg__notif_intr_en_t extends uvm_reg;
        rand uvm_reg_field notif_cmd_done_en;

        function new(string name = "sha512_reg__notif_intr_en_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.notif_cmd_done_en = new("notif_cmd_done_en");
            this.notif_cmd_done_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__notif_intr_en_t

    // Reg - sha512_reg::global_intr_t_agg_sts_dd3dcf0a
    class sha512_reg__global_intr_t_agg_sts_dd3dcf0a extends uvm_reg;
        rand uvm_reg_field agg_sts;

        function new(string name = "sha512_reg__global_intr_t_agg_sts_dd3dcf0a");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.agg_sts = new("agg_sts");
            this.agg_sts.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__global_intr_t_agg_sts_dd3dcf0a

    // Reg - sha512_reg::global_intr_t_agg_sts_e6399b4a
    class sha512_reg__global_intr_t_agg_sts_e6399b4a extends uvm_reg;
        rand uvm_reg_field agg_sts;

        function new(string name = "sha512_reg__global_intr_t_agg_sts_e6399b4a");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.agg_sts = new("agg_sts");
            this.agg_sts.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__global_intr_t_agg_sts_e6399b4a

    // Reg - sha512_reg::error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378
    class sha512_reg__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378 extends uvm_reg;
        rand uvm_reg_field error0_sts;
        rand uvm_reg_field error1_sts;
        rand uvm_reg_field error2_sts;
        rand uvm_reg_field error3_sts;

        function new(string name = "sha512_reg__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.error0_sts = new("error0_sts");
            this.error0_sts.configure(this, 1, 0, "W1C", 1, 'h0, 1, 1, 0);
            this.error1_sts = new("error1_sts");
            this.error1_sts.configure(this, 1, 1, "W1C", 1, 'h0, 1, 1, 0);
            this.error2_sts = new("error2_sts");
            this.error2_sts.configure(this, 1, 2, "W1C", 1, 'h0, 1, 1, 0);
            this.error3_sts = new("error3_sts");
            this.error3_sts.configure(this, 1, 3, "W1C", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378

    // Reg - sha512_reg::notif_intr_t_notif_cmd_done_sts_1c68637e
    class sha512_reg__notif_intr_t_notif_cmd_done_sts_1c68637e extends uvm_reg;
        rand uvm_reg_field notif_cmd_done_sts;

        function new(string name = "sha512_reg__notif_intr_t_notif_cmd_done_sts_1c68637e");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.notif_cmd_done_sts = new("notif_cmd_done_sts");
            this.notif_cmd_done_sts.configure(this, 1, 0, "W1C", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__notif_intr_t_notif_cmd_done_sts_1c68637e

    // Reg - sha512_reg::error_intr_trig_t
    class sha512_reg__error_intr_trig_t extends uvm_reg;
        rand uvm_reg_field error0_trig;
        rand uvm_reg_field error1_trig;
        rand uvm_reg_field error2_trig;
        rand uvm_reg_field error3_trig;

        function new(string name = "sha512_reg__error_intr_trig_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.error0_trig = new("error0_trig");
            this.error0_trig.configure(this, 1, 0, "W1S", 0, 'h0, 1, 1, 0);
            this.error1_trig = new("error1_trig");
            this.error1_trig.configure(this, 1, 1, "W1S", 0, 'h0, 1, 1, 0);
            this.error2_trig = new("error2_trig");
            this.error2_trig.configure(this, 1, 2, "W1S", 0, 'h0, 1, 1, 0);
            this.error3_trig = new("error3_trig");
            this.error3_trig.configure(this, 1, 3, "W1S", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__error_intr_trig_t

    // Reg - sha512_reg::notif_intr_trig_t
    class sha512_reg__notif_intr_trig_t extends uvm_reg;
        rand uvm_reg_field notif_cmd_done_trig;

        function new(string name = "sha512_reg__notif_intr_trig_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.notif_cmd_done_trig = new("notif_cmd_done_trig");
            this.notif_cmd_done_trig.configure(this, 1, 0, "W1S", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__notif_intr_trig_t

    // Reg - sha512_reg::intr_count_t_cnt_35ace267
    class sha512_reg__intr_count_t_cnt_35ace267 extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "sha512_reg__intr_count_t_cnt_35ace267");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__intr_count_t_cnt_35ace267

    // Reg - sha512_reg::intr_count_t_cnt_73c42c28
    class sha512_reg__intr_count_t_cnt_73c42c28 extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "sha512_reg__intr_count_t_cnt_73c42c28");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__intr_count_t_cnt_73c42c28

    // Reg - sha512_reg::intr_count_t_cnt_d8af96ff
    class sha512_reg__intr_count_t_cnt_d8af96ff extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "sha512_reg__intr_count_t_cnt_d8af96ff");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__intr_count_t_cnt_d8af96ff

    // Reg - sha512_reg::intr_count_t_cnt_9bd7f809
    class sha512_reg__intr_count_t_cnt_9bd7f809 extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "sha512_reg__intr_count_t_cnt_9bd7f809");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__intr_count_t_cnt_9bd7f809

    // Reg - sha512_reg::intr_count_t_cnt_be67d6d5
    class sha512_reg__intr_count_t_cnt_be67d6d5 extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "sha512_reg__intr_count_t_cnt_be67d6d5");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__intr_count_t_cnt_be67d6d5

    // Reg - sha512_reg::intr_count_incr_t_pulse_37026c97
    class sha512_reg__intr_count_incr_t_pulse_37026c97 extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "sha512_reg__intr_count_incr_t_pulse_37026c97");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__intr_count_incr_t_pulse_37026c97

    // Reg - sha512_reg::intr_count_incr_t_pulse_d860d977
    class sha512_reg__intr_count_incr_t_pulse_d860d977 extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "sha512_reg__intr_count_incr_t_pulse_d860d977");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__intr_count_incr_t_pulse_d860d977

    // Reg - sha512_reg::intr_count_incr_t_pulse_87b45fe7
    class sha512_reg__intr_count_incr_t_pulse_87b45fe7 extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "sha512_reg__intr_count_incr_t_pulse_87b45fe7");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__intr_count_incr_t_pulse_87b45fe7

    // Reg - sha512_reg::intr_count_incr_t_pulse_c1689ee6
    class sha512_reg__intr_count_incr_t_pulse_c1689ee6 extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "sha512_reg__intr_count_incr_t_pulse_c1689ee6");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__intr_count_incr_t_pulse_c1689ee6

    // Reg - sha512_reg::intr_count_incr_t_pulse_6173128e
    class sha512_reg__intr_count_incr_t_pulse_6173128e extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "sha512_reg__intr_count_incr_t_pulse_6173128e");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha512_reg__intr_count_incr_t_pulse_6173128e

    // Regfile - sha512_reg::intr_block_t
    class sha512_reg__intr_block_t extends uvm_reg_block;
        rand sha512_reg__global_intr_en_t global_intr_en_r;
        rand sha512_reg__error_intr_en_t error_intr_en_r;
        rand sha512_reg__notif_intr_en_t notif_intr_en_r;
        rand sha512_reg__global_intr_t_agg_sts_dd3dcf0a error_global_intr_r;
        rand sha512_reg__global_intr_t_agg_sts_e6399b4a notif_global_intr_r;
        rand sha512_reg__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378 error_internal_intr_r;
        rand sha512_reg__notif_intr_t_notif_cmd_done_sts_1c68637e notif_internal_intr_r;
        rand sha512_reg__error_intr_trig_t error_intr_trig_r;
        rand sha512_reg__notif_intr_trig_t notif_intr_trig_r;
        rand sha512_reg__intr_count_t_cnt_35ace267 error0_intr_count_r;
        rand sha512_reg__intr_count_t_cnt_73c42c28 error1_intr_count_r;
        rand sha512_reg__intr_count_t_cnt_d8af96ff error2_intr_count_r;
        rand sha512_reg__intr_count_t_cnt_9bd7f809 error3_intr_count_r;
        rand sha512_reg__intr_count_t_cnt_be67d6d5 notif_cmd_done_intr_count_r;
        rand sha512_reg__intr_count_incr_t_pulse_37026c97 error0_intr_count_incr_r;
        rand sha512_reg__intr_count_incr_t_pulse_d860d977 error1_intr_count_incr_r;
        rand sha512_reg__intr_count_incr_t_pulse_87b45fe7 error2_intr_count_incr_r;
        rand sha512_reg__intr_count_incr_t_pulse_c1689ee6 error3_intr_count_incr_r;
        rand sha512_reg__intr_count_incr_t_pulse_6173128e notif_cmd_done_intr_count_incr_r;

        function new(string name = "sha512_reg__intr_block_t");
            super.new(name);
        endfunction : new

        virtual function void build();
            this.default_map = create_map("reg_map", 0, 4, UVM_NO_ENDIAN);
            this.global_intr_en_r = new("global_intr_en_r");
            this.global_intr_en_r.configure(this);

            this.global_intr_en_r.build();
            this.default_map.add_reg(this.global_intr_en_r, 'h0);
            this.error_intr_en_r = new("error_intr_en_r");
            this.error_intr_en_r.configure(this);

            this.error_intr_en_r.build();
            this.default_map.add_reg(this.error_intr_en_r, 'h4);
            this.notif_intr_en_r = new("notif_intr_en_r");
            this.notif_intr_en_r.configure(this);

            this.notif_intr_en_r.build();
            this.default_map.add_reg(this.notif_intr_en_r, 'h8);
            this.error_global_intr_r = new("error_global_intr_r");
            this.error_global_intr_r.configure(this);

            this.error_global_intr_r.build();
            this.default_map.add_reg(this.error_global_intr_r, 'hc);
            this.notif_global_intr_r = new("notif_global_intr_r");
            this.notif_global_intr_r.configure(this);

            this.notif_global_intr_r.build();
            this.default_map.add_reg(this.notif_global_intr_r, 'h10);
            this.error_internal_intr_r = new("error_internal_intr_r");
            this.error_internal_intr_r.configure(this);

            this.error_internal_intr_r.build();
            this.default_map.add_reg(this.error_internal_intr_r, 'h14);
            this.notif_internal_intr_r = new("notif_internal_intr_r");
            this.notif_internal_intr_r.configure(this);

            this.notif_internal_intr_r.build();
            this.default_map.add_reg(this.notif_internal_intr_r, 'h18);
            this.error_intr_trig_r = new("error_intr_trig_r");
            this.error_intr_trig_r.configure(this);

            this.error_intr_trig_r.build();
            this.default_map.add_reg(this.error_intr_trig_r, 'h1c);
            this.notif_intr_trig_r = new("notif_intr_trig_r");
            this.notif_intr_trig_r.configure(this);

            this.notif_intr_trig_r.build();
            this.default_map.add_reg(this.notif_intr_trig_r, 'h20);
            this.error0_intr_count_r = new("error0_intr_count_r");
            this.error0_intr_count_r.configure(this);

            this.error0_intr_count_r.build();
            this.default_map.add_reg(this.error0_intr_count_r, 'h100);
            this.error1_intr_count_r = new("error1_intr_count_r");
            this.error1_intr_count_r.configure(this);

            this.error1_intr_count_r.build();
            this.default_map.add_reg(this.error1_intr_count_r, 'h104);
            this.error2_intr_count_r = new("error2_intr_count_r");
            this.error2_intr_count_r.configure(this);

            this.error2_intr_count_r.build();
            this.default_map.add_reg(this.error2_intr_count_r, 'h108);
            this.error3_intr_count_r = new("error3_intr_count_r");
            this.error3_intr_count_r.configure(this);

            this.error3_intr_count_r.build();
            this.default_map.add_reg(this.error3_intr_count_r, 'h10c);
            this.notif_cmd_done_intr_count_r = new("notif_cmd_done_intr_count_r");
            this.notif_cmd_done_intr_count_r.configure(this);

            this.notif_cmd_done_intr_count_r.build();
            this.default_map.add_reg(this.notif_cmd_done_intr_count_r, 'h180);
            this.error0_intr_count_incr_r = new("error0_intr_count_incr_r");
            this.error0_intr_count_incr_r.configure(this);

            this.error0_intr_count_incr_r.build();
            this.default_map.add_reg(this.error0_intr_count_incr_r, 'h200);
            this.error1_intr_count_incr_r = new("error1_intr_count_incr_r");
            this.error1_intr_count_incr_r.configure(this);

            this.error1_intr_count_incr_r.build();
            this.default_map.add_reg(this.error1_intr_count_incr_r, 'h204);
            this.error2_intr_count_incr_r = new("error2_intr_count_incr_r");
            this.error2_intr_count_incr_r.configure(this);

            this.error2_intr_count_incr_r.build();
            this.default_map.add_reg(this.error2_intr_count_incr_r, 'h208);
            this.error3_intr_count_incr_r = new("error3_intr_count_incr_r");
            this.error3_intr_count_incr_r.configure(this);

            this.error3_intr_count_incr_r.build();
            this.default_map.add_reg(this.error3_intr_count_incr_r, 'h20c);
            this.notif_cmd_done_intr_count_incr_r = new("notif_cmd_done_intr_count_incr_r");
            this.notif_cmd_done_intr_count_incr_r.configure(this);

            this.notif_cmd_done_intr_count_incr_r.build();
            this.default_map.add_reg(this.notif_cmd_done_intr_count_incr_r, 'h210);
        endfunction : build
    endclass : sha512_reg__intr_block_t

    // Addrmap - sha512_reg
    class sha512_reg extends uvm_reg_block;
        rand sha512_reg__SHA512_NAME SHA512_NAME[2];
        rand sha512_reg__SHA512_VERSION SHA512_VERSION[2];
        rand sha512_reg__SHA512_CTRL SHA512_CTRL;
        rand sha512_reg__SHA512_STATUS SHA512_STATUS;
        rand sha512_reg__SHA512_BLOCK SHA512_BLOCK[32];
        rand sha512_reg__SHA512_DIGEST SHA512_DIGEST[16];
        rand kv_read_ctrl_reg SHA512_KV_RD_CTRL;
        rand kv_write_ctrl_reg SHA512_KV_WR_CTRL;
        rand sha512_reg__intr_block_t intr_block_rf;

        function new(string name = "sha512_reg");
            super.new(name);
        endfunction : new

        virtual function void build();
            this.default_map = create_map("reg_map", 0, 4, UVM_NO_ENDIAN);
            foreach(this.SHA512_NAME[i0]) begin
                this.SHA512_NAME[i0] = new($sformatf("SHA512_NAME[%0d]", i0));
                this.SHA512_NAME[i0].configure(this);
                
                this.SHA512_NAME[i0].build();
                this.default_map.add_reg(this.SHA512_NAME[i0], 'h0 + i0*'h4);
            end
            foreach(this.SHA512_VERSION[i0]) begin
                this.SHA512_VERSION[i0] = new($sformatf("SHA512_VERSION[%0d]", i0));
                this.SHA512_VERSION[i0].configure(this);
                
                this.SHA512_VERSION[i0].build();
                this.default_map.add_reg(this.SHA512_VERSION[i0], 'h8 + i0*'h4);
            end
            this.SHA512_CTRL = new("SHA512_CTRL");
            this.SHA512_CTRL.configure(this);

            this.SHA512_CTRL.build();
            this.default_map.add_reg(this.SHA512_CTRL, 'h10);
            this.SHA512_STATUS = new("SHA512_STATUS");
            this.SHA512_STATUS.configure(this);

            this.SHA512_STATUS.build();
            this.default_map.add_reg(this.SHA512_STATUS, 'h18);
            foreach(this.SHA512_BLOCK[i0]) begin
                this.SHA512_BLOCK[i0] = new($sformatf("SHA512_BLOCK[%0d]", i0));
                this.SHA512_BLOCK[i0].configure(this);
                
                this.SHA512_BLOCK[i0].build();
                this.default_map.add_reg(this.SHA512_BLOCK[i0], 'h80 + i0*'h4);
            end
            foreach(this.SHA512_DIGEST[i0]) begin
                this.SHA512_DIGEST[i0] = new($sformatf("SHA512_DIGEST[%0d]", i0));
                this.SHA512_DIGEST[i0].configure(this);
                
                this.SHA512_DIGEST[i0].build();
                this.default_map.add_reg(this.SHA512_DIGEST[i0], 'h100 + i0*'h4);
            end
            this.SHA512_KV_RD_CTRL = new("SHA512_KV_RD_CTRL");
            this.SHA512_KV_RD_CTRL.configure(this);

            this.SHA512_KV_RD_CTRL.build();
            this.default_map.add_reg(this.SHA512_KV_RD_CTRL, 'h600);
            this.SHA512_KV_WR_CTRL = new("SHA512_KV_WR_CTRL");
            this.SHA512_KV_WR_CTRL.configure(this);

            this.SHA512_KV_WR_CTRL.build();
            this.default_map.add_reg(this.SHA512_KV_WR_CTRL, 'h604);
            this.intr_block_rf = new("intr_block_rf");
            this.intr_block_rf.configure(this);
            this.intr_block_rf.build();
            this.default_map.add_submap(this.intr_block_rf.default_map, 'h800);
        endfunction : build
    endclass : sha512_reg

endpackage: sha512_reg_uvm
