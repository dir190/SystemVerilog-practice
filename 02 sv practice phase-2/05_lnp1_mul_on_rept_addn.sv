// FSMD Finite State Machine with Datapath
// This Design file with testbench file is named as prefix lnp1 means "Learning and practicing 1st design"
// Design an unsigned multiplier which works on the principal of repeated addition
// Below is the datapath given
// Step 1: read(Input) A and B (B != 0) , A and B are 16 bit binary numbers
// Step 2: input and initialise P = 0
// Step 3: P = P + A
// Step 4: Check whether B = 0 or not , if B != 0 then B = B - 1 then run step 3
// Step 5: If B = 0 then stop

module PIPO1 (dout, din, ld, clk);
    input [15:0] din;
    input ld,clk;
    output reg [15:0] dout;

    always @(posedge clk)
        if (ld) dout <= din;
endmodule

module PIPO2 (dout, din, ld, clk, rst);
    input [15:0] din;
    input ld, clk, rst;
    output reg [15:0] dout;
    
    always @(posedge clk) begin
        if (rst) dout <= 16'b0;
        else if (ld) dout <= din;
    end
endmodule

module adder (out, in1, in2);
    input [15:0] in1, in2;
    output reg [15:0] out;

    always @(*)
    out = in1 + in2;
endmodule

module decr (dout, din, ld, clk, dec);
    input [15:0] din;
    input ld, clk, dec;
    output reg [15:0] dout;

    always @(posedge clk) begin
        if (ld) dout <= din;
        else if (dec) dout <= dout - 1;
    end
endmodule

module eq0 (com, data);
    input [15:0] data;
    output com;

    assign com = (data == 1);
endmodule

module mul_datapath (
    input [15:0] a_in, b_in,
    input lda, ldb, decb, ldp, clrp, clk,
    output eqz,
    output [15:0] p_out
);
    wire [15:0] x, y, z, bout;

    assign p_out = y;

    PIPO1 blockA(x, a_in, lda, clk);
    PIPO2 blockP(y, z, ldp, clk, clrp);
    adder adderPA(z, x, y);
    decr decrementerB(bout, b_in, ldb, clk, decb);
    eq0 comparatorB20(eqz, bout);
endmodule

module mul_controlpath (
    output reg lda, ldb, decb, ldp, clrp, stop,
    input eqz, clk, start, rst
);

    reg [2:0] state;
    parameter S0=3'd0, S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4;

    always @(posedge clk or posedge rst) begin
        if (rst) state <= S0;
        else begin
            case (state)
                S0: if(start) state <= S1;
                S1: state <= S2;
                S2: state <= S3;
                S3: if (eqz) state <=S4; else state <= S3;
                S4: state <= S4;
                default: state <= S0;
            endcase
        end
    end

    always @(*) begin
        lda=0; ldb=0; decb=0; ldp=0; clrp=0; stop=0;
        case (state)
            S0: ;
            S1: begin lda=1'b1; end
            S2: begin ldb=1'b1; clrp=1'b1; end
            S3: begin ldp=1'b1; decb=1'b1; end
            S4: begin stop=1'b1; end
            default: begin lda=0; ldb=0; ldp=0; clrp=0; decb=0; stop=0; end
        endcase
    end
endmodule
