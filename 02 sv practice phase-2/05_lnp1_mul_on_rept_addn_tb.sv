// FSMD Finite State Machine with Datapath
// This testbench file with Design file is named as prefix lnp1 means "Learning and practicing 1st design"
// Design an unsigned multiplier which works on the principal of repeated addition
// Below is the datapath given
// Step 1: read(Input) A and B (B != 0) , A and B are 16 bit binary numbers
// Step 2: input and initialise P = 0
// Step 3: P = P + A
// Step 4: Check whether B = 0 or not , if B != 0 then B = B - 1 then run step 3
// Step 5: If B = 0 then stop

`timescale 1ps/1ps
module mul_tb;
    reg [15:0] a_in, b_in;
    reg clk, start, rst;
    wire stop;
    wire lda, ldb, ldp, clrp, decb, eqz;
    wire [15:0] p_out;

    mul_datapath mul_dp (
        .a_in(a_in), .b_in(b_in), .lda(lda), .ldb(ldb), 
        .decb(decb), .eqz(eqz), .ldp(ldp), .clrp(clrp), 
        .clk(clk), .p_out(p_out)
    );

    mul_controlpath mul_cp (
        .lda(lda), .ldb(ldb), .decb(decb), .eqz(eqz), 
        .ldp(ldp), .clrp(clrp), .clk(clk), .start(start), 
        .stop(stop), .rst(rst)
    );

    initial begin
        clk=1'b0; start=1'b0; rst=1'b1;
        #100;
        rst=1'b0; start=1'b1;
        #300; $finish;
    end

    always #5 clk = ~clk;

    initial begin
        #20; a_in = 17; b_in = 5;
    end

    initial begin
        $dumpfile("mul.vcd");
        $dumpvars(0,mul_tb);
        $monitor("Time=%3t | A=%d | B=%d | Output=%d | Done=%b", $time, a_in, b_in, p_out, stop);
        
    end
endmodule