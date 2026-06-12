module srlatch (
    input a,input b,output q,output qb
);
    nand n1(q,a,qb);
    nand n2(qb,b,q);
endmodule