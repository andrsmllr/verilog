/**
 * \file      dvbc_qam_mapper
 *
 * \project   dvbc
 *
 * \langv     Verilog-2005
 *
 * \brief     QAM mapper for DVB-C modulator.
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
**/

module dvbc_qam_mapper
#(
    parameter PARAM1 = 0,
    parameter PARAM2 = 8
)
(
    input wire clk_i,
    input wire rst_i,
    input wire[PARAM2-1:0] data_i,
    output reg[PARAM2-1:0] data_o
);

/*
 * Purpose of the following always block.
**/
always@(posedge clk_i or posedge rst_i)
begin
    if (rst_i == 1'b1)
        data_o <= 'b0;
    else
        data_o <= data_i;
end

endmodule
