/**
 * A clock synchronous up-counter with clock enable, load input and 
 * active high asynchronous reset.
**/

module COUNTER_R1S1LEU #(
  parameter WIDTH = 8
)(
  input clk_i,
  input rst_i,
  input ld_i,
  input [WIDTH-1:0] ld_cnt_i,
  input ena_cnt_i,
  output reg [WIDTH-1:0] cnt_o
);

always @ (posedge clk_i, posedge rst_i)
  begin
    if (rst_i == 1'b1)
      cnt_o <= 'b0;
    else
      if (ld_i == 1'b1)
        cnt_o <= ld_cnt_i;
      else
        if (ena_cnt_i == 1'b1)
          cnt_o <= cnt_o + 1;
  end

endmodule
