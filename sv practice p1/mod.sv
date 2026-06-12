module temp (
    input clk,
    input [7:0] a,b,d,
    output reg [7:0] f
);
    reg [7:0] c;
    
    always @(posedge clk) begin
    c <= a + b;
    end

    always @(negedge clk) begin
    f <= c - d;
    end
endmodule