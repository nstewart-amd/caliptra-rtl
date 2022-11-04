
// This file was autogenerated by PeakRDL-uvm
package ecc_reg_uvm;
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    
    // Reg - ecc_reg::ECC_NAME
    class ecc_reg__ECC_NAME extends uvm_reg;
        rand uvm_reg_field NAME;

        function new(string name = "ecc_reg__ECC_NAME");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.NAME = new("NAME");
            this.NAME.configure(this, 32, 0, "RO", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_NAME

    // Reg - ecc_reg::ECC_VERSION
    class ecc_reg__ECC_VERSION extends uvm_reg;
        rand uvm_reg_field VERSION;

        function new(string name = "ecc_reg__ECC_VERSION");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.VERSION = new("VERSION");
            this.VERSION.configure(this, 32, 0, "RO", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_VERSION

    // Reg - ecc_reg::ECC_CTRL
    class ecc_reg__ECC_CTRL extends uvm_reg;
        rand uvm_reg_field CTRL;

        function new(string name = "ecc_reg__ECC_CTRL");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.CTRL = new("CTRL");
            this.CTRL.configure(this, 2, 0, "WO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_CTRL

    // Reg - ecc_reg::ECC_STATUS
    class ecc_reg__ECC_STATUS extends uvm_reg;
        rand uvm_reg_field READY;
        rand uvm_reg_field VALID;

        function new(string name = "ecc_reg__ECC_STATUS");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.READY = new("READY");
            this.READY.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
            this.VALID = new("VALID");
            this.VALID.configure(this, 1, 1, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_STATUS

    // Reg - ecc_reg::ECC_SCACONFIG
    class ecc_reg__ECC_SCACONFIG extends uvm_reg;
        rand uvm_reg_field POINT_RND_EN;
        rand uvm_reg_field MASK_SIGN_EN;
        rand uvm_reg_field SCALAR_RND_EN;
        rand uvm_reg_field OPENSSL_EN;

        function new(string name = "ecc_reg__ECC_SCACONFIG");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.POINT_RND_EN = new("POINT_RND_EN");
            this.POINT_RND_EN.configure(this, 1, 0, "WO", 0, 'h1, 1, 1, 0);
            this.MASK_SIGN_EN = new("MASK_SIGN_EN");
            this.MASK_SIGN_EN.configure(this, 1, 1, "WO", 0, 'h1, 1, 1, 0);
            this.SCALAR_RND_EN = new("SCALAR_RND_EN");
            this.SCALAR_RND_EN.configure(this, 1, 2, "WO", 0, 'h1, 1, 1, 0);
            this.OPENSSL_EN = new("OPENSSL_EN");
            this.OPENSSL_EN.configure(this, 1, 3, "WO", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_SCACONFIG

    // Reg - ecc_reg::ECC_SEED
    class ecc_reg__ECC_SEED extends uvm_reg;
        rand uvm_reg_field SEED;

        function new(string name = "ecc_reg__ECC_SEED");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.SEED = new("SEED");
            this.SEED.configure(this, 32, 0, "WO", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_SEED

    // Reg - ecc_reg::ECC_MSG
    class ecc_reg__ECC_MSG extends uvm_reg;
        rand uvm_reg_field MSG;

        function new(string name = "ecc_reg__ECC_MSG");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.MSG = new("MSG");
            this.MSG.configure(this, 32, 0, "WO", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_MSG

    // Reg - ecc_reg::ECC_PRIVKEY
    class ecc_reg__ECC_PRIVKEY extends uvm_reg;
        rand uvm_reg_field PRIVKEY;

        function new(string name = "ecc_reg__ECC_PRIVKEY");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.PRIVKEY = new("PRIVKEY");
            this.PRIVKEY.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_PRIVKEY

    // Reg - ecc_reg::ECC_PUBKEY_X
    class ecc_reg__ECC_PUBKEY_X extends uvm_reg;
        rand uvm_reg_field PUBKEY_X;

        function new(string name = "ecc_reg__ECC_PUBKEY_X");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.PUBKEY_X = new("PUBKEY_X");
            this.PUBKEY_X.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_PUBKEY_X

    // Reg - ecc_reg::ECC_PUBKEY_Y
    class ecc_reg__ECC_PUBKEY_Y extends uvm_reg;
        rand uvm_reg_field PUBKEY_Y;

        function new(string name = "ecc_reg__ECC_PUBKEY_Y");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.PUBKEY_Y = new("PUBKEY_Y");
            this.PUBKEY_Y.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_PUBKEY_Y

    // Reg - ecc_reg::ECC_SIGN_R
    class ecc_reg__ECC_SIGN_R extends uvm_reg;
        rand uvm_reg_field SIGN_R;

        function new(string name = "ecc_reg__ECC_SIGN_R");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.SIGN_R = new("SIGN_R");
            this.SIGN_R.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_SIGN_R

    // Reg - ecc_reg::ECC_SIGN_S
    class ecc_reg__ECC_SIGN_S extends uvm_reg;
        rand uvm_reg_field SIGN_S;

        function new(string name = "ecc_reg__ECC_SIGN_S");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.SIGN_S = new("SIGN_S");
            this.SIGN_S.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_SIGN_S

    // Reg - ecc_reg::ECC_VERIFY_R
    class ecc_reg__ECC_VERIFY_R extends uvm_reg;
        rand uvm_reg_field VERIFY_R;

        function new(string name = "ecc_reg__ECC_VERIFY_R");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.VERIFY_R = new("VERIFY_R");
            this.VERIFY_R.configure(this, 32, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_VERIFY_R

    // Reg - ecc_reg::ECC_IV
    class ecc_reg__ECC_IV extends uvm_reg;
        rand uvm_reg_field IV;

        function new(string name = "ecc_reg__ECC_IV");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.IV = new("IV");
            this.IV.configure(this, 32, 0, "WO", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__ECC_IV

    // Reg - ecc_reg::intr_block_t::global_intr_en_t
    class ecc_reg__intr_block_t__global_intr_en_t extends uvm_reg;
        rand uvm_reg_field error_en;
        rand uvm_reg_field notif_en;

        function new(string name = "ecc_reg__intr_block_t__global_intr_en_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.error_en = new("error_en");
            this.error_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
            this.notif_en = new("notif_en");
            this.notif_en.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__global_intr_en_t

    // Reg - ecc_reg::intr_block_t::error_intr_en_t
    class ecc_reg__intr_block_t__error_intr_en_t extends uvm_reg;
        rand uvm_reg_field error_internal_en;

        function new(string name = "ecc_reg__intr_block_t__error_intr_en_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.error_internal_en = new("error_internal_en");
            this.error_internal_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__error_intr_en_t

    // Reg - ecc_reg::intr_block_t::notif_intr_en_t
    class ecc_reg__intr_block_t__notif_intr_en_t extends uvm_reg;
        rand uvm_reg_field notif_cmd_done_en;

        function new(string name = "ecc_reg__intr_block_t__notif_intr_en_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.notif_cmd_done_en = new("notif_cmd_done_en");
            this.notif_cmd_done_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__notif_intr_en_t

    // Reg - ecc_reg::intr_block_t::global_intr_t_agg_sts_dd3dcf0a
    class ecc_reg__intr_block_t__global_intr_t_agg_sts_dd3dcf0a extends uvm_reg;
        rand uvm_reg_field agg_sts;

        function new(string name = "ecc_reg__intr_block_t__global_intr_t_agg_sts_dd3dcf0a");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.agg_sts = new("agg_sts");
            this.agg_sts.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__global_intr_t_agg_sts_dd3dcf0a

    // Reg - ecc_reg::intr_block_t::global_intr_t_agg_sts_e6399b4a
    class ecc_reg__intr_block_t__global_intr_t_agg_sts_e6399b4a extends uvm_reg;
        rand uvm_reg_field agg_sts;

        function new(string name = "ecc_reg__intr_block_t__global_intr_t_agg_sts_e6399b4a");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.agg_sts = new("agg_sts");
            this.agg_sts.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__global_intr_t_agg_sts_e6399b4a

    // Reg - ecc_reg::intr_block_t::error_intr_t_error_internal_sts_83adab02
    class ecc_reg__intr_block_t__error_intr_t_error_internal_sts_83adab02 extends uvm_reg;
        rand uvm_reg_field error_internal_sts;

        function new(string name = "ecc_reg__intr_block_t__error_intr_t_error_internal_sts_83adab02");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.error_internal_sts = new("error_internal_sts");
            this.error_internal_sts.configure(this, 1, 0, "W1C", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__error_intr_t_error_internal_sts_83adab02

    // Reg - ecc_reg::intr_block_t::notif_intr_t_notif_cmd_done_sts_1c68637e
    class ecc_reg__intr_block_t__notif_intr_t_notif_cmd_done_sts_1c68637e extends uvm_reg;
        rand uvm_reg_field notif_cmd_done_sts;

        function new(string name = "ecc_reg__intr_block_t__notif_intr_t_notif_cmd_done_sts_1c68637e");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.notif_cmd_done_sts = new("notif_cmd_done_sts");
            this.notif_cmd_done_sts.configure(this, 1, 0, "W1C", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__notif_intr_t_notif_cmd_done_sts_1c68637e

    // Reg - ecc_reg::intr_block_t::error_intr_trig_t
    class ecc_reg__intr_block_t__error_intr_trig_t extends uvm_reg;
        rand uvm_reg_field error_internal_trig;

        function new(string name = "ecc_reg__intr_block_t__error_intr_trig_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.error_internal_trig = new("error_internal_trig");
            this.error_internal_trig.configure(this, 1, 0, "W1S", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__error_intr_trig_t

    // Reg - ecc_reg::intr_block_t::notif_intr_trig_t
    class ecc_reg__intr_block_t__notif_intr_trig_t extends uvm_reg;
        rand uvm_reg_field notif_cmd_done_trig;

        function new(string name = "ecc_reg__intr_block_t__notif_intr_trig_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.notif_cmd_done_trig = new("notif_cmd_done_trig");
            this.notif_cmd_done_trig.configure(this, 1, 0, "W1S", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__notif_intr_trig_t

    // Reg - ecc_reg::intr_block_t::intr_count_t_cnt_60ddff93
    class ecc_reg__intr_block_t__intr_count_t_cnt_60ddff93 extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "ecc_reg__intr_block_t__intr_count_t_cnt_60ddff93");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__intr_count_t_cnt_60ddff93

    // Reg - ecc_reg::intr_block_t::intr_count_t_cnt_be67d6d5
    class ecc_reg__intr_block_t__intr_count_t_cnt_be67d6d5 extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "ecc_reg__intr_block_t__intr_count_t_cnt_be67d6d5");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__intr_count_t_cnt_be67d6d5

    // Reg - ecc_reg::intr_block_t::intr_count_incr_t_pulse_15e6ed7e
    class ecc_reg__intr_block_t__intr_count_incr_t_pulse_15e6ed7e extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "ecc_reg__intr_block_t__intr_count_incr_t_pulse_15e6ed7e");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__intr_count_incr_t_pulse_15e6ed7e

    // Reg - ecc_reg::intr_block_t::intr_count_incr_t_pulse_6173128e
    class ecc_reg__intr_block_t__intr_count_incr_t_pulse_6173128e extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "ecc_reg__intr_block_t__intr_count_incr_t_pulse_6173128e");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : ecc_reg__intr_block_t__intr_count_incr_t_pulse_6173128e

    // Regfile - ecc_reg::intr_block_t
    class ecc_reg__intr_block_t extends uvm_reg_block;
        rand ecc_reg__intr_block_t__global_intr_en_t global_intr_en_r;
        rand ecc_reg__intr_block_t__error_intr_en_t error_intr_en_r;
        rand ecc_reg__intr_block_t__notif_intr_en_t notif_intr_en_r;
        rand ecc_reg__intr_block_t__global_intr_t_agg_sts_dd3dcf0a error_global_intr_r;
        rand ecc_reg__intr_block_t__global_intr_t_agg_sts_e6399b4a notif_global_intr_r;
        rand ecc_reg__intr_block_t__error_intr_t_error_internal_sts_83adab02 error_internal_intr_r;
        rand ecc_reg__intr_block_t__notif_intr_t_notif_cmd_done_sts_1c68637e notif_internal_intr_r;
        rand ecc_reg__intr_block_t__error_intr_trig_t error_intr_trig_r;
        rand ecc_reg__intr_block_t__notif_intr_trig_t notif_intr_trig_r;
        rand ecc_reg__intr_block_t__intr_count_t_cnt_60ddff93 error_internal_intr_count_r;
        rand ecc_reg__intr_block_t__intr_count_t_cnt_be67d6d5 notif_cmd_done_intr_count_r;
        rand ecc_reg__intr_block_t__intr_count_incr_t_pulse_15e6ed7e error_internal_intr_count_incr_r;
        rand ecc_reg__intr_block_t__intr_count_incr_t_pulse_6173128e notif_cmd_done_intr_count_incr_r;

        function new(string name = "ecc_reg__intr_block_t");
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
            this.error_internal_intr_count_r = new("error_internal_intr_count_r");
            this.error_internal_intr_count_r.configure(this);

            this.error_internal_intr_count_r.build();
            this.default_map.add_reg(this.error_internal_intr_count_r, 'h100);
            this.notif_cmd_done_intr_count_r = new("notif_cmd_done_intr_count_r");
            this.notif_cmd_done_intr_count_r.configure(this);

            this.notif_cmd_done_intr_count_r.build();
            this.default_map.add_reg(this.notif_cmd_done_intr_count_r, 'h180);
            this.error_internal_intr_count_incr_r = new("error_internal_intr_count_incr_r");
            this.error_internal_intr_count_incr_r.configure(this);

            this.error_internal_intr_count_incr_r.build();
            this.default_map.add_reg(this.error_internal_intr_count_incr_r, 'h200);
            this.notif_cmd_done_intr_count_incr_r = new("notif_cmd_done_intr_count_incr_r");
            this.notif_cmd_done_intr_count_incr_r.configure(this);

            this.notif_cmd_done_intr_count_incr_r.build();
            this.default_map.add_reg(this.notif_cmd_done_intr_count_incr_r, 'h204);
        endfunction : build
    endclass : ecc_reg__intr_block_t

    // Addrmap - ecc_reg
    class ecc_reg extends uvm_reg_block;
        rand ecc_reg__ECC_NAME ECC_NAME[2];
        rand ecc_reg__ECC_VERSION ECC_VERSION[2];
        rand ecc_reg__ECC_CTRL ECC_CTRL;
        rand ecc_reg__ECC_STATUS ECC_STATUS;
        rand ecc_reg__ECC_SCACONFIG ECC_SCACONFIG;
        rand ecc_reg__ECC_SEED ECC_SEED[12];
        rand ecc_reg__ECC_MSG ECC_MSG[12];
        rand ecc_reg__ECC_PRIVKEY ECC_PRIVKEY[12];
        rand ecc_reg__ECC_PUBKEY_X ECC_PUBKEY_X[12];
        rand ecc_reg__ECC_PUBKEY_Y ECC_PUBKEY_Y[12];
        rand ecc_reg__ECC_SIGN_R ECC_SIGN_R[12];
        rand ecc_reg__ECC_SIGN_S ECC_SIGN_S[12];
        rand ecc_reg__ECC_VERIFY_R ECC_VERIFY_R[12];
        rand ecc_reg__ECC_IV ECC_IV[12];
        rand ecc_reg__intr_block_t intr_block_rf;

        function new(string name = "ecc_reg");
            super.new(name);
        endfunction : new

        virtual function void build();
            this.default_map = create_map("reg_map", 0, 4, UVM_NO_ENDIAN);
            foreach(this.ECC_NAME[i0]) begin
                this.ECC_NAME[i0] = new($sformatf("ECC_NAME[%0d]", i0));
                this.ECC_NAME[i0].configure(this);
                
                this.ECC_NAME[i0].build();
                this.default_map.add_reg(this.ECC_NAME[i0], 'h0 + i0*'h4);
            end
            foreach(this.ECC_VERSION[i0]) begin
                this.ECC_VERSION[i0] = new($sformatf("ECC_VERSION[%0d]", i0));
                this.ECC_VERSION[i0].configure(this);
                
                this.ECC_VERSION[i0].build();
                this.default_map.add_reg(this.ECC_VERSION[i0], 'h8 + i0*'h4);
            end
            this.ECC_CTRL = new("ECC_CTRL");
            this.ECC_CTRL.configure(this);

            this.ECC_CTRL.build();
            this.default_map.add_reg(this.ECC_CTRL, 'h10);
            this.ECC_STATUS = new("ECC_STATUS");
            this.ECC_STATUS.configure(this);

            this.ECC_STATUS.build();
            this.default_map.add_reg(this.ECC_STATUS, 'h18);
            this.ECC_SCACONFIG = new("ECC_SCACONFIG");
            this.ECC_SCACONFIG.configure(this);

            this.ECC_SCACONFIG.build();
            this.default_map.add_reg(this.ECC_SCACONFIG, 'h20);
            foreach(this.ECC_SEED[i0]) begin
                this.ECC_SEED[i0] = new($sformatf("ECC_SEED[%0d]", i0));
                this.ECC_SEED[i0].configure(this);
                
                this.ECC_SEED[i0].build();
                this.default_map.add_reg(this.ECC_SEED[i0], 'h80 + i0*'h4);
            end
            foreach(this.ECC_MSG[i0]) begin
                this.ECC_MSG[i0] = new($sformatf("ECC_MSG[%0d]", i0));
                this.ECC_MSG[i0].configure(this);
                
                this.ECC_MSG[i0].build();
                this.default_map.add_reg(this.ECC_MSG[i0], 'h100 + i0*'h4);
            end
            foreach(this.ECC_PRIVKEY[i0]) begin
                this.ECC_PRIVKEY[i0] = new($sformatf("ECC_PRIVKEY[%0d]", i0));
                this.ECC_PRIVKEY[i0].configure(this);
                
                this.ECC_PRIVKEY[i0].build();
                this.default_map.add_reg(this.ECC_PRIVKEY[i0], 'h180 + i0*'h4);
            end
            foreach(this.ECC_PUBKEY_X[i0]) begin
                this.ECC_PUBKEY_X[i0] = new($sformatf("ECC_PUBKEY_X[%0d]", i0));
                this.ECC_PUBKEY_X[i0].configure(this);
                
                this.ECC_PUBKEY_X[i0].build();
                this.default_map.add_reg(this.ECC_PUBKEY_X[i0], 'h200 + i0*'h4);
            end
            foreach(this.ECC_PUBKEY_Y[i0]) begin
                this.ECC_PUBKEY_Y[i0] = new($sformatf("ECC_PUBKEY_Y[%0d]", i0));
                this.ECC_PUBKEY_Y[i0].configure(this);
                
                this.ECC_PUBKEY_Y[i0].build();
                this.default_map.add_reg(this.ECC_PUBKEY_Y[i0], 'h280 + i0*'h4);
            end
            foreach(this.ECC_SIGN_R[i0]) begin
                this.ECC_SIGN_R[i0] = new($sformatf("ECC_SIGN_R[%0d]", i0));
                this.ECC_SIGN_R[i0].configure(this);
                
                this.ECC_SIGN_R[i0].build();
                this.default_map.add_reg(this.ECC_SIGN_R[i0], 'h300 + i0*'h4);
            end
            foreach(this.ECC_SIGN_S[i0]) begin
                this.ECC_SIGN_S[i0] = new($sformatf("ECC_SIGN_S[%0d]", i0));
                this.ECC_SIGN_S[i0].configure(this);
                
                this.ECC_SIGN_S[i0].build();
                this.default_map.add_reg(this.ECC_SIGN_S[i0], 'h380 + i0*'h4);
            end
            foreach(this.ECC_VERIFY_R[i0]) begin
                this.ECC_VERIFY_R[i0] = new($sformatf("ECC_VERIFY_R[%0d]", i0));
                this.ECC_VERIFY_R[i0].configure(this);
                
                this.ECC_VERIFY_R[i0].build();
                this.default_map.add_reg(this.ECC_VERIFY_R[i0], 'h400 + i0*'h4);
            end
            foreach(this.ECC_IV[i0]) begin
                this.ECC_IV[i0] = new($sformatf("ECC_IV[%0d]", i0));
                this.ECC_IV[i0].configure(this);
                
                this.ECC_IV[i0].build();
                this.default_map.add_reg(this.ECC_IV[i0], 'h480 + i0*'h4);
            end
            this.intr_block_rf = new("intr_block_rf");
            this.intr_block_rf.configure(this);
            this.intr_block_rf.build();
            this.default_map.add_submap(this.intr_block_rf.default_map, 'h800);
        endfunction : build
    endclass : ecc_reg

endpackage: ecc_reg_uvm
