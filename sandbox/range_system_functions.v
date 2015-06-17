/**
 * The system functions $size, $bits, $high, $low are only supported in
 * SystemVerilog.
**/

module ranges;

wire [7:0] a;
wire [-5:5] b;
reg [3:0] c[0:255];

parameter W_UPPER = 2;    // In Verilog parameters or defines must be used to
parameter W_LOWER = 0;    // create constants which can be used for the speci-
wire [W_UPPER:W_LOWER] w; // fication of wire/reg dimensions.

initial
  begin
      $display("### SIMULATION STARTED ###");
      // $display("$bits(a) = %d", $bits(a)); // Only in SystemVerilog.
      // $display("$bits(b) = %d", $bits(b));
      // $display("$bits(c) = %d", $bits(c));
      $display("### SIMULATION COMPLETED ###");
  end

endmodule // ranges
