module parity_detector (
    input clk,
    input rst,
    input x,
    output reg parity
);

reg state, next_state;

localparam EVEN = 1'b0,
           ODD  = 1'b1;


always @(posedge clk or posedge rst)
begin
    if (rst)
        state <= EVEN;
    else
        state <= next_state;
end


always @(*)
begin
    case(state)

        EVEN:
        begin
            if(x)
                next_state = ODD;
            else
                next_state = EVEN;
        end

        ODD:
        begin
            if(x)
                next_state = EVEN;
            else
                next_state = ODD;
        end

        default:
            next_state = EVEN;

    endcase
end


always @(*)
begin
    case(state)

        EVEN: parity = 1'b0;
        ODD : parity = 1'b1;

        default: parity = 1'b0;

    endcase
end

endmodule