module sequence_detector (
    input logic clk, reset, w,
    output logic z
);
    logic [3:0] shift;

    always @(posedge clk) begin
        if (reset) begin
            shift <= 4'b0001; // Reset the shift register
        end else begin
            shift <= {shift[2:0], w}; // Shift in w
        end
    end

    always @(*) begin
        z = (shift == 4'b0000) || (shift == 4'b1111); // Check for both patterns
    end
endmodule
