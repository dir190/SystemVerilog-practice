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

