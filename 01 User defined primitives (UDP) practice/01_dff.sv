primitive udp_latch_dff(q, d, clk);
    output q        ;
    input  d, clk;
    reg q;

    initial q = 1'b0;

    table
 // d clk : current_q : next_q
    ?  0  :      ?    :    -  ;
    0  1  :      ?    :    0  ;
    1  1  :      ?    :    1  ;
    endtable
endprimitive

primitive udp_posedge_dff(q, d, clk);
    output q        ;
    input  d, clk;
    reg q;

    initial q = 1'b0;

    table
 // d clk   : current_q : next_q
    ? (??)  :      ?    :    -  ;
    0 (01)  :      ?    :    0  ;
    1 (01)  :      ?    :    1  ;
    endtable
endprimitive

primitive udp_negedge_dff(q, d, clk);
    output q        ;
    input  d, clk;
    reg q;

    initial q = 1'b0;

    table
 // d  clk   : current_q : next_q
    ?  (??)  :      ?    :    -  ;
    1  (10)  :      ?    :    1  ;
    0  (10)  :      ?    :    0  ;
    endtable
endprimitive