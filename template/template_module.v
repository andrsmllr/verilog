/**
 * \file <FILE_NAME>
 * 
 * \date <YYYY-MM-DD>
 * 
 * \author <YOUR_NAME>
 * 
 * \brief ...
 * 
 * \details ...
 * 
 * \see
 */

/****************************************************************************/

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

/****************************************************************************/

always@(posedge clk_i or posedge rst_i)
begin
    if (rst_i == 1'b1)
        data_o <= 'b0;
    else
        data_o <= data_i;
end

/****************************************************************************/

endmodule
