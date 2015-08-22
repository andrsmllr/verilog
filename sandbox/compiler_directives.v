// Verilog compiler directives.
`define PARAMETER 10
`define MACRO replacement text

/**
 * The timescale macro is used to define the time resolution and precision
 * wich a simulator will use when simulation the design. Take care that the
 * timescale is defined in only one place.
 * `timescale resolution / precision.
 */
`define timescale 10 ns / 1 ns
