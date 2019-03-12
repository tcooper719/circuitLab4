//testbench.v
`timescale 1ns / 1ns

module testbench; 

reg clock;
reg xin;
wire DaO, DbO, DcO, yO;


fsm fsm0 (yO, DaO, DbO, DcO, xin, clock);
    initial begin 
        
        
        fork

        begin clock = 0; forever #5 clock = ~clock; end

        xin = 0;
        // 011110011
        #10 xin = 0;
        #20 xin = 1;
        #30 xin = 1;
        #40 xin = 1;
        #50 xin = 1;
        #60 xin = 0;
        #70 xin = 0;
        #80 xin = 1;
        #90 xin = 1;
        
        join
        
    end
    initial
        $monitor($stime,, clock,, xin,, DaO,, DbO,, DcO,, yO);
endmodule 