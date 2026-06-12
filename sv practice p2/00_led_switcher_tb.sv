`timescale  1ns / 1ps

module tb_ledswitch;
    reg clock;
    wire [0:2] light;

    ledswitch switch(.clock(clock), .light(light));
    always #5 clock = ~clock;
    initial begin
        clock = 1'b0;
        #200 $finish;
    end
    initial begin
        $dumpfile("ledswitch.vcd");
        $dumpvars(0,tb_ledswitch);
        $monitor("Time=%0t Clock=%b Light=%b",$time ,clock ,light);
    end
endmodule