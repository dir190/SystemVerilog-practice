module serial_adder (
    sum,clk,rst,a,b
);
    input a,b, clk, rst;
    output reg sum;

    reg ps, ns;
    parameter s0 =1'b0 ,s1=1'b1;

    always @(posedge clk or posedge rst) begin
        if (rst) ps <= s0;
        else ps <= ns;
    end

    always @(*) begin
        case (ps)
            s0: begin 
                sum = (a^b);
                ns = (a&b) ? s1 : s0;
            end
            s1: begin
                sum = ~(a^b);
                ns = (a|b) ? s1 : s0;
            end
            default: begin
               sum = 1'b0;
               ns = s0; 
            end
        endcase
    end
    
endmodule