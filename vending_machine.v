`timescale 1ns / 1ps
module vending_machine(
    input clk,
    input reset,
    input coin5,
    input coin10,
    output reg product,
    output reg change
);

parameter S0  = 3'b000,
          S5  = 3'b001,
          S10 = 3'b010,
          S15 = 3'b011, 
          S20 = 3'b100; 

reg [2:0] state, next_state;

always @(posedge clk) begin
    if(reset)
        state <= S0;
    else
        state <= next_state;
end

always @(*) begin
    next_state = state; 

    case(state)
        S0:  begin
            if(coin5)       next_state = S5;
            else if(coin10) next_state = S10;
        end

        S5:  begin
            if(coin5)       next_state = S10;
            else if(coin10) next_state = S15;
        end

        S10: begin
            if(coin5)       next_state = S15;
            else if(coin10) next_state = S20;
        end

        S15: next_state = S0;  

        S20: next_state = S0;

        default: next_state = S0;
    endcase
end

always @(posedge clk) begin
    if(reset) begin
        product <= 0;
        change  <= 0;
    end
    else begin
        product <= (next_state == S15 || next_state == S20);
        change  <= (next_state == S20);
    end
end

endmodule