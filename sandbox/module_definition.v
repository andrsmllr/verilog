// Verilog-1995 module declaration.
module MODULE_NAME_A_1995(inport, outport);

input inport;
output outport;

wire inport;
reg outport;

endmodule

// Verilog-1995 parameterizable module declaration.
module MODULE_NAME_B_1995(inport, outport);

parameter WIDTH_IN = 8;
parameter WIDTH_OUT = 4;

input inport;
output outport;

wire [WIDTH_IN-1:0] inport;
// reg outport [WIDTH_OUT-1:0]; // This is actually not allowed...
reg [WIDTH_OUT-1:0] outport; // But this is. Booh Verilog!

endmodule

// Verilog-2001 module declaration.
module MODULE_NAME_A_2001(
    input wire inport,
    output reg outport
);
endmodule

// Verilog-2001 parameterizable module declaration.
module MODULE_NAME_B_2001
#(
    localparam WIDTH_IN = 8,
    localparam WIDTH_OUT = 4
)
(
    input wire [WIDTH_IN-1:0] inport,
    output reg [WIDTH_OUT-1:0] outport
);
endmodule

// Verilog-2005 module declaration.
module MODULE_NAME_A_2005(
    input wire inport,
    output reg outport
);
endmodule

// Verilog-2005 parameterizable module declaration.
module MODULE_NAME_B_2005
#(
    parameter WIDTH_IN = 8,
    parameter WIDTH_OUT = 4
)
(
    input wire [WIDTH_IN-1:0] inport,
    output reg [WIDTH_OUT-1:0] outport
);
endmodule
