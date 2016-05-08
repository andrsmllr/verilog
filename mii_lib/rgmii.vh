/**
 * \file      rgmii.vh
 *
 * \project   mii_lib
 *
 * \langv     Verilog-2005
 *
 * \brief     Macro definitions for the reduced gigabit media-independent
 *            interface (RGMII).
 *
 * \details   This file contains macro definitions for the reduced gigabit
 *            media-independent interface (RGMII).
 *            These macros are intended as a uniform way to easily add RGMIIs
 *            to the port interface of a module or to quickly declare nets of
 *            the required types.
 *
 *            There are 3 different interface types for the RGMII:
 *            RGMII_TX: RGMII transmit interface.
 *            RGMII_RX: RGMII receive interface.
 *            RGMII_MD: RGMII management data interface.
 *
 *            There are 4 different macros per RGMII interface type:
 *            In the following * stand for one of the RGMII interface types.
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

`ifndef _RGMII_H
`define _RGMII_H

/**
 * RGMII transmit signals.
**/
`define RGMII_TX(_type, _prefix, _suffix, _delim) \
_type       _prefix``txc``_suffix``_delim \
_type [3:0] _prefix``txd``_suffix``_delim \
_type       _prefix``tx_ctl``_suffix

/**
 * RGMII transmit signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define RGMII_TX_P2M(_type, _prefix, _suffix, _delim)

/**
 * RGMII transmit signals MAC to PHY.
**/
`define RGMII_TX_M2P(_type, _prefix, _suffix, _delim) \
_type       _prefix``txc``_suffix``_delim \
_type [3:0] _prefix``txd``_suffix``_delim \
_type       _prefix``tx_ctl``_suffix

/**
 * RGMII transmit signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define RGMII_TX_IO(_type, _prefix, _suffix, _delim)

/**
 * RGMII receive signals.
**/
`define RGMII_RX(_type, _prefix, _suffix, _delim) \
_type       _prefix``rxc``_suffix``_delim \
_type [3:0] _prefix``rxd``_suffix``_delim \
_type       _prefix``rx_ctl``_suffix

/**
 * RGMII receive signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define RGMII_RX_P2M(_type, _prefix, _suffix, _delim)

/**
 * RGMII receive signals MAC to PHY.
**/
`define RGMII_RX_M2P(_type, _prefix, _suffix, _delim) \
_type       _prefix``rxc``_suffix``_delim \
_type [3:0] _prefix``rxd``_suffix``_delim \
_type       _prefix``rx_ctl``_suffix

/**
 * RGMII receive signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define RGMII_RX_IO(_type, _prefix, _suffix, _delim)

/**
 * RGMII management data signals.
**/
`define RGMII_MD(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix``_delim \
_type _prefix``mdio``_suffix

/**
 * RGMII management data signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define RGMII_MD_P2M(_type, _prefix, _suffix, _delim)

/**
 * RGMII management data signals MAC to PHY.
**/
`define RGMII_MD_M2P(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix

/**
 * RGMII management data signals bidirectional.
**/
`define RGMII_MD_IO(_type, _prefix, _suffix, _delim) \
_type _prefix``mdio``_suffix

`endif // _RGMII_H
