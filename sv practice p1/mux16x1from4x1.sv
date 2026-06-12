module mux16x1from4x1 (in,sel,out);
input [15:0] in;
input [3:0] sel;
wire [3:0] w;
output out;

mux4x1from2x1 m1 (in[3:0], sel[1:0],w[0]);
mux4x1from2x1 m2 (in[7:4], sel[1:0],w[1]);
mux4x1from2x1 m3 (in[11:8], sel[1:0],w[2]);
mux4x1from2x1 m4 (in[15:12], sel[1:0],w[3]);
mux4x1from2x1 m5 (w, sel[3:2], out);
endmodule
