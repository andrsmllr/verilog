/**
 * \file      dds_phase_acc.v
 *
 * \project   dds
 *
 * \langv     Verilog-2005
 *
 * \brief     A general purpose phase accumulator.
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
 * \date      2016-03-01
 * \author    Andreas Mueller
 * \brief     Create file.
**/

module dds_phase_acc
#(
    parameter PHASE_INC_WIDTH = 16,
    parameter PHASE_ACC_WIDTH = 16,
    parameter PHASE_INITIAL = 0
)
(
    input  wire                       clk_i,
    input  wire                       rst_i,
    input  wire [PHASE_INC_WIDTH-1:0] phase_inc_i,
    input  wire                       phase_inc_ena_i,
    input  wire [PHASE_ACC_WIDTH-1:0] phase_load_i,
    input  wire                       phase_load_ena_i,
    output wire [PHASE_ACC_WIDTH-1:0] phase_acc_o,
    output wire                       phase_acc_carry_o
);

    reg [PHASE_ACC_WIDTH-1:0]         phase_acc;
    reg                               phase_acc_carry;

/**
 * Phase accumulator.
**/
always @ (posedge clk_i)
begin
    if (rst_i == 1'b1) begin
        phase_acc <= PHASE_INITIAL;
        phase_acc_carry <= 1'b0;
    end else begin
        if (phase_load_ena_i == 1'b1) begin
            phase_acc <= phase_load_i;
        end else if (phase_inc_ena_i == 1'b1) begin
            {phase_acc_carry, phase_acc} <= phase_acc + phase_inc_i;
        end
    end
end

assign phase_acc_o = phase_acc;
assign phase_acc_carry_o = phase_acc_carry;

endmodule

