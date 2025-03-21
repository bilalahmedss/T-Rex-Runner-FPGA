module FSM(
    input clk_div1,
    input fsm_reset,
    input fsm_input_user, // Correctly declared as an input
    output reg [2:0] state = 3'b000,
    output reg [9:0] mover = 639,
    output reg [9:0] mover_dino = 380
);
    // ... declaration of internal variables ...

    reg flag = 1;
    reg fsm_coll;
    reg[2:0] next_state;
    reg [17:0] counter_fsm = 0;
    parameter Idle = 3'b000;
    parameter Run = 3'b001;
    parameter MoveUp = 3'b010;
    parameter MoveDown = 3'b011;
    parameter Dead = 3'b100;

    wire ReachMax = (mover_dino <= 150);
    wire ReachMin = (mover_dino >= 380);
    // The always block handles state transitions and outputs
    always @(posedge clk_div1 or posedge fsm_reset) begin
        if (fsm_reset) begin
            // Reset logic
            state <= Idle;
            mover <= 639;
            mover_dino <= 380;
            counter_fsm <= 0;
            fsm_coll <= 0;
            flag <= 1;
            next_state <= Idle;
       end else begin
            // Normal operation
            if (counter_fsm < 195619) begin
                counter_fsm <= counter_fsm + 1;
            end else begin
                counter_fsm <= 0;

                // Check for collisions
                if (((mover_dino + 50) < 438 && (mover_dino + 50) > 348) && (mover < 100 && (mover + 25) > 48))   
                    fsm_coll <= 1;   
                else
                    fsm_coll <= 0;
                // State transition logic
                state <= next_state;

                // State transitions and output assignments
                case (state)
                    Idle: begin
                        mover_dino <= 380;
                        mover <= 600;
                       next_state <= fsm_input_user ? Run : Idle;
                    end
                    Run: begin
                        mover_dino <= 380;
                        mover <= mover == 0 ? 639 : mover - 2;
                        if (fsm_coll)
                            next_state <= Dead;
                        else if (fsm_input_user)
                            next_state <= MoveUp;
                        else
                            next_state <= Run;
                    end

                    MoveUp: begin
                        mover_dino <= ReachMax ? mover_dino : mover_dino - 3;
                        mover <= mover == 0 ? 639 : mover - 2;
                        if (fsm_coll)
                            next_state <= Dead;
                        else if (ReachMax)
                            next_state <= MoveDown;
                        else
                            next_state <= MoveUp;
                    end

                    MoveDown: begin
                        mover_dino <= ReachMin ? mover_dino : mover_dino + 3;
                        mover <= mover == 0 ? 639 : mover - 2;
                        if (fsm_coll)
                            next_state <= Dead;
                        else if (ReachMin)
                            next_state <= Run;
                        else
                            next_state <= MoveDown;
                    end
                    Dead: begin
                        // On Dead state, check for user input to reset to Idle
                        next_state <= fsm_input_user ? Idle : Dead;
                    end

                    default: next_state <= Idle;
                endcase
            end
        end
    end
endmodule
