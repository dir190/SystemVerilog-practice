module bcd_fadd (
    input      [3:0] a,
    input      [3:0] b,
    input            cin,
    output reg       cout,
    output reg [3:0] sum
);

  reg [4:0] tempsum;

  always @(*) begin
    tempsum = a + b + cin;
    if (tempsum > 9) begin
      {cout, sum} = tempsum + 6;
    end else begin
      cout = 0;
      sum  = tempsum;
    end
  end
endmodule

module fourbcdadder (
    input [15:0] a,
    b,
    input cin,
    output cout,
    output [15:0] out
);
  wire c1, c2, c3;
  bcd_fadd m1 (
      .a(a[3:0]),
      .b(b[3:0]),
      .cin(cin),
      .cout(c1),
      .sum(out[3:0])
  );
  bcd_fadd m2 (
      .a(a[7:4]),
      .b(b[7:4]),
      .cin(c1),
      .cout(c2),
      .sum(out[7:4])
  );
  bcd_fadd m3 (
      .a(a[11:8]),
      .b(b[11:8]),
      .cin(c2),
      .cout(c3),
      .sum(out[11:8])
  );
  bcd_fadd m4 (
      .a(a[15:12]),
      .b(b[15:12]),
      .cin(c3),
      .cout(cout),
      .sum(out[15:12])
  );
endmodule
