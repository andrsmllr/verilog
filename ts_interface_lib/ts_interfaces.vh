/**
 * \file      ts_interfaces.vh
 *
 * \project   ts_interfaces
 *
 * \langv     Verilog-2005
 *
 * \brief     Definition of various intefaces for MPEG-2 transport streams
 *            (MPEG-2 TS) to be used in port declarations.
 *
 * \details   This file contains macros for a number of standardized or
 *            frequently used MPEG-2 TS interfaces. These macros are intended
 *            as a uniform way to easily add MPEG-2 TS interfaces to the port 
 *            interface of a module or to quickly declare nets of the required
 *            types.
 *
 * \bug       -
 *
 * \see       EN 50083-9
 *
 * \copyright GPLv2
 *
 * Revision history:
 *
 * \version   0.2
 * \date      2015-11-20
 * \author    Andreas Mueller
 * \brief     Generalize macros to allow port and net declarations alike.
 *            This brakes backwards compatibility.
 *
 * \version   0.1
 * \date      2015-06-05
 * \author    Andreas Mueller
 * \brief     Create file.
**/

`ifndef _TS_INTERFACES
`define _TS_INTERFACES

/**
 * Proprietary interfaces for MPEG-2 TSs.
**/

/**
 * Serial MPEG-2 TS interface.
**/
`define tsif_ser(_type, _prefix, _suffix) \
_type _prefix``clk``_suffix,\
_type _prefix``data``_suffix,\
_type _prefix``sync``_suffix,\
_type _prefix``valid``_suffix

/**
 * Parallel MPEG-2 TS interface 8 bit.
 * This port interface is identical to the synchronous parallel interface(SPI)
 * defined in EN 50083-9.
**/
`define tsif_par(_type, _prefix, _suffix) `tsif_par_8b(_type, _prefix, _suffix)
`define tsif_par_8b(_type, _prefix, _suffix) \
_type       _prefix``clk``_suffix,\
_type [7:0] _prefix``data``_suffix,\
_type       _prefix``sync``_suffix,\
_type       _prefix``valid``_suffix

/**
 * Parallel MPEG-2 TS interface 16 bit.
**/
`define tsif_par_16b(_type, _prefix, _suffix) \
_type        _prefix``clk``_suffix,\
_type [15:0] _prefix``data``_suffix,\
_type        _prefix``sync``_suffix,\
_type        _prefix``valid``_suffix

/**
 * Parallel MPEG-2 TS interface 32 bit.
**/
`define tsif_par_32b(_type, _prefix, _suffix) \
_type        _prefix``clk``_suffix,\
_type [31:0] _prefix``data``_suffix,\
_type        _prefix``sync``_suffix,\
_type        _prefix``valid``_suffix

/**
 * MPEG-2 TS interfaces as standardized by EN 50083-9.
**/

/**
 * Synchronous Parallel Interface (SPI), ref. EN 50083-9.
**/
`define tsif_spi(_type, _prefix, _suffix) \
_type       _prefix``clock``_suffix,\
_type [7:0] _prefix``data``_suffix,\
_type       _prefix``dvalid``_suffix,\
_type       _prefix``psync``_suffix

/**
 * Synchronous Serial Interface (SSI), ref. EN 50083-9.
 * This port interface is trivial, but is listed for completeness.
**/
`define tsif_ssi(_type, _prefix, _suffix) \
_type _prefix``data``_suffix

/**
 * Asynchronous Serial Interface (ASI), ref. EN 50083-9.
 * This port interface is trivial, but is listed for completeness.
**/
`define tsif_asi(_type, _prefix, _suffix) \
_type _prefix``data``_suffix

`endif // _TS_INTERFACES
