module ha_tb;


reg  a,b;
wire sum,count;
halfadder m_tb (
    .a(a),
    .b(b),
    .sum(sum),
    .count(count)
    );
    initial begin
        $dumpfile("halfadder.vcd");
        $dumpvars(0,ha_tb);
        $monitor($time,"a=%b,b=%b",a,b,sum,count);
        #5 a=0; b=0;
        #5 a=0; b=1;
        #5 a=1; b=0;
        #5 a=1; b=1;
        #5 $finish;
    end
endmodule