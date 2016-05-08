/**
 * \file      dds_sin_rom_tb.v
 *
 * \project   dds
 *
 * \langv     Verilog-2005
 *
 * \brief     Testbench for module dds_sin_rom.
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
 * \date      2016-03-02
 * \author    Andreas Mueller
 * \brief     Create file.
**/

module dds_sin_rom_tb;

/**
 * DUT parameters.
**/
   parameter PHASE_WIDTH = 12;
   parameter ROM_WIDTH = 8;
   parameter ROM_INIT_FILE = "dds_sin_rom.mem";

/**
 * DUT signals.
**/
   reg [PHASE_WIDTH-1:0] phase;
   wire [ROM_WIDTH-1:0]  sinus;
   
   
/**
 * Run simulation.
**/
integer i = 0;

initial
begin
    $display("# Simulation started. #");
    phase <= 'b0;
    #1;
    for (i = 0; i < 1000; i = i+1) begin
	phase <= phase + 10;
        #1;
    end
    $display("# Simulation finished. #");
    $finish;
end

/**
 * Trace variables.
**/
initial
begin
    $dumpfile("dds_sin_rom_tb.vcd");
    $dumpvars(2);
end   

/**
 * DUT.
**/
dds_sin_rom #(
    .PHASE_WIDTH(PHASE_WIDTH),
    .ROM_WIDTH(ROM_WIDTH),
    .ROM_INIT_FILE(ROM_INIT_FILE)
)
i_dut_sin_rom (
    .phase_i(phase),
    .sin_o(sinus)
);

endmodule
