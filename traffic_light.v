module traffic_light (
    input  wire clk,
    input  wire reset,
    output reg  red,
    output reg  yellow,
    output reg  green
);

    // State encoding
    typedef enum reg [1:0] {
        RED    = 2'b00,
        GREEN  = 2'b01,
        YELLOW = 2'b10
    } state_t;

    state_t current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= RED;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            RED:    next_state = GREEN;
            GREEN:  next_state = YELLOW;
            YELLOW: next_state = RED;
            default:next_state = RED;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default OFF
        red    = 0;
        yellow = 0;
        green  = 0;

        case (current_state)
            RED:    red    = 1;
            GREEN:  green  = 1;
            YELLOW: yellow = 1;
        endcase
    end

endmodule