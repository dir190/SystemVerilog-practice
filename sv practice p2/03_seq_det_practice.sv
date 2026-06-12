// Design a sequence detector which detects "101010" in its data output stream

module seq_det_p (z,clk,x,rst);
input clk, x, rst;
output reg z;

parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5;
reg [2:0] PS, NS;

always @(posedge clk or posedge rst) begin
    if (rst) PS <= S0;
    else     PS <= NS;
end

always @(PS, x) begin
    case (PS)
        S0: begin
            NS = x ? S1 : S0;
            z = x ? 0 : 0;
        end
        S1: begin
            NS = x ? S0 : S2;
            z = x ? 0 : 0;
        end
        S2: begin
            NS = x ? S3 : S0;
            z = x ? 0 : 0;
        end
        S3: begin
            NS = x ? S1 : S4;
            z = x ? 0 : 0;
        end
        S4: begin
            NS = x ? S5 : S0;
            z = x ? 0 : 0;
        end
        S5: begin
            NS = x ? S1 : S2;
            z = x ? 0 : 1;
        end
        default: begin
            NS = S0;
            z = 0;
        end
    endcase
end
endmodule