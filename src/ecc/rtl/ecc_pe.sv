//======================================================================
//
// ecc_pe.sv
// --------
// processing element for Montgomery Multiplier based on 
// Optimized Algorithms and Architectures for Montgomery Multiplication
// for Post-quantum Cryptography by Rami Elkhatib et. al.
//
// Author: Mojtaba Bisheh-Niasar
//======================================================================

module ecc_pe #(
    parameter RADIX = 32
)
(
    // Clock and reset.
    input  wire              clk,
    input  wire              reset_n,

    input  wire              start_in,
    // DATA PORT
    input  wire [RADIX-1:0]  a_in,
    input  wire [RADIX-1:0]  b_in,
    input  wire [RADIX-1:0]  p_in,
    input  wire [RADIX-1:0]  m_in,
    input  wire [RADIX-1:0]  s_in,
    input  wire [RADIX  :0]  c_in,
    input  wire              odd,

    output logic [RADIX-1:0] a_out,
    output logic [RADIX-1:0] m_out,
    output logic [RADIX-1:0] s_out,
    output logic [RADIX  :0] c_out
);


    //----------------------------------------------------------------
    // ecc_pe
    //----------------------------------------------------------------
    logic  [2*RADIX-1 : 0]    mult0_out;
    logic  [2*RADIX-1 : 0]    mult1_out;

    logic  [RADIX   : 0]      c_mux;
    logic  [RADIX-1 : 0]      s_mux;

    logic  [2*RADIX   : 0]    res;
    logic  [RADIX-1 : 0]      res_LSW;
    logic  [RADIX   : 0]      res_MSW;

    ecc_mult_dsp #(
        .RADIX(RADIX)
    ) MULT1 (
        .A(a_in),
        .B(b_in),
        .P(mult0_out)
    );

    ecc_mult_dsp #(
        .RADIX(RADIX)
    ) MULT2 (
        .A(p_in),
        .B(m_in),
        .P(mult1_out)
    );

    assign c_mux = odd ? c_out : c_in;
    assign s_mux = odd ? s_in : s_out;

    assign res_MSW = res[2*RADIX : RADIX];
    assign res_LSW = res[RADIX-1 : 0];

    always_comb begin
        res = {1'b0, mult0_out} + {1'b0, mult1_out} + c_mux + s_mux;
    end

    always_ff @(posedge clk) begin
        if (start_in) begin
            c_out <= 'b0;
        end else begin
            c_out <= res_MSW;
        end

        if (~reset_n) begin
            c_out <= 'b0;
        end
    end

    always_ff @(posedge clk) begin
        if (start_in) begin
            s_out <= 'b0;
        end else begin
            s_out <= res_LSW;
        end

        if (~reset_n) begin
            s_out <= 'b0;
        end
    end

    always_ff @(posedge clk) begin
        if (start_in) begin
            a_out <= 'b0;
        end else begin
            if (odd) begin
                a_out <= a_in;
            end
        end

        if (~reset_n) begin
            a_out <= 'b0;
        end
    end

    always_ff @(posedge clk) begin
        if (start_in) begin
            m_out <= 'b0;
        end else begin
            if (odd) begin
                m_out <= m_in;
            end
        end

        if (~reset_n) begin
            m_out <= 'b0;
        end
    end

endmodule