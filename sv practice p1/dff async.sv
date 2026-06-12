module async_dff (
    d,set,reset,q,qbar
    );

    input  d,set,reset;
    output reg q      ;
    output qbar       ;
    assign qbar = ~q;
    always @(posedge clk, negedge set, negedge reset) begin
        if (set ==0 ) d<=1;
        else if (reset == 0) d<=0;
        else d<=q;
    end
endmodule