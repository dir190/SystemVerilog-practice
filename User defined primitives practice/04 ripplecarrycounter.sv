module latch_rcc (q, a, clk);
    input a, clk;
    output [3:0] q;
    
    udp_latch_tff bit0 (q[0], a, clk);
    udp_latch_tff bit1 (q[1], a, q[0]);
    udp_latch_tff bit2 (q[2], a, q[1]);
    udp_latch_tff bit3 (q[3], a, q[2]);
endmodule