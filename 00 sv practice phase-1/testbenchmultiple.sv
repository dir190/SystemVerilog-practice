module testbenchmultiple;

reg  [15:0] inp ;
reg   [1:0] crit;
wire        out;
mux16x1from4x1 m2(.in(inp), .sel(crit), .out(out));
intial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(0,m2);
    $monitor($time,"inp=%h, crit=%b,out=%b", inp,out);
    #5 inp=16'h1f06; crit=4'h1;
    #5 crit=4'h0;
    #5 crit=4'h0;
    #5 crit=4'h1;
    #5 $finish;
end
endmodule
