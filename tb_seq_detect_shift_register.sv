module tb_seq_detect_shift_register();

    logic clk,reset,w;
    logic z;

    sequence_detector dut (
        .clk(clk),
        .reset(reset),
        .w(w),
        .z(z)
    );

    // Clock generation: 10ns clock period
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        reset = 1;
        w = 0;

        // Apply reset
        #10 reset = 0; 

        // Test case 1: Four consecutive 0s
        #10 w = 0; // Apply 0
        #10 w = 0;
        #10 w = 0;
        #10 w = 0; // z should go high here

        // Test case 2: Interruption with 1s
        #10 w = 1; // Apply 1
        #10 w = 1; 
        #10 w = 0; 
        #10 w = 0; 
        #10 w = 0; 
        #10 w = 1; // z should remain low

        // Test case 3: Four consecutive 1s
        #10 w = 1; 
        #10 w = 1; 
        #10 w = 1; 
        #10 w = 1; // z should go high here

        // End simulation
        #10 $stop;
    end

    // Monitor output for debugging
    initial begin
        $monitor("Time: %0t | reset: %b | w: %b | z: %b", $time, reset, w, z);
    end

endmodule
