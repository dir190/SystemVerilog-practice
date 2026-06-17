// Construct a bcd counter which is counts either up or down
// A beginner level project

module bcd_counter (
    input toggle, clr, count,clk,
    output reg [3:0] out
);
    always @(posedge clk or posedge clr) begin
        if (clr) begin out <= 4'b0; end

        else if (count) begin
            if (toggle) begin 
                if (out == 4'b1001) out <= 4'b0000; 
                else out <= out - 1'b1; 
            end
            else begin 
                if (out == 4'b1001) out <= 4'b0000; 
                else out <= out + 1'b1;
            end
        end
    end
endmodule

// If we change the if statement check from 0000 to 1001 and make the statement inside the procedural block as blocking assignment then the counter count between 9 to 15 with toggle and count toggled on because the toggle not checks from the 0000
// Below is the interpretion of what is talked about
// module bcd_counter1 (
//     input toggle, clr, count,clk,
//     output reg [3:0] out
// );
//     always @(posedge clk or posedge clr) begin
//         if (clr) begin out = 4'b0; end       // Switched to blocking assignment

//         else if (count) begin
//             if (toggle) begin 
                // if (out == 4'b1001) out = 4'b0000; // Changed the 0000 to 1001 and Switched to blocking assignment
//                 else out = out - 1'b1;       // Switched to blocking assignment
//             end
//             else begin 
//                 if (out == 4'b1001) out = 4'b0000;       // Switched to blocking assignment
//                 else out = out + 1'b1;       // Switched to blocking assignment
//             end
//         end
//     end
// endmodule
