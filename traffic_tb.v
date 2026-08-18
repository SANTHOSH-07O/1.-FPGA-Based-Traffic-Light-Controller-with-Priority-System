`timescale 1ns / 1ps

module traffic_tb;

    // Inputs
    reg clk;
    reg reset;
    reg emergency;

    // Outputs
    wire RA_R;
    wire RA_Y;
    wire RA_G;

    wire RB_R;
    wire RB_Y;
    wire RB_G;

    // Instantiate the DUT (Device Under Test)
    Traffic_Light_Controller uut (
        .clk(clk),
        .reset(reset),
        .emergency(emergency),

        .RA_R(RA_R),
        .RA_Y(RA_Y),
        .RA_G(RA_G),

        .RB_R(RB_R),
        .RB_Y(RB_Y),
        .RB_G(RB_G)
    );

    // Clock generation
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial
    begin
        reset = 1;
        emergency = 0;
        
        #20;
        reset = 0;
        
        // Normal operation
        #80;
        
        // Emergency vehicle arrives
        emergency = 1;
        
        // Stay in emergency mode
        #50;
        
        // Emergency cleared
        emergency = 0;
        
        // Continue normal operation
        #100;
        
        
        $stop;
    end

endmodule