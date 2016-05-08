/**
 * \file      gen_lut_rom_tb.v
 *
 * \project   gen_lut_rom
 *
 * \langv     Verilog-2005
 *
 * \brief     Testbench for module gen_lut_rom.
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
 * \date      2016-03-14
 * \author    Andreas Mueller
 * \brief     Create file.
**/

module gen_lut_rom_tb;

/**
 * DUT parameters.
**/
   parameter ADDR_WIDTH = 10;
   parameter ROM_WIDTH = 8;
   parameter MEMORY_FILE = "rom.mem";

/**
 * DUT signals.
**/
   reg  [ADDR_WIDTH-1:0] addr;
   wire signed [ROM_WIDTH-1:0]  data;

/**
 * Run simulation.
**/
integer i = 0;   
initial
  begin
     $display("### Simulation started. ###");
     addr <= 'b0;
     #1;
     for (i = 0; i < 2**ADDR_WIDTH-1; i = i + 1) begin
	addr <= addr + 1;
	#1;
     end
     $display("### Simulation finished. ###");
     $finish;
  end

/**
 * Trace variables.
**/
initial
begin
    $dumpfile("gen_lut_rom_tb.vcd");
    $dumpvars();
end

/**
 * DUT.
**/
gen_lut_rom #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .ROM_WIDTH(ROM_WIDTH),
    .MEMORY_FILE(MEMORY_FILE)
)
dut_gen_lut_rom (
    .addr_i(addr),
    .data_o(data)
);

endmodule
