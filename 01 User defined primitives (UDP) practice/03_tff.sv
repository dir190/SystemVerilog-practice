primitive udp_latch_tff (q, t, clk);
    output q;
    reg q;
    input t, clk;

    initial q = 1'b0;

    table
    //  t clk : current_q : next_q
        ?  0  :     ?     :   -;
        0  1  :     ?     :   -;
        1  1  :     0     :   1;
        1  1  :     1     :   0;
    endtable
endprimitive

primitive udp_posedge_tff (q, t, clk);
    output q;
    reg q;
    input t, clk;

    initial q = 1'b0;

    table
    //  t clk   : current_q : next_q
        ? ?  :     ?     :   -;
        0 (01)  :     ?     :   -;
        1 (01)  :     0     :   1;
        1 (01)  :     1     :   0;
        ? (10)  :     ?     :   -;
    endtable
endprimitive

primitive udp_negedge_tff (q, t, clk);
    output q;
    reg q;
    input t, clk;
    
    initial q = 1'b0;

    table
    //  t clk   : current_q : next_q
        ? ?  :     ?     :   -;
        0 (10)  :     ?     :   -;
        1 (10)  :     0     :   1;
        1 (10)  :     1     :   0;
        ? (01)  :     ?     :   -;
    endtable
endprimitive

