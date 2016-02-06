/**
 * \file      mii.vh
 *
 * \project   mii_lib
 *
 * \langv     Verilog-2005
 *
 * \brief     Macro definitions for the media-independent interface (MII).
 *
 * \details   This file contains macro definitions for the media-independent
 *            interface (MII).
 *            These macros are intended as a uniform way to easily add MIIs
 *            to the port interface of a module or to quickly declare nets of
 *            the required types.
 *
 *            There are 3 different interface types for the RMII:
 *            MII_TX: MII transmit interface.
 *            MII_RX: MII receive interface.
 *            MII_MD: MII management data interface.
 *
 *            There are 4 different macros per MII interface type:
 *            In the following * stand for one of the MII interface types.
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
 * \date      2015-11-25
 * \author    Andreas Mueller
 * \brief     Create file.
**/

`ifndef _MII_H
`define _MII_H

/**
 * MII transmit signals.
**/
`define MII_TX(_type, _prefix, _suffix, _delim) \
_type       _prefix``tx_clk``_suffix``_delim \
_type [3:0] _prefix``txd``_suffix``_delim \
_type       _prefix``tx_en``_suffix``_delim \
_type       _prefix``tx_er``_suffix

/**
 * MII transmit signals PHY to MAC.
**/
`define MII_TX_P2M(_type, _prefix, _suffix, _delim) \
_type _prefix``tx_clk``_suffix

/**
 * MII transmit signals MAC to PHY.
**/
`define MII_TX_M2P(_type, _prefix, _suffix, _delim) \
_type [3:0] _prefix``txd``_suffix``_delim \
_type       _prefix``tx_en``_suffix``_delim \
_type       _prefix``tx_er``_suffix

/**
 * MII transmit signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define MII_TX_IO(_type, _prefix, _suffix, _delim)

/**
 * MII receive signals.
**/
`define MII_RX(_type, _prefix, _suffix, _delim) \
_type       _prefix``rx_clk``_suffix``_delim \
_type [3:0] _prefix``rxd``_suffix``_delim \
_type       _prefix``rx_dv``_suffix``_delim \
_type       _prefix``rx_er``_suffix``_delim \
_type       _prefix``crs``_suffix``_delim \
_type       _prefix``col``_suffix

/**
 * MII receive signals PHY to MAC.
**/
`define MII_RX_P2M(_type, _prefix, _suffix, _delim) \
_type       _prefix``rx_clk``_suffix``_delim \
_type [3:0] _prefix``rxd``_suffix``_delim \
_type       _prefix``rx_dv``_suffix``_delim \
_type       _prefix``rx_er``_suffix``_delim \
_type       _prefix``crs``_suffix``_delim \
_type       _prefix``col``_suffix

/**
 * MII receive signals MAC to PHY.
**/
// This would be an empty definition and is thus not included.
// `define MII_RX_M2P(_type, _prefix, _suffix, _delim)

/**
 * MII receive signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define MII_RX_IO(_type, _prefix, _suffix, _delim)

/**
 * MII management data signals.
**/
`define MII_MD(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix``_delim \
_type _prefix``mdio``_suffix

/**
 * MII management data signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define MII_MD_P2M(_type, _prefix, _suffix, _delim)

/**
 * MII management data signals MAC to PHY.
**/
`define MII_MD_M2P(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix

/**
 * MII management data signals bidirectional.
**/
`define MII_MDIO_IO(_type, _prefix, _suffix, _delim) \
_type _prefix``mdio``_suffix

`endif // _MII_H
