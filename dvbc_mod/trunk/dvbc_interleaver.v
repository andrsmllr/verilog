/**
 * \file      dvbc_interleaver
 *
 * \project   dvbc
 *
 * \langv     Verilog-2005
 *
 * \brief     Interleaver for DVB-C modulator.
 *
 * \details   -
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

module dvbc_interleaver
#(
    parameter SIMULATION = 0,
    parameter DEBUG = 0
)
(
    input wire clk_i,
    input wire rst_i
);

/*
 * Purpose of the following always block.
**/
always @ (posedge clk_i, posedge rst_i)
begin
    ;
end

endmodule
