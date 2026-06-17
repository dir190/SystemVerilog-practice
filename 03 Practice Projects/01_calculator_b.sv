// Made a Calculator which can perform addition, subtraction, multiplication and division by taking inputs
// A beginner level projects

module adder (
    output [4:0] out,
    input [3:0] in1, in2
);
    assign out = in1 + in2;
endmodule

module subtractor (
    output [3:0] out,
    input [3:0] in1, in2
);
    assign out = (in1 > in2) ? (in1 - in2) : (in2 - in1);
endmodule

module multiplier (
    output [7:0] out,
    input [3:0] in1, in2
);
    assign out = in1 * in2;
endmodule

module divider (
    output [3:0] out,
    input [3:0] in1, in2
);
    assign out = (in1 == 0|| in2 == 0) ? 0 : (in1 > in2) ? (in1 / in2) : (in2 / in1);
endmodule

module calculator (
    input rst,
    input [1:0] sel,
    input [3:0] in1, in2,
    output reg [7:0] out
);
    wire [4:0] a_out;
    wire [3:0] s_out;
    wire [7:0] m_out;
    wire [3:0 ] d_out;

    adder addfn(.out(a_out), .in1(in1), .in2(in2));
    subtractor subfn(.out(s_out), .in1(in1), .in2(in2));
    multiplier mulfn(.out(m_out), .in1(in1), .in2(in2));
    divider divfn(.out(d_out), .in1(in1), .in2(in2));

    always @(rst, sel, in1, in2) begin
        if (rst) out = 0;
        else begin
            case (sel)
                2'b00 : out = {3'b0,a_out};
                2'b01 : out = {4'b0,s_out};
                2'b10 : out = {m_out};
                2'b11 : out = {4'b0,d_out};
                default: out = 0;
            endcase
        end
    end
endmodule