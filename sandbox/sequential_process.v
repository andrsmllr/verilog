module sequential_process;

wire       clk;
wire       rst;
wire [2:0] d;
reg  [2:0] q;

// Verilog-1995.
always @ (posedge clk or posedge rst)
    begin
        if (rst == 1'b1)
            q[0] <= 1'b0;
        else
            q[0] <= d[0];
    end

// Verilog-2001.
always @ (posedge clk, posedge rst)
    begin
        if (rst == 1'b1)
            q[1] <= 1'b0;
        else
            q[1] <= d[1];
    end

// Verilog-2005.
always @ (posedge clk, posedge rst)
    begin
        if (rst == 1'b1)
            q[2] <= 1'b0;
        else
            q[2] <= d[2];
    end

endmodule // sequential_process
