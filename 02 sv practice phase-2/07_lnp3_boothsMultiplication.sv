// FSMD Finite State Machine with Datapath
// This Design file with testbench file is named as prefix lnp3 means "Learning and practicing 3st design"
// Design an Booth's Multiplication machine
// Below is the flowchart given
// A is Multiplicant and B is Multiplier. There are n number of bit(Change according to needs) introduce a temporary registor T.
// Introduce a counter which value is the number of bit, i.e: n.
// Also introduce a B[n-1] called b_n_minus_one as bm.
// Whenever         B[0] > B_n_minus_one then T = T - A and shift right by one bit, decrease counter by one.
//          else if B[0] < B_n_minus_one then T = T + A and shift right by one bit, decrease counter by one.
//          else if B[0] = B_n_minus_one then        simple shift right by one bit, decrease counter by one.
// then if counter is not equal to 0 then again compare B[0] : B_n_minus_one
// If counter is equal to 0 then stop

module shiftreg (
    output reg [15:0] d_out,
    input [15:0] d_in,
    input in, ld, clk, clr, sft
);
    always @(posedge clk) begin
        if      (clr) d_out <= 16'b0;
        else if (ld ) d_out <= d_in;
        else if (sft) begin 
            d_out <= {in, d_out[15:1]};
        end
    end
endmodule

module dff(
    output reg d_out,
    input d_in,
    input ld, clk, clr
);
    always @(posedge clk) begin
        if      (clr) d_out <= 1'b0;
        else if (ld ) d_out <= d_in;
    end
endmodule

module pipo (
    output reg [15:0] d_out,
    input [15:0] d_in,
    input clk, ld
);
    always @(posedge clk) begin
        if (ld) d_out <= d_in;
    end
endmodule

module alu (
    output reg [15:0] d_out,
    input [15:0] in1, in2,
    input sel
);
    always @(*) begin
        if (sel == 1) d_out = in1 + in2 ;
        else d_out = in1 - in2 ;
    end
endmodule

module counter(
    output reg [4:0] out,
    input dec,
    input clk, ld
);
    always @(posedge clk) begin
        if (ld ) out <= 5'd16;
        else if (dec) out <= out - 1'b1;
    end
endmodule

module boothsMul_dp (
    output bmout, bout, eq0,
    output [4:0] ctout,
    input lda, ldb, clrb, sftb, ldt, clrt, sftt, ldbm, clrbm, ldct, decct, clk, sel,
    input [15:0] d_in
);
    wire [15:0] a, t, y, b;

    assign eq0 = ~|ctout;
    assign bout = b[0];

    pipo block_a(a, d_in, clk, lda);
    alu alu(y, t, a, sel);
    shiftreg block_t(t, y, t[15], ldt, clk, clrt, sftt);
    shiftreg block_b(b, d_in, t[0], ldb, clk, clrb, sftb);
    dff block_bm(bmout, b[0], ldbm, clk, clrbm);
    counter counter(ctout, decct, clk, ldct);
endmodule

module boothsMul_cp (
    input clk, rst, start, eq0, bout, bmout,
    output reg lda, ldb, sftb, clrb, ldt, sftt, clrt, ldbm, clrbm, ldct, decct, sel, stop
);
    reg [2:0] state;
    parameter S0 = 0, S1 =1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6;

    always @(posedge clk or posedge rst) begin
        if (rst) state <= S0;
        else begin
            case (state)
                S0: begin 
                    if (start) state <= S1;
                    else state <= S0;
                end
                S1: begin state <= S2; end
                S2, S5: begin
                    if (eq0)                         state <= S6;
                    else if ({bout, bmout} == 2'b01) state <= S3;
                    else if ({bout, bmout} == 2'b10) state <= S4;
                    else                             state <= S5;
                end
                S3, S4: begin state <= S5; end
                S6: begin state <=S6; end
                default: begin state <= S0; end
            endcase
        end
    end

    always @(*) begin
            lda=1'b0; ldb=1'b0; sftb=1'b0; clrb=1'b0; ldt=1'b0; sftt=1'b0; clrt=1'b0; ldbm=1'b0; clrbm=1'b0; ldct=1'b0; decct=1'b0; sel=1'b0; stop = 1'b0;

            case (state)
                S0: ;
                S1: begin
                    lda = 1'b1; clrt = 1'b1; clrbm = 1'b1; ldct = 1'b1; ldt= 1'b1; ldbm = 1'b1; clrb = 1;
                    end
                S2: begin
                    ldb = 1;
                end
                S3: begin
                    ldt = 1; sel = 1;
                end
                S4: begin
                    ldt = 1; sel = 0;
                end
                S5: begin
                    sftb = 1; sftt = 1; decct = 1; ldbm = 1;
                end
                S6: begin
                    stop = 1;
                end
                default: begin 
                    lda=1'b0; ldb=1'b0; sftb=1'b0; clrb=1'b0; ldt=1'b0; sftt=1'b0; clrt=1'b0; ldbm=1'b0; clrbm=1'b0; ldct=1'b0; decct=1'b0; sel=1'b0; stop = 1'b0;
                    end
            endcase
        end
endmodule