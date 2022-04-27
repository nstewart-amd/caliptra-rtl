//======================================================================
//
// sha256_ctrl.sv
// --------
// SHA256 controller for the AHb_lite interface.
//
//
// Author: Mojtaba Bisheh-Niasar
//======================================================================

module sha256_ctrl #(
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
    // sha256
    //----------------------------------------------------------------
    reg           sha256_cs;
    reg           sha256_we;
    reg  [31 : 0] sha256_address;
    reg  [63 : 0] sha256_write_data;
    reg  [63 : 0] sha256_read_data;
    reg           sha256_error;

    sha256 sha256_inst(
        .clk(clk),
        .reset_n(reset_n),
        .cs(sha256_cs),
        .we(sha256_we),
        .address(sha256_address),
        .write_data(sha256_write_data),
        .read_data(sha256_read_data),
        .error(sha256_error)
    );


    /*
    //----------------------------------------------------------------
    // fifo_in
    //----------------------------------------------------------------
    reg                     fifo_in_we,
    reg                     fifo_in_rd,
    reg                     fifo_in_full,
    reg                     fifo_in_empty,
    reg [DATA_WIDTH-1 : 0]  fifo_in_write_data,
    reg [DATA_WIDTH-1 : 0]  fifo_in_read_data

    fifo  fifo_in #(
        RAM_ADDR_WIDTH = 5,
        DATA_WIDTH = 64
    )
    (
        .clk(clk),
        .reset_n(reset_n),
        .we(fifo_in_we),
        .rd(fifo_in_rd),
        .fifo_full(fifo_in_full),
        .fifo_empty(fifo_in_empty),
        .write_data(fifo_in_write_data),
        .read_data(fifo_in_read_data)
    );
    */

    //----------------------------------------------------------------
    // AHB Slave node
    //----------------------------------------------------------------
    logic cs;
    logic write;
    logic [31:0] laddr, addr;
    logic [63:0] rdata;
    logic [63:0] hrdata;
    logic [63:0] hwdata;

    always @ (negedge clk) begin
        cs = (hsel_i & hready_i)? 1 : 0;
        hrdata <= rdata;
        if (write & hready_i) begin
            addr = laddr;
            case (hsize_i)
                3'b000: 
                    hwdata = {56'h00000000000000, hwdata_i[7:0]};
                3'b001: 
                    hwdata = {48'h000000000000, hwdata_i[15:0]};
                3'b010: 
                    hwdata = {32'h00000000, hwdata_i[31:0]};
                default:  // 3'b011: 
                    hwdata = hwdata_i[63:0];
            endcase;
        end
        else if(hready_i)
            addr = hadrr_i;
    end

    assign hrdata_o = hready_i ? hrdata : ~hrdata;
    assign hreadyout_o = 1;  //wscnt == 0;
    assign hresp_o = 0;

    always_ff @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            laddr <= 0;
            write <= 1'b0;
            rdata <= '0;
        end
        else begin
            if(hready_i & hsel_i) begin
                laddr <= hadrr_i;
                write <= hwrite_i & |htrans_i;
                if(|htrans_i & ~hwrite_i)
                    rdata <= sha256_read_data;
            end
        end
    end

    always_comb begin
        sha256_cs = cs;
        sha256_we = write;
        sha256_write_data = hwdata;
        sha256_address = addr;
    end


endmodule