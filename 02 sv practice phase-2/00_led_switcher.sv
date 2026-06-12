module ledswitch (
    clock,light
);
    input clock;
    output reg [2:0] light;
    parameter red = 3'b100, green = 3'b010, blue = 3'b001;
    parameter S0 = 0, S1 = 1, S2 = 2;
    reg [1:0] state;
    
    always @(posedge clock ) begin
        case (state)
            S0: state <= S1;
            S1: state <= S2;
            S2: state <= S0;
            default: state <= S0;
        endcase
    end
    always @(state) begin
        case (state)
            S0: light = green;
            S1: light = blue;
            S2: light = red;
            default: light = red;
        endcase
    end

endmodule