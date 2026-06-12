`timescale 1ns/1ps
module parity_generator_tb ();
reg x,clk;
wire z;

moore_parity_generator par_gen(z,x,clk);

always #5 clk=~clk;

initial begin
    $dumpfile("pargen.vcd");
    $dumpvars(0,parity_generator_tb);
    $monitor("Time=%0t x=%b clk=%b z=%b", $time, x,clk,z);

    clk=1'b0; x=0;

    repeat (5) begin
        #5; x= $random % 2;
    end

    #20 $finish;
end


endmodule