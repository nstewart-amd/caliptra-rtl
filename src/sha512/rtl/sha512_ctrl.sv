//======================================================================
//
// sha512_ctrl.sv
// --------
// SHA512 controller for the AHb_lite interface.
//
//
// Author: Mojtaba Bisheh-Niasar
//======================================================================

module sha512_ctrl #(
    parameter AHB_DATA_WIDTH = 64,
    parameter AHB_ADDR_WIDTH = 32,
    parameter BYPASS_HSEL = 0
)
(
    // Clock and reset.
    input wire           clk,
    input wire           reset_n,

    // from SLAVES PORT
    input logic [AHB_ADDR_WIDTH-1:0] hadrr_i,
    input logic [AHB_DATA_WIDTH-1:0] hwdata_i,
    input logic hsel_i,
    input logic hwrite_i,
    input logic hmastlock_i,
    input logic hready_i,
    input logic [1:0] htrans_i,
    input logic [3:0] hprot_i,
    input logic [2:0] hburst_i,
    input logic [2:0] hsize_i,

    output logic hresp_o,
    output logic hreadyout_o,
    output logic [AHB_DATA_WIDTH-1:0] hrdata_o
);

    //----------------------------------------------------------------
    // sha512
    //----------------------------------------------------------------
    reg           sha512_cs;
    reg           sha512_we;
    reg  [31 : 0] sha512_address;
    reg  [31 : 0] sha512_write_data;
    reg  [31 : 0] sha512_read_data;
    reg           sha512_error;

    sha512 #(
        .ADDR_WIDTH(32),
        .DATA_WIDTH(32)
        )
        sha512_inst(
        .clk(clk),
        .reset_n(reset_n),
        .cs(sha512_cs),
        .we(sha512_we),
        .address(sha512_address),
        .write_data(sha512_write_data),
        .read_data(sha512_read_data),
        .error(sha512_error)
    );

    //----------------------------------------------------------------
    // AHB Slave node
    //----------------------------------------------------------------
    logic cs;
    logic write;
    logic [AHB_ADDR_WIDTH-1 : 0] laddr, addr;
    logic [AHB_DATA_WIDTH-1 : 0] rdata;
    logic [AHB_DATA_WIDTH-1 : 0] hrdata;
    logic [AHB_DATA_WIDTH-1 : 0] hwdata;

    bit [7:0] wscnt;
    int dws = 0;
    int iws = 0;

    always @ (negedge clk) begin
        cs = (hsel_i & hready_i)? 1 : 0;
        hrdata <= rdata;
        if (write & hready_i) begin
            addr = laddr;
            hwdata = 0;
            case (hsize_i)
                3'b000: 
                    hwdata = hwdata_i[7:0];
                3'b001: 
                    hwdata = hwdata_i[15:0];
                3'b010: 
                    hwdata = laddr[2]? hwdata_i[63:32] : hwdata_i[31:0];
                default:  // 3'b011: 
                    hwdata = hwdata_i;
            endcase;
        end
        else if(hready_i)
            addr = hadrr_i;
        if(hready_i & hsel_i & |htrans_i)
            if(~hprot_i[0])
                iws = 0;
            if(hprot_i[0])
                dws = 0;
    end

    assign hrdata_o = hready_i ? hrdata : ~hrdata;
    assign hreadyout_o = wscnt == 0;
    assign hresp_o = 0;

    always_ff @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            laddr <= 0;
            write <= 1'b0;
            rdata <= '0;
            wscnt <= 0;
        end
        else begin
            if(hready_i & hsel_i) begin
                laddr <= hadrr_i;
                write <= hwrite_i & |htrans_i;
                if(|htrans_i & ~hwrite_i)
                    rdata <= sha512_read_data;
            end
        end
        if(hready_i & hsel_i & |htrans_i)
            wscnt <= hprot_i[0] ? dws[7:0] : iws[7:0];
        else if(wscnt != 0)
            wscnt <= wscnt-1;
    end

    always_comb begin
        sha512_cs = cs;
        sha512_we = write;
        sha512_write_data = hwdata;
        sha512_address = addr;
    end


endmodule