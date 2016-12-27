/**
 * \file      dds_tb.v
 *
 * \project   dds
 *
 * \langv     Verilog-2005
 *
 * \brief     Testbench for module dds.
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
 * \date      2016-03-03
 * \author    Andreas Mueller
 * \brief     Create file.
**/

`timescale 10 ns / 10 ps

module dds_tb;

   parameter BB_DATA_WIDTH = 8;
   parameter PHASE_INC_WIDTH = 16;
   parameter PHASE_ACC_WIDTH = 16;
   parameter PHASE_INITIAL = 0;
   parameter SIN_PHASE_WIDTH = 12;
   parameter SIN_ROM_WIDTH = 8;
   parameter SIN_ROM_INIT_FILE = "dds_sin_rom.mem";

   reg clk = 1'b0;
   reg rst;
   reg [BB_DATA_WIDTH-1:0]   bb_data;
   reg [PHASE_INC_WIDTH-1:0] phase_inc;
   reg                       phase_inc_ena;
   wire signed [BB_DATA_WIDTH+SIN_ROM_WIDTH+1-1:0] if_data;

/**
 * Run simulation.
**/
integer i;
integer seed;

initial
  begin
     $display("# Simulation started. #");
     rst <= 1'b1;
     bb_data <= 'b0;
     phase_inc <= 'b0;
     phase_inc_ena <= 1'b0;
     #10;
     rst <= 1'b0;
     #10;
     phase_inc <= 'd2048;
     phase_inc_ena <= 1'b1;
     seed <= 1337;
     for (i = 0; i < 80; i = i + 1)
       begin
          bb_data <= 127 * ($sin(2.0 * 3.14 * i / 40.0) + 1);
          #200;
       end
     for (i = 0; i < 20; i = i + 1)
       begin
          bb_data <= $random(seed) % 256;
          #500;
       end
     #10;
     phase_inc <= 'h8000;
     for (i = 0; i < 20; i = i + 1)
       begin
          bb_data <= $random(seed) % 256;
          #500;
       end
     #10;
     $display("# Simulation finished. #");
     $finish;
end

/**
 * Trace signals.
**/
initial
  begin
     $dumpfile("dds_tb.vcd");
     $dumpvars(3);
  end

/**
 * Generate clock.
**/
always
  begin
     #1 clk <= ~clk;
  end

/**
 * DUT.
**/
dds #(
    .BB_DATA_WIDTH(BB_DATA_WIDTH),
    .PHASE_INC_WIDTH(PHASE_INC_WIDTH),
    .PHASE_ACC_WIDTH(PHASE_ACC_WIDTH),
    .PHASE_INITIAL(PHASE_INITIAL),
    .SIN_PHASE_WIDTH(SIN_PHASE_WIDTH),
    .SIN_ROM_WIDTH(SIN_ROM_WIDTH),
    .SIN_ROM_INIT_FILE(SIN_ROM_INIT_FILE)
)
i_dut_dds (
    .clk_i(clk),
    .rst_i(rst),
    .bb_data_i(bb_data),
    .phase_inc_i(phase_inc),
    .phase_inc_ena_i(phase_inc_ena),
    .if_data_o(if_data)
);

endmodule
