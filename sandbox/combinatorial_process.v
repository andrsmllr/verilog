module combinatorial_process;

wire [2:0] a;
wire [2:0] b;
reg  [2:0] c;

// Verilog-1995.
always @ (a[0] or b[0])
    begin
        c[0] = a[0] & b[0];
    end

// Verilog-2001.
always @ (a[1], b[1])
    begin
        c[1] = a[1] & b[1];
    end

// Verilog-2005.
always @ (*) // also: always @ *
    begin
        c[2] = a[2] & b[2];
    end

endmodule // combinatorial_process
