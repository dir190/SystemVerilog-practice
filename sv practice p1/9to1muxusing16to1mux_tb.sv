module ninetoonemux_tb;
    reg [15:0] a,b,c,d,e,f,g,h,i;
    reg [3:0] sel;
    wire [15:0] out;
    integer k;
ninetoonemux m1(a,b,c,d,e,f,g,h,i,sel,out);
    initial begin
        a=16'hAAAA; b=16'hBBBB; c=16'hCCCC; d=16'hDDDD; 
        e=16'hEEEE; f=16'hFFFF; g=16'h1111; h=16'h2222; i=16'h3333;
        $dumpfile("dump.vcd");
        $dumpvars(0,ninetoonemux_tb);
        $monitor("time=%0t | sel=%d | out=%h",$time,sel,out);
        for ( k=0 ; k<=10 ;k=k+1 ) begin
            #5 sel=k;
        end
        $finish;
    end
endmodule