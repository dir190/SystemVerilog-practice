module moore_parity_generator (z,x,clk);
input x,clk;
output reg z;
reg evenodd;

parameter even = 0, odd = 1;

always @(posedge clk or negedge clk) begin
    case (evenodd)
        even: evenodd <= x ? odd : even;
        odd : evenodd <= x ? even : odd;
        default: evenodd <= even;
    endcase
end

always @(*) begin
    case(evenodd)
        even   : z = 1'b0;
        odd    : z = 1'b1;
        default: z = 1'b0;
    endcase
end

endmodule

module mealy_parity_generator (z,x,clk);
input x,clk;
output reg z;
reg evenodd;

parameter even = 0, odd = 1;

always @(posedge clk or negedge clk) begin
    case (evenodd)
        even: evenodd <= x ? odd : even;
        odd : evenodd <= x ? even : odd;
        default: evenodd <= even;
    endcase
end

always @(*) begin
    case(evenodd)
        even   : z = x ? 1 : 0;
        odd    : z = x ? 0 : 1;
        default: z = 0;
    endcase
end

endmodule