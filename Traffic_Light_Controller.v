`timescale 1ns / 1ps

module Traffic_Light_Controller(
input clk,
input reset,
input emergency,

output reg RA_R,
output reg RA_Y,
output reg RA_G,

output reg RB_R,
output reg RB_Y,
output reg RB_G

    );
    
    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;
    
    reg [1:0] state;
    reg [1:0] next_state;
    reg [31:0] counter;
    
    always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            state <= s0;
            counter <= 0;
        end
        else
        begin
            if(counter == 4)
            begin
                state <= next_state;
                counter <= 0;
            end
            else
            begin
                counter <= counter + 1;
            end    
        end
    end
    always @(*)
begin

    if(emergency)
    begin
        next_state = state;      // Freeze the current state
    end

    else
    begin
        case(state)

            s0:
                next_state = s1;

            s1:
                next_state = s2;

            s2:
                next_state = s3;

            s3:
                next_state = s0;

            default:
                next_state = s0;

        endcase
    end

end
    
    always @(*)
begin

    RA_R = 0;
    RA_Y = 0;
    RA_G = 0;

    RB_R = 0;
    RB_Y = 0;
    RB_G = 0;

    if(emergency)
    begin
        // Emergency Mode
        RA_G = 1;
        RB_R = 1;
    end

    else
    begin

        case(state)

            s0:
            begin
                RA_G = 1;
                RB_R = 1;
            end

            s1:
            begin
                RA_Y = 1;
                RB_R = 1;
            end

            s2:
            begin
                RA_R = 1;
                RB_G = 1;
            end

            s3:
            begin
                RA_R = 1;
                RB_Y = 1;
            end

            default:
            begin
                RA_R = 1;
                RB_R = 1;
            end

        endcase

    end

end    
endmodule
