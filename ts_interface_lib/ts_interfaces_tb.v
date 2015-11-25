/**
 * \file      ts_interfaces_tb.v
 *
 * \project   ts_interfaces
 *
 * \langv     Verilog-2005
 *
 * \brief     Testbench for the macros in the 'ts_interfaces.vh' header file.
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
 * \version   0.3
 * \date      2015-11-25
 * \author    Andreas Mueller
 * \brief     Adapt to changes in 'ts_interfaces.vh'.
 *            Add helper macros for comma and semicolon characters.
 *
 * \version   0.2
 * \date      2015-11-20
 * \author    Andreas Mueller
 * \brief     Adapt to changes in 'ts_interfaces.vh'.
 *            Use each TS interface at least once for a port declaration.
 *            Add clock and file output via $dumpvars.
 *            Add timescale directive.
 *
 * \version   0.1
 * \date      2015-06-05
 * \author    Andreas Mueller
 * \brief     Create file.
**/

`include "ts_interfaces.vh"

`timescale 10ns/10ns

// Delimiters used as parameters to macros below.
`define COMMA ,
`define SEMICOLON ;

module ts_interfaces_tb
(
// Declare some ports for TS interfaces of different "types".
`TSIF_SER(output, ts_ser_, _o1, `COMMA),
`TSIF_SER(output, , _o2, `COMMA),
`TSIF_PAR(output, ts_par_, _o3, `COMMA),
`TSIF_PAR_8B(output, ts_par_, _o4, `COMMA),
`TSIF_PAR_16B(output, ts_par_, _o5, `COMMA),
`TSIF_PAR_32B(output, ts_par_, _o6, `COMMA)
);

// Declare some nets for TS interfaces of different "types".
`TSIF_SER(reg, ts_ser_, _r1, `SEMICOLON);
`TSIF_SER(wire, , _w2, `SEMICOLON);
`TSIF_PAR(reg, ts_par_, _r3, `SEMICOLON);
`TSIF_PAR_8B(wire, ts_par_, _w4, `SEMICOLON);
`TSIF_PAR_16B(reg, ts_par_, _r5, `SEMICOLON);
`TSIF_PAR_32B(wire, ts_par_, _w6, `SEMICOLON);

/**
 * Initialize and run simulation.
 * Dump the results to a file.
**/
initial begin
    $display("### SIMULATION STARTED ###");
    $display("Initializing TS interface ports.");
    //$display("clk\tdata\tsync\tvalid");
    //$monitor("%b\t%h\t%b\t%b", ts_ser_o1_clk, ts_ser_o1_data, ts_ser_o1_sync, ts_ser_o1_valid);
    //$monitor("%b\t%h\t%b\t%b", ts_par_o2_clk, ts_par_o2_data, ts_par_o2_sync, ts_par_o2_valid);
    //$monitor("%b\t%h\t%b\t%b", ts_par_o3_clk, ts_par_o3_data, ts_par_o3_sync, ts_par_o3_valid);
    //$monitor("%b\t%h\t%b\t%b", ts_par_o4_clk, ts_par_o4_data, ts_par_o4_sync, ts_par_o4_valid);
    //$monitor("%b\t%h\t%b\t%b", ts_par_o5_clk, ts_par_o5_data, ts_par_o5_sync, ts_par_o5_valid);
    $dumpfile("dumpfile.vcd");
    $dumpvars;
    #10;
    $dumpvars;
    $display("### SIMULATION COMPLETED ###");
    $finish;
end

reg clk;
initial begin
    clk = 1'b0;
    forever begin
        clk = #1 ~clk;
    end
end

assign ts_ser_clk_o1   = clk;
assign ts_ser_data_o1  = 1'b1;
assign ts_ser_sync_o1  = 1'b0;
assign ts_ser_valid_o1 = 1'b0;

assign ts_par_clk_o3   = clk;
assign ts_par_data_o3  = 8'h47;
assign ts_par_sync_o3  = 1'b0;
assign ts_par_valid_o3 = 1'b1;

assign ts_par_clk_o4   = clk;
assign ts_par_data_o4  = 8'h47;
assign ts_par_sync_o4  = 1'b0;
assign ts_par_valid_o4 = 1'b1;

assign ts_par_clk_o5   = clk;
assign ts_par_data_o5  = 16'h471F;
assign ts_par_sync_o5  = 1'b0;
assign ts_par_valid_o5 = 1'b1;

assign ts_par_clk_o6   = clk;
assign ts_par_data_o6  = 32'hFEDCBA98;
assign ts_par_sync_o6  = 1'b0;
assign ts_par_valid_o6 = 1'b1;

endmodule

