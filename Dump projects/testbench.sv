module tb;
    reg [3:0] in1, in2;
    reg start, clk, rst, restart;
    wire [9:0] mul;
    wire done;

    boothmul mul1(in1, in2, start, clk, rst, restart, mul, done);
    always #5 clk = ~clk;
    initial begin
        clk = 0; in1 = 0; in2 = 0; start = 0; rst = 0; restart = 0;
        #4 rst = 1'b1;
        #4 rst = 0;
        @(posedge clk); in1 = 4'd15; in2 = 4'd12;
        @(posedge clk); start = 1'b1;
        wait(done);
        #10 $finish;
    end
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb);
        $monitor("a = %d b = %d || mul= %d", in1, in2, mul);
    end

endmodule