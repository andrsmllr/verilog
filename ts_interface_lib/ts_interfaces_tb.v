/**
 * \file      ts_interfaces_tb
 *
 * \project   ts_interfaces
 *
 * \langv     Verilog-2005
 *
 * \brief     Testbench for the macros in the 'ts_interfaces' header file.
 *
 * \details   -
 *
 * \bug       -
 *
 * \see       -
 *
 * \copyright GPLv2
 *
 * Revision history:
 *
 * \version   0.1
 * \date      2015-06-05
 * \author    Andreas Mueller
**/

`include "ts_interfaces.vh"

module ts_interfaces_tb
(
// Construct some TS interfaces of different types.
`tsif_ser(ts_ser_i1, input),
`tsif_par(ts_par_o2, output),
`tsif_par_32b(ts_par_i3, input)
);

initial
begin
    $display("### SIMULATION STARTED ###");
    $display("Initializing TS interface ports.");
    $display("### SIMULATION COMPLETED ###");
end

assign ts_ser_i1_clk = 1'b0;
assign ts_ser_i1_data = 1'b1;
assign ts_ser_i1_sync = 1'b0;
assign ts_ser_i1_valid = 1'b0;

assign ts_par_o2_clk = 1'b1;
assign ts_par_o2_data = 8'h47;
assign ts_par_o2_sync = 1'b0;
assign ts_par_o2_valid = 1'b1;

assign ts_par_i3_clk = 1'b1;
assign ts_par_i3_data = 32'hFEDCBA98;
assign ts_par_i3_sync = 1'b0;
assign ts_par_i3_valid = 1'b1;

endmodule
