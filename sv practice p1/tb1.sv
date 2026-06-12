module mux;

reg  [15:0] i;
reg   [3:0] c;
wire        o;
myfirstmodule m1 (.inputs(i), .criteria(c), .outputs(o));
initial begin
    $dumpfile("dumpfile16to1MUX.vcd");
    $dumpvars (0,m1);
    $monitor ($time, "i=%h c=%h o=%b", i,c,o);
    #5 i=16'h1f06; c=4'h0;
    #5 c=4'h3;
    #5 c=4'h7;
    #5 c=4'hb;
    #5 $finish;
end
endmodule