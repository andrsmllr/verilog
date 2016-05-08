/**
 * \file      dvbc_randomizer
 *
 * \project   dvbc
 *
 * \langv     Verilog-2005
 *
 * \brief     Randomizer to perform energy dispersal.
 *
 * \details   Randomizer to perform energy dispersal and sync byte inversion
 *            according to ETSI EN 300429.
 *            The randomizer implements a LSFR using the polynomial
 *            x^15+x^14+1.
 *
 * \bug       -
 *
 * \see       ETSI EN 300429
 *
 * \copyright GPLv2
 *
 * Revision history:
 *
 * \version   0.1
 * \date      2015-06-05
 * \author    Andreas Mueller
 * \brief     Create file.
**/

module dvbc_randomizer
#(
    parameter SIMULATION = 0,
    parameter DEBUG = 0
)
(
    input wire clk_i,
    input wire rst_i
);

localparam LSFR_POLYNOMIAL = 16'b1100000000000001; // Highest power @ MSB.
localparam LSFR_INIT_VALUE = 15'b100101010000000; // Highest power @ MSB.

reg [7:0] LSFR_LUT [0:255];

/*
 * Purpose of the following always block.
**/
always @ (posedge clk_i)
begin
    ;
end

endmodule
