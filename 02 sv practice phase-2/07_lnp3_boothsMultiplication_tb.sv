// FSMD Finite State Machine with Datapath
// This testbench file with Design file is named as prefix lnp3 means "Learning and practicing 3st design"
// Design an Booth's Multiplication machine
// Below is the flowchart given
// A is Multiplicant and B is Multiplier. There are n number of bit(Change according to needs) introduce a temporary registor T.
// Introduce a counter which value is the number of bit, i.e: n.
// Also introduce a B[n-1] called b_n_minus_one as bm.
// Whenever         B[0] > B_n_minus_one then T = T - A and shift right by one bit, decrease counter by one.
//          else if B[0] < B_n_minus_one then T = T + A and shift right by one bit, decrease counter by one.
//          else if B[0] = B_n_minus_one then        simple shift right by one bit, decrease counter by one.
// then if counter is not equal to 0 then again compare B[0] : B_n_minus_one
// If counter is equal to 0 then stop

`timescale 1ps/1ps
module boothsMul_tb();
    reg [15:0] d_in;
    reg clk, rst, start;
    wire lda, ldb, sftb, clrb, ldt, sftt, clrt, ldbm, clrbm, ldct, decct, sel, eq0, bmout, bout, stop;
    wire [4:0] ctout;
    wire [15:0] d_out;

    boothsMul_dp dp(bmout, bout, eq0, ctout, lda, ldb, clrb, sftb, ldt, clrt, sftt, ldbm, clrbm, ldct, decct, clk, sel, d_in);
    boothsMul_cp cp(clk, rst, start, eq0, bout, bmout, lda, ldb, sftb, clrb, ldt, sftt, clrt, ldbm, clrbm, ldct, decct, sel, stop);

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; start = 0; d_in = 0;
        #7; rst = 0;
        
        @(posedge clk); d_in = 3; start = 1;
        @(posedge clk); d_in = 6; start = 0;
        wait(stop);
        #10; $finish;
    end
    initial begin
        $dumpfile("mul.vcd");
        $dumpvars(0,boothsMul_tb);
        $monitor("Time=%3t A=%d B=%d T=%d Interm=%d || Output", $time, dp.a, dp.b, dp.t, dp.y, d_out);
    end
endmodule