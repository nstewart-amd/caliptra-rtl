
// This file was autogenerated by PeakRDL-uvm
package sha256_reg_uvm;
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    
    // Reg - sha256_reg::SHA256_NAME
    class sha256_reg__SHA256_NAME extends uvm_reg;
        rand uvm_reg_field NAME;

        function new(string name = "sha256_reg__SHA256_NAME");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.NAME = new("NAME");
            this.NAME.configure(this, 32, 0, "RO", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : sha256_reg__SHA256_NAME

    // Reg - sha256_reg::SHA256_VERSION
    class sha256_reg__SHA256_VERSION extends uvm_reg;
        rand uvm_reg_field VERSION;

        function new(string name = "sha256_reg__SHA256_VERSION");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.VERSION = new("VERSION");
            this.VERSION.configure(this, 32, 0, "RO", 1, 'h0, 0, 1, 0);
        endfunction : build
    endclass : sha256_reg__SHA256_VERSION

    // Reg - sha256_reg::SHA256_CTRL
    class sha256_reg__SHA256_CTRL extends uvm_reg;
        rand uvm_reg_field INIT;
        rand uvm_reg_field NEXT;
        rand uvm_reg_field MODE;

        function new(string name = "sha256_reg__SHA256_CTRL");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.INIT = new("INIT");
            this.INIT.configure(this, 1, 0, "WO", 1, 'h0, 1, 1, 0);
            this.NEXT = new("NEXT");
            this.NEXT.configure(this, 1, 1, "WO", 1, 'h0, 1, 1, 0);
            this.MODE = new("MODE");
            this.MODE.configure(this, 1, 2, "WO", 1, 'h1, 1, 1, 0);
        endfunction : build
    endclass : sha256_reg__SHA256_CTRL

    // Reg - sha256_reg::SHA256_STATUS
    class sha256_reg__SHA256_STATUS extends uvm_reg;
        rand uvm_reg_field READY;
        rand uvm_reg_field VALID;

        function new(string name = "sha256_reg__SHA256_STATUS");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.READY = new("READY");
            this.READY.configure(this, 1, 0, "RO", 1, 'h0, 1, 1, 0);
            this.VALID = new("VALID");
            this.VALID.configure(this, 1, 1, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_reg__SHA256_STATUS

    // Reg - sha256_reg::SHA256_BLOCK
    class sha256_reg__SHA256_BLOCK extends uvm_reg;
        rand uvm_reg_field BLOCK;

        function new(string name = "sha256_reg__SHA256_BLOCK");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.BLOCK = new("BLOCK");
            this.BLOCK.configure(this, 32, 0, "WO", 0, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_reg__SHA256_BLOCK

    // Reg - sha256_reg::SHA256_DIGEST
    class sha256_reg__SHA256_DIGEST extends uvm_reg;
        rand uvm_reg_field DIGEST;

        function new(string name = "sha256_reg__SHA256_DIGEST");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction : new

        virtual function void build();
            this.DIGEST = new("DIGEST");
            this.DIGEST.configure(this, 32, 0, "RO", 1, 'h0, 1, 1, 0);
        endfunction : build
    endclass : sha256_reg__SHA256_DIGEST

    // Addrmap - sha256_reg
    class sha256_reg extends uvm_reg_block;
        rand sha256_reg__SHA256_NAME SHA256_NAME[2];
        rand sha256_reg__SHA256_VERSION SHA256_VERSION[2];
        rand sha256_reg__SHA256_CTRL SHA256_CTRL;
        rand sha256_reg__SHA256_STATUS SHA256_STATUS;
        rand sha256_reg__SHA256_BLOCK SHA256_BLOCK[16];
        rand sha256_reg__SHA256_DIGEST SHA256_DIGEST[8];

        function new(string name = "sha256_reg");
            super.new(name);
        endfunction : new

        virtual function void build();
            this.default_map = create_map("reg_map", 0, 4, UVM_NO_ENDIAN);
            foreach(this.SHA256_NAME[i0]) begin
                this.SHA256_NAME[i0] = new($sformatf("SHA256_NAME[%0d]", i0));
                this.SHA256_NAME[i0].configure(this);
                
                this.SHA256_NAME[i0].build();
                this.default_map.add_reg(this.SHA256_NAME[i0], 'h0 + i0*'h4);
            end
            foreach(this.SHA256_VERSION[i0]) begin
                this.SHA256_VERSION[i0] = new($sformatf("SHA256_VERSION[%0d]", i0));
                this.SHA256_VERSION[i0].configure(this);
                
                this.SHA256_VERSION[i0].build();
                this.default_map.add_reg(this.SHA256_VERSION[i0], 'h8 + i0*'h4);
            end
            this.SHA256_CTRL = new("SHA256_CTRL");
            this.SHA256_CTRL.configure(this);

            this.SHA256_CTRL.build();
            this.default_map.add_reg(this.SHA256_CTRL, 'h10);
            this.SHA256_STATUS = new("SHA256_STATUS");
            this.SHA256_STATUS.configure(this);

            this.SHA256_STATUS.build();
            this.default_map.add_reg(this.SHA256_STATUS, 'h18);
            foreach(this.SHA256_BLOCK[i0]) begin
                this.SHA256_BLOCK[i0] = new($sformatf("SHA256_BLOCK[%0d]", i0));
                this.SHA256_BLOCK[i0].configure(this);
                
                this.SHA256_BLOCK[i0].build();
                this.default_map.add_reg(this.SHA256_BLOCK[i0], 'h80 + i0*'h4);
            end
            foreach(this.SHA256_DIGEST[i0]) begin
                this.SHA256_DIGEST[i0] = new($sformatf("SHA256_DIGEST[%0d]", i0));
                this.SHA256_DIGEST[i0].configure(this);
                
                this.SHA256_DIGEST[i0].build();
                this.default_map.add_reg(this.SHA256_DIGEST[i0], 'h100 + i0*'h4);
            end
        endfunction : build
    endclass : sha256_reg

endpackage: sha256_reg_uvm
