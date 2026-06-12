module myfirstmodule (
    input [15:0] inputs,
    input [3:0] criteria,
    output outputs
);
    assign outputs = inputs[criteria];
endmodule

// iverilog -g2012 -o sim.out tb1 /home/kdesktop/Documents/code/mux16x1from4x1.sv /home/kdesktop/Documents/code/testbenchmultiple.sv  && vvp sim.out && gtkwave dump.vcd 
