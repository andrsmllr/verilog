/**
 * Only supported in SystemVerilog.
**/

module ranges;

wire [7:0] a;
wire [-5:5] b;
reg [3:0] c[0:255];

parameter w_upper = 2;
parameter w_lower = 0;
wire [w_upper:w_lower] w;

initial
begin
    $display("### SIMULATION STARTED ###");
    // $display("$bits(a) = %d", $bits(a)); // Only in SystemVerilog.
    // $display("$bits(b) = %d", $bits(b));
    // $display("$bits(c) = %d", $bits(c));
    $display("### SIMULATION COMPLETED ###");
end

endmodule
