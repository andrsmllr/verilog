/**
 * \file      gen_lut_rom.v
 *
 * \project   gen_lut_rom
 *
 * \langv     Verilog-2005
 *
 * \brief     A generic ROM for table lookup.
 *
 * \details   A generic ROM with unbuffered address input
 *            and unbuffered data output.
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

module gen_lut_rom
#(
    parameter MEMORY_FILE = "rom.mem",
    parameter ADDR_WIDTH = 10,
    parameter ROM_WIDTH = 8
)
(
    input  wire [ADDR_WIDTH-1:0] addr_i,
    output wire [ROM_WIDTH-1:0]  data_o
);

reg [ROM_WIDTH-1:0] rom [2**ADDR_WIDTH-1:0];

initial
begin
    $readmemh(MEMORY_FILE, rom);
end

/**
 * Read data from ROM.
**/
assign data_o = rom[addr_i];

endmodule
