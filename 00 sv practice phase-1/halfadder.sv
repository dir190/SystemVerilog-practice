module halfadder (
    
    input a,
    input b,
    output sum,
    output count,
);
    assign sum = a^b;
    assign count = a&b;
endmodule