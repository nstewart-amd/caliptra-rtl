
// This file was autogenerated by PeakRDL-uvm
package ecc_reg_uvm;
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    
    // Reg - ecc_reg::ecc_NAME
    class ecc_reg__ecc_NAME extends uvm_reg;
        rand uvm_reg_field NAME;

        function new(string name = "ecc_reg__ecc_NAME");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.NAME = new("NAME");
            this.NAME.configure(this, 32, 0, "RO", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_NAME

    // Reg - ecc_reg::ecc_VERSION
    class ecc_reg__ecc_VERSION extends uvm_reg;
        rand uvm_reg_field VERSION;

        function new(string name = "ecc_reg__ecc_VERSION");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.VERSION = new("VERSION");
            this.VERSION.configure(this, 32, 0, "RO", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_VERSION

    // Reg - ecc_reg::ecc_CTRL
    class ecc_reg__ecc_CTRL extends uvm_reg;
        rand uvm_reg_field CTRL;

        function new(string name = "ecc_reg__ecc_CTRL");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.CTRL = new("CTRL");
            this.CTRL.configure(this, 2, 0, "RW", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_CTRL

    // Reg - ecc_reg::ecc_STATUS
    class ecc_reg__ecc_STATUS extends uvm_reg;
        rand uvm_reg_field STATUS;

        function new(string name = "ecc_reg__ecc_STATUS");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.STATUS = new("STATUS");
            this.STATUS.configure(this, 2, 0, "RO", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_STATUS

    // Reg - ecc_reg::ecc_SCACONFIG
    class ecc_reg__ecc_SCACONFIG extends uvm_reg;
        rand uvm_reg_field SCACONFIG;

        function new(string name = "ecc_reg__ecc_SCACONFIG");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.SCACONFIG = new("SCACONFIG");
            this.SCACONFIG.configure(this, 4, 0, "RW", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_SCACONFIG

    // Reg - ecc_reg::ecc_SEED
    class ecc_reg__ecc_SEED extends uvm_reg;
        rand uvm_reg_field SEED;

        function new(string name = "ecc_reg__ecc_SEED");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.SEED = new("SEED");
            this.SEED.configure(this, 32, 0, "RW", 0, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_SEED

    // Reg - ecc_reg::ecc_MSG
    class ecc_reg__ecc_MSG extends uvm_reg;
        rand uvm_reg_field MSG;

        function new(string name = "ecc_reg__ecc_MSG");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.MSG = new("MSG");
            this.MSG.configure(this, 32, 0, "RW", 0, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_MSG

    // Reg - ecc_reg::ecc_PRIVKEY
    class ecc_reg__ecc_PRIVKEY extends uvm_reg;
        rand uvm_reg_field PRIVKEY;

        function new(string name = "ecc_reg__ecc_PRIVKEY");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.PRIVKEY = new("PRIVKEY");
            this.PRIVKEY.configure(this, 32, 0, "RW", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_PRIVKEY

    // Reg - ecc_reg::ecc_PUBKEY_X
    class ecc_reg__ecc_PUBKEY_X extends uvm_reg;
        rand uvm_reg_field PUBKEY_X;

        function new(string name = "ecc_reg__ecc_PUBKEY_X");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.PUBKEY_X = new("PUBKEY_X");
            this.PUBKEY_X.configure(this, 32, 0, "RW", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_PUBKEY_X

    // Reg - ecc_reg::ecc_PUBKEY_Y
    class ecc_reg__ecc_PUBKEY_Y extends uvm_reg;
        rand uvm_reg_field PUBKEY_Y;

        function new(string name = "ecc_reg__ecc_PUBKEY_Y");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.PUBKEY_Y = new("PUBKEY_Y");
            this.PUBKEY_Y.configure(this, 32, 0, "RW", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_PUBKEY_Y

    // Reg - ecc_reg::ecc_SIGN_R
    class ecc_reg__ecc_SIGN_R extends uvm_reg;
        rand uvm_reg_field SIGN_R;

        function new(string name = "ecc_reg__ecc_SIGN_R");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.SIGN_R = new("SIGN_R");
            this.SIGN_R.configure(this, 32, 0, "RW", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_SIGN_R

    // Reg - ecc_reg::ecc_SIGN_S
    class ecc_reg__ecc_SIGN_S extends uvm_reg;
        rand uvm_reg_field SIGN_S;

        function new(string name = "ecc_reg__ecc_SIGN_S");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.SIGN_S = new("SIGN_S");
            this.SIGN_S.configure(this, 32, 0, "RW", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_SIGN_S

    // Reg - ecc_reg::ecc_VERIFY_R
    class ecc_reg__ecc_VERIFY_R extends uvm_reg;
        rand uvm_reg_field VERIFY_R;

        function new(string name = "ecc_reg__ecc_VERIFY_R");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.VERIFY_R = new("VERIFY_R");
            this.VERIFY_R.configure(this, 32, 0, "RO", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_VERIFY_R

    // Reg - ecc_reg::ecc_IV
    class ecc_reg__ecc_IV extends uvm_reg;
        rand uvm_reg_field IV;

        function new(string name = "ecc_reg__ecc_IV");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.IV = new("IV");
            this.IV.configure(this, 32, 0, "RW", 0, 'h0, 0, 1, 0);
        endfunction : build
    endclass : ecc_reg__ecc_IV

    // Addrmap - ecc_reg
    class ecc_reg extends uvm_reg_block;
        rand ecc_reg__ecc_NAME ecc_NAME[2];
        rand ecc_reg__ecc_VERSION ecc_VERSION[2];
        rand ecc_reg__ecc_CTRL ecc_CTRL;
        rand ecc_reg__ecc_STATUS ecc_STATUS;
        rand ecc_reg__ecc_SCACONFIG ecc_SCACONFIG;
        rand ecc_reg__ecc_SEED ecc_SEED[12];
        rand ecc_reg__ecc_MSG ecc_MSG[12];
        rand ecc_reg__ecc_PRIVKEY ecc_PRIVKEY[12];
        rand ecc_reg__ecc_PUBKEY_X ecc_PUBKEY_X[12];
        rand ecc_reg__ecc_PUBKEY_Y ecc_PUBKEY_Y[12];
        rand ecc_reg__ecc_SIGN_R ecc_SIGN_R[12];
        rand ecc_reg__ecc_SIGN_S ecc_SIGN_S[12];
        rand ecc_reg__ecc_VERIFY_R ecc_VERIFY_R[12];
        rand ecc_reg__ecc_IV ecc_IV[12];

        function new(string name = "ecc_reg");
            super.new(name);
        endfunction : new

        virtual function void build();
            this.default_map = create_map("reg_map", 0, 4, UVM_NO_ENDIAN);
            foreach(this.ecc_NAME[i0]) begin
                this.ecc_NAME[i0] = new($sformatf("ecc_NAME[%0d]", i0));
                this.ecc_NAME[i0].configure(this);
                
                this.ecc_NAME[i0].build();
                this.default_map.add_reg(this.ecc_NAME[i0], 'h0 + i0*'h4);
            end
            foreach(this.ecc_VERSION[i0]) begin
                this.ecc_VERSION[i0] = new($sformatf("ecc_VERSION[%0d]", i0));
                this.ecc_VERSION[i0].configure(this);
                
                this.ecc_VERSION[i0].build();
                this.default_map.add_reg(this.ecc_VERSION[i0], 'h8 + i0*'h4);
            end
            this.ecc_CTRL = new("ecc_CTRL");
            this.ecc_CTRL.configure(this);

            this.ecc_CTRL.build();
            this.default_map.add_reg(this.ecc_CTRL, 'h10);
            this.ecc_STATUS = new("ecc_STATUS");
            this.ecc_STATUS.configure(this);

            this.ecc_STATUS.build();
            this.default_map.add_reg(this.ecc_STATUS, 'h18);
            this.ecc_SCACONFIG = new("ecc_SCACONFIG");
            this.ecc_SCACONFIG.configure(this);

            this.ecc_SCACONFIG.build();
            this.default_map.add_reg(this.ecc_SCACONFIG, 'h20);
            foreach(this.ecc_SEED[i0]) begin
                this.ecc_SEED[i0] = new($sformatf("ecc_SEED[%0d]", i0));
                this.ecc_SEED[i0].configure(this);
                
                this.ecc_SEED[i0].build();
                this.default_map.add_reg(this.ecc_SEED[i0], 'h80 + i0*'h4);
            end
            foreach(this.ecc_MSG[i0]) begin
                this.ecc_MSG[i0] = new($sformatf("ecc_MSG[%0d]", i0));
                this.ecc_MSG[i0].configure(this);
                
                this.ecc_MSG[i0].build();
                this.default_map.add_reg(this.ecc_MSG[i0], 'h100 + i0*'h4);
            end
            foreach(this.ecc_PRIVKEY[i0]) begin
                this.ecc_PRIVKEY[i0] = new($sformatf("ecc_PRIVKEY[%0d]", i0));
                this.ecc_PRIVKEY[i0].configure(this);
                
                this.ecc_PRIVKEY[i0].build();
                this.default_map.add_reg(this.ecc_PRIVKEY[i0], 'h180 + i0*'h4);
            end
            foreach(this.ecc_PUBKEY_X[i0]) begin
                this.ecc_PUBKEY_X[i0] = new($sformatf("ecc_PUBKEY_X[%0d]", i0));
                this.ecc_PUBKEY_X[i0].configure(this);
                
                this.ecc_PUBKEY_X[i0].build();
                this.default_map.add_reg(this.ecc_PUBKEY_X[i0], 'h200 + i0*'h4);
            end
            foreach(this.ecc_PUBKEY_Y[i0]) begin
                this.ecc_PUBKEY_Y[i0] = new($sformatf("ecc_PUBKEY_Y[%0d]", i0));
                this.ecc_PUBKEY_Y[i0].configure(this);
                
                this.ecc_PUBKEY_Y[i0].build();
                this.default_map.add_reg(this.ecc_PUBKEY_Y[i0], 'h280 + i0*'h4);
            end
            foreach(this.ecc_SIGN_R[i0]) begin
                this.ecc_SIGN_R[i0] = new($sformatf("ecc_SIGN_R[%0d]", i0));
                this.ecc_SIGN_R[i0].configure(this);
                
                this.ecc_SIGN_R[i0].build();
                this.default_map.add_reg(this.ecc_SIGN_R[i0], 'h300 + i0*'h4);
            end
            foreach(this.ecc_SIGN_S[i0]) begin
                this.ecc_SIGN_S[i0] = new($sformatf("ecc_SIGN_S[%0d]", i0));
                this.ecc_SIGN_S[i0].configure(this);
                
                this.ecc_SIGN_S[i0].build();
                this.default_map.add_reg(this.ecc_SIGN_S[i0], 'h380 + i0*'h4);
            end
            foreach(this.ecc_VERIFY_R[i0]) begin
                this.ecc_VERIFY_R[i0] = new($sformatf("ecc_VERIFY_R[%0d]", i0));
                this.ecc_VERIFY_R[i0].configure(this);
                
                this.ecc_VERIFY_R[i0].build();
                this.default_map.add_reg(this.ecc_VERIFY_R[i0], 'h400 + i0*'h4);
            end
            foreach(this.ecc_IV[i0]) begin
                this.ecc_IV[i0] = new($sformatf("ecc_IV[%0d]", i0));
                this.ecc_IV[i0].configure(this);
                
                this.ecc_IV[i0].build();
                this.default_map.add_reg(this.ecc_IV[i0], 'h480 + i0*'h4);
            end
        endfunction : build
    endclass : ecc_reg

endpackage: ecc_reg_uvm
