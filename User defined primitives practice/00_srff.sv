primitive udp_latch_srff(q, a, b, clk);

    output q      ;
    input  a,b,clk;
    reg q;

    initial q = 1'b0;

    table
     // a b clk : q : q_next
        ? ?  0  : ? :   -    ;
        0 0  1  : ? :   -    ;
        0 1  1  : ? :   0    ;
        1 0  1  : ? :   1    ;
        1 1  1  : ? :   x    ;
    endtable
endprimitive

primitive udp_posedge_srff(q, a, b, clk);

    output q      ;
    input  a,b,clk;
    reg q;

    initial q = 1'b0;

    table
     // a b clk  : q : q_next
        ? ? (??) : ? :   -    ;
        0 0 (01) : ? :   -    ;
        0 1 (01) : ? :   0    ;
        1 0 (01) : ? :   1    ;
        1 1 (01) : ? :   x    ;
    endtable
endprimitive

primitive udp_negedge_srff(q, a, b, clk);

    output q      ;
    input  a,b,clk;
    reg q;

    initial q = 1'b0;

    table
     // a b clk  : q : q_next
        ? ? (??) : ? :   -    ;
        0 0 (10) : ? :   -    ;
        0 1 (10) : ? :   0    ;
        1 0 (10) : ? :   1    ;
        1 1 (10) : ? :   x    ;
    endtable
endprimitive