module transparent_latch (
    input d, enable,
    output reg q,
    output qbar
);
assign qbar = ~q;
    always @(d,enable) begin
        if (enable) d = q;
    end
endmodule