module fulladder (

    input  a    ,
    input  b    ,
    input  cin  ,
    output sum  ,
    output count
    );

    assign sum   = a^b^cin          ;
    assign count = (a&b)|((a^b)&cin);

endmodule


module fourbitFA (
    input [3:0] a, b,
    input c,
    output [3:0] out,
    output cout
);
wire [2:0] w;
    fulladder fa0 (.a(a[0]), .b(b[0]), .cin(c), .sum(out[0]), .count(w[0]));
    fulladder fa1 (.a(a[1]), .b(b[1]), .cin(w[0]), .sum(out[1]), .count(w[1]));
    fulladder fa2 (.a(a[2]), .b(b[2]), .cin(w[1]), .sum(out[2]), .count(w[2]));
    fulladder fa3 (.a(a[3]), .b(b[3]), .cin(w[2]), .sum(out[3]), .count(cout));
endmodule