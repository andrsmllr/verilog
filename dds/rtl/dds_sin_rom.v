/**
 * \file      dds_sin_rom.v
 *
 * \project   dds
 *
 * \langv     Verilog-2005
 *
 * \brief     A ROM for sine lookup.
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

module dds_sin_rom
#(
    parameter PHASE_WIDTH = 12,
    parameter ROM_WIDTH = 8,
    parameter ROM_INIT_FILE = "dds_sin_rom.mem"
)
(
    input  wire [PHASE_WIDTH-1:0] phase_i,
    output wire [ROM_WIDTH-1:0]   sin_o
);

reg [ROM_WIDTH-1:0] rom [0:2**PHASE_WIDTH-1];

initial
begin
    $readmemh(ROM_INIT_FILE, rom);
end

/*
 * Sin lookup.
**/
assign sin_o = rom[phase_i];

endmodule
