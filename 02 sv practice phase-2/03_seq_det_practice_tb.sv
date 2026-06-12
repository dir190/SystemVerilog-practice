`timescale 1ps/1ps;
module seq_det_p_tb;
    reg x,clk,rst;
    wire z;

    wire [15:0] ps_str, ns_str;

    seq_det_p sq(z,clk,x,rst);

    function [15:0] statetostring(input [2:0] state);
        case (state)
            3'b000: statetostring = "S0";
            3'b001: statetostring = "S1";
            3'b010: statetostring = "S2";
            3'b011: statetostring = "S3";
            3'b100: statetostring = "S4";
            3'b101: statetostring = "S5";
            default: statetostring = "XX";
        endcase
    endfunction

    assign ps_str = statetostring(sq.PS);
    assign ns_str = statetostring(sq.NS);

    initial begin
        $dumpfile("seqp.vcd");
        $dumpvars(0,seq_det_p_tb);
        $monitor("Time=%3t Clock=%b x=%b rst=%b z=%b || PS=%s NS=%s", $time, clk, x, rst, z, ps_str, ns_str);
    end
    always #5 clk = ~clk;
    initial begin
        #0; clk=0; x=0; rst=1;
        #5 rst=0;
        repeat(2200) begin
            @(negedge clk);
            #1; x = $urandom %2;
        end
        #10; $finish;
    end
endmodule