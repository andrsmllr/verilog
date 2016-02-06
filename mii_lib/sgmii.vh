/**
 * \file      sgmii.vh
 *
 * \project   mii_lib
 *
 * \langv     Verilog-2005
 *
 * \brief     Macro definitions for the serial gigabit media-independent
 *            interface (SGMII).
 *
 * \details   This file contains macro definitions for the serial gigabit
 *            media-independent interface (SGMII).
 *            These macros are intended as a uniform way to easily add SGMIIs
 *            to the port interface of a module or to quickly declare nets of
 *            the required types.
 *
 *            There are 3 different interface types for the SGMII:
 *            SGMII_TX: SGMII transmit interface.
 *            SGMII_RX: SGMII receive interface.
 *            SGMII_MD: SGMII management data interface.
 *
 *            There are 4 different macros per SGMII interface type:
 *            In the following * stand for one of the SGMII interface types.
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

`ifndef _SGMII_H
`define _SGMII_H

/**
 * SGMII transmit signals.
**/
`define SGMII_TX(_type, _prefix, _suffix, _delim) \
_type _prefix``txclk``_suffix``_delim \
_type _prefix``tx``_suffix

/**
 * SGMII transmit signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define SGMII_TX_P2M(_type, _prefix, _suffix, _delim)

/**
 * SGMII transmit signals MAC to PHY.
**/
`define SGMII_TX_M2P(_type, _prefix, _suffix, _delim) \
_type _prefix``txclk``_suffix``_delim \
_type _prefix``tx``_suffix

/**
 * SGMII transmit signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define SGMII_TX_IO(_type, _prefix, _suffix, _delim)

/**
 * SGMII receive signals.
**/
`define SGMII_RX(_type, _prefix, _suffix, _delim) \
_type _prefix``txclk``_suffix``_delim \
_type _prefix``rx``_suffix

/**
 * SGMII receive signals PHY to MAC.
**/
`define SGMII_RX_P2M(_type, _prefix, _suffix, _delim) \
_type _prefix``txclk``_suffix``_delim \
_type _prefix``rx``_suffix

/**
 * SGMII receive signals MAC to PHY.
**/
// This would be an empty definition and is thus not included.
// `define SGMII_RX_M2P(_type, _prefix, _suffix, _delim)

/**
 * SGMII receive signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define SGMII_RX_IO(_type, _prefix, _suffix, _delim)

/**
 * SGMII management data signals.
**/
`define SGMII_MD(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix``_delim \
_type _prefix``mdio``_suffix

/**
 * SGMII management data signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define SGMII_MD_P2M(_type, _prefix, _suffix, _delim)

/**
 * SGMII management data signals MAC to PHY.
**/
`define SGMII_MD_M2P(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix

/**
 * SGMII management data signals bidirectional.
**/
`define SGMII_MD_IO(_type, _prefix, _suffix, _delim) \
_type _prefix``mdio``_suffix

`endif // _SGMII_H
