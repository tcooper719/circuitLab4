module Prob_5_41 ( output reg y_out, input x_in, clock, reset_b);
parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
reg [2: 0] state, next_state;
always @ ( posedge clock, negedge reset_b)
if (reset_b == 0) state <= s0;
else state <= next_state;
always @ (state, x_in) begin
y_out = 0;
next_state = s0;
case (state)
s0: if (x_in) begin next_state = s4; y_out = 1; end else begin next_state = s3; y_out = 0; end
s1: if (x_in) begin next_state = s4; y_out = 1; end else begin next_state = s1; y_out = 0; end
s2: if (x_in) begin next_state = s0; y_out = 1; end else begin next_state = s2; y_out = 0; end
s3: if (x_in) begin next_state = s2; y_out = 1; end else begin next_state = s1; y_out = 0; end
s4: if (x_in) begin next_state = s3; y_out = 0; end else begin next_state = s2; y_out = 0; end
default : next_state = 3'bxxx;
endcase
end
endmodule
module t_ Prob_5_41 ();
wire y_out;
reg x_in, clk, reset_b;
Prob_5_41 M0 (y_out, x_in, clk, reset_b);
initial #350 $finish ;
initial begin clk = 0; forever #5 clk = ~clk; end
initial fork
#2 reset_b = 1;
#3 reset_b = 0; // Initialize to s0
#4 reset_b = 1;
// Trace the state diagram and monitor y_out
x_in = 0; // Drive from s0 to s3 to S1 and park
#40 x_in = 1; // Drive to s4 to s3 to s2 to s0 to s4 and loop
#90 x_in = 0; // Drive from s0 to s3 to s2 and part
#110 x_in = 1; // Drive s0 to s4 etc
join
endmodule