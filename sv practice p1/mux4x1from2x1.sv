module mux4x1 (in,sel,out);
    input [3:0] in;
    input [1:0] sel;
    output out;
    wire [1:0] w;
    mux2x1frombasic m0 (in[1:0], sel[0], w[0]);
    mux2x1frombasic m1 (in[3:2], sel[0], w[1]);
    mux2x1frombasic m2 (w,sel[1], out);
endmodule
