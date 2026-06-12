`timescale 1ps/1ps;
module sequence_detector_tb ;
reg clk,x,rst;
wire z;

wire [15:0] ps_str, ns_str;

sequence_detector sq1(z,clk,x,rst);

function [15:0] statetostring(input [1:0] state);
    case (state)
        2'd0: statetostring = "S0";
        2'd1: statetostring = "S1";
        2'd2: statetostring = "S2";
        2'd3: statetostring = "S3";
        default: statetostring = "XX";
    endcase
endfunction

assign ps_str = statetostring(sq1.PS);
assign ns_str = statetostring(sq1.NS);


initial begin
    $dumpfile("seqdet.vcd");
    $dumpvars(0,sequence_detector_tb);
    $monitor("Time=%3t Clock=%b x=%b z=%b Reset=%b || PS=%s NS=%s", $time, clk, x, z, rst, ps_str, ns_str);
    
    #0; clk = 0; x = 0; rst = 1;
    #10; rst = 0;
end

always #5 clk = ~clk;

initial begin
    repeat (20) begin
        @(negedge clk);
        #0; x = $urandom %2;
    end
    @(posedge clk);
    #10; $finish;
end

endmodule