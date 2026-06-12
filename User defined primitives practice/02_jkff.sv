primitive udp_latch_jkff (q, j, k, clk);
    output q;
    input j, k, clk;
    reg q;
    
    table
    //  j k clk : current_q : next_q
        ? ?  0  :     ?     :   -    ;
        0 0  1  :     ?     :   -    ;
        0 1  1  :     ?     :   0    ;
        1 0  1  :     ?     :   1    ;
        1 1  1  :     0     :   1    ;
        1 1  1  :     1     :   0    ;
    endtable
endprimitive

primitive udp_posedge_jkff (q, j, k, clk);
    output q;
    input j, k, clk;
    reg q;
    
    table
    //  j k clk   : current_q : next_q
        ? ? (??)  :     ?     :   -    ;
        0 0 (01)  :     ?     :   -    ;
        0 1 (01)  :     ?     :   0    ;
        1 0 (01)  :     ?     :   1    ;
        1 1 (01)  :     0     :   1    ;
        1 1 (01)  :     1     :   0    ;
    endtable
endprimitive

primitive udp_negedge_jkff (q, j, k, clk);
    output q;
    input j, k, clk;
    reg q;
    
    table
    //  j k  clk   : current_q : next_q
        ? ?  (??)  :     ?     :   -    ;
        0 0  (10)  :     ?     :   -    ;
        0 1  (10)  :     ?     :   0    ;
        1 0  (10)  :     ?     :   1    ;
        1 1  (10)  :     0     :   1    ;
        1 1  (10)  :     1     :   0    ;
    endtable
endprimitive