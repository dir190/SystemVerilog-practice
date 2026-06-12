module FA_tb;


reg  a,b,cin  ;
wire sum,count;
fulladder m_tb (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .count(count)
    );
    initial begin
        $dumpfile("fa.vcd");
        $dumpvars(0,FA_tb);
        $monitor($time,"$time, a=%b,b=%b,cin=%b, sum=%b, count=%b",a,b,cin,sum,count);
        #5 a=0; b=0; cin=0;
        #5 a=0; b=0; cin=1;
        #5 a=0; b=1; cin=0;
        #5 a=0; b=1; cin=1;
        #5 a=1; b=0; cin=0;
        #5 a=1; b=0; cin=1;
        #5 a=1; b=1; cin=0;
        #5 a=1; b=1; cin=1;
        #5 a=1; b=1; cin=1;
        #5 $finish;
    end
endmodule