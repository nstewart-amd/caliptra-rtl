
// This file was autogenerated by PeakRDL-uvm
package mbox_csr_uvm;
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    
    // Reg - mbox_csr::mbox_lock
    class mbox_csr__mbox_lock extends uvm_reg;
        rand uvm_reg_field lock;

        function new(string name = "mbox_csr__mbox_lock");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.lock = new("lock");
            this.lock.configure(this, 1, 0, "RS", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : mbox_csr__mbox_lock

    // Reg - mbox_csr::mbox_user
    class mbox_csr__mbox_user extends uvm_reg;
        rand uvm_reg_field user;

        function new(string name = "mbox_csr__mbox_user");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.user = new("user");
            this.user.configure(this, 32, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : mbox_csr__mbox_user

    // Reg - mbox_csr::mbox_cmd
    class mbox_csr__mbox_cmd extends uvm_reg;
        rand uvm_reg_field command;

        function new(string name = "mbox_csr__mbox_cmd");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.command = new("command");
            this.command.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : mbox_csr__mbox_cmd

    // Reg - mbox_csr::mbox_dlen
    class mbox_csr__mbox_dlen extends uvm_reg;
        rand uvm_reg_field length;

        function new(string name = "mbox_csr__mbox_dlen");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.length = new("length");
            this.length.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : mbox_csr__mbox_dlen

    // Reg - mbox_csr::mbox_datain
    class mbox_csr__mbox_datain extends uvm_reg;
        rand uvm_reg_field datain;

        function new(string name = "mbox_csr__mbox_datain");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.datain = new("datain");
            this.datain.configure(this, 32, 0, "RW", 0, 'h0, 0, 1, 0);
        endfunction : build
    endclass : mbox_csr__mbox_datain

    // Reg - mbox_csr::mbox_dataout
    class mbox_csr__mbox_dataout extends uvm_reg;
        rand uvm_reg_field dataout;

        function new(string name = "mbox_csr__mbox_dataout");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.dataout = new("dataout");
            this.dataout.configure(this, 32, 0, "RW", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : mbox_csr__mbox_dataout

    // Reg - mbox_csr::mbox_execute
    class mbox_csr__mbox_execute extends uvm_reg;
        rand uvm_reg_field execute;

        function new(string name = "mbox_csr__mbox_execute");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.execute = new("execute");
            this.execute.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : mbox_csr__mbox_execute

    // Reg - mbox_csr::mbox_status_ecc_double_error_38cec4b0_ecc_single_error_9c62b760
    class mbox_csr__mbox_status_ecc_double_error_38cec4b0_ecc_single_error_9c62b760 extends uvm_reg;
        rand uvm_reg_field status;
        rand uvm_reg_field ecc_single_error;
        rand uvm_reg_field ecc_double_error;

        function new(string name = "mbox_csr__mbox_status_ecc_double_error_38cec4b0_ecc_single_error_9c62b760");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.status = new("status");
            this.status.configure(this, 2, 0, "RW", 0, 'h0, 1, 1, 0);
            this.ecc_single_error = new("ecc_single_error");
            this.ecc_single_error.configure(this, 1, 2, "RO", 1, 'h0, 1, 1, 0);
            this.ecc_double_error = new("ecc_double_error");
            this.ecc_double_error.configure(this, 1, 3, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : mbox_csr__mbox_status_ecc_double_error_38cec4b0_ecc_single_error_9c62b760

    // Addrmap - mbox_csr
    class mbox_csr extends uvm_reg_block;
        rand mbox_csr__mbox_lock mbox_lock;
        rand mbox_csr__mbox_user mbox_user;
        rand mbox_csr__mbox_cmd mbox_cmd;
        rand mbox_csr__mbox_dlen mbox_dlen;
        rand mbox_csr__mbox_datain mbox_datain;
        rand mbox_csr__mbox_dataout mbox_dataout;
        rand mbox_csr__mbox_execute mbox_execute;
        rand mbox_csr__mbox_status_ecc_double_error_38cec4b0_ecc_single_error_9c62b760 mbox_status;

        function new(string name = "mbox_csr");
            super.new(name);
        endfunction : new

        virtual function void build();
            this.default_map = create_map("reg_map", 0, 4, UVM_LITTLE_ENDIAN);
            this.mbox_lock = new("mbox_lock");
            this.mbox_lock.configure(this);

            this.mbox_lock.build();
            this.default_map.add_reg(this.mbox_lock, 'h0);
            this.mbox_user = new("mbox_user");
            this.mbox_user.configure(this);

            this.mbox_user.build();
            this.default_map.add_reg(this.mbox_user, 'h4);
            this.mbox_cmd = new("mbox_cmd");
            this.mbox_cmd.configure(this);

            this.mbox_cmd.build();
            this.default_map.add_reg(this.mbox_cmd, 'h8);
            this.mbox_dlen = new("mbox_dlen");
            this.mbox_dlen.configure(this);

            this.mbox_dlen.build();
            this.default_map.add_reg(this.mbox_dlen, 'hc);
            this.mbox_datain = new("mbox_datain");
            this.mbox_datain.configure(this);

            this.mbox_datain.build();
            this.default_map.add_reg(this.mbox_datain, 'h10);
            this.mbox_dataout = new("mbox_dataout");
            this.mbox_dataout.configure(this);

            this.mbox_dataout.build();
            this.default_map.add_reg(this.mbox_dataout, 'h14);
            this.mbox_execute = new("mbox_execute");
            this.mbox_execute.configure(this);

            this.mbox_execute.build();
            this.default_map.add_reg(this.mbox_execute, 'h18);
            this.mbox_status = new("mbox_status");
            this.mbox_status.configure(this);

            this.mbox_status.build();
            this.default_map.add_reg(this.mbox_status, 'h1c);
        endfunction : build
    endclass : mbox_csr

endpackage: mbox_csr_uvm
