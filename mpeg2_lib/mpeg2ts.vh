/**
 * \file      mpeg2ts
 *
 * \project   mpeg2_lib
 *
 * \langv     Verilog-2005
 *
 * \brief     Definition of MPEG2-TS related quantities and subprograms.
 *
 * \details   This file contains definitions and subprograms which should deem
 *            helpful when working with the MPEG2 transport stream (MPEG2-TS).
 *
 * \bug       -
 *
 * \see       ISO-13818-1-2000, ITU-T Rec. H.222.0-2006
 *
 * \copyright GPLv2
 *
 * Revision history:
 *
 * \version   0.1
 * \date      2015-06-04
 * \author    Andreas Mueller
**/

`ifndef _MPEG2TS_H
`define _MPEG2TS_H

/**
 * Transport stream packet.
 *
 * In the following TSP is used instead of TS_PACKET or TS_PKT to shorten
 * identifiers.
**/
`define TSP_LEN 188 // TS packet length.
`define TSP_LEN_RS 204 // TS packet length with RS.
`define TSP_SYNC_BYTE 8'h47 // TS sync byte.

/**
 * Static PIDs.
**/
`define TS_PAT_PID (13'd0) // Program Association Table PID.
`define TS_CAT_PID (13'd1) // Conditional Access Table PID.
`define TS_TSDT_PID (13'd2) // Transport Stream Description Table PID.
`define TS_NPKT_PID (13'd8191) // Null packet PID.

/** 
 * Transport stream packet header.
 *
 * In the following TSPH is used instead of TS_PACKET_HEADER or TS_PKT_HDR to
 * shorten identifiers.
**/
`define TSPH_LEN (4) // Length of TS packet header.
`define TSPH_SYNC_BYTE_BITPOS 0 // Sync byte.
`define TSPH_SYNC_BYTE_BITLEN 8
`define TSPH_SYNC_BYTE 8'h47
`define TSPH_TEI_BITPOS 8 // Transport Error Indicator.
`define TSPH_TEI_BITLEN 1
`define TSPH_PUSI_BITPOS 9 // Payload Unit Start Indicator.
`define TSPH_PUSI_BITLEN 1
`define TSPH_TP_BITPOS 10 // Transport Priority.
`define TSPH_TP_BITLEN 1
`define TSPH_PID_BITPOS 11 // Packet Identification.
`define TSPH_PID_BITLEN 13
`define TSPH_TSC_BITPOS 24 // Transport Scrambling Control.
`define TSPH_TSC_BITLEN 2
`define TSPH_AFC_BITPOS 26 // Adaptation Field Control.
`define TSPH_AFC_BITLEN 2
`define TSPH_CC_BITPOS 28 // Continuity Counter.
`define TSPH_CC_BITLEN 4

/**
 * Adaptation field.
**/
`define AF_LEN_BITPOS 0 // Length.
`define AF_LEN_BITLEN 8
`define AF_DI_BITPOS 8 // Discontinuity indicator.
`define AF_DI_BITLEN 1
`define AF_RAI_BITPOS 8 // Random access indicator.
`define AF_RAI_BITLEN 1
`define AF_ESPI_BITPOS 8 // Elementary stream priority indicator.
`define AF_ESPI_BITLEN 1
`define AF_PCR_FLAG_BITPOS 8 // PCR flag.
`define AF_PCR_FLAG_BITLEN 1
`define AF_OPCR_FLAG_BITPOS 8 // OPCR flag.
`define AF_OPCR_FLAG_BITLEN 1
`define AF_SP_FLAG_BITPOS 8 // Splicing point flag.
`define AF_SP_FLAG_BITLEN 1
`define AF_TPD_FLAG_BITPOS 8 // Transport private data flag.
`define AF_TPD_FLAG_BITLEN 1
`define AF_AFE_FLAG_BITPOS 8 // Adaptation field extension flag.
`define AF_AFE_FLAG_BITLEN 1
// The following are non-static positions, thus only the length is given.
// PCR flag set.
`define AF_PCR_BASE_BITLEN 33 // PCR.
`define AF_PCR_RESERVED_BITLEN 6
`define AF_PCR_EXT_BITLEN 9
// OPCR flag set.
`define AF_OPCR_BASE_BITLEN 33 // OPCR.
`define AF_OPCR_RESERVED_BITLEN 6
`define AF_OPCR_EXT_BITLEN 9
// Splicing point flag set.
`define AF_SPC_BITLEN 8 // Splicing point countdown.
// Transport private data flag set.
`define AF_TPD_LEN_BITLEN 8 // Transport private data length.
// Adaptation field extension flag set.
`define AF_AFE_LENGTH_BITLEN 8 // Adaptiation field extension length.
// ... TODO

/**
 * Packetized Elementary Stream.
 * TODO: Should this part get its own header file?
**/
`define PES_PSCP_BITPOS 0 // Packet start code prefix.
`define PES_PSCP_BITLEN 24
`define PES_PSCP 24'h000001
`define PES_SID_BITPOS 24 // Stream ID.
`define PES_SID_BITLEN 8
`define PES_PESPL_BITPOS 32 // PES packet length.
`define PES_PESPL_BITLEN 16
// TODO: finish this.
 
/**
 * Misc.
**/
`define STC_FREQ 27_000_000
`define PCR_BASE_FREQ 90_000
`define PCR_EXT_FREQ 27_000_000

/**
 * Functions.
**/
function [7:0] tsph_get_sync_byte;
    input [0:31] tsph;
    begin
        tsph_get_sync_byte = tsph[0:7]; 
    end
endfunction

function tsph_get_tei;
    input [0:31] tsph;
    begin
        tsph_get_tei = tsph[8]; 
    end
endfunction

function tsph_get_pusi;
    input [0:31] tsph;
    begin
        tsph_get_pusi = tsph[9]; 
    end
endfunction

function tsph_get_tp;
    input [0:31] tsph;
    begin
        tsph_get_tp = tsph[10]; 
    end
endfunction

function [12:0] tsph_get_pid;
    input [0:31] tsph;
    begin
        tsph_get_pid = tsph[11:23]; 
    end
endfunction

function [1:0] tsph_get_tsc;
    input [0:31] tsph;
    begin
        tsph_get_tsc = tsph[24:25]; 
    end
endfunction

function [1:0] tsph_get_afc;
    input [0:31] tsph;
    begin
        tsph_get_afc = tsph[26:27]; 
    end
endfunction

function [3:0] tsph_get_cc;
    input [0:31] tsph;
    begin
        tsph_get_cc = tsph[28:31]; 
    end
endfunction

/**
 * Tasks.
**/
task tsph_dissect;
    input [0:31] tsph;
    output [7:0] tsph_sync_byte;
    output tsph_tei;
    output tsph_pusi;
    output tsph_tp;
    output [12:0] tsph_pid;
    output [1:0] tsph_tsc;
    output [1:0] tsph_afc;
    output [3:0] tsph_cc;
    begin
        tsph_sync_byte = tsph[0:7];
        tsph_tei = tsph[8];
        tsph_pusi = tsph[9];
        tsph_tp = tsph[10];
        tsph_pid = tsph[11:23];
        tsph_tsc = tsph[24:25];
        tsph_afc = tsph[26:27];
        tsph_cc = tsph[28:31];
    end
endtask
 
`endif // _MPEG2TS_H
