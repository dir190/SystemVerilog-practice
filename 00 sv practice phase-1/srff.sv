module srlatch (
    input a, b,
    output q, qb
    );
    nand n1(q,a,qb);
    nand n2(qb,b,q);
endmodule

module srff (
    input p, q, clk,
    output r, s
);
    wire w1, w2;
    nand n3(w1,p,clk);
    nand n4(w2,clk,q);
    srlatch sr1(
        .a(w1),
        .b(w2),
        .q(r),
        .qb(s)
    );
endmodule