module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    assign s = a[7:0] + b[7:0];
    assign overflow = (a[7]==b[7])&&(s[7]!=a[7]);

endmodule
