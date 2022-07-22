// SPDX-License-Identifier: Apache-2.0
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

`include "caliptra_macros.svh"
`include "caliptra_sva.svh"

module ahb_slv_sif #(
    parameter AHB_DATA_WIDTH = 64
   ,parameter CLIENT_DATA_WIDTH = 32
   ,parameter ADDR_WIDTH = 32

   )   
   (
    //AMBA AHB Lite INF
    input logic hclk,
    input logic hreset_n,
    input logic [ADDR_WIDTH-1:0] haddr_i,
    input logic [AHB_DATA_WIDTH-1:0] hwdata_i,
    input logic hsel_i,
    input logic hwrite_i,

    input logic hready_i,
    input logic [1:0] htrans_i,
    input logic [2:0] hsize_i,

    output logic hresp_o,
    output logic hreadyout_o,
    output logic [AHB_DATA_WIDTH-1:0] hrdata_o,

    //COMPONENT INF
    output logic                         dv,
    input  logic                         hold,
    input  logic                         error,
    output logic                         write,
    output logic [CLIENT_DATA_WIDTH-1:0] wdata,
    output logic [ADDR_WIDTH-1:0]        addr,

    input  logic [CLIENT_DATA_WIDTH-1:0] rdata
   );

//support bus widths:
//64b ahb, 32b client
//64b ahb, 64b client
generate begin: data_muxes
    if ((AHB_DATA_WIDTH == 32) & (CLIENT_DATA_WIDTH == 32)) begin
        always_comb begin
            unique casez (hsize_i)
                3'b000:  //byte
                    wdata = {{$bits(wdata)-8{1'b0}},hwdata_i[7:0]};
                3'b001:  //halfword
                    wdata = {{$bits(wdata)-16{1'b0}},hwdata_i[15:0]};
                3'b010:  //word
                    wdata = hwdata_i[31:0];
                default: //word
                wdata = hwdata_i[31:0];
            endcase;
        end
        always_comb hrdata_o = rdata;
    end else if ((AHB_DATA_WIDTH == 64) & (CLIENT_DATA_WIDTH == 32)) begin
        always_comb begin
            unique casez (hsize_i)
                3'b000:  //byte
                    wdata = {{$bits(wdata)-8{1'b0}},hwdata_i[7:0]};
                3'b001:  //halfword
                    wdata = {{$bits(wdata)-16{1'b0}},hwdata_i[15:0]};
                3'b010:  //word
                    wdata = addr[2]? hwdata_i[63:32] : hwdata_i[31:0];
                default: //word
                wdata = addr[2]? hwdata_i[63:32] : hwdata_i[31:0];
            endcase;
        end
        always_comb hrdata_o = addr[2] ? {rdata, 32'b0} : {32'b0, rdata};
    end else if ((AHB_DATA_WIDTH == 64) & (CLIENT_DATA_WIDTH == 64)) begin
        always_comb begin
            unique casez (hsize_i)
                3'b000:  //byte
                    wdata = {{$bits(wdata)-8{1'b0}},hwdata_i[7:0]};
                3'b001:  //halfword
                    wdata = {{$bits(wdata)-16{1'b0}},hwdata_i[15:0]};
                3'b010:  //word
                    wdata = addr[2]? hwdata_i[63:32] : hwdata_i[31:0];
                3'b011: //dword
                    wdata = hwdata_i;
                default: //dword
                    wdata = hwdata_i;
            endcase;
        end
        always_comb hrdata_o = rdata;
    end 
end
endgenerate

    always_ff @(posedge hclk or negedge hreset_n) begin
        if(!hreset_n) begin
            dv <= 1'b0;
            write <= 1'b0;
            addr <= '0;
        end
        else begin
            if (hready_i) begin
                dv <= hsel_i & htrans_i inside {2'b10, 2'b11};
            end
            if(hready_i & hsel_i) begin
                addr <= haddr_i;
                write <= hwrite_i & |htrans_i;
            end
        end
    end

    assign hreadyout_o = ~hold;
    assign hresp_o = error;

endmodule