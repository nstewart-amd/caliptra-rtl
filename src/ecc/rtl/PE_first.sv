//======================================================================
//
// PE_first.sv
// --------
// 
//
//
// Author: Mojtaba Bisheh-Niasar
//======================================================================

module PE_first #(
    parameter RADIX = 32
)
(
    // Clock and reset.
    input wire           clk,
    input wire           reset_n,

    // DATA PORT
    input  logic [RADIX-1:0] a_in,
    input  logic [RADIX-1:0] b_in,
    input  logic [RADIX-1:0] s_in,
    input  logic             odd,

    output logic [RADIX-1:0] a_out,
    output logic [RADIX-1:0] m_out,
    output logic [RADIX  :0] c_out
);


    //----------------------------------------------------------------
    // PE_first
    //----------------------------------------------------------------
    logic  [2*RADIX-1 : 0]    mult_out;
    logic  [RADIX-1 : 0]      mult_out_MSW;
    logic  [RADIX-1 : 0]      mult_out_LSW;

    logic  [RADIX   : 0]      res_0;
    logic  [RADIX-1 : 0]      sum_0;
    logic  [RADIX-1 : 0]      carry_0;

    logic  [RADIX   : 0]      res_1;

    mult_dsp MULT1(
        .A(a_in),
        .B(b_in),
        .P(mult_out)
    );

    assign mult_out_MSW = mult_out[2*RADIX-1 : RADIX];
    assign mult_out_LSW = mult_out[RADIX-1 : 0];

    always_comb begin
        res_0 = {1'b0, s_in} + {1'b0, mult_out_LSW};
        sum_0 = res_0[RADIX-1 : 0];
        carry_0 = res_0[RADIX];
    end

    always_comb begin
        res_1 = {1'b0, mult_out_MSW} + {1'b0, sum_0} + {1'b0, carry_0};
    end

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            c_out <= 0;
        else
            c_out <= res_1;
    end

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            a_out <= 0;
        else if (odd)
            a_out <= a_in;
    end

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            m_out <= 0;
        else if (odd)
            m_out <= sum_0;
    end

endmodule