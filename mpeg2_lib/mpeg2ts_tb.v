/**
 * \file      mpeg2ts_tb
 *
 * \project   mpeg2
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

`include "mpeg2ts.vh"

module mpeg2ts_tb;

initial
begin
    $display("### SIMULATION STARTING ###");
    $display("Output format:\nIDENTIFIERT : dec, hex, bin");
    $display("`SYNC_BYTE : %d, 0x%h, %b", `TSPH_SYNC_BYTE, `TSPH_SYNC_BYTE, `TSPH_SYNC_BYTE);
    $display("`TS_PAT_PID : %d, 0x%h, %b", `TS_PAT_PID, `TS_PAT_PID, `TS_PAT_PID);
    $display("`TS_CAT_PID : %d, 0x%h, %b", `TS_CAT_PID, `TS_CAT_PID, `TS_CAT_PID);
    $display("`TS_TSDT_PID : %d, 0x%h, %b", `TS_TSDT_PID, `TS_TSDT_PID, `TS_TSDT_PID);
    $display("`NPKT_PID : %d, 0x%h, %b", `TS_NPKT_PID, `TS_NPKT_PID, `TS_NPKT_PID);
    $display("`TSPH_LEN : %d", `TSPH_LEN);
    $display("`TSPH_SYNC_BYTE_BITPOS : %d", `TSPH_SYNC_BYTE_BITPOS);
    $display("`TSPH_SYNC_BYTE_BITLEN : %d", `TSPH_SYNC_BYTE_BITLEN);
    $display("`TSPH_SYNC_BYTE : %d", `TSPH_SYNC_BYTE);
    $display("`TSPH_TEI_BITPOS : %d", `TSPH_TEI_BITPOS);
    $display("`TSPH_TEI_BITLEN : %d", `TSPH_TEI_BITLEN);
    $display("`TSPH_PUSI_BITPOS : %d", `TSPH_PUSI_BITPOS);
    $display("`TSPH_PUSI_BITLEN : %d", `TSPH_PUSI_BITLEN);
    $display("`TSPH_TP_BITPOS : %d", `TSPH_TP_BITPOS);
    $display("`TSPH_TP_BITLEN : %d", `TSPH_TP_BITLEN);
    $display("`TSPH_PID_BITPOS : %d", `TSPH_PID_BITPOS);
    $display("`TSPH_PID_BITLEN : %d", `TSPH_PID_BITLEN);
    $display("`TSPH_TSC_BITPOS : %d", `TSPH_TSC_BITPOS);
    $display("`TSPH_TSC_BITLEN : %d", `TSPH_TSC_BITLEN);
    $display("`TSPH_AFC_BITPOS : %d", `TSPH_AFC_BITPOS);
    $display("`TSPH_AFC_BITLEN : %d", `TSPH_AFC_BITLEN);
    $display("`TSPH_CC_BITPOS : %d", `TSPH_CC_BITPOS);
    $display("`TSPH_CC_BITLEN : %d", `TSPH_CC_BITLEN);
    $display("### SIMULATION COMPLETED ###");
    $finish;
end

endmodule
