module tasks;

// \note Ports of mode inout are also possible, but are not shown.

// Verilog-1995 task declaration.
task add_1995;
    input  [7:0] opa;
    input  [7:0] opb;
    output [7:0] sum;
    output       carry;
begin
    assign {carry, sum} = opa + opb;
end
endtask

// Verilog-2001 task declaration.
task add_2001(
    input  [7:0] opa,
    input  [7:0] opb,
    output [7:0] sum,
    output       carry
);
begin
    assign {carry, sum} = opa + opb;
end
endtask

// Verilog-2005 task declaration.
task add_2005(
    input  [7:0] opa,
    input  [7:0] opb,
    output [7:0] sum,
    output       carry
);
begin
    assign {carry, sum} = opa + opb;
end
endtask

/**
 * The keyword automatic declares a reentrant task,  i.e. a task for
 * which all internal declarations are dynamically allocated.
 * An automatic task can be called recursively.
 * \see IEEE 1364-2005 10.4.1
 */
 task automatic sometask(
    input  ina,
    input  inb,
    input  inc,
    output outa
);
begin
    assign outa = inc ? ina : inb;
end
endtask
 
endmodule // tasks
