/**
 * \file      xgmii.vh
 *
 * \project   mii_lib
 *
 * \langv     Verilog-2005
 *
 * \brief     Macro definitions for the 10 gigabit media-independent interface
 *            (XGMII).
 *
 * \details   This file contains macro definitions for the 10 gigabit
 *            media-independent interface (XGMII).
 *            These macros are intended as a uniform way to easily add SGMIIs
 *            to the port interface of a module or to quickly declare nets of
 *            the required types.
 *
 *            There are 3 different interface types for the XGMII:
 *            XGMII_TX: XGMII transmit interface.
 *            XGMII_RX: XGMII receive interface.
 *            XGMII_MD: XGMII management data interface.
 *
 *            There are 4 different macros per XGMII interface type:
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
 * \brief     Initial implementation.
 *            Update description.
 *
 * \version   0.1
 * \date      2015-11-25
 * \author    Andreas Mueller
 * \brief     Create file.
**/

`ifndef _XGMII_H
`define _XGMII_H

/**
 *  XGMII transmit signals.
**/
`define XGMII_TX(_type, _prefix, _suffix, _delim) \
_type        _prefix``tx_clk``_suffix``_delim \
_type [31:0] _prefix``txd``_suffix``_delim \
_type [3:0]  _prefix``txc``_suffix

/**
 *  XGMII transmit signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define XGMII_TX_P2M(_type, _prefix, _suffix, _delim)

/**
 *  XGMII transmit signals MAC to PHY.
**/
`define XGMII_TX_M2P(_type, _prefix, _suffix, _delim) \
_type        _prefix``tx_clk``_suffix``_delim \
_type [31:0] _prefix``txd``_suffix``_delim \
_type [3:0]  _prefix``txc``_suffix

/**
 *  XGMII transmit signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define XGMII_TX_IO(_type, _prefix, _suffix, _delim)

/**
 *  XGMII receive signals.
**/
`define XGMII_RX(_type, _prefix, _suffix, _delim) \
_type        _prefix``rx_clk``_suffix``_delim \
_type [31:0] _prefix``rxd``_suffix``_delim \
_type [3:0]  _prefix``rxc``_suffix

/**
 *  XGMII receive signals PHY to MAC.
**/
`define XGMII_RX_P2M(_type, _prefix, _suffix, _delim) \
_type        _prefix``rx_clk``_suffix``_delim \
_type [31:0] _prefix``rxd``_suffix``_delim \
_type [3:0]  _prefix``rxc``_suffix

/**
 *  XGMII receive signals MAC to PHY.
**/
// This would be an empty definition and is thus not included.
// `define XGMII_RX_M2P(_type, _prefix, _suffix, _delim)

/**
 *  XGMII receive signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define XGMII_RX_IO(_type, _prefix, _suffix, _delim)

/**
 * XGMII management data signals.
**/
`define XGMII_MD(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix``_delim \
_type _prefix``mdio``_suffix

/**
 * XGMII management data signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define XGMII_MD_P2M(_type, _prefix, _suffix, _delim)

/**
 * XGMII management data signals MAC to PHY.
**/
`define XGMII_MD_M2P(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix

/**
 * XGMII management data signals bidirectional.
**/
`define XGMII_MD_IO(_type, _prefix, _suffix, _delim) \
_type _prefix``mdio``_suffix

`endif // _XGMII_H
