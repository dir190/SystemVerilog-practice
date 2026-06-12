module comptwobit_tb;
    reg [1:0] a,b;
    integer i;
    wire c;
    comptwobit m1(a,b,c);
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,comptwobit_tb);
        $monitor("Time=%t | a=%b b=%b c=%b", $time,a,b,c);
        for (i = 0; i<=200; i++) begin
            #5
            a=$random;
            b=$random;
        end
        #5 $finish;
    end
endmodule