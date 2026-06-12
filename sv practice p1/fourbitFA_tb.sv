module fourbitFA_tb;
reg [3:0] a,b;
reg c;
wire [3:0] s;
wire cout;
fourbitFA m1(.a(a), .b(b), .c(c), .cout(cout), .out(s));
initial begin
    $dumpfile("fourbitfa.vcd");
    $dumpvars(0, fourbitFA_tb);
    $monitor("Time=%0t | a=%b b=%b c=%b | sum=%b cout=%b", $time, a, b, c, s, cout);
    #5 a=4'b0000; b=4'b0000; c=1'b0;
    #5 a=4'b0011; b=4'b0011; c=1'b1;
    #5 a=4'b1100; b=4'b1100; c=1'b1;
    #5 a=4'b0110; b=4'b0110; c=1'b0;
end
    
endmodule