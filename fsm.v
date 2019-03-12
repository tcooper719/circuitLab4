module fsm (output reg y, Da, Db, Dc, input x, clock);

parameter 
    a = 3'b000,
    b = 3'b001,
    c = 3'b010,
    d = 3'b011,
    e = 3'b100;

reg [2: 0] state, next_state;

always @ (posedge clock)

    state <= next_state;

always @ (state, x)

case (state)
    a:
    begin y = 0;
        if (x == 0) next_state = d;
        else
        begin
            next_state = e;
            y = 1;
        end
    end

    b:
    begin y = 0;
        if (x == 0) next_state = b;
        else
        begin
            next_state = e;
            y = 1;
        end
    end

    c:
    begin y = 0;
        if (x == 0) next_state = c;
        else 
        begin 
            next_state = a;
            y = 1;
        end
    end

    d: 
    begin y = 0;
        if (x == 0) next_state = b;
        else 
        begin 
            next_state = c;
            y = 1;
        end
    end
    
    e: 
    begin y = 0;
        if (x == 0) next_state = c;
        else 
            next_state = d;
        end
    endcase


endmodule