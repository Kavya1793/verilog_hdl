

module siso_tb();
    reg in;
    reg clk;
    reg rst;
    wire out;
    siso dut(.in(in),.clk(clk),.rst(rst),.out(out));
    initial
    begin
    clk=0;
    forever #5 clk=~clk;
    end
    task initialise; begin
    in=0;clk=0;rst=0;
    end
    endtask
    task reset;
    begin
    @(negedge clk)
    rst=1;
    @(negedge clk)
    rst=0;
    end
    endtask
    task stimulus(input x); begin
    @(negedge clk)
    in=x;
    #10;
    end
    endtask
    initial
    begin
    initialise;
    reset;
    #10;
    stimulus(1);#10;
    stimulus(0);#10;
    stimulus(1);#10;
    stimulus(0);#10;
    stimulus(1);
    #10;
    $finish;
    end
    endmodule
    
    
    
    
