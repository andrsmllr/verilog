/**
 * \file      rmii.vh
 *
 * \project   mii_lib
 *
 * \langv     Verilog-2005
 *
 * \brief     Macro definitions for the reduced media-independent interface
 *            (RMII).
 *
 * \details   This file contains macro definitions for the reduced
 *            media-independent interface (RMII).
 *            These macros are intended as a uniform way to easily add RMIIs
 *            to the port interface of a module or to quickly declare nets of
 *            the required types.
 *
 *            There are 3 different interface types for the RMII:
 *            RMII_TX: RMII transmit interface.
 *            RMII_RX: RMII receive interface.
 *            RMII_MD: RMII management data interface.
 *
 *            There are 4 different macros per RMII interface type:
 *            In the following * stand for one of the RMII interface types.
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

`ifndef _RMII_H
`define _RMII_H

/**
 * RMII transmit signals.
**/
`define RMII_TX(_type, _prefix, _suffix, _delim) \
_type       _prefix``ref_clk``_suffix``_delim \
_type [1:0] _prefix``txd``_suffix``_delim \
_type       _prefix``tx_en``_suffix

/**
 * RMII transmit signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define RMII_TX_P2M(_type, _prefix, _suffix, _delim)

/**
 * RMII transmit signals MAC to PHY.
**/
`define RMII_TX_M2P(_type, _prefix, _suffix, _delim) \
_type       _prefix``ref_clk``_suffix``_delim \
_type [1:0] _prefix``txd``_suffix``_delim \
_type       _prefix``tx_en``_suffix

/**
 * RMII transmit signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define RMII_TX_IO(_type, _prefix, _suffix, _delim)

/**
 * RMII receive signals.
**/
`define RMII_RX(_type, _prefix, _suffix, _delim) \
_type       _prefix``ref_clk``_suffix``_delim \
_type [1:0] _prefix``rxd``_suffix``_delim \
_type       _prefix``crs_dv``_suffix``_delim \
_type       _prefix``rx_er``_suffix

/**
 * RMII receive signals PHY to MAC.
**/
`define RMII_RX_P2M(_type, _prefix, _suffix, _delim) \
_type [1:0] _prefix``rxd``_suffix``_delim \
_type       _prefix``crs_dv``_suffix``_delim \
_type       _prefix``rx_er``_suffix

/**
 * RMII receive signals MAC to PHY.
**/
`define RMII_RX_M2P(_type, _prefix, _suffix, _delim) \
_type _prefix``ref_clk``_suffix

/**
 * RMII receive signals bidirectional.
**/
// This would be an empty definition and is thus not included.
// `define RMII_RX_IO(_type, _prefix, _suffix, _delim)

/**
 * RMII management data signals.
**/
`define RMII_MD(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix``_delim \
_type _prefix``mdio``_suffix

/**
 * RMII management data signals PHY to MAC.
**/
// This would be an empty definition and is thus not included.
// `define RMII_MD_P2M(_type, _prefix, _suffix, _delim)

/**
 * RMII management data signals MAC to PHY.
**/
`define RMII_MD_M2P(_type, _prefix, _suffix, _delim) \
_type _prefix``mdc``_suffix

/**
 * RMII management data signals bidirectional.
**/
`define RMII_MD_IO(_type, _prefix, _suffix, _delim) \
_type _prefix``mdio``_suffix

`endif // _RMII_H
