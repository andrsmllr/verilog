/**
 * \file      mpeg2ts_tb
 *
 * \project   mpeg2_lib
 *
 * \langv     Verilog-2005
 *
 * \brief     Testbench for mpeg2ts.
 *
 * \details   Testbench for mpeg2ts.
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
 * \date      2015-06-04
 * \author    Andreas Mueller
**/

module mpeg2ts_tb;

`include "mpeg2ts.vh"

initial
begin
    $display("### SIMULATION STARTING ###");
    $display("Output format:\nIDENTIFIER :\t dec\t hex\t bin");
    $display("`SYNC_BYTE :\t %d\t 0x%h\t %b", `TSPH_SYNC_BYTE, `TSPH_SYNC_BYTE, `TSPH_SYNC_BYTE);
    $display("`TS_PAT_PID :\t %d\t 0x%h\t %b", `TS_PAT_PID, `TS_PAT_PID, `TS_PAT_PID);
    $display("`TS_CAT_PID :\t %d\t 0x%h\t %b", `TS_CAT_PID, `TS_CAT_PID, `TS_CAT_PID);
    $display("`TS_TSDT_PID :\t %d\t 0x%h\t %b", `TS_TSDT_PID, `TS_TSDT_PID, `TS_TSDT_PID);
    $display("`NPKT_PID :\t %d\t 0x%h\t %b", `TS_NPKT_PID, `TS_NPKT_PID, `TS_NPKT_PID);
    $display("`TSPH_LEN :\t %d", `TSPH_LEN);
    $display("`TSPH_SYNC_BYTE_BITPOS :\t %d\t -\t -", `TSPH_SYNC_BYTE_BITPOS);
    $display("`TSPH_SYNC_BYTE_BITLEN :\t %d\t -\t -", `TSPH_SYNC_BYTE_BITLEN);
    $display("`TSPH_SYNC_BYTE :\t %d\t -\t -", `TSPH_SYNC_BYTE);
    $display("`TSPH_TEI_BITPOS :\t %d\t -\t -", `TSPH_TEI_BITPOS);
    $display("`TSPH_TEI_BITLEN :\t %d\t -\t -", `TSPH_TEI_BITLEN);
    $display("`TSPH_PUSI_BITPOS :\t %d\t -\t -", `TSPH_PUSI_BITPOS);
    $display("`TSPH_PUSI_BITLEN :\t %d\t -\t -", `TSPH_PUSI_BITLEN);
    $display("`TSPH_TP_BITPOS :\t %d\t -\t -", `TSPH_TP_BITPOS);
    $display("`TSPH_TP_BITLEN :\t %d\t -\t -", `TSPH_TP_BITLEN);
    $display("`TSPH_PID_BITPOS :\t %d\t -\t -", `TSPH_PID_BITPOS);
    $display("`TSPH_PID_BITLEN :\t %d\t -\t -", `TSPH_PID_BITLEN);
    $display("`TSPH_TSC_BITPOS :\t %d\t -\t -", `TSPH_TSC_BITPOS);
    $display("`TSPH_TSC_BITLEN :\t %d\t -\t -", `TSPH_TSC_BITLEN);
    $display("`TSPH_AFC_BITPOS :\t %d\t -\t -", `TSPH_AFC_BITPOS);
    $display("`TSPH_AFC_BITLEN :\t %d\t -\t -", `TSPH_AFC_BITLEN);
    $display("`TSPH_CC_BITPOS :\t %d\t -\t -", `TSPH_CC_BITPOS);
    $display("`TSPH_CC_BITLEN :\t %d\t -\t -", `TSPH_CC_BITLEN);
    $display("### SIMULATION COMPLETED ###");
    $finish;
end

endmodule
