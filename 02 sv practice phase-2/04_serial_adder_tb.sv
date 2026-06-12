`timescale 1ps/1ps
module serial_adder_tb;
    reg a,b, clk, rst;
    wire sum;

    reg [3:0] a_mul, b_mul;
    reg [3:0] sum_mul;
    reg [4:0] fi_sum;

    serial_adder sa(sum,clk,rst,a,b);

    wire [15:0] ps_str, ns_str;
    function [15:0] state_as_string(input state);
        case (state)
            1'b0: state_as_string = "C0";
            1'b1: state_as_string = "C1";
            default: state_as_string = "XX";
        endcase
    endfunction
    assign ps_str = state_as_string(sa.ps);
    assign ns_str = state_as_string(sa.ns);

    always @(posedge clk or posedge rst) begin
        if (rst) sum_mul <= 4'b0000;
        else sum_mul <= {sum, sum_mul[3:1]};
    end

    initial begin
        $dumpfile("sa.vcd");
        $dumpvars(0,serial_adder_tb);
        // $monitor("time=%2t a=%b b=%b clk=%b rst=%b sum =%b PS=%s NS=%s", $time, a,b,clk,rst,sum,ps_str,ns_str);
        #0; rst=1'b1; a=1'b0; b=1'b0; clk=1'b0;
        #2; rst=1'b0;
    end

    always #5 clk = ~clk;

    initial begin
        #5;
        for (integer i = 0 ; i<= 3; i++ ) begin
            @(negedge clk);
            #1;
            a = $urandom % 2;
            b = $urandom % 2;

            a_mul[i] = a;
            b_mul[i] = b;
        end

        @(posedge clk);
        #2;
        fi_sum = {sa.ps,sum_mul[3:0]};

        $display("A = %b (%d)", a_mul, a_mul);
        $display("B = %b (%d)", b_mul, b_mul);
        $display("----------------");
        $display("Final sum = %b (%d)",fi_sum, fi_sum);
        $display("Sum = %b (%d)", sum_mul, sum_mul);
        $display("Overflow = %b",sa.ps);


        #10; $finish;
    end
    
endmodule