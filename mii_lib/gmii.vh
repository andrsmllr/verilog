/**
 * \file      gmii.vh
 *
 * \project   mii_lib
 *
 * \langv     Verilog-2005
 *
 * \brief     Macro definitions for the gigabit media-independent interface
 *            (GMII).
 *
 * \details   This file contains macro definitions for the gigabit
 *            media-independent interface (GMII).
 *            These macros are intended as a uniform way to easily add GMIIs
 *            to the port interface of a module or to quickly declare nets of
 *            the required types.
 *
 *            There are 3 different interface types for the GMII:
 *            GMII_TX: GMII transmit interface.
 *            GMII_RX: GMII receive interface.
 *            GMII_MD: GMII management data interface.
 *
 *            There are 4 different macros per GMII interface type:
 *            In the following * stand for one of the GMII interface types.
 *            *: defines the complete interface. Can be used for net declar-
 *              ations or in cases where direction does not matter.
 *            *_P2M: defines only those part of the interface which contains
 *              signals from the PHY to the MAC.
 *            *_M2P: defines only those part of the interface which contains
 *              signals from the MAC to the PHY.
 *            *_IO: defines only those part of the interface which contains
 *              signals which connect MAC and PHY bidirectionally.
 *
 * \bug       -
 *
 * \see       -
 *
 * \copyright GPLv2
 *
 * Revision history:
 *
 * \version   0.2
 * \date      2016-02-06
 * \author    Andreas Mueller
 * \brief     Differentiate the intended directivity of macros more clearly.
 *            Add stubs for non-existent interface directions for clarity.
 *            Update description.
 *
 * \version   0.1
 * \date      2015-11-28
 * \author    Andreas Mueller
 * \brief     Create file.
**/

`ifndef _GMII_H
`define _GMII_H

/**
 * GMII transmit signals.
**/
`define GMII_TX_M2P(_type, _prefix, _suffix, _delim) \
_type       _prefix``gtxclk``_suffix``_delim \
_type       _prefix``txclk``_suffix``_delim \
_type [7:0] _prefix``txd``_suffix``_delim \
_type       _prefix``txen``_suffix``_delim \
_type       _prefix``txer``_suffix

/**
 * GMII transmit signals PHY to MAC.
**/
`define GMII_TX_P2M(_type, _prefix, _suffix, _delim) \
_type _prefix``txclk``_suffix

/**
 * GMII transmit signals MAC to PHY.
**/
`define GMII_TX_M2P(_type, _prefix, _suffix, _delim) \
_type       _prefix``gtxclk``_suffix``_delim \
_type [7:0] _prefix``txd``_suffix``_delim \
_type       _prefix``txen``_suffix``_delim \
_type       _prefix``txer``_suffix

/**
 * GMII transmit signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define GMII_TX_IO(_type, _prefix, _suffix, _delim)

/**
 * GMII receive signals.
**/
`define GMII_RX(_type, _prefix, _suffix, _delim) \
_type       _prefix``rxclk``_suffix``_delim \
_type [7:0] _prefix``rxd``_suffix``_delim \
_type       _prefix``rxdv``_suffix``_delim \
_type       _prefix``rxer``_suffix``_delim \
_type       _prefix``col``_suffix``_delim \
_type       _prefix``crs``_suffix

/**
 * GMII receive signals PHY to MAC.
**/
`define GMII_RX_P2M(_type, _prefix, _suffix, _delim) \
_type       _prefix``rxclk``_suffix``_delim \
_type [7:0] _prefix``rxd``_suffix``_delim \
_type       _prefix``rxdv``_suffix``_delim \
_type       _prefix``rxer``_suffix``_delim \
_type       _prefix``col``_suffix``_delim \
_type       _prefix``crs``_suffix

/**
 * GMII receive signals MAC to PHY.
**/
// This would be an empty definition and is thus not included.
// `define GMII_RX_M2P(_type, _prefix, _suffix, _delim)

/**
 * GMII receive signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define GMII_RX_IO(_type, _prefix, _suffix, _delim)

/**
 * GMII management data signals.
**/
`define GMII_MD(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix``_delim \
_type _prefix``mdio``_suffix

/**
 * GMII management data signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define GMII_MD_P2M(_type, _prefix, _suffix, _delim)

/**
 * GMII management data signals MAC to PHY.
**/
`define GMII_MD_M2P(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix

/**
 * GMII management data signals bidirectional.
**/
`define GMII_MD_IO(_type, _prefix, _suffix, _delim) \
_type _prefix``mdio``_suffix

`endif // _GMII_H
