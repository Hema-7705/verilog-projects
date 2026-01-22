module traffic_light_tb;

    reg clk;
    reg reset;
    wire red;
    wire yellow;
    wire green;

    // Instantiate DUT
    traffic_light dut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // Clock generation (10 time units period)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk   = 0;
        reset = 1;

        // Apply reset
        #10 reset = 0;

        // Run simulation
        #100;

        $finish;
    end

endmodule