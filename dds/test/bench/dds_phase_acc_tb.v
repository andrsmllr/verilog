/**
 * \file      dds_phase_acc_tb.v
 *
 * \project   dds
 *
 * \langv     Verilog-2005
 *
 * \brief     Testbench for module dds_phase_acc.
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

module dds_phase_acc_tb;

   localparam PHASE_INC_WIDTH = 16;
   localparam PHASE_ACC_WIDTH = 16;
   localparam PHASE_INITIAL = 0;

   reg                        clk = 1'b0;
   reg                        rst = 1'b1;
   reg  [PHASE_INC_WIDTH-1:0] phase_inc;
   reg                        phase_inc_ena;
   reg  [PHASE_ACC_WIDTH-1:0] phase_load;
   reg                        phase_load_ena;
   wire [PHASE_ACC_WIDTH-1:0] phase_acc;
   wire                       phase_acc_carry;

/**
 * Run simulation.
**/
initial
begin
    $display("# Simulation started. #");
    rst <= 1'b1;
    phase_inc <= 'h0000;
    phase_inc_ena <= 1'b0;
    phase_load <= 'h0000;
    phase_load_ena <= 1'b0;
    #100;
    rst <= 1'b0;
    #100;
    phase_inc <= 'h0080;
    phase_inc_ena <= 1'b1;
    #300;
    phase_inc_ena <= 1'b0;
    #10;
    phase_load <= 'h0123;
    phase_load_ena <= 1'b1;
    #2;
    phase_load_ena <= 1'b0;
    phase_inc <= 'h0FFF;
    phase_inc_ena <= 1'b1;
    #100;   
    $display("# Simulation finished. #");
    $finish;
end

/**
 * Trace signals.
**/
initial
begin
    $dumpfile("dds_phase_acc_tb.vcd");
    $dumpvars(2);
end

/**
 * Generate clock.
**/
always
begin
    #1 clk <= ~clk;
end

/**
 * DUT.
**/
dds_phase_acc #(
    .PHASE_INC_WIDTH(PHASE_INC_WIDTH),
    .PHASE_ACC_WIDTH(PHASE_ACC_WIDTH),
    .PHASE_INITIAL(PHASE_INITIAL)
)
i_dut_dds_phase_acc (
    .clk_i(clk),
    .rst_i(rst),
    .phase_inc_i(phase_inc),
    .phase_inc_ena_i(phase_inc_ena),
    .phase_load_i(phase_load),
    .phase_load_ena_i(phase_load_ena),
    .phase_acc_o(phase_acc),
    .phase_acc_carry_o(phase_acc_carry)
);

endmodule
