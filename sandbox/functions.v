module functions;

// Verilog-1995 function declaration.
function [8:0] add_1995;
    input  opa;
    input  opb;
begin
    // wire [7:0] opa;
    // wire [7:0] opb;

    add_1995 = opa + opb;
end
endfunction

// Verilog-2001 function declaration.
function [8:0] add_2001(
    input [7:0] opa,
    input [7:0] opb
);
begin
    add_2001 = opa + opb;
end
endfunction

// Verilog-2005 function declaration.
function [8:0] add_2005(
    input [7:0] opa,
    input [7:0] opb
);
begin
    add_2005 = opa + opb;
end
endfunction

/**
 * The keyword automatic declares a reentrant function,  i.e. a function for
 * which all internal declarations are dynamically allocated.
 * An automatic function can be called recursively.
 * \see IEEE 1364-2005 10.4.1
 */
function automatic [31:0] factorial(
    input [7:0] num
);
integer fac;
begin
    if (num == 8'd1) begin
        factorial = 1;
    end else begin
        factorial = factorial(num-1);
    end
end
endfunction

endmodule // functions
