module centuaryadder (
    input[99:0] a,b,
    input cin,
    output [99:0] sum,
    output cout
);
    assign {cout,sum} = a+b+cin;
endmodule