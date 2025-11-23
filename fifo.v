
  module fifo(
  input clk, rst,
  input rd, wr,
  input [7:0] data,
  output reg [7:0] out,
  output full, empty
);
  reg [4:0] wr_ptr, rd_ptr;
  integer i;
  reg [7:0] mem[15:0];

  always @(posedge clk) begin
    if (!rst) begin  // ✅ active-low reset
      wr_ptr <= 0;
      rd_ptr <= 0;
      out <= 0;
      for (i = 0; i < 16; i = i + 1)
        mem[i] <= 0;
    end
    else if (wr && !full) begin
      mem[wr_ptr] <= data;
      wr_ptr <= wr_ptr + 1;
    end
    else if (rd && !empty) begin
      out <= mem[rd_ptr];
      rd_ptr <= rd_ptr + 1;
    end
  end

  assign full  = ((wr_ptr[4] != rd_ptr[4]) && (wr_ptr[3:0] == rd_ptr[3:0]));
  assign empty = (wr_ptr == rd_ptr);

endmodule
