/**
 * \file      dds.v
 *
 * \project   dds
 *
 * \langv     Verilog-2005
 *
 * \brief     This module performs a simple form of direct digital synthesis.
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

module dds
#(
    parameter BB_DATA_WIDTH = 8,
    parameter PHASE_INC_WIDTH = 16,
    parameter PHASE_ACC_WIDTH = 16,
    parameter PHASE_INITIAL = 0,
    parameter SIN_PHASE_WIDTH = 12,
    parameter SIN_ROM_WIDTH = 8,
    parameter SIN_ROM_INIT_FILE = "dds_sin_rom.mem"
)
(
    input  wire                                  clk_i,
    input  wire                                  rst_i,
    input  wire [BB_DATA_WIDTH-1:0]              bb_data_i,
    input  wire [PHASE_INC_WIDTH-1:0]            phase_inc_i,
    input  wire                                  phase_inc_ena_i,
    output reg signed [BB_DATA_WIDTH+SIN_ROM_WIDTH+1-1:0] if_data_o
);

/*****************************************************************************
 * Declaration region.
**/

   wire [PHASE_INC_WIDTH-1:0] phase_inc;
   wire 		      phase_inc_ena;
   wire [PHASE_INC_WIDTH-1:0] phase_load;
   wire 		      phase_load_ena;
   wire [PHASE_ACC_WIDTH-1:0] phase_acc;
   reg  [PHASE_ACC_WIDTH-1:0] phase_acc_reg;
   wire 		      phase_acc_carry;

   wire [SIN_ROM_WIDTH-1:0]   sin;
   reg [SIN_ROM_WIDTH-1:0]    sin_reg;

   reg signed [BB_DATA_WIDTH+SIN_ROM_WIDTH+1-1:0] if_data;
   
   
/*****************************************************************************
 * Implementation region.
**/
  
/**
 * Phase accumulator.
**/
dds_phase_acc #(
    .PHASE_INC_WIDTH(PHASE_INC_WIDTH),
    .PHASE_ACC_WIDTH(PHASE_ACC_WIDTH),
    .PHASE_INITIAL(PHASE_INITIAL)
)
i_phase_acc (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .phase_inc_i(phase_inc_i),
    .phase_inc_ena_i(phase_inc_ena_i),
    .phase_load_i(phase_load),
    .phase_load_ena_i(phase_load_ena),
    .phase_acc_o(phase_acc),
    .phase_acc_carry_o(phase_acc_carry)
);

assign phase_load = 'b0;
assign phase_load_ena = 1'b0;

always @ (posedge clk_i)
  begin
     phase_acc_reg <= $signed(phase_acc);
  end

/**
 * Sin lookup.
**/
dds_sin_rom #(
    .PHASE_WIDTH(SIN_PHASE_WIDTH),
    .ROM_WIDTH(SIN_ROM_WIDTH),
    .ROM_INIT_FILE(SIN_ROM_INIT_FILE)
)
i_sin_rom (
    .phase_i(phase_acc_reg[PHASE_ACC_WIDTH-1:PHASE_ACC_WIDTH-12]),
    .sin_o(sin)
 );

/**
 * Up-conversion.
**/
always @ (posedge clk_i, posedge rst_i)
  begin
     if (rst_i == 1'b1) begin
	sin_reg <= 'b0;
     end else begin
	sin_reg <= sin;
	if_data <= $signed({1'b0, bb_data_i}) * $signed(sin_reg);
     end
  end


/**
 * DDS control.
**/
always @ (posedge clk_i, posedge rst_i)
  begin
     if (rst_i == 1'b1) begin
	if_data_o <= 'b0;
     end else begin
	if_data_o <= if_data;
     end
  end

endmodule
