module mux2x1frombasic (in,sel,out);
    input[1:0] in;
    input sel;
    output out;
    wire w0,w1,w2;
    NOT (w0,sel)
    AND (w1,in[0],sel)
    AND (w2,in[1],w0)
    OR (out,w1,w2)
endmodule