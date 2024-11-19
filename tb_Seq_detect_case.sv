module tb_Seq_detect_case();

    logic clk, reset, w;
    logic z;

    seq_detect_1 dut(.clk(clk), .reset(reset), .w(w), .z(z));

    always begin
        clk = 1'b0; #50;
        clk = 1'b1; #50;
    end

    // Test Sequence
    initial begin

        $monitor("Time: %0t | Reset: %b | W: %b | Z: %b", $time, reset, w, z);

        // Reset FSM
        reset = 1'b1; #100;
        reset = 1'b0; #100;

        // Zero Sequence for z = 1
        w = 1'b0; #100; 
        w = 1'b0; #100;
        w = 1'b0; #100;
        w = 1'b0; #100;

        // Random Sequence
        w = 1'b0; #100; 
        w = 1'b1; #100;
        w = 1'b1; #100;
        w = 1'b0; #100;

        // One Sequence for z = 1
        w = 1'b1; #100; 
        w = 1'b1; #100;
        w = 1'b1; #100;
        w = 1'b1; #100;

        // Random Sequence
        w = 1'b0; #100; 
        w = 1'b1; #100;
        w = 1'b1; #100;
        w = 1'b0; #100;

        // Zero Sequence for z = 1
        w = 1'b0; #100; 
        w = 1'b0; #100;
        w = 1'b0; #100;
        w = 1'b0; #100;

        $finish;
    end
endmodule
