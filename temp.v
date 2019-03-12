module t_Problem_5_37;
wire y_Fig_5_25, y_Fig_5_26;
reg x_in, clock, reset_b;
Problem_5_37_Fig_5_25 M0 (y_Fig_5_25, x_in, clock, reset_b);
Problem_5_37_Fig_5_26 M1 (y_Fig_5_26, x_in, clock, reset_b);
wire [2: 0] state_25 = M0.state;
wire [2: 0] state_26 = M1.state;

initial #350

initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
x = 0;

#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
join
endmodule