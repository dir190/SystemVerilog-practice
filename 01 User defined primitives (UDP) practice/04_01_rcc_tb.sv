`timescale 1ns/1ps
module rcc_tb;
    // latch_rcc Inputs
reg   a;
reg   clk;

// latch_rcc Outputs
wire  [3:0]  q;

latch_rcc  u_latch_rcc (
    .a(a),.clk(clk),.q(q)
);

always begin
    #5 clk = ~clk;
end

initial begin
    #0 clk=0; a=0;
    #20 a=1;
    #200 a=0;
    #20 $finish;
end

initial begin
    $dumpfile("latch_rcc.vcd");
    $dumpvars(0, rcc_tb);
    $monitor("time=%0t clk=%b a=%d a=%b q dec=%d q bin=%b",$time,clk ,a ,a , q, q);
end
endmodule