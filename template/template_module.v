/**
 * \file      <FILE_NAME>
 *
 * \project   <PROJECT_NAME>
 *
 * \langv     Verilog-2005
 *
 * \brief     <BRIEF_DESCRIPTION>.
 *
 * \details   <DETAILED_DESCRIPTION>.
 *
 * \bug       <BUGS_OR_KNOWN_ISSUES>.
 *
 * \see       <REFERENCES>
 *
 * \copyright <COPYRIGHT_OR_LICENSE>
 *
 * Revision history:
 *
 * \version   <VERSION>
 * \date      <YYYY-MM-DD>
 * \author    <AUTHOR_NAME>
**/

module MODULE_NAME
#(
    parameter PARAM1 = 0,
    parameter PARAM2 = 8
)
(
    input wire clk_i,
    input wire rst_i,
    input wire[PARAM2-1:0] data_i,
    output reg[PARAM2-1:0] data_o
);

/*
 * Purpose of the following always block.
**/
always@(posedge clk_i or posedge rst_i)
begin
    if (rst_i == 1'b1)
        data_o <= 'b0;
    else
        data_o <= data_i;
end

endmodule
