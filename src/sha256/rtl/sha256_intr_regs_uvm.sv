
// This file was autogenerated by PeakRDL-uvm
package sha256_intr_regs_uvm;
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    
    // Reg - sha256_intr_regs::global_intr_en_t
    class sha256_intr_regs__global_intr_en_t extends uvm_reg;
        rand uvm_reg_field error_en;
        rand uvm_reg_field notif_en;

        function new(string name = "sha256_intr_regs__global_intr_en_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.error_en = new("error_en");
            this.error_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
            this.notif_en = new("notif_en");
            this.notif_en.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__global_intr_en_t

    // Reg - sha256_intr_regs::error_intr_en_t
    class sha256_intr_regs__error_intr_en_t extends uvm_reg;
        rand uvm_reg_field error0_en;
        rand uvm_reg_field error1_en;
        rand uvm_reg_field error2_en;
        rand uvm_reg_field error3_en;

        function new(string name = "sha256_intr_regs__error_intr_en_t");
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
    endclass : sha256_intr_regs__error_intr_en_t

    // Reg - sha256_intr_regs::notif_intr_en_t
    class sha256_intr_regs__notif_intr_en_t extends uvm_reg;
        rand uvm_reg_field notif_cmd_done_en;

        function new(string name = "sha256_intr_regs__notif_intr_en_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.notif_cmd_done_en = new("notif_cmd_done_en");
            this.notif_cmd_done_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__notif_intr_en_t

    // Reg - sha256_intr_regs::global_intr_t_agg_sts_dd3dcf0a
    class sha256_intr_regs__global_intr_t_agg_sts_dd3dcf0a extends uvm_reg;
        rand uvm_reg_field agg_sts;

        function new(string name = "sha256_intr_regs__global_intr_t_agg_sts_dd3dcf0a");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.agg_sts = new("agg_sts");
            this.agg_sts.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__global_intr_t_agg_sts_dd3dcf0a

    // Reg - sha256_intr_regs::global_intr_t_agg_sts_e6399b4a
    class sha256_intr_regs__global_intr_t_agg_sts_e6399b4a extends uvm_reg;
        rand uvm_reg_field agg_sts;

        function new(string name = "sha256_intr_regs__global_intr_t_agg_sts_e6399b4a");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.agg_sts = new("agg_sts");
            this.agg_sts.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__global_intr_t_agg_sts_e6399b4a

    // Reg - sha256_intr_regs::error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378
    class sha256_intr_regs__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378 extends uvm_reg;
        rand uvm_reg_field error0_sts;
        rand uvm_reg_field error1_sts;
        rand uvm_reg_field error2_sts;
        rand uvm_reg_field error3_sts;

        function new(string name = "sha256_intr_regs__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378");
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
    endclass : sha256_intr_regs__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378

    // Reg - sha256_intr_regs::notif_intr_t_notif_cmd_done_sts_1c68637e
    class sha256_intr_regs__notif_intr_t_notif_cmd_done_sts_1c68637e extends uvm_reg;
        rand uvm_reg_field notif_cmd_done_sts;

        function new(string name = "sha256_intr_regs__notif_intr_t_notif_cmd_done_sts_1c68637e");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.notif_cmd_done_sts = new("notif_cmd_done_sts");
            this.notif_cmd_done_sts.configure(this, 1, 0, "W1C", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__notif_intr_t_notif_cmd_done_sts_1c68637e

    // Reg - sha256_intr_regs::error_intr_trig_t
    class sha256_intr_regs__error_intr_trig_t extends uvm_reg;
        rand uvm_reg_field error0_trig;
        rand uvm_reg_field error1_trig;
        rand uvm_reg_field error2_trig;
        rand uvm_reg_field error3_trig;

        function new(string name = "sha256_intr_regs__error_intr_trig_t");
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
    endclass : sha256_intr_regs__error_intr_trig_t

    // Reg - sha256_intr_regs::notif_intr_trig_t
    class sha256_intr_regs__notif_intr_trig_t extends uvm_reg;
        rand uvm_reg_field notif_cmd_done_trig;

        function new(string name = "sha256_intr_regs__notif_intr_trig_t");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.notif_cmd_done_trig = new("notif_cmd_done_trig");
            this.notif_cmd_done_trig.configure(this, 1, 0, "W1S", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__notif_intr_trig_t

    // Reg - sha256_intr_regs::intr_count_t_cnt_35ace267
    class sha256_intr_regs__intr_count_t_cnt_35ace267 extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "sha256_intr_regs__intr_count_t_cnt_35ace267");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__intr_count_t_cnt_35ace267

    // Reg - sha256_intr_regs::intr_count_t_cnt_73c42c28
    class sha256_intr_regs__intr_count_t_cnt_73c42c28 extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "sha256_intr_regs__intr_count_t_cnt_73c42c28");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__intr_count_t_cnt_73c42c28

    // Reg - sha256_intr_regs::intr_count_t_cnt_d8af96ff
    class sha256_intr_regs__intr_count_t_cnt_d8af96ff extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "sha256_intr_regs__intr_count_t_cnt_d8af96ff");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__intr_count_t_cnt_d8af96ff

    // Reg - sha256_intr_regs::intr_count_t_cnt_9bd7f809
    class sha256_intr_regs__intr_count_t_cnt_9bd7f809 extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "sha256_intr_regs__intr_count_t_cnt_9bd7f809");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__intr_count_t_cnt_9bd7f809

    // Reg - sha256_intr_regs::intr_count_t_cnt_be67d6d5
    class sha256_intr_regs__intr_count_t_cnt_be67d6d5 extends uvm_reg;
        rand uvm_reg_field cnt;

        function new(string name = "sha256_intr_regs__intr_count_t_cnt_be67d6d5");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.cnt = new("cnt");
            this.cnt.configure(this, 32, 0, "RW", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__intr_count_t_cnt_be67d6d5

    // Reg - sha256_intr_regs::intr_count_incr_t_pulse_37026c97
    class sha256_intr_regs__intr_count_incr_t_pulse_37026c97 extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "sha256_intr_regs__intr_count_incr_t_pulse_37026c97");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__intr_count_incr_t_pulse_37026c97

    // Reg - sha256_intr_regs::intr_count_incr_t_pulse_d860d977
    class sha256_intr_regs__intr_count_incr_t_pulse_d860d977 extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "sha256_intr_regs__intr_count_incr_t_pulse_d860d977");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__intr_count_incr_t_pulse_d860d977

    // Reg - sha256_intr_regs::intr_count_incr_t_pulse_87b45fe7
    class sha256_intr_regs__intr_count_incr_t_pulse_87b45fe7 extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "sha256_intr_regs__intr_count_incr_t_pulse_87b45fe7");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__intr_count_incr_t_pulse_87b45fe7

    // Reg - sha256_intr_regs::intr_count_incr_t_pulse_c1689ee6
    class sha256_intr_regs__intr_count_incr_t_pulse_c1689ee6 extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "sha256_intr_regs__intr_count_incr_t_pulse_c1689ee6");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__intr_count_incr_t_pulse_c1689ee6

    // Reg - sha256_intr_regs::intr_count_incr_t_pulse_6173128e
    class sha256_intr_regs__intr_count_incr_t_pulse_6173128e extends uvm_reg;
        rand uvm_reg_field pulse;

        function new(string name = "sha256_intr_regs__intr_count_incr_t_pulse_6173128e");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.pulse = new("pulse");
            this.pulse.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_intr_regs__intr_count_incr_t_pulse_6173128e

    // Regfile - sha256_intr_regs::intr_block_t
    class sha256_intr_regs__intr_block_t extends uvm_reg_block;
        rand sha256_intr_regs__global_intr_en_t global_intr_en_r;
        rand sha256_intr_regs__error_intr_en_t error_intr_en_r;
        rand sha256_intr_regs__notif_intr_en_t notif_intr_en_r;
        rand sha256_intr_regs__global_intr_t_agg_sts_dd3dcf0a error_global_intr_r;
        rand sha256_intr_regs__global_intr_t_agg_sts_e6399b4a notif_global_intr_r;
        rand sha256_intr_regs__error_intr_t_error0_sts_28545624_error1_sts_40e0d3e1_error2_sts_b1cf2205_error3_sts_74a35378 error_internal_intr_r;
        rand sha256_intr_regs__notif_intr_t_notif_cmd_done_sts_1c68637e notif_internal_intr_r;
        rand sha256_intr_regs__error_intr_trig_t error_intr_trig_r;
        rand sha256_intr_regs__notif_intr_trig_t notif_intr_trig_r;
        rand sha256_intr_regs__intr_count_t_cnt_35ace267 error0_intr_count_r;
        rand sha256_intr_regs__intr_count_t_cnt_73c42c28 error1_intr_count_r;
        rand sha256_intr_regs__intr_count_t_cnt_d8af96ff error2_intr_count_r;
        rand sha256_intr_regs__intr_count_t_cnt_9bd7f809 error3_intr_count_r;
        rand sha256_intr_regs__intr_count_t_cnt_be67d6d5 notif_cmd_done_intr_count_r;
        rand sha256_intr_regs__intr_count_incr_t_pulse_37026c97 error0_intr_count_incr_r;
        rand sha256_intr_regs__intr_count_incr_t_pulse_d860d977 error1_intr_count_incr_r;
        rand sha256_intr_regs__intr_count_incr_t_pulse_87b45fe7 error2_intr_count_incr_r;
        rand sha256_intr_regs__intr_count_incr_t_pulse_c1689ee6 error3_intr_count_incr_r;
        rand sha256_intr_regs__intr_count_incr_t_pulse_6173128e notif_cmd_done_intr_count_incr_r;

        function new(string name = "sha256_intr_regs__intr_block_t");
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
    endclass : sha256_intr_regs__intr_block_t

    // Addrmap - sha256_intr_regs
    class sha256_intr_regs extends uvm_reg_block;
        rand sha256_intr_regs__intr_block_t intr_block_rf;

        function new(string name = "sha256_intr_regs");
            super.new(name);
        endfunction : new

        virtual function void build();
            this.default_map = create_map("reg_map", 0, 4, UVM_NO_ENDIAN);
            this.intr_block_rf = new("intr_block_rf");
            this.intr_block_rf.configure(this);
            this.intr_block_rf.build();
            this.default_map.add_submap(this.intr_block_rf.default_map, 'h0);
        endfunction : build
    endclass : sha256_intr_regs

endpackage: sha256_intr_regs_uvm
