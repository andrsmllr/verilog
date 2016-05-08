/**
 * \file      dvbc
 *
 * \project   dvbc
 *
 * \langv     Verilog-2005
 *
 * \brief     DVB-C modulator.
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
 * \brief     Create file.
**/

module dvbc
#(
    parameter BB_SYMBOL_WIDTH = 8,
    parameter SIMULATION = 0,
    parameter DEBUG = 0
)
(
    // System interface.
    input wire       clk_sys_i,
    input wire       rst_sys_i,
    output reg       irq_o,
    output reg [7:0] status_o,
    input wire [7:0] ctrl_i,
    
    // MPEG2-TS data interface.
    input wire       tsp_clock,
    input wire [7:0] tsp_data,
    input wire       tsp_sync,
    input wire       tsp_valid,
    output reg       tsp_ack, // Interface extension.
    
    // Baseband (BB) data interface.
    input wire                       clk_bb_i,
    output reg [BB_SYMBOL_WIDTH-1:0] bb_symbol_i,
    output reg [BB_SYMBOL_WIDTH-1:0] bb_symbol_q
);

/*
 * Purpose of the following always block.
**/
always @ (posedge clk_i, posedge rst_i)
begin
    ;
end

endmodule
