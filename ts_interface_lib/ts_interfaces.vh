/**
 * \file      ts_interfaces
 *
 * \project   ts_interfaces
 *
 * \langv     Verilog-2005
 *
 * \brief     Definition of various TS intefaces for usage in port
 *            declarations.
 *
 * \details   This file contains macros for a number of standardized or
 *            frequently used TS interfaces. These macros are intended to
 *            supply a uniform way to add TS interfaces to the port
 *            declaration of modules in order to improve interoperabilty.
 *
 * \bug       -
 *
 * \see       EN 50083-9
 *
 * \copyright GPLv2
 *
 * Revision history:
 *
 * \version   0.1
 * \date      2015-06-05
 * \author    Andreas Mueller
**/

`ifndef _TS_INTERFACES
`define _TS_INTERFACES

/**
 * Serial TS interface.
 * This port interface is identical to the synchronous parallel interface(SPI)
 * defined in EN 50083-9.
**/
`define tsif_ser(name, direction) \
direction name``_clk,\
direction name``_data,\
direction name``_sync,\
direction name``_valid

/**
 * Parallel TS interface 8 bit.
**/
`define tsif_par(name, direction) `tsif_par_8b(name, direction)
`define tsif_par_8b(name, direction) \
direction       name``_clk,\
direction [7:0] name``_data,\
direction       name``_sync,\
direction       name``_valid

/**
 * Parallel TS interface 16 bit.
**/
`define tsif_par_16b(name, direction) \
direction        name``_clk,\
direction [15:0] name``_data,\
direction        name``_sync,\
direction        name``_valid

/**
 * Parallel TS interface 32 bit.
**/
`define tsif_par_32b(name, direction) \
direction        name``_clk,\
direction [31:0] name``_data,\
direction        name``_sync,\
direction        name``_valid

/**
 * Transport stream interfaces as standardized by EN 50083-9.
**/

/**
 * Synchronous Parallel Interface (SPI), EN 50083-9.
**/
`define tsif_spi(name, direction) \
direction       name``_clock,\
direction [7:0] name``_data,\
direction       name``_dvalid,\
direction       name``_psync

/**
 * Synchronous Serial Interface (SSI), EN 50083-9.
 * This port interface is trivial, but is listed for completeness.
**/
`define tsif_ssi(name, direction) \
direction name``_data,\

/**
 * Asynchronous Serial Interface (ASI), EN 50083-9.
 * This port interface is trivial, but is listed for completeness.
**/
`define tsif_asi(name, direction) \
direction name``_data,\

`endif // _TS_INTERFACES
