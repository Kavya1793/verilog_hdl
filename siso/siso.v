
module siso(
    input in,
    input clk,
    input rst,
    output reg out
    );
    parameter  N=4;
    reg [N-1:0] temp;
    reg [1:0] count;
    always@(posedge clk)
    if(rst) begin
    temp<=0;
    count<=0;
    out<=0;
    end
    else begin
    count<=count+1;
    if(count<2) begin
    temp<={temp[N-2:0],in};
    end 
    out<=temp[N-1];
    end
 endmodule
